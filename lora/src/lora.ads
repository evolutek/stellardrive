with HAL; use HAL;
with UART;

package LoRa is

    type LoRa_Device is record
        port : not null access UART.UART_Port;
    end record;

    procedure init (device : in out LoRa_Device);
    procedure send (device : in out LoRa_Device; msg : String);
    procedure send (device : in out LoRa_Device; data : UInt8_Array);

end LoRa;
