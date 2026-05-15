with HAL.UART; use HAL.UART;
with HAL; use HAL;

package UART is

    type UART_Port is abstract tagged limited null record;

    procedure print(
        port : in out UART_Port;
        str  : String
    ) is abstract;

    procedure write(
        port : in out UART_Port;
        str  : String
    ) is abstract;

    procedure write(
        port : in out UART_Port;
        data : UART_Data_8b
    ) is abstract;

    function available(port : in out UART_Port) return Boolean is abstract;

    function read(
        port    : in out UART_Port;
        data    : out UART_Data_8b;
        timeout : Integer := 1000
    ) return Boolean is abstract;

end UART;
