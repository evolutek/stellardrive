with STM32.USARTs;
with STM32.GPIO;
with STM32; use STM32;

with HAL.UART; use HAL.UART;
with HAL; use HAL;

--  Serial : USARTs.USART renames Device.USART_2; -- STM32.Device
--  Serial_AF : constant GPIO_Alternate_Function := Device.GPIO_AF_USART2_7;
--  Serial_RX_Pin : GPIO.GPIO_Point renames Device.PA3; -- RX
--  Serial_TX_Pin : GPIO.GPIO_Point renames Device.PA2; -- TX
--  Serial_Pins : GPIO.GPIO_Points := (Serial_RX_Pin, Serial_TX_Pin);
--  Serial_Baudrate : constant UInt32 := 9600;

package UART is

    type UART_Port is record
        port : access USARTs.USART;
    end record;

    procedure init(
        port : in out UART_Port;
        AF : GPIO_Alternate_Function;
        RX_Pin : GPIO.GPIO_Point;
        TX_Pin : GPIO.GPIO_Point;
        Baudrate : UInt32
    );

    procedure print(
        port : in out UART_Port;
        str: String
    );

    procedure write(
        port : in out UART_Port;
        str: String
    );

    procedure write(
        port : in out UART_Port;
        data: UART_Data_8b
    );

    function available(port : in out UART_Port) return boolean;

    function read(
        port : in out UART_Port;
        data : out UART_Data_8b;
        timeout : Integer := 1000
    ) return boolean;

end UART;
