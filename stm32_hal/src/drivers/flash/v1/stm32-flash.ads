private with STM32_SVD.FLASH;
with HAL.Flash;

package STM32.Flash is
   type Internal_Flash is limited private;

   type Flash_Memory (Periph : not null access Internal_Flash) is
   limited new HAL.Flash.Flash_Memory with private;

   Chip_Size : constant := 2 ** 20; -- 1 MB

   overriding function Size (This : Flash_Memory)
      return Natural is (Chip_Size);

   overriding function Is_Busy (This : Flash_Memory) return Boolean;

   overriding function Erasable_Region (This : in out Flash_Memory;
      Region : HAL.Flash.Memory_Region) return HAL.Flash.Memory_Region;

   overriding procedure Erase (This : in out Flash_Memory;
      Region : HAL.Flash.Memory_Region;
      Success : out Boolean);

   --  I don't plan on doing this function will only do if we have time
   overriding procedure Read (This : in out Flash_Memory;
      Offset : Natural;
      Data : out HAL.UInt8_Array;
      Success : out Boolean);

   overriding procedure Write (This : in out Flash_Memory;
      Offset : Natural;
      Data : HAL.UInt8_Array;
      Success : out Boolean);

   function Is_Locked (This : Flash_Memory) return Boolean;

   procedure Unlock_CR (This : in out Flash_Memory);

   function Get_PSIZE (This : Flash_Memory) return HAL.UInt2;

   procedure Set_PSIZE (This : in out Flash_Memory; psize : HAL.UInt2);
private
   type Internal_Flash is new STM32_SVD.FLASH.FLASH_Peripheral;

   type Flash_Memory (
      Periph : not null access Internal_Flash)
      is limited new HAL.Flash.Flash_Memory with null record;
end STM32.Flash;