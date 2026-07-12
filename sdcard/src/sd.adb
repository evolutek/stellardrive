with System;

with STM32.Device; use STM32.Device;
with STM32.GPIO;   use STM32.GPIO;
with STM32.SDMMC;  use STM32.SDMMC;
with HAL.SDMMC;    use HAL.SDMMC;

with File_IO;
use type File_IO.Status_Code;
use type File_IO.File_Size;

package body SD is

   Mount_Name : constant String := "sd";

   mounted_flag : Boolean := False;
   open_flag    : Boolean := False;
   log_file     : File_IO.File_Descriptor;

   function is_mounted return Boolean is (mounted_flag);


   function init return Boolean is
      --  CMD + the four data lines share one config; CK wants no pull-up.
      Bus : constant GPIO_Points :=
        (STM32.Device.PD2,    -- CMD
         STM32.Device.PC8,    -- D0
         STM32.Device.PC9,    -- D1
         STM32.Device.PC10,   -- D2
         STM32.Device.PC11);  -- D3
      Clk : constant GPIO_Points := (1 => STM32.Device.PC12);
      Err : SD_Error;
      St  : File_IO.Status_Code;
   begin
      Enable_Clock (Bus);
      Enable_Clock (Clk);
      Configure_IO (Bus,
        (Mode           => Mode_AF,
         AF             => GPIO_AF_SDIO_12,
         AF_Speed       => Speed_50MHz,
         AF_Output_Type => Push_Pull,
         Resistors      => Pull_Up,
         others         => <>));
      Configure_IO (Clk,
        (Mode           => Mode_AF,
         AF             => GPIO_AF_SDIO_12,
         AF_Speed       => Speed_50MHz,
         AF_Output_Type => Push_Pull,
         Resistors      => Floating,
         others         => <>));

      --  Bring up the SDIO controller. Its kernel clock is the MCU's 48 MHz
      --  domain (PLL48CK); Set_Clk_Src_Speed tells the driver that source rate
      --  so it can derive the 400 kHz identification / 24 MHz transfer clocks.
      Enable_Clock (STM32.Device.SDIO);
      Reset (STM32.Device.SDIO);
      Set_Clk_Src_Speed (STM32.Device.SDIO, 48_000_000);
      Err := Initialize (STM32.Device.SDIO);
      if Err /= OK then
         return False;
      end if;

      St := File_IO.Mount_Drive (Mount_Name, STM32.Device.SDIO'Access);
      mounted_flag := St = File_IO.OK;
      return mounted_flag;
   end init;


   function open_log (path : String) return Boolean is
      St     : File_IO.Status_Code;
      Amount : File_IO.File_Size := 0;
   begin
      if not mounted_flag then
         return False;
      end if;
      St := File_IO.Open (log_file, path, File_IO.Write_Only);
      if St = File_IO.No_Such_File then
         St := File_IO.Create_File (path);
         if St /= File_IO.OK then
            return False;
         end if;
         St := File_IO.Open (log_file, path, File_IO.Write_Only);
      end if;
      if St /= File_IO.OK then
         return False;
      end if;
      --  Position at end-of-file so subsequent writes append.
      St := File_IO.Seek (log_file, File_IO.From_End, Amount);
      open_flag := St = File_IO.OK;
      return open_flag;
   end open_log;


   function write (data : UInt8_Array) return Boolean is
      N : File_IO.File_Size;
   begin
      if not open_flag or else data'Length = 0 then
         return open_flag;
      end if;
      N := File_IO.Write
        (log_file, data'Address, File_IO.File_Size (data'Length));
      return N = File_IO.File_Size (data'Length);
   end write;


   function write_line (line : String) return Boolean is
      CRLF : constant String := ASCII.CR & ASCII.LF;
      N    : File_IO.File_Size;
      ok   : Boolean := True;
   begin
      if not open_flag then
         return False;
      end if;
      if line'Length > 0 then
         N := File_IO.Write
           (log_file, line'Address, File_IO.File_Size (line'Length));
         ok := N = File_IO.File_Size (line'Length);
      end if;
      N := File_IO.Write
        (log_file, CRLF'Address, File_IO.File_Size (CRLF'Length));
      return ok and then N = File_IO.File_Size (CRLF'Length);
   end write_line;


   function flush return Boolean is
   begin
      if not open_flag then
         return False;
      end if;
      return File_IO.Flush (log_file) = File_IO.OK;
   end flush;


   procedure close is
   begin
      if open_flag then
         File_IO.Close (log_file);
         open_flag := False;
      end if;
   end close;

end SD;
