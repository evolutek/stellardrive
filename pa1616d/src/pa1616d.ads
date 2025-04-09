with UART;

package PA1616D is

    type PA1616D_Device is record
        port : not null access UART.UART_Port;
        longitude : Float := 0.0;
        latitude : Float := 0.0;
    end record;

    procedure init (device : in out PA1616D_Device);
    procedure read (device : in out PA1616D_Device);

end PA1616D;
