pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.COMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype COMP_C1CSR_EN_Field is Boolean;
   subtype COMP_C1CSR_INMSEL_Field is HAL.UInt3;
   subtype COMP_C1CSR_INPSEL_Field is Boolean;
   subtype COMP_C1CSR_POL_Field is Boolean;
   subtype COMP_C1CSR_HYST_Field is HAL.UInt3;
   subtype COMP_C1CSR_BLANKSEL_Field is HAL.UInt3;
   subtype COMP_C1CSR_BRGEN_Field is Boolean;
   subtype COMP_C1CSR_SCALEN_Field is Boolean;
   subtype COMP_C1CSR_VALUE_Field is Boolean;
   subtype COMP_C1CSR_LOCK_Field is Boolean;

   --  Comparator control/status register
   type COMP_C1CSR_Register is record
      --  EN
      EN             : COMP_C1CSR_EN_Field := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  INMSEL
      INMSEL         : COMP_C1CSR_INMSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  INPSEL
      INPSEL         : COMP_C1CSR_INPSEL_Field := False;
      --  unspecified
      Reserved_9_14  : HAL.UInt6 := 16#0#;
      --  POL
      POL            : COMP_C1CSR_POL_Field := False;
      --  HYST
      HYST           : COMP_C1CSR_HYST_Field := 16#0#;
      --  BLANKSEL
      BLANKSEL       : COMP_C1CSR_BLANKSEL_Field := 16#0#;
      --  BRGEN
      BRGEN          : COMP_C1CSR_BRGEN_Field := False;
      --  SCALEN
      SCALEN         : COMP_C1CSR_SCALEN_Field := False;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Read-only. VALUE
      VALUE          : COMP_C1CSR_VALUE_Field := False;
      --  LOCK
      LOCK           : COMP_C1CSR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP_C1CSR_Register use record
      EN             at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      INMSEL         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      INPSEL         at 0 range 8 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      POL            at 0 range 15 .. 15;
      HYST           at 0 range 16 .. 18;
      BLANKSEL       at 0 range 19 .. 21;
      BRGEN          at 0 range 22 .. 22;
      SCALEN         at 0 range 23 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      VALUE          at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype COMP_C2CSR_EN_Field is Boolean;
   subtype COMP_C2CSR_INMSEL_Field is HAL.UInt3;
   subtype COMP_C2CSR_INPSEL_Field is Boolean;
   subtype COMP_C2CSR_POL_Field is Boolean;
   subtype COMP_C2CSR_HYST_Field is HAL.UInt3;
   subtype COMP_C2CSR_BLANKSEL_Field is HAL.UInt3;
   subtype COMP_C2CSR_BRGEN_Field is Boolean;
   subtype COMP_C2CSR_SCALEN_Field is Boolean;
   subtype COMP_C2CSR_VALUE_Field is Boolean;
   subtype COMP_C2CSR_LOCK_Field is Boolean;

   --  Comparator control/status register
   type COMP_C2CSR_Register is record
      --  EN
      EN             : COMP_C2CSR_EN_Field := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  INMSEL
      INMSEL         : COMP_C2CSR_INMSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  INPSEL
      INPSEL         : COMP_C2CSR_INPSEL_Field := False;
      --  unspecified
      Reserved_9_14  : HAL.UInt6 := 16#0#;
      --  POL
      POL            : COMP_C2CSR_POL_Field := False;
      --  HYST
      HYST           : COMP_C2CSR_HYST_Field := 16#0#;
      --  BLANKSEL
      BLANKSEL       : COMP_C2CSR_BLANKSEL_Field := 16#0#;
      --  BRGEN
      BRGEN          : COMP_C2CSR_BRGEN_Field := False;
      --  SCALEN
      SCALEN         : COMP_C2CSR_SCALEN_Field := False;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Read-only. VALUE
      VALUE          : COMP_C2CSR_VALUE_Field := False;
      --  LOCK
      LOCK           : COMP_C2CSR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP_C2CSR_Register use record
      EN             at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      INMSEL         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      INPSEL         at 0 range 8 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      POL            at 0 range 15 .. 15;
      HYST           at 0 range 16 .. 18;
      BLANKSEL       at 0 range 19 .. 21;
      BRGEN          at 0 range 22 .. 22;
      SCALEN         at 0 range 23 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      VALUE          at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype COMP_C3CSR_EN_Field is Boolean;
   subtype COMP_C3CSR_INMSEL_Field is HAL.UInt3;
   subtype COMP_C3CSR_INPSEL_Field is Boolean;
   subtype COMP_C3CSR_POL_Field is Boolean;
   subtype COMP_C3CSR_HYST_Field is HAL.UInt3;
   subtype COMP_C3CSR_BLANKSEL_Field is HAL.UInt3;
   subtype COMP_C3CSR_BRGEN_Field is Boolean;
   subtype COMP_C3CSR_SCALEN_Field is Boolean;
   subtype COMP_C3CSR_VALUE_Field is Boolean;
   subtype COMP_C3CSR_LOCK_Field is Boolean;

   --  Comparator control/status register
   type COMP_C3CSR_Register is record
      --  EN
      EN             : COMP_C3CSR_EN_Field := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  INMSEL
      INMSEL         : COMP_C3CSR_INMSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  INPSEL
      INPSEL         : COMP_C3CSR_INPSEL_Field := False;
      --  unspecified
      Reserved_9_14  : HAL.UInt6 := 16#0#;
      --  POL
      POL            : COMP_C3CSR_POL_Field := False;
      --  HYST
      HYST           : COMP_C3CSR_HYST_Field := 16#0#;
      --  BLANKSEL
      BLANKSEL       : COMP_C3CSR_BLANKSEL_Field := 16#0#;
      --  BRGEN
      BRGEN          : COMP_C3CSR_BRGEN_Field := False;
      --  SCALEN
      SCALEN         : COMP_C3CSR_SCALEN_Field := False;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Read-only. VALUE
      VALUE          : COMP_C3CSR_VALUE_Field := False;
      --  LOCK
      LOCK           : COMP_C3CSR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP_C3CSR_Register use record
      EN             at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      INMSEL         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      INPSEL         at 0 range 8 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      POL            at 0 range 15 .. 15;
      HYST           at 0 range 16 .. 18;
      BLANKSEL       at 0 range 19 .. 21;
      BRGEN          at 0 range 22 .. 22;
      SCALEN         at 0 range 23 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      VALUE          at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype COMP_C4CSR_EN_Field is Boolean;
   subtype COMP_C4CSR_INMSEL_Field is HAL.UInt3;
   subtype COMP_C4CSR_INPSEL_Field is Boolean;
   subtype COMP_C4CSR_POL_Field is Boolean;
   subtype COMP_C4CSR_HYST_Field is HAL.UInt3;
   subtype COMP_C4CSR_BLANKSEL_Field is HAL.UInt3;
   subtype COMP_C4CSR_BRGEN_Field is Boolean;
   subtype COMP_C4CSR_SCALEN_Field is Boolean;
   subtype COMP_C4CSR_VALUE_Field is Boolean;
   subtype COMP_C4CSR_LOCK_Field is Boolean;

   --  Comparator control/status register
   type COMP_C4CSR_Register is record
      --  EN
      EN             : COMP_C4CSR_EN_Field := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  INMSEL
      INMSEL         : COMP_C4CSR_INMSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  INPSEL
      INPSEL         : COMP_C4CSR_INPSEL_Field := False;
      --  unspecified
      Reserved_9_14  : HAL.UInt6 := 16#0#;
      --  POL
      POL            : COMP_C4CSR_POL_Field := False;
      --  HYST
      HYST           : COMP_C4CSR_HYST_Field := 16#0#;
      --  BLANKSEL
      BLANKSEL       : COMP_C4CSR_BLANKSEL_Field := 16#0#;
      --  BRGEN
      BRGEN          : COMP_C4CSR_BRGEN_Field := False;
      --  SCALEN
      SCALEN         : COMP_C4CSR_SCALEN_Field := False;
      --  unspecified
      Reserved_24_29 : HAL.UInt6 := 16#0#;
      --  Read-only. VALUE
      VALUE          : COMP_C4CSR_VALUE_Field := False;
      --  LOCK
      LOCK           : COMP_C4CSR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP_C4CSR_Register use record
      EN             at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      INMSEL         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      INPSEL         at 0 range 8 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      POL            at 0 range 15 .. 15;
      HYST           at 0 range 16 .. 18;
      BLANKSEL       at 0 range 19 .. 21;
      BRGEN          at 0 range 22 .. 22;
      SCALEN         at 0 range 23 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      VALUE          at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Comparator control and status register
   type COMP_Peripheral is record
      --  Comparator control/status register
      COMP_C1CSR : aliased COMP_C1CSR_Register;
      --  Comparator control/status register
      COMP_C2CSR : aliased COMP_C2CSR_Register;
      --  Comparator control/status register
      COMP_C3CSR : aliased COMP_C3CSR_Register;
      --  Comparator control/status register
      COMP_C4CSR : aliased COMP_C4CSR_Register;
   end record
     with Volatile;

   for COMP_Peripheral use record
      COMP_C1CSR at 16#0# range 0 .. 31;
      COMP_C2CSR at 16#4# range 0 .. 31;
      COMP_C3CSR at 16#8# range 0 .. 31;
      COMP_C4CSR at 16#C# range 0 .. 31;
   end record;

   --  Comparator control and status register
   COMP_Periph : aliased COMP_Peripheral
     with Import, Address => COMP_Base;

end STM32_SVD.COMP;
