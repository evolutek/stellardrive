with System; use System;
with Ada.Real_Time; use Ada.Real_Time;

package body STM32.Flash is
   Masks : constant array (1 .. 3) of HAL.UInt32 :=
      (2 ** 15 - 1, 2 ** 17 - 1, 2 ** 18 - 1);
   --  masks for 32K, 128K and 256K erasable regions

   overriding function Is_Busy (This : Flash_Memory) return Boolean is
   begin
      return This.Periph.SR.BSY;
   end Is_Busy;

   --  this is taken from the W25Q16 driver in the Ada drivers library but it probably is built only for SPI memory
   --  I think it's taking the memory region it gets and giving you the beginning and end of the sectors they are within
   overriding function Erasable_Region (This : in out Flash_Memory;
      Region : HAL.Flash.Memory_Region)
      return HAL.Flash.Memory_Region is

      From : constant HAL.UInt32 := HAL.UInt32 (Region.From);
      To   : constant HAL.UInt32 := HAL.UInt32 (Region.To);
   begin
      for Mask of Masks loop
         if (From and not Mask) = (To and not Mask) then
            return (From => Natural (From and not Mask),
                  To   => Natural (From or Mask));
         end if;
      end loop;

      return (0, Chip_Size - 1); -- Chip erase
   end Erasable_Region;

   --  this does not follow what I think is the intended formula it is supposed to but it should work
   --  It's possible that Memory Region To and From are intended to be addresses but here I assume that they are sectors
   --  I do this because the main flash can only be erased by complete sectors anyway
   overriding procedure Erase (This : in out Flash_Memory;
      Region : HAL.Flash.Memory_Region;
      Success : out Boolean) is

      From : constant Natural := Region.From;
      To   : constant Natural := Region.To;
   begin
      --  Some hardcoded nonsense to check ranges on sectors not good coding practice
      if From > To or else From > 8 or else To > 8 or else This.Is_Locked then
         Success := False;
         return;
      end if;

      -- Do erase operation for all sectors given by looping between the two points
      for i in From .. To loop
         --  Ends call in failure if there is already a flash operation
         if This.Is_Busy then
            Success := False;
            return;
         end if;

         --  Sets the sector erase bit
         This.Periph.CR.SER := True;

         --  Set sector to erase
         This.Periph.CR.SNB := UInt5 (i);

         --  Begin Erase Operation
         This.Periph.CR.STRT := True;

         --  busy waits for one sector erase to finish before doing the next or finishing the operation
         loop
            exit when not This.Is_Busy;
         end loop;
      end loop;
      Success := True;
   end Erase;

   overriding procedure Read (This : in out Flash_Memory;
      Offset : Natural;
      Data : out HAL.UInt8_Array;
      Success : out Boolean) is
      --  We don't need this for our project so it isn't implemented
      Read_Loc : HAL.UInt8_Array (1 .. 4);
      for Read_Loc'Address use System'To_Address (Offset);
   begin
      if This.Is_Busy then
         Success := False;
         return;
      end if;

      Data := Read_Loc;
      Success := True;
   end Read;

   overriding procedure Write (This : in out Flash_Memory;
      Offset : Natural;
      Data : HAL.UInt8_Array;
      Success : out Boolean) is
      --  We should only be writing 32 bits at a time
      Write_Loc : HAL.UInt8_Array (1 .. 4);
   
      Data_To_Write : HAL.UInt8_Array(1 .. 4) := Data;

      --  Sets the address to the offset
      for Write_Loc'Address use System'To_Address (Offset);
   begin
      --  If there is a flash operation then the process should fail
      --  If the data sent is not 32 bits the process should fail
      Success := False;

      if This.Is_Busy or else Data'Length /= 4 or else This.Is_Locked then
         Success := False;
         return;
      end if;

      --  Become busy
      --This.Periph.SR.BSY := True;

      --  check error registers
      This.Periph.SR.PGAERR := True;
      This.Periph.SR.PGPERR := True;
      This.Periph.SR.PGSERR := True;
      This.Periph.SR.WRPERR := True;

      -- set PSIZE to 32 bit mode
      This.Periph.CR.PSIZE := 2#10#;

      This.Periph.CR.PG := True;

      --  Writes 4 bytes directly to the flash
      --  for i in 1 .. 4 loop
      --     Write_Loc (i) := Data_To_Write (i);
      --  end loop;
      Write_Loc := Data_To_Write;

      --  check error flags
      if This.Periph.SR.PGAERR or This.Periph.SR.PGPERR or This.Periph.SR.PGSERR or This.Periph.SR.WRPERR then
         Success := False;
         return;
      end if;

      --  Busy waits while the BSY bit is still 1
      loop
         exit when not This.Is_Busy;
      end loop;
      Success := True;
   end Write;

   function Is_Locked (This : Flash_Memory) return Boolean is
   begin
      return This.Periph.CR.LOCK;
   end Is_Locked;

   procedure Unlock_CR (This : in out Flash_Memory) is
   begin
      loop
         exit when not This.Is_Busy;
      end loop;

      This.Periph.KEYR := 16#4567_0123#;

      This.Periph.KEYR := 16#CDEF_89AB#;
      
   end Unlock_CR;

   function Get_PSIZE (This : Flash_Memory) return HAL.UInt2 is
   begin
      return This.Periph.CR.PSIZE;
   end Get_PSIZE;

   procedure Set_PSIZE (This : in out Flash_Memory; psize : HAL.UInt2) is
   begin
      This.Periph.CR.PSIZE := psize;
   end Set_PSIZE;
end STM32.Flash;