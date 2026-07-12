with HAL; use HAL;

--  SD-card logger over the STM32F407 SDIO peripheral (1-bit bus), storing data
--  as files on the card's first FAT partition (mounted at "/sd"). One physical
--  card => this is a singleton, mirroring the single SDIO peripheral.
--
--  Board wiring (AF12): PC8=D0, PC9=D1, PC10=D2, PC11=D3, PC12=CK, PD2=CMD.
--  In 1-bit mode only D0 carries data, but every line is configured.
package SD is

   --  Bring up the SDIO pins + peripheral, identify the card and mount its
   --  first FAT volume. Returns False if there is no card, it is not FAT, or a
   --  hardware error occurs. Safe to ignore the result: the rest of the API is
   --  a no-op until a mount succeeds, so a missing card never blocks the app.
   function init return Boolean;

   --  True once init succeeded and the volume is mounted.
   function is_mounted return Boolean;

   --  Open (creating it if absent) the log file and position at end-of-file so
   --  writes append. `path` is absolute on the mount, e.g. "/sd/telem.bin".
   function open_log (path : String) return Boolean;

   --  Append raw bytes / a CRLF-terminated text line to the open log.
   function write (data : UInt8_Array) return Boolean;
   function write_line (line : String) return Boolean;

   --  Flush FAT metadata + data to the card. Call periodically so a power loss
   --  costs at most the records written since the previous flush.
   function flush return Boolean;

   --  Close the log file (implies a final flush).
   procedure close;

end SD;
