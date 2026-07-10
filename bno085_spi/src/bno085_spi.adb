with Ada.Real_Time; use Ada.Real_Time;
with Interfaces; use Interfaces;
with STM32.SPI;  use STM32.SPI;
with STM32.GPIO; use STM32.GPIO;

package body BNO085_SPI is
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

    --  HINTN is active-low: the BNO085 pulls it low when it is ready to be
    --  serviced (has a packet to send, or is ready to accept one). Wait for it,
    --  bounded so an absent/silent IMU cannot block.
    function wait_int (device : in out BNO085_Device) return boolean is
        deadline : constant Time := Clock + Milliseconds (100);
    begin
        loop
            exit when not Set (device.int_pin);   -- INT_N low = asserted
            if Clock > deadline then
                return false;
            end if;
        end loop;
        return true;
    end wait_int;

    --  One CS-framed SHTP transaction. SPI is full-duplex, so a single transfer
    --  simultaneously clocks OUR packet out and the DEVICE's packet in. We read
    --  the 4-byte header first to learn the device packet length, then clock
    --  max(our_len, device_len) bytes so neither side is truncated (a truncated
    --  device packet desyncs its SHTP state and it then ignores our commands).
    --  Precondition: caller has waited for INT low. CS is driven here.
    procedure exchange (device  : in out BNO085_Device;
                        out_buf : UInt8_Buffer;
                        in_buf  : out UInt8_Buffer;
                        dev_len : out Natural) is
        our_len : constant Natural := out_buf'Length;
        hdr_rx  : UInt8_Buffer (1 .. 4);
        zero4   : constant UInt8_Buffer (1 .. 4) := (others => 0);
        ln      : UInt16;
        total   : Natural;
    begin
        in_buf := (in_buf'Range => 0);
        Clear (device.cs);
        --  Header (4 bytes)
        if our_len >= 4 then
            device.port.Transmit_Receive (out_buf (out_buf'First .. out_buf'First + 3), hdr_rx, 4);
        else
            device.port.Transmit_Receive (zero4, hdr_rx, 4);
        end if;
        in_buf (1 .. 4) := hdr_rx;
        ln := (UInt16 (hdr_rx (2)) * 256 + UInt16 (hdr_rx (1))) mod 16#8000#;
        dev_len := Natural (ln);
        total := Natural'Max (our_len, dev_len);
        if total > in_buf'Length then
            total := in_buf'Length;
        end if;
        --  Body: rest of our packet (zero-padded) out, rest of device packet in.
        if total > 4 then
            declare
                n  : constant Natural := total - 4;
                tx : UInt8_Buffer (1 .. n) := (others => 0);
                rx : UInt8_Buffer (1 .. n);
            begin
                for k in 1 .. n loop
                    if 4 + k <= our_len then
                        tx (k) := out_buf (out_buf'First + 4 + k - 1);
                    end if;
                end loop;
                device.port.Transmit_Receive (tx, rx, n);
                for k in 1 .. n loop
                    in_buf (4 + k) := rx (k);
                end loop;
            end;
        end if;
        Set (device.cs);
    end exchange;

    function send_packet(device : in out BNO085_Device; channel : UInt8; data : UInt8_Buffer) return boolean is
        length : constant UInt16 := data'Length + 4;
        ichannel : constant Integer := Integer (channel);
        frame  : UInt8_Buffer(1..(data'Length + 4));
        in_buf : UInt8_Buffer(1..MAX_PACKET_SIZE);
        dev_len : Natural;
    begin
        frame (1) := UInt8 (length mod 256);
        frame (2) := UInt8 (length / 256);
        frame (3) := channel;
        frame (4) := device.sequences(ichannel);

        for i in 1..data'Length loop
            frame (i + 4) := data (i);
        end loop;

        device.sequences(ichannel) := device.sequences(ichannel) + 1;

        --  Host-initiated transfer (SH-2 over SPI): the BNO only lowers HINTN on
        --  its own when it has data to send. To send *to* it we must first assert
        --  WAKE (PS0, active low) so it wakes and lowers HINTN, then transfer,
        --  then release WAKE.
        Clear (device.wake_pin);
        if not wait_int (device) then
            Set (device.wake_pin);
            return false;
        end if;
        exchange (device, frame, in_buf, dev_len);
        Set (device.wake_pin);   -- release WAKE only after the transaction
        return true;
    end send_packet;

    function recv_packet(device : in out BNO085_Device; data : out UInt8_Buffer; header : out Shtp_Header) return boolean is
        in_buf   : UInt8_Buffer(1..MAX_PACKET_SIZE);
        empty    : UInt8_Buffer(1..0);
        dev_len  : Natural;
        body_len : Natural;
    begin
        if not wait_int (device) then
            return false;
        end if;

        exchange (device, empty, in_buf, dev_len);

        if dev_len <= 4 then
            return false;
        end if;
        if dev_len > in_buf'Length then
            dev_len := in_buf'Length;
        end if;

        body_len := dev_len - 4;
        if body_len > data'Length then
            body_len := data'Length;
        end if;

        for i in 1..body_len loop
            data (i) := in_buf (i + 4);
        end loop;

        header.channel := in_buf (3);
        header.length := UInt16 (dev_len);

        return true;
    end recv_packet;

    procedure enable_feature(device : in out BNO085_Device; report_id : UInt8; millis_between_reports: UInt16; specific_config: UInt32 := 0) is
        micros_between_reports : UInt32 := UInt32 (millis_between_reports) * 1000;
        data : UInt8_Buffer(1..17);
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

    procedure parse_input_report(device : in out BNO085_Device; data : UInt8_Buffer; header : Shtp_Header) is
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
        deadline : Time;
    begin
        device.initialized := false;
        device.sequences := (others => 0);
        Set (device.wake_pin);   -- WAKE idle high (deasserted)
        Set (device.cs);         -- CS deselected

        --  Hardware reset (RST_N active low). After the rising edge the BNO08x
        --  boots (~90 ms) and *spontaneously* emits its advertisement (ch 0) and
        --  a reset-complete (ch 1) — no soft-reset command is needed, and sending
        --  one only reboots it again right before we configure it.
        Clear (device.rst_pin);
        my_delay (10);
        Set (device.rst_pin);
        my_delay (150);          -- let it finish booting

        --  Read (bounded) until it announces reset-complete.
        deadline := Clock + Milliseconds (500);
        loop
            exit when device.initialized;
            exit when Clock > deadline;
            process_packets (device);
            my_delay (10);
        end loop;

        return device.initialized;
    end init;

    procedure process_packets(device : in out BNO085_Device) is
        data : UInt8_Buffer(1..MAX_PACKET_SIZE);
        header : Shtp_Header;
    begin
        --  Bounded: a chip that holds INT low and keeps streaming packets must
        --  not trap us here forever. Process at most a handful per call; each
        --  recv_packet is itself bounded by wait_int's 100 ms deadline.
        for iter in 1 .. 16 loop
            exit when not recv_packet (device, data, header);
            --Check to see if this packet is a sensor reporting its data to us
            if ((header.channel = CHANNEL_REPORTS and data(1) = BNO_SHTP_REPORT_BASE_TIMESTAMP) or header.channel = CHANNEL_GYRO) then
                device.streaming := True;
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
end BNO085_SPI;
