with HAL; use HAL;
with UART;

package LoRa is

    type LoRa_Device is record
        port : not null access UART.UART_Port'Class;
    end record;

    --  frequency is the MHz string put into the AT+TEST=rfcfg command (e.g.
    --  "868.0"). NB: the module may silently refuse some values -- verify with
    --  read_config after init.
    procedure init (device : in out LoRa_Device; frequency : String := "868.0");
    function ping (device : in out LoRa_Device) return Boolean;  -- send AT, bounded wait for a reply
    procedure send (device : in out LoRa_Device; msg : String);
    procedure send (device : in out LoRa_Device; data : UInt8_Array);

    --  Send and confirm the packet was actually radiated: returns True only if
    --  the module reports "+TEST: TX DONE" within the timeout, False otherwise.
    function send_confirm (device : in out LoRa_Device; data : UInt8_Array) return Boolean;

    --  Query the module's current radio config; copies its "+TEST: RFCFG ..."
    --  reply into buf and returns the length (0 if the module did not answer).
    function read_config (device : in out LoRa_Device; buf : out String) return Natural;

end LoRa;
