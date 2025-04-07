-- with Last_Chance_Handler;

package body AS5600 is

    procedure read_bytes
    (device   : in out AS5600_Device;
    register : UInt8;
    data    : out I2C_Data)
    is
        result : I2C_Status;
    begin
        device.port.Mem_Read(
            Addr          => device.addr,
            Mem_Addr      => UInt16 (register),
            Mem_Addr_Size => Memory_Size_8b,
            Data          => data,
            Status        => result
        );
        -- if result /= Ok then
            -- Last_Chance_Handler.error("I2C read byte error: " & result'Img);
        -- end if;
    end read_bytes;

    --procedure write_byte
    --(device   : in out AS5600_Device;
    --register : UInt8;
    --value    : UInt8)
    --is
    --    data : constant I2C_Data (1..1) := (1 => value);
    --    result : I2C_Status;
    --begin
    --    device.port.Mem_Write(
    --        Addr          => device.addr,
    --        Mem_Addr      => UInt16 (register),
    --        Mem_Addr_Size => Memory_Size_8b,
    --        Data          => data,
    --        Status        => result);
    --    if result /= Ok then
    --        Last_Chance_Handler.error("I2C write byte error: " & result'Img);
    --    end if;
    --end write_byte;

    procedure init (device : in out AS5600_Device) is
    begin
        null;
    end init;

    procedure read_angle(device : in out AS5600_Device; angle : out UInt16) is
        data : I2C_Data(1..2);
        result : UInt16;
    begin
        read_bytes (device, 16#0E#, data);
        result := UInt16 (data(1)) * 256 + UInt16 (data(2));
        result := result mod 4096;
        angle := result;
    end read_angle;

end AS5600;
