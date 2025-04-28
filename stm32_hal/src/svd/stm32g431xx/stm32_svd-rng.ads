pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.RNG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_RNGEN_Field is Boolean;
   subtype CR_IE_Field is Boolean;
   subtype CR_CED_Field is Boolean;

   --  control register
   type CR_Register is record
      --  unspecified
      Reserved_0_1  : HAL.UInt2 := 16#0#;
      --  Random number generator enable
      RNGEN         : CR_RNGEN_Field := False;
      --  Interrupt enable
      IE            : CR_IE_Field := False;
      --  unspecified
      Reserved_4_4  : Boolean := False;
      --  Clock error detection
      CED           : CR_CED_Field := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      RNGEN         at 0 range 2 .. 2;
      IE            at 0 range 3 .. 3;
      Reserved_4_4  at 0 range 4 .. 4;
      CED           at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype SR_DRDY_Field is Boolean;
   subtype SR_CECS_Field is Boolean;
   subtype SR_SECS_Field is Boolean;
   subtype SR_CEIS_Field is Boolean;
   subtype SR_SEIS_Field is Boolean;

   --  status register
   type SR_Register is record
      --  Read-only. Data ready
      DRDY          : SR_DRDY_Field := False;
      --  Read-only. Clock error current status
      CECS          : SR_CECS_Field := False;
      --  Read-only. Seed error current status
      SECS          : SR_SECS_Field := False;
      --  unspecified
      Reserved_3_4  : HAL.UInt2 := 16#0#;
      --  Clock error interrupt status
      CEIS          : SR_CEIS_Field := False;
      --  Seed error interrupt status
      SEIS          : SR_SEIS_Field := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      DRDY          at 0 range 0 .. 0;
      CECS          at 0 range 1 .. 1;
      SECS          at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      CEIS          at 0 range 5 .. 5;
      SEIS          at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Random number generator
   type RNG_Peripheral is record
      --  control register
      CR : aliased CR_Register;
      --  status register
      SR : aliased SR_Register;
      --  data register
      DR : aliased HAL.UInt32;
   end record
     with Volatile;

   for RNG_Peripheral use record
      CR at 16#0# range 0 .. 31;
      SR at 16#4# range 0 .. 31;
      DR at 16#8# range 0 .. 31;
   end record;

   --  Random number generator
   RNG_Periph : aliased RNG_Peripheral
     with Import, Address => RNG_Base;

end STM32_SVD.RNG;
