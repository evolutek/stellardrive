with Ada.Real_Time; use Ada.Real_Time;

with STM32.Device;
use STM32;

package body UART is

    procedure init(
        port : in out UART_Port;
        AF : GPIO_Alternate_Function;
        RX_Pin : GPIO.GPIO_Point;
        TX_Pin : GPIO.GPIO_Point;
        Baudrate : UInt32
    ) is
        Pins : constant GPIO.GPIO_Points := (RX_Pin, TX_Pin);
    begin
        Device.Enable_Clock (Pins);

        GPIO.Configure_IO (Pins,
                        (Mode          => GPIO.Mode_AF,
                        AF             => AF,
                        AF_Speed       => GPIO.Speed_100MHz,
                        AF_Output_Type => GPIO.Push_Pull,
                        Resistors      => GPIO.Pull_Up,
                        others => <>));
        GPIO.Lock (Pins);

        Device.Enable_Clock (port.port.all);
        Device.Reset (port.port.all);

        USARTs.Disable (port.port.all);

        USARTs.Set_Baud_Rate    (port.port.all, Baudrate);
        USARTs.Set_Mode         (port.port.all, USARTs.Tx_Rx_Mode);
        USARTs.Set_Stop_Bits    (port.port.all, USARTs.Stopbits_1);
        USARTs.Set_Word_Length  (port.port.all, USARTs.Word_Length_8);
        USARTs.Set_Parity       (port.port.all, USARTs.No_Parity);
        USARTs.Set_Flow_Control (port.port.all, USARTs.No_Flow_Control);
        USARTs.Set_Oversampling_Mode (port.port.all, USARTs.Oversampling_By_16);

        USARTs.Enable (port.port.all);
    end init;


    procedure wait_tx(port: UART_Port) is
    begin
        loop
            exit when USARTs.Tx_Ready(port.port.all);
        end loop;
    end wait_tx;


    function wait_rx(port: UART_Port; timeout : Integer := 1000) return boolean is
        end_time : constant Time := Clock + Milliseconds (timeout);
    begin
        if timeout = 0 then
            return USARTs.Rx_Ready(port.port.all);
        end if;
        loop
            exit when USARTs.Rx_Ready(port.port.all);
            if Clock > end_time then
                return false;
            end if;
        end loop;
        return true;
    end wait_rx;


    procedure write(
        port : in out UART_Port;
        data : UART_Data_8b
    ) is
        result : UART_Status;
    begin
        wait_tx (port);
        USARTs.Transmit (port.port.all, data, result);
    end write;


    function available(port : in out UART_Port) return boolean is
    begin
        return USARTs.Rx_Ready(port.port.all);
    end available;


    function read(
        port : in out UART_Port;
        data : out UART_Data_8b;
        timeout : Integer := 1000
    ) return boolean is
        result : UART_Status;
    begin
        if not wait_rx (port, timeout) then
            return false;
        end if;
        USARTs.Receive(port.port.all, data, result);
        return result = OK;
    end read;


    procedure write(
        port : in out UART_Port;
        str : String
    ) is
        data: UART_Data_8b(1..str'Length) with Address => str'Address;
    begin
        --for i in 1 .. str'Length loop
        --    data (i) := Character'Pos (str (i));
        --end loop;
        write (port, data);
    end write;


    procedure print(
        port : in out UART_Port;
        str : String
    ) is
    begin
        write (port, str);
        write (port, ASCII.CR & ASCII.LF);
    end print;

end UART;
