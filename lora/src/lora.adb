with HAL.UART; use HAL.UART;
with HAL; use HAL;

with UART;

package body LoRa is

    procedure raw_recv (device : in out LoRa_Device) is
        data : UART_Data_8b(1..1);
    begin
        loop
            loop
                exit when UART.available (device.port.all);
            end loop;
            exit when not UART.read (device.port.all, data, 10);
            --UART.write (Main.usb_serial, data);
            exit when UInt8 (Character'Pos (ASCII.LF)) = data(1);
        end loop;
    end raw_recv;


    procedure init (device : in out LoRa_Device) is
    begin
        UART.print (device.port.all, "AT+MODE=TEST");
        raw_recv (device);
        UART.print (device.port.all, "AT+TEST=rfcfg,869.5,sf7,250,12,15,14,on,off,off");
        raw_recv (device);
    end init;


    procedure send (device : in out LoRa_Device; msg : String) is
        data : UInt8_Array(1..msg'Length);
    begin
        for i in 1..msg'Length loop
            data (i) := Character'Pos (msg (i));
        end loop;
        send (device, data);
    end send;


    procedure send (device : in out LoRa_Device; data : UInt8_Array) is
        hex_msg : String(1..(data'Length * 2));
        cpos : Integer;
        cmap : constant array (0..15) of Character := (
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
        );
    begin
        if data'Length > 0 then
            for i in 1..data'Length loop
                cpos := Integer (data (i));
                hex_msg ((i * 2) - 1) := cmap (cpos / 16);
                hex_msg ( i * 2     ) := cmap (cpos mod 16);
            end loop;
            UART.print (device.port.all, "AT+TEST=TXLRPKT,""" & hex_msg & """");
            --raw_recv (device);
            --raw_recv (device);
        end if;
    end send;


end LoRa;
