with Ada.Real_Time; use Ada.Real_Time;
with Interfaces; use Interfaces;
with HAL.I2C; use HAL.I2C;

-- TODO print module
-- with Main; 

package body BNO085 is
    MAX_PACKET_SIZE: constant := 300;

    ROTATION_VECTOR_Q1: constant := 14;
    ROTATION_VECTOR_ACCURACY_Q1: constant := 12; -- Heading accuracy estimate in radians. The Q point is 12.
    ACCELEROMETER_Q1: constant := 8;
    LINEAR_ACCELEROMETER_Q1: constant := 8;
    GYRO_Q1: constant := 9;
    MAGNETOMETER_Q1: constant := 4;
    ANGULAR_VELOCITY_Q1: constant := 10;
    GRAVITY_Q1: constant := 8;

    procedure my_delay (millis : Natural) is
    begin
        delay until Clock + Milliseconds (millis);
    end my_delay;

    function send_packet(device : in out BNO085_Device; channel : UInt8; data : I2C_Data) return boolean is
        length : constant UInt16 := data'Length + 4;
        ichannel : constant Integer := Integer (channel);
        frame : I2C_Data(1..(data'Length + 4));
        result : I2C_Status;
    begin
        frame (1) := UInt8 (length mod 256);
        frame (2) := UInt8 (length / 256);
        frame (3) := channel;
        frame (4) := device.sequences(ichannel);

        for i in 1..data'Length loop
            frame (i + 4) := data (i);
        end loop;

        device.sequences(ichannel) := device.sequences(ichannel) + 1;

        for i in 1..5 loop
            device.port.Master_Transmit (device.addr, frame, result);
            exit when result = Ok;
            my_delay (2);
        end loop;

        return result = Ok;
    end send_packet;

    function recv_packet(device : in out BNO085_Device; data : out I2C_Data; header : out Shtp_Header) return boolean is
        frame : I2C_Data(1..MAX_PACKET_SIZE);
        result : I2C_Status;
        length : UInt16;
        remaining : Natural;
        to_read : Natural;
        readed : Natural := 0;
    begin
        device.port.Master_Receive (device.addr, frame(1..4), result);
        if not (result = Ok) then
            return false;
        end if;

        -- Main.print ("Received header");

        length := UInt16 (frame(2)) * 256 + UInt16 (frame(1));
        length := length mod 16#8000#;

        if length = 0 then
            --Main.print ("Received empty packet");
            return false;
        end if;

        if length <= 4 then
            -- TODO: Error
            -- Main.print ("Received invalid length packet");
            return false;
        end if;

        if length > data'Length then
            length := data'Length;
        end if;

        remaining := Natural (length);

        loop
            exit when remaining = 0;
            if remaining < 32 then
                to_read := remaining;
            else
                to_read := 32;
            end if;
            remaining := remaining - to_read;
            device.port.Master_Receive (device.addr, frame((readed + 1)..(readed + to_read)), result);
            if not (result = Ok) then
                return false;
            end if;
            readed := readed + to_read;
        end loop;

        --Main.print ("Received body");

        for i in 1..(readed - 4) loop
            data (i) := frame (i + 4);
        end loop;

        header.channel := frame(3);
        header.length := length;

        return true;
    end recv_packet;

    procedure enable_feature(device : in out BNO085_Device; report_id : UInt8; millis_between_reports: UInt16; specific_config: UInt32 := 0) is
        micros_between_reports : UInt32 := UInt32 (millis_between_reports) * 1000;
        data : I2C_Data(1..17);
        lol : boolean;
    begin
        data(0+1) := BNO_SHTP_REPORT_SET_FEATURE_COMMAND;	 --Set feature command. Reference page 55
	    data(1+1) := report_id;							   --Feature Report ID. 0x01 = Accelerometer, 0x05 = Rotation vector
	    data(2+1) := 0;								   --Feature flags
	    data(3+1) := 0;								   --Change sensitivity (LSB)
	    data(4+1) := 0;								   --Change sensitivity (MSB)
	    data(5+1) := UInt8 ((micros_between_reports) mod 256);  --Report interval (LSB) in microseconds. 0x7A120 = 500ms
	    data(6+1) := UInt8 ((micros_between_reports / 256) mod 256);  --Report interval
	    data(7+1) := UInt8 ((micros_between_reports / 65536) mod 256); --Report interval
	    data(8+1) := UInt8 ((micros_between_reports / 16777216) mod 256); --Report interval (MSB)
	    data(9+1) := 0;								   --Batch Interval (LSB)
	    data(10+1) := 0;								   --Batch Interval
	    data(11+1) := 0;								   --Batch Interval
	    data(12+1) := 0;								   --Batch Interval (MSB)
	    data(13+1) := UInt8 ((specific_config) mod 256);	   --Sensor-specific config (LSB)
	    data(14+1) := UInt8 ((specific_config / 256) mod 256);	   --Sensor-specific config
	    data(15+1) := UInt8 ((specific_config / 65536) mod 256);	  --Sensor-specific config
	    data(16+1) := UInt8 ((specific_config / 16777216) mod 256);	  --Sensor-specific config (MSB)

        lol := send_packet (device, CHANNEL_CONTROL, data);
    end enable_feature;

    function u16_to_s16(u16 : UInt16) return Integer_16
    is
        s16 : Integer_16 with Address => u16'Address;
    begin
        return s16;
    end u16_to_s16;

    function fixed_to_float(fixedPointValue : Integer_16; qPoint : UInt8) return Float is
        qFloat : Float := Float (fixedPointValue);
    begin
        return qFloat / (2.0**(Natural(qPoint)));
    end fixed_to_float;

    function fixed_to_float(fixedPointValue : UInt16; qPoint : UInt8) return Float is
    begin
        return fixed_to_float (u16_to_s16 (fixedPointValue), qPoint);
    end fixed_to_float;

    function merge_u8 (a : UInt8; b : UInt8) return UInt16 is
    begin
        return UInt16 (a) * 256 + UInt16 (b);
    end merge_u8;

    procedure parse_input_report(device : in out BNO085_Device; data : I2C_Data; header : Shtp_Header) is
        timestamp : UInt32;
        values : UInt16_Array(1..6) := (others => 0);
        status : UInt8;
        report_id : UInt8 := data(6);
    begin
        -- The gyro-integrated input reports are sent via the special gyro channel and do no include the usual ID, sequence, and status fields
        if (header.channel = CHANNEL_GYRO) then
            device.data.quatI := fixed_to_float (merge_u8 (data(2), data(1)), ROTATION_VECTOR_Q1);
            device.data.quatJ := fixed_to_float (merge_u8 (data(4), data(3)), ROTATION_VECTOR_Q1);
            device.data.quatK := fixed_to_float (merge_u8 (data(6), data(5)), ROTATION_VECTOR_Q1);
            device.data.quatReal := fixed_to_float (merge_u8 (data(8), data(7)), ROTATION_VECTOR_Q1);
            --device.data.fastGyroX := fixed_to_float (merge_u8 (data(10), data(9)), GYRO_Q1);
            --device.data.fastGyroY := fixed_to_float (merge_u8 (data(12), data(11)), GYRO_Q1);
            --device.data.fastGyroZ := fixed_to_float (merge_u8 (data(14), data(13)), GYRO_Q1);
            --return BNO_REPORTID_GYRO_INTEGRATED_ROTATION_VECTOR;
        else
            timestamp := (UInt32 (data(5)) * 16777216) + (UInt32 (data(4)) * 65536) + (UInt32 (data(3)) * 256) + (UInt32 (data(2)));
            status := data(7) mod 4; --Get status bits

            for i in 0..5 loop
                exit when (UInt16 (i) * 2 + 11) > header.length;
                values(i + 1) := merge_u8 (data(i * 2 + 11), data(i * 2 + 10));
            end loop;

            --Store these generic values to their proper global variable
            -- We only need yaw for the Movement Tracker, but getting other reports is pretty simple
            if (report_id = BNO_REPORTID_ACCELEROMETER) then
                --accelAccuracy = status;
                device.data.accelX := fixed_to_float (values(1), ACCELEROMETER_Q1);
                device.data.accelY := fixed_to_float (values(2), ACCELEROMETER_Q1);
                device.data.accelZ := fixed_to_float (values(3), ACCELEROMETER_Q1);
            elsif (report_id = BNO_REPORTID_LINEAR_ACCELERATION) then
                --accelLinAccuracy = status;
                device.data.linAccelX := fixed_to_float (values(1), LINEAR_ACCELEROMETER_Q1);
                device.data.linAccelY := fixed_to_float (values(2), LINEAR_ACCELEROMETER_Q1);
                device.data.linAccelZ := fixed_to_float (values(3), LINEAR_ACCELEROMETER_Q1);
            elsif (report_id = BNO_REPORTID_GYROSCOPE) then
                --gyroAccuracy = status;
                device.data.gyroX := fixed_to_float (values(1), GYRO_Q1);
                device.data.gyroY := fixed_to_float (values(2), GYRO_Q1);
                device.data.gyroZ := fixed_to_float (values(3), GYRO_Q1);
            --elsif (report_id = BNO_REPORTID_UNCALIBRATED_GYRO) then
            --    UncalibGyroAccuracy = status;
            --    rawUncalibGyroX = data1;
            --    rawUncalibGyroY = data2;
            --    rawUncalibGyroZ = data3;
            --    rawBiasX  = data4;
            --    rawBiasY  = data5;
            --    rawBiasZ  = data6;
            --elsif (report_id = BNO_REPORTID_MAGNETIC_FIELD) then
            --    magAccuracy = status;
            --    rawMagX = data1;
            --    rawMagY = data2;
            --    rawMagZ = data3;
            elsif (
                report_id = BNO_REPORTID_AR_VR_STABILIZED_GAME_ROTATION_VECTOR or
                report_id = BNO_REPORTID_AR_VR_STABILIZED_ROTATION_VECTOR or
                report_id = BNO_REPORTID_GAME_ROTATION_VECTOR or
                report_id = BNO_REPORTID_ROTATION_VECTOR
            ) then
                --quatAccuracy = status;
                device.data.quatI := fixed_to_float (values(1), ROTATION_VECTOR_Q1);
                device.data.quatJ := fixed_to_float (values(2), ROTATION_VECTOR_Q1);
                device.data.quatK := fixed_to_float (values(3), ROTATION_VECTOR_Q1);
                device.data.quatReal := fixed_to_float (values(4), ROTATION_VECTOR_Q1);
                --Only available on rotation vector and ar/vr stabilized rotation vector,
                -- not game rot vector and not ar/vr stabilized rotation vector
                --rawQuatRadianAccuracy = data5;
            --elsif (report_id = BNO_REPORTID_TAP_DETECTOR) then
            --    tapDetector = shtpData[5 + 4]; --Byte 4 only
            --elsif (report_id = BNO_REPORTID_STEP_COUNTER) then
            --    stepCount = data3; --Bytes 8/9
            --elsif (report_id = BNO_REPORTID_STABILITY_CLASSIFIER) then
            --    stabilityClassifier = shtpData[5 + 4]; --Byte 4 only
            --elsif (report_id = BNO_REPORTID_PERSONAL_ACTIVITY_CLASSIFIER) then
            --    activityClassifier = shtpData[5 + 5]; --Most likely state
            --    --Load activity classification confidences into the array
            --    for (uint8_t x = 0; x < 9; x++)					   --Hardcoded to max of 9. TODO - bring in array size
            --        _activityConfidences[x] = shtpData[5 + 6 + x]; --5 bytes of timestamp, byte 6 is first confidence byte
            --elsif (report_id = BNO_REPORTID_RAW_ACCELEROMETER) then
            --    memsRawAccelX = data1;
            --    memsRawAccelY = data2;
            --    memsRawAccelZ = data3;
            --elsif (report_id = BNO_REPORTID_RAW_GYROSCOPE) then
            --    memsRawGyroX = data1;
            --    memsRawGyroY = data2;
            --    memsRawGyroZ = data3;
            --elsif (report_id = BNO_REPORTID_RAW_MAGNETOMETER) then
            --    memsRawMagX = data1;
            --    memsRawMagY = data2;
            --    memsRawMagZ = data3;
            --elsif (report_id = BNO_SHTP_REPORT_COMMAND_RESPONSE) then
            --    --if (_debug) printf("!");
            --    --The BNO080 responds with this report to command requests. It's up to use to remember which command we issued.
            --    uint8_t command = shtpData[5 + 2]; --This is the Command byte of the response
            --    if (command = BNO_COMMANDID_ME_CALIBRATE) then
            --        --if(_debug) printf ("ME Cal report found!");
            --        calibrationStatus = shtpData[5 + 5]; --R0 - Status (0 = success, non-zero = fail)
            --    end if;
            --elsif(Breport_id = NO_REPORTID_GRAVITY) then
            --    gravityAccuracy = status;
            --    gravityX = data1;
            --    gravityY = data2;
            --    gravityZ = data3;
            end if;
        end if;
    end parse_input_report;

    function init(device : in out BNO085_Device) return boolean is
        data : I2C_Data(1..MAX_PACKET_SIZE);
        header : Shtp_Header;
        success : boolean := false;
    begin
        device.initialized := false;
        device.sequences := (others => 0);

        for i in 1..10 loop
            device.sequences (Integer (CHANNEL_EXECUTABLE)) := 0;
            if send_packet (device, CHANNEL_EXECUTABLE, data(1..1)) then
                success := true;
                exit;
            end if;
            my_delay (100);
        end loop;

        if not success then
            -- TODO: Error
            -- Main.print ("Failed to send reset packet");
            return false;
        end if;

        loop
            exit when device.initialized;
            my_delay (10);
            process_packets (device);
        end loop;

        return true;
    end init;

    procedure process_packets(device : in out BNO085_Device) is
        data : I2C_Data(1..MAX_PACKET_SIZE);
        header : Shtp_Header;
    begin
        loop
            exit when not recv_packet (device, data, header);
            --Main.print ("Valid packet received");
            --Check to see if this packet is a sensor reporting its data to us
            if ((header.channel = CHANNEL_REPORTS and data(1) = BNO_SHTP_REPORT_BASE_TIMESTAMP) or header.channel = CHANNEL_GYRO) then
                parse_input_report (device, data, header); --This will update the rawAccelX, etc variables depending on which feature report is found
            --elsif (header.channel = CHANNEL_CONTROL)
            --    parse_command_report(device, data, header); --This will update responses to commands, calibrationStatus, etc.
            elsif (header.channel = CHANNEL_EXECUTABLE) then
                if data (1) = 1 then -- Device reset complete
                    device.initialized := true;
                end if;
            end if;
        end loop;
    end process_packets;
end BNO085;
