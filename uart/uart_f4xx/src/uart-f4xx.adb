with Ada.Real_Time; use Ada.Real_Time;

with STM32.Device;

package body UART.F4xx is

    procedure init(
        Self     : in out UART_Port_F4xx;
        AF       : GPIO_Alternate_Function;
        RX_Pin   : STM32.GPIO.GPIO_Point;
        TX_Pin   : STM32.GPIO.GPIO_Point;
        Baudrate : UInt32
    ) is
        Pins : constant GPIO.GPIO_Points := (RX_Pin, TX_Pin);
    begin
        Device.Enable_Clock (Pins);

        GPIO.Configure_IO (Pins,
                        (Mode           => GPIO.Mode_AF,
                        AF              => AF,
                        AF_Speed        => GPIO.Speed_100MHz,
                        AF_Output_Type  => GPIO.Push_Pull,
                        Resistors       => GPIO.Pull_Up,
                        others => <>));
        GPIO.Lock (Pins);

        Device.Enable_Clock (Self.port.all);
        Device.Reset (Self.port.all);

        USARTs.Disable (Self.port.all);

        USARTs.Set_Baud_Rate         (Self.port.all, Baudrate);
        USARTs.Set_Mode              (Self.port.all, USARTs.Tx_Rx_Mode);
        USARTs.Set_Stop_Bits         (Self.port.all, USARTs.Stopbits_1);
        USARTs.Set_Word_Length       (Self.port.all, USARTs.Word_Length_8);
        USARTs.Set_Parity            (Self.port.all, USARTs.No_Parity);
        USARTs.Set_Flow_Control      (Self.port.all, USARTs.No_Flow_Control);
        USARTs.Set_Oversampling_Mode (Self.port.all, USARTs.Oversampling_By_16);

        USARTs.Enable (Self.port.all);
    end init;


    procedure wait_tx(Self : UART_Port_F4xx) is
    begin
        loop
            exit when USARTs.Tx_Ready (Self.port.all);
        end loop;
    end wait_tx;


    function wait_rx(Self : UART_Port_F4xx; timeout : Integer := 1000) return Boolean is
        end_time : constant Time := Clock + Milliseconds (timeout);
    begin
        if timeout = 0 then
            return USARTs.Rx_Ready (Self.port.all);
        end if;
        loop
            exit when USARTs.Rx_Ready (Self.port.all);
            if Clock > end_time then
                return False;
            end if;
        end loop;
        return True;
    end wait_rx;


    overriding procedure write(Self : in out UART_Port_F4xx; data : UART_Data_8b) is
        result : UART_Status;
    begin
        wait_tx (Self);
        USARTs.Transmit (Self.port.all, data, result);
    end write;


    overriding function available(Self : in out UART_Port_F4xx) return Boolean is
    begin
        return USARTs.Rx_Ready (Self.port.all);
    end available;


    overriding function read(
        Self    : in out UART_Port_F4xx;
        data    : out UART_Data_8b;
        timeout : Integer := 1000
    ) return Boolean is
        result : UART_Status;
    begin
        if not wait_rx (Self, timeout) then
            return False;
        end if;
        USARTs.Receive (Self.port.all, data, result);
        return result = Ok;
    end read;


    overriding procedure write(Self : in out UART_Port_F4xx; str : String) is
        data : UART_Data_8b (1 .. str'Length) with Address => str'Address;
    begin
        write (Self, data);
    end write;


    overriding procedure print(Self : in out UART_Port_F4xx; str : String) is
    begin
        write (Self, str);
        write (Self, ASCII.CR & ASCII.LF);
    end print;

end UART.F4xx;
