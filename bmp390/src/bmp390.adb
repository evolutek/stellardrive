with Interfaces; use Interfaces;

-- Allow floating point exponent for **
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body BMP390 is

   procedure read_byte
     (device   : in out BMP390_Device;
      register : UInt8;
      value    : out UInt8)
   is
      buffer : I2C_Data (1..1);
      result : I2C_Status;
   begin
      device.port.Mem_Read(
         Addr          => device.addr,
         Mem_Addr      => UInt16 (register),
         Mem_Addr_Size => Memory_Size_8b,
         Data          => buffer,
         Status        => result
      );

      value := buffer (1);
   end read_byte;

   procedure write_byte
     (device   : in out BMP390_Device;
      register : UInt8;
      value    : UInt8)
   is
      data : constant I2C_Data (1..1) := (1 => value);
      result : I2C_Status;
   begin
      device.port.Mem_Write(
         Addr          => device.addr,
         Mem_Addr      => UInt16 (register),
         Mem_Addr_Size => Memory_Size_8b,
         Data          => data,
         Status        => result);
   end write_byte;

   procedure read_bytes
     (device   : in out BMP390_Device;
      register : UInt8;
      buffer   : out I2C_Data)
   is
      result   : I2C_Status;
   begin
      device.port.Mem_Read(
         Addr          => device.addr,
         Mem_Addr      => UInt16 (register),
         Mem_Addr_Size => Memory_Size_8b,
         Data          => buffer,
         Status        => result);
   end read_bytes;

   type BMP390_RawParams is record
      T1  : Unsigned_16;
      T2  : Unsigned_16;
      T3  : Integer_8;
      P1  : Integer_16;
      P2  : Integer_16;
      P3  : Integer_8;
      P4  : Integer_8;
      P5  : Unsigned_16;
      P6  : Unsigned_16;
      P7  : Integer_8;
      P8  : Integer_8;
      P9  : Integer_16;
      P10 : Integer_8;
      P11 : Integer_8;
   end record; --with size => 168;

   --for BMP390_RawParams use record
   --   T1  at 0 range 0..15;
   --   T2  at 0 range 16..31;
   --   T3  at 0 range 32..39;
   --   P1  at 0 range 40..55;
   --   P2  at 0 range 56..71;
   --   P3  at 0 range 72..79;
   --   P4  at 0 range 80..87;
   --   P5  at 0 range 88..103;
   --   P6  at 0 range 104..119;
   --   P7  at 0 range 120..127;
   --   P8  at 0 range 128..135;
   --   P9  at 0 range 136..151;
   --   P10 at 0 range 152..159;
   --   P11 at 0 range 160..167;
   --end record;

   function u8_to_s8(u8 : UInt8) return Integer_8
   is
      s8 : Integer_8 with Address => u8'Address;
   begin
      return s8;
   end u8_to_s8;

   function u16_to_s16(u16 : UInt16) return Integer_16
   is
      s16 : Integer_16 with Address => u16'Address;
   begin
      return s16;
   end u16_to_s16;

   procedure read_config(device : in out BMP390_Device)
   is
      raw_params : BMP390_RawParams;
      data : I2C_Data(1..21) := (others => 0);
   begin
      read_bytes(device, 16#31#, data);

      raw_params.T1  := Unsigned_16 (data(1)) + Unsigned_16 (data(2)) * 256;
      raw_params.T2  := Unsigned_16 (data(3)) + Unsigned_16 (data(4)) * 256;
      raw_params.T3  := u8_to_s8 (data(5));
      raw_params.P1  := u16_to_s16 (UInt16 (data(6)) + UInt16 (data(7)) * 256);
      raw_params.P2  := u16_to_s16 (UInt16 (data(8)) + UInt16 (data(9)) * 256);
      raw_params.P3  := u8_to_s8 (data(10));
      raw_params.P4  := u8_to_s8 (data(11));
      raw_params.P5  := Unsigned_16 (data(12)) + Unsigned_16 (data(13)) * 256;
      raw_params.P6  := Unsigned_16 (data(14)) + Unsigned_16 (data(15)) * 256;
      raw_params.P7  := u8_to_s8 (data(16));
      raw_params.P8  := u8_to_s8 (data(17));
      raw_params.P9  := u16_to_s16 (UInt16 (data(18)) + UInt16 (data(19)) * 256);
      raw_params.P10 := u8_to_s8 (data(20));
      raw_params.P11 := u8_to_s8 (data(21));

      device.params.T1  := Float (raw_params.T1) / 0.00390625; -- x / 2**-8
      device.params.T2  := Float (raw_params.T2) / 1073741824.0; -- x / 2**30
      device.params.T3  := Float (raw_params.T3) / 281474976710656.0; -- x / 2**48
      device.params.P1  := (Float (raw_params.P1) - 16384.0) / 1048576.0; -- (x - 2**14) / 2**20
      device.params.P2  := (Float (raw_params.P2) - 16384.0) / 536870912.0; -- (x - 2**14) / 2**29
      device.params.P3  := Float (raw_params.P3) / 4294967296.0; -- x / 2**32
      device.params.P4  := Float (raw_params.P4) / 137438953472.0; -- x / 2**37
      device.params.P5  := Float (raw_params.P5) / 0.125; -- x / 2**-3
      device.params.P6  := Float (raw_params.P6) / 64.0; -- x / 2**6
      device.params.P7  := Float (raw_params.P7) / 256.0; -- x / 2**8
      device.params.P8  := Float (raw_params.P8) / 32768.0; -- x / 2**15
      device.params.P9  := Float (raw_params.P9) / 281474976710656.0; -- x / 2**48
      device.params.P10 := Float (raw_params.P10) / 281474976710656.0; -- x / 2**48
      device.params.P11 := Float (raw_params.P11) / 36893488147419103232.0; -- x / 2**65
   end read_config;

   procedure init (device : in out BMP390_Device)
   is
   begin
      -- Register 0x1C OSR
      write_byte(device, 16#1C#, 2#00000000#);

      -- Register 0x1D ODR
      write_byte(device, 16#1D#, 2#00000000#);

      -- Register pwr_ctrl 0x1B
      write_byte(device, 16#1B#, 2#00110011#);

      -- Register FIFO_CONFIG2 0x18
      write_byte(device, 16#18#, 2#00001000#);

      -- Register FIFO_CONFIG1 0x17
      write_byte(device, 16#17#, 2#00011001#);

      -- Register INT_STATUS 0x11
      write_byte(device, 16#11#, 2#00000011#);

      -- Register EVENT 0x10
      write_byte(device, 16#10#, 2#00000011#);

      -- Register CHIP_ID
      write_byte(device, 16#00#, 16#60#);

      read_config(device);
   end init;

   function compensate_temp(device : in out BMP390_Device; uncomp_temp: Float) return Float
   is
      partial_data1: constant Float := uncomp_temp - device.params.T1;
      partial_data2: constant Float := partial_data1 * device.params.T2;
   begin
      return partial_data2 + partial_data1 * partial_data1 * device.params.T3;
   end compensate_temp;


   function compensate_press(device : in out BMP390_Device; uncomp_press: Float; t_lin: Float) return Float
   is
      partial_data1_1: constant Float := device.params.P6 * t_lin;
      partial_data2_1: constant Float := device.params.P7 * t_lin * t_lin;
      partial_data3_1: constant Float := device.params.P8 * t_lin * t_lin * t_lin;
      partial_out1: constant Float := device.params.P5 + partial_data1_1 + partial_data2_1 + partial_data3_1;
      partial_data1_2: constant Float := device.params.P2 * t_lin;
      partial_data2_2: constant Float := device.params.P3 * t_lin * t_lin;
      partial_data3_2: constant Float := device.params.P4 * t_lin * t_lin * t_lin;
      partial_out2: constant Float := uncomp_press * (device.params.P1 + partial_data1_2 + partial_data2_2 + partial_data3_2);
      partial_data1_3: constant Float := uncomp_press * uncomp_press;
      partial_data2_3: constant Float := device.params.P9 + device.params.P10 * t_lin;
      partial_data3_3: constant Float := partial_data1_3 * partial_data2_3;
      partial_out3: constant Float := partial_data3_3 + uncomp_press * uncomp_press * uncomp_press * device.params.P11;
   begin
      return partial_out1 + partial_out2 + partial_out3;
   end compensate_press;


   procedure get_temp_and_pres(device : in out BMP390_Device; temperature : out Float; pressure : out Float)
   is
      data: I2C_Data(1..6);
      adc_temp: Integer_32;
      adc_pres: Integer_32;
   begin
      -- Read the temperature and pressure data
      read_bytes (device, 16#04#, data);

      -- Copy the temperature and pressure data into the adc variables
      adc_temp := (Integer_32 (data(6)) * 65536) + (Integer_32 (data(5)) * 256) + Integer_32 (data(4));
      adc_pres := (Integer_32 (data(3)) * 65536) + (Integer_32 (data(2)) * 256) + Integer_32 (data(1));

      -- Temperature compensation (function from BMP388 datasheet)
      temperature := compensate_temp(device, Float (adc_temp));

      -- Pressure compensation (function from BMP388 datasheet)
      pressure := compensate_press(device, Float (adc_pres), temperature);
   end get_temp_and_pres;



   -- https://www.mide.com/air-pressure-at-altitude-calculator
   function compute_altitude(device : in out BMP390_Device; pressure : Float; temperature : Float) return Float is
      Tb: constant Float := temperature + 273.15;
      P: constant Float := pressure;
      Lb: constant Float := -0.0065;
      Pb: constant Float := 101325.0;
      R: constant Float := 8.31432;
      g: constant Float := 9.80665;
      M: constant Float := 0.0289644;
   begin
      -- ((T + 273.15) / -0.0065) * (((P / 101325.0) ^ ((-8.31432*-0.0065) / (9.80665*0.0289644))) - 1)
      return (Tb / Lb) * (((P / Pb) ** ((-R*Lb) / (g*M))) - 1.0);
   end compute_altitude;


   procedure get_altitude(device : in out BMP390_Device; altitude : in out Float)
   is
      pressure: Float;
      temperature: Float;
      Lb: constant Float := -0.0065;
      Pb: constant Float := device.sea_pressure;
      R: constant Float := 8.31432;
      g: constant Float := 9.80665;
      M: constant Float := 0.0289644;
   begin
      get_temp_and_pres (device, temperature, pressure);
      altitude := compute_altitude (device, pressure, temperature);
   end get_altitude;

end BMP390;
