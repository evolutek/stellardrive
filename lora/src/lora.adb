with HAL.UART; use HAL.UART;
with HAL; use HAL;

with Ada.Real_Time; use Ada.Real_Time;

with UART;

package body LoRa is

    procedure raw_recv (device : in out LoRa_Device) is
        data     : UART_Data_8b(1..1);
        deadline : constant Time := Clock + Milliseconds (300);
    begin
        -- Drain the reply until LF, a per-byte read timeout, OR a 300 ms total
        -- budget -- a chatty or absent module must never stall the caller.
        loop
            exit when Clock > deadline;
            exit when not UART.read (device.port.all, data, 50);
            exit when UInt8 (Character'Pos (ASCII.LF)) = data(1);
        end loop;
    end raw_recv;


    --  Drain UART until the module goes QUIET (no byte for `quiet_ms`), or the
    --  total budget expires. Unlike raw_recv, it does NOT stop at the first LF:
    --  it keeps reading through multi-line replies and, crucially, waits out the
    --  gap after AT+MODE=TEST while the module actually switches into TEST mode.
    --  Sending AT+TEST=rfcfg before that switch completes gets it silently
    --  dropped -- which is exactly why rfcfg used to be ignored (the module kept
    --  its 868.0 defaults) even though the command was correct.
    procedure drain_quiet (device : in out LoRa_Device;
                           quiet_ms : Natural := 150;
                           total_ms : Natural := 1200) is
        data     : UART_Data_8b (1 .. 1);
        deadline : constant Time := Clock + Milliseconds (total_ms);
    begin
        loop
            exit when Clock > deadline;
            exit when not UART.read (device.port.all, data, quiet_ms);
        end loop;
    end drain_quiet;


    procedure init (device : in out LoRa_Device; frequency : String := "868.0") is
        ready : Boolean := False;
    begin
        --  The WIO-E5 can take up to ~2 s to boot after power-up. Poll AT until
        --  it answers before configuring, otherwise AT+MODE=TEST is lost and the
        --  module never enters TEST mode -- so TXLRPKT silently does nothing.
        for attempt in 1 .. 20 loop
            ready := ping (device);
            raw_recv (device);   -- drain the rest of the reply
            exit when ready;
            delay until Clock + Milliseconds (100);
        end loop;

        UART.print (device.port.all, "AT+MODE=TEST");
        --  Wait for the mode switch to COMPLETE (drain to quiet + settle) before
        --  configuring. raw_recv used to return on the first LF and rfcfg went
        --  out too early -> dropped -> module stayed on 868.0 defaults. This is
        --  the fix for "rfcfg silently ignored" (the C ref worked only because
        --  its blocking recv happened to wait here long enough).
        drain_quiet (device);
        delay until Clock + Milliseconds (200);

        --  Radio config, identical on both ends (receiver/src/main.py):
        --  <frequency> MHz, SF7, BW 125 kHz, TxPreamble 8, RxPreamble 8,
        --  TxPower 14 dBm, CRC on, IQ off, NET off.
        --  Operations reads it back to confirm it applied.
        UART.print (device.port.all,
                    "AT+TEST=rfcfg," & frequency & ",sf7,125,8,8,14,on,off,off");
        drain_quiet (device);
    end init;


    function ping (device : in out LoRa_Device) return Boolean is
        data : UART_Data_8b (1 .. 1);
    begin
        UART.print (device.port.all, "AT");
        return UART.read (device.port.all, data, 300);
    end ping;


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
        end if;
    end send;


    --  Read reply lines for up to timeout_ms; return True as soon as a line
    --  contains `needle` (e.g. "TX DONE"). Lets callers confirm a real TX.
    function await (device : in out LoRa_Device; needle : String; timeout_ms : Natural) return Boolean is
        data     : UART_Data_8b (1 .. 1);
        line     : String (1 .. 64);
        n        : Natural := 0;
        deadline : constant Time := Clock + Milliseconds (timeout_ms);

        function line_has_needle return Boolean is
        begin
            if n >= needle'Length then
                for s in 1 .. n - needle'Length + 1 loop
                    if line (s .. s + needle'Length - 1) = needle then
                        return True;
                    end if;
                end loop;
            end if;
            return False;
        end line_has_needle;
    begin
        loop
            exit when Clock > deadline;
            if UART.read (device.port.all, data, 40) then
                if data (1) = UInt8 (Character'Pos (ASCII.LF))
                   or data (1) = UInt8 (Character'Pos (ASCII.CR)) then
                    if line_has_needle then return True; end if;
                    n := 0;
                elsif n < line'Length then
                    n := n + 1;
                    line (n) := Character'Val (data (1));
                end if;
            end if;
        end loop;
        return line_has_needle;
    end await;


    --  Send data and confirm it was actually radiated: the WIO-E5 answers
    --  "+TEST: TXLRPKT ..." then "+TEST: TX DONE" once the packet has left the
    --  radio. Returns True only if that "TX DONE" is seen within the timeout.
    function send_confirm (device : in out LoRa_Device; data : UInt8_Array) return Boolean is
    begin
        if data'Length = 0 then
            return False;
        end if;
        send (device, data);
        return await (device, "TX DONE", 600);
    end send_confirm;


    --  Query the module's CURRENT radio config and copy its "+TEST: RFCFG ..."
    --  reply into buf; returns the number of characters written (0 = no reply).
    --  Lets the caller VERIFY the rfcfg actually took (e.g. contains 865125000)
    --  instead of assuming AT+TEST=rfcfg succeeded.
    function read_config (device : in out LoRa_Device; buf : out String) return Natural is
        data     : UART_Data_8b (1 .. 1);
        n        : Natural := 0;
        deadline : constant Time := Clock + Milliseconds (500);
    begin
        buf := (buf'Range => ' ');
        raw_recv (device);   -- drop any stale bytes first
        UART.print (device.port.all, "AT+TEST=RFCFG");
        loop
            exit when Clock > deadline;
            if UART.read (device.port.all, data, 100) then
                if data (1) = UInt8 (Character'Pos (ASCII.LF))
                   or data (1) = UInt8 (Character'Pos (ASCII.CR)) then
                    exit when n > 0;   -- first complete non-empty line
                elsif n < buf'Length then
                    n := n + 1;
                    buf (buf'First + n - 1) := Character'Val (data (1));
                end if;
            end if;
        end loop;
        return n;
    end read_config;


end LoRa;
