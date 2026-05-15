with STM32.USARTs;
with STM32.GPIO;
with STM32; use STM32;

package UART.F4xx is

    type UART_Port_F4xx is new UART_Port with record
        port : access STM32.USARTs.USART;
    end record;

    procedure init(
        Self     : in out UART_Port_F4xx;
        AF       : GPIO_Alternate_Function;
        RX_Pin   : STM32.GPIO.GPIO_Point;
        TX_Pin   : STM32.GPIO.GPIO_Point;
        Baudrate : UInt32
    );

    overriding procedure print(Self : in out UART_Port_F4xx; str : String);
    overriding procedure write(Self : in out UART_Port_F4xx; str : String);
    overriding procedure write(Self : in out UART_Port_F4xx; data : UART_Data_8b);
    overriding function available(Self : in out UART_Port_F4xx) return Boolean;
    overriding function read(
        Self    : in out UART_Port_F4xx;
        data    : out UART_Data_8b;
        timeout : Integer := 1000
    ) return Boolean;

end UART.F4xx;
