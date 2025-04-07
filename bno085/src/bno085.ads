with HAL;             use HAL;
with HAL.I2C;         use HAL.I2C;

package BNO085 is

  BNO_SHTP_REPORT_COMMAND_RESPONSE : constant := 16#F1#;
  BNO_SHTP_REPORT_COMMAND_REQUEST : constant := 16#F2#;
  BNO_SHTP_REPORT_FRS_READ_RESPONSE : constant := 16#F3#;
  BNO_SHTP_REPORT_FRS_READ_REQUEST : constant := 16#F4#;
  BNO_SHTP_REPORT_PRODUCT_ID_RESPONSE : constant := 16#F8#;
  BNO_SHTP_REPORT_PRODUCT_ID_REQUEST : constant := 16#F9#;
  BNO_SHTP_REPORT_BASE_TIMESTAMP : constant := 16#FB#;
  BNO_SHTP_REPORT_SET_FEATURE_COMMAND : constant := 16#FD#;

  BNO_REPORTID_ACCELEROMETER : constant := 16#01#;
  BNO_REPORTID_GYROSCOPE : constant := 16#02#;
  BNO_REPORTID_MAGNETIC_FIELD : constant := 16#03#;
  BNO_REPORTID_LINEAR_ACCELERATION : constant := 16#04#;
  BNO_REPORTID_ROTATION_VECTOR : constant := 16#05#;
  BNO_REPORTID_GRAVITY : constant := 16#06#;
  BNO_REPORTID_UNCALIBRATED_GYRO : constant := 16#07#;
  BNO_REPORTID_GAME_ROTATION_VECTOR : constant := 16#08#;
  BNO_REPORTID_GEOMAGNETIC_ROTATION_VECTOR : constant := 16#09#;
  BNO_REPORTID_GYRO_INTEGRATED_ROTATION_VECTOR : constant := 16#2A#;
  BNO_REPORTID_TAP_DETECTOR : constant := 16#10#;
  BNO_REPORTID_STEP_COUNTER : constant := 16#11#;
  BNO_REPORTID_STABILITY_CLASSIFIER : constant := 16#13#;
  BNO_REPORTID_RAW_ACCELEROMETER : constant := 16#14#;
  BNO_REPORTID_RAW_GYROSCOPE : constant := 16#15#;
  BNO_REPORTID_RAW_MAGNETOMETER : constant := 16#16#;
  BNO_REPORTID_PERSONAL_ACTIVITY_CLASSIFIER : constant := 16#1E#;
  BNO_REPORTID_AR_VR_STABILIZED_ROTATION_VECTOR : constant := 16#28#;
  BNO_REPORTID_AR_VR_STABILIZED_GAME_ROTATION_VECTOR : constant := 16#29#;

  CHANNEL_EXECUTABLE : constant UInt8 := 1;
  CHANNEL_CONTROL : constant UInt8 := 2;
  CHANNEL_REPORTS : constant UInt8 := 3;
  CHANNEL_GYRO : constant UInt8 := 5;

  type BNO085_Sequences is array (1..6) of UInt8;

  type Shtp_Header is record
    length : UInt16;
    channel : UInt8;
  end record;

  type BNO085_Data is record
    quatI : Float;
    quatJ : Float;
    quatK : Float;
    quatReal : Float;
    gyroX : Float;
    gyroY : Float;
    gyroZ : Float;
    linAccelX : Float;
    linAccelY : Float;
    linAccelZ : Float;
    accelX : Float;
    accelY : Float;
    accelZ : Float;
  end record;

  type BNO085_Device is record
      port : not null Any_I2C_Port;
      addr : I2C_Address;
      initialized : boolean;
      sequences : BNO085_Sequences;
      data : BNO085_Data;
  end record;

  function init(device : in out BNO085_Device) return boolean;
  procedure enable_feature(device : in out BNO085_Device; report_id : UInt8; millis_between_reports: UInt16; specific_config: UInt32 := 0);
  procedure process_packets(device : in out BNO085_Device);

end BNO085;
