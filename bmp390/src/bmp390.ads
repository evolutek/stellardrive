with HAL;             use HAL;
with HAL.I2C;         use HAL.I2C;

package BMP390 is

  type BMP390_Params is record
      T1  : Float;
      T2  : Float;
      T3  : Float;
      P1  : Float;
      P2  : Float;
      P3  : Float;
      P4  : Float;
      P5  : Float;
      P6  : Float;
      P7  : Float;
      P8  : Float;
      P9  : Float;
      P10 : Float;
      P11 : Float;
  end record;

  type BMP390_Device is record
      port : not null Any_I2C_Port;
      addr : I2C_Address;
      sea_pressure : Float := 101325.0;
      params : BMP390_Params;
  end record;

  procedure init (device : in out BMP390_Device);
  procedure get_temp_and_pres(device : in out BMP390_Device; temperature : out Float; pressure : out Float);
  function compute_altitude(device : in out BMP390_Device; pressure : Float; temperature : Float) return Float;
  procedure get_altitude(device : in out BMP390_Device; altitude : in out Float);

end BMP390;
