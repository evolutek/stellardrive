with HAL;             use HAL;
with HAL.I2C;         use HAL.I2C;

package AS5600 is

  type AS5600_Device is record
      port : not null Any_I2C_Port;
      addr : I2C_Address;
  end record;

  procedure init (device : in out AS5600_Device);
  procedure read_angle(device : in out AS5600_Device; angle : out UInt16);

end AS5600;
