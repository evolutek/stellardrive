pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.TAMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_TAMP1E_Field is Boolean;
   subtype CR1_TAMP2E_Field is Boolean;
   subtype CR1_TAMP3E_Field is Boolean;
   subtype CR1_ITAMP3E_Field is Boolean;
   subtype CR1_ITAMP4E_Field is Boolean;
   subtype CR1_ITAMP5E_Field is Boolean;
   subtype CR1_ITAMP6E_Field is Boolean;

   --  control register 1
   type CR1_Register is record
      --  TAMP1E
      TAMP1E         : CR1_TAMP1E_Field := False;
      --  TAMP2E
      TAMP2E         : CR1_TAMP2E_Field := False;
      --  TAMP2E
      TAMP3E         : CR1_TAMP3E_Field := False;
      --  unspecified
      Reserved_3_17  : HAL.UInt15 := 16#6000#;
      --  ITAMP3E
      ITAMP3E        : CR1_ITAMP3E_Field := True;
      --  ITAMP4E
      ITAMP4E        : CR1_ITAMP4E_Field := True;
      --  ITAMP5E
      ITAMP5E        : CR1_ITAMP5E_Field := True;
      --  ITAMP6E
      ITAMP6E        : CR1_ITAMP6E_Field := True;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#3FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      TAMP1E         at 0 range 0 .. 0;
      TAMP2E         at 0 range 1 .. 1;
      TAMP3E         at 0 range 2 .. 2;
      Reserved_3_17  at 0 range 3 .. 17;
      ITAMP3E        at 0 range 18 .. 18;
      ITAMP4E        at 0 range 19 .. 19;
      ITAMP5E        at 0 range 20 .. 20;
      ITAMP6E        at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype CR2_TAMP1NOER_Field is Boolean;
   subtype CR2_TAMP2NOER_Field is Boolean;
   subtype CR2_TAMP3NOER_Field is Boolean;
   subtype CR2_TAMP1MSK_Field is Boolean;
   subtype CR2_TAMP2MSK_Field is Boolean;
   subtype CR2_TAMP3MSK_Field is Boolean;
   subtype CR2_TAMP1TRG_Field is Boolean;
   subtype CR2_TAMP2TRG_Field is Boolean;
   subtype CR2_TAMP3TRG_Field is Boolean;

   --  control register 2
   type CR2_Register is record
      --  TAMP1NOER
      TAMP1NOER      : CR2_TAMP1NOER_Field := False;
      --  TAMP2NOER
      TAMP2NOER      : CR2_TAMP2NOER_Field := False;
      --  TAMP3NOER
      TAMP3NOER      : CR2_TAMP3NOER_Field := False;
      --  unspecified
      Reserved_3_15  : HAL.UInt13 := 16#0#;
      --  TAMP1MSK
      TAMP1MSK       : CR2_TAMP1MSK_Field := False;
      --  TAMP2MSK
      TAMP2MSK       : CR2_TAMP2MSK_Field := False;
      --  TAMP3MSK
      TAMP3MSK       : CR2_TAMP3MSK_Field := False;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      --  TAMP1TRG
      TAMP1TRG       : CR2_TAMP1TRG_Field := False;
      --  TAMP2TRG
      TAMP2TRG       : CR2_TAMP2TRG_Field := False;
      --  TAMP3TRG
      TAMP3TRG       : CR2_TAMP3TRG_Field := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      TAMP1NOER      at 0 range 0 .. 0;
      TAMP2NOER      at 0 range 1 .. 1;
      TAMP3NOER      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      TAMP1MSK       at 0 range 16 .. 16;
      TAMP2MSK       at 0 range 17 .. 17;
      TAMP3MSK       at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      TAMP1TRG       at 0 range 24 .. 24;
      TAMP2TRG       at 0 range 25 .. 25;
      TAMP3TRG       at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype FLTCR_TAMPFREQ_Field is HAL.UInt3;
   subtype FLTCR_TAMPFLT_Field is HAL.UInt2;
   subtype FLTCR_TAMPPRCH_Field is HAL.UInt2;
   subtype FLTCR_TAMPPUDIS_Field is Boolean;

   --  TAMP filter control register
   type FLTCR_Register is record
      --  TAMPFREQ
      TAMPFREQ      : FLTCR_TAMPFREQ_Field := 16#0#;
      --  TAMPFLT
      TAMPFLT       : FLTCR_TAMPFLT_Field := 16#0#;
      --  TAMPPRCH
      TAMPPRCH      : FLTCR_TAMPPRCH_Field := 16#0#;
      --  TAMPPUDIS
      TAMPPUDIS     : FLTCR_TAMPPUDIS_Field := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FLTCR_Register use record
      TAMPFREQ      at 0 range 0 .. 2;
      TAMPFLT       at 0 range 3 .. 4;
      TAMPPRCH      at 0 range 5 .. 6;
      TAMPPUDIS     at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype IER_TAMP1IE_Field is Boolean;
   subtype IER_TAMP2IE_Field is Boolean;
   subtype IER_TAMP3IE_Field is Boolean;
   subtype IER_ITAMP3IE_Field is Boolean;
   subtype IER_ITAMP4IE_Field is Boolean;
   subtype IER_ITAMP5IE_Field is Boolean;
   subtype IER_ITAMP6IE_Field is Boolean;

   --  TAMP interrupt enable register
   type IER_Register is record
      --  TAMP1IE
      TAMP1IE        : IER_TAMP1IE_Field := False;
      --  TAMP2IE
      TAMP2IE        : IER_TAMP2IE_Field := False;
      --  TAMP3IE
      TAMP3IE        : IER_TAMP3IE_Field := False;
      --  unspecified
      Reserved_3_17  : HAL.UInt15 := 16#0#;
      --  ITAMP3IE
      ITAMP3IE       : IER_ITAMP3IE_Field := False;
      --  ITAMP4IE
      ITAMP4IE       : IER_ITAMP4IE_Field := False;
      --  ITAMP5IE
      ITAMP5IE       : IER_ITAMP5IE_Field := False;
      --  ITAMP6IE
      ITAMP6IE       : IER_ITAMP6IE_Field := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      TAMP1IE        at 0 range 0 .. 0;
      TAMP2IE        at 0 range 1 .. 1;
      TAMP3IE        at 0 range 2 .. 2;
      Reserved_3_17  at 0 range 3 .. 17;
      ITAMP3IE       at 0 range 18 .. 18;
      ITAMP4IE       at 0 range 19 .. 19;
      ITAMP5IE       at 0 range 20 .. 20;
      ITAMP6IE       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype SR_TAMP1F_Field is Boolean;
   subtype SR_TAMP2F_Field is Boolean;
   subtype SR_TAMP3F_Field is Boolean;
   subtype SR_ITAMP3F_Field is Boolean;
   subtype SR_ITAMP4F_Field is Boolean;
   subtype SR_ITAMP5F_Field is Boolean;
   subtype SR_ITAMP6F_Field is Boolean;

   --  TAMP status register
   type SR_Register is record
      --  Read-only. TAMP1F
      TAMP1F         : SR_TAMP1F_Field;
      --  Read-only. TAMP2F
      TAMP2F         : SR_TAMP2F_Field;
      --  Read-only. TAMP3F
      TAMP3F         : SR_TAMP3F_Field;
      --  unspecified
      Reserved_3_17  : HAL.UInt15;
      --  Read-only. ITAMP3F
      ITAMP3F        : SR_ITAMP3F_Field;
      --  Read-only. ITAMP4F
      ITAMP4F        : SR_ITAMP4F_Field;
      --  Read-only. ITAMP5F
      ITAMP5F        : SR_ITAMP5F_Field;
      --  Read-only. ITAMP6F
      ITAMP6F        : SR_ITAMP6F_Field;
      --  unspecified
      Reserved_22_31 : HAL.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      TAMP1F         at 0 range 0 .. 0;
      TAMP2F         at 0 range 1 .. 1;
      TAMP3F         at 0 range 2 .. 2;
      Reserved_3_17  at 0 range 3 .. 17;
      ITAMP3F        at 0 range 18 .. 18;
      ITAMP4F        at 0 range 19 .. 19;
      ITAMP5F        at 0 range 20 .. 20;
      ITAMP6F        at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype MISR_TAMP1MF_Field is Boolean;
   subtype MISR_TAMP2MF_Field is Boolean;
   subtype MISR_TAMP3MF_Field is Boolean;
   subtype MISR_ITAMP3MF_Field is Boolean;
   subtype MISR_ITAMP4MF_Field is Boolean;
   subtype MISR_ITAMP5MF_Field is Boolean;
   subtype MISR_ITAMP6MF_Field is Boolean;

   --  TAMP masked interrupt status register
   type MISR_Register is record
      --  Read-only. TAMP1MF:
      TAMP1MF        : MISR_TAMP1MF_Field;
      --  Read-only. TAMP2MF
      TAMP2MF        : MISR_TAMP2MF_Field;
      --  Read-only. TAMP3MF
      TAMP3MF        : MISR_TAMP3MF_Field;
      --  unspecified
      Reserved_3_17  : HAL.UInt15;
      --  Read-only. ITAMP3MF
      ITAMP3MF       : MISR_ITAMP3MF_Field;
      --  Read-only. ITAMP4MF
      ITAMP4MF       : MISR_ITAMP4MF_Field;
      --  Read-only. ITAMP5MF
      ITAMP5MF       : MISR_ITAMP5MF_Field;
      --  Read-only. ITAMP6MF
      ITAMP6MF       : MISR_ITAMP6MF_Field;
      --  unspecified
      Reserved_22_31 : HAL.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MISR_Register use record
      TAMP1MF        at 0 range 0 .. 0;
      TAMP2MF        at 0 range 1 .. 1;
      TAMP3MF        at 0 range 2 .. 2;
      Reserved_3_17  at 0 range 3 .. 17;
      ITAMP3MF       at 0 range 18 .. 18;
      ITAMP4MF       at 0 range 19 .. 19;
      ITAMP5MF       at 0 range 20 .. 20;
      ITAMP6MF       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype SCR_CTAMP1F_Field is Boolean;
   subtype SCR_CTAMP2F_Field is Boolean;
   subtype SCR_CTAMP3F_Field is Boolean;
   subtype SCR_CITAMP3F_Field is Boolean;
   subtype SCR_CITAMP4F_Field is Boolean;
   subtype SCR_CITAMP5F_Field is Boolean;
   subtype SCR_CITAMP6F_Field is Boolean;

   --  TAMP status clear register
   type SCR_Register is record
      --  CTAMP1F
      CTAMP1F        : SCR_CTAMP1F_Field := False;
      --  CTAMP2F
      CTAMP2F        : SCR_CTAMP2F_Field := False;
      --  CTAMP3F
      CTAMP3F        : SCR_CTAMP3F_Field := False;
      --  unspecified
      Reserved_3_17  : HAL.UInt15 := 16#0#;
      --  CITAMP3F
      CITAMP3F       : SCR_CITAMP3F_Field := False;
      --  CITAMP4F
      CITAMP4F       : SCR_CITAMP4F_Field := False;
      --  CITAMP5F
      CITAMP5F       : SCR_CITAMP5F_Field := False;
      --  CITAMP6F
      CITAMP6F       : SCR_CITAMP6F_Field := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      CTAMP1F        at 0 range 0 .. 0;
      CTAMP2F        at 0 range 1 .. 1;
      CTAMP3F        at 0 range 2 .. 2;
      Reserved_3_17  at 0 range 3 .. 17;
      CITAMP3F       at 0 range 18 .. 18;
      CITAMP4F       at 0 range 19 .. 19;
      CITAMP5F       at 0 range 20 .. 20;
      CITAMP6F       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Tamper and backup registers
   type TAMP_Peripheral is record
      --  control register 1
      CR1    : aliased CR1_Register;
      --  control register 2
      CR2    : aliased CR2_Register;
      --  TAMP filter control register
      FLTCR  : aliased FLTCR_Register;
      --  TAMP interrupt enable register
      IER    : aliased IER_Register;
      --  TAMP status register
      SR     : aliased SR_Register;
      --  TAMP masked interrupt status register
      MISR   : aliased MISR_Register;
      --  TAMP status clear register
      SCR    : aliased SCR_Register;
      --  TAMP backup register
      BKP0R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP1R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP2R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP3R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP4R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP5R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP6R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP7R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP8R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP9R  : aliased HAL.UInt32;
      --  TAMP backup register
      BKP10R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP11R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP12R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP13R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP14R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP15R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP16R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP17R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP18R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP19R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP20R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP21R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP22R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP23R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP24R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP25R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP26R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP27R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP28R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP29R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP30R : aliased HAL.UInt32;
      --  TAMP backup register
      BKP31R : aliased HAL.UInt32;
   end record
     with Volatile;

   for TAMP_Peripheral use record
      CR1    at 16#0# range 0 .. 31;
      CR2    at 16#4# range 0 .. 31;
      FLTCR  at 16#C# range 0 .. 31;
      IER    at 16#2C# range 0 .. 31;
      SR     at 16#30# range 0 .. 31;
      MISR   at 16#34# range 0 .. 31;
      SCR    at 16#3C# range 0 .. 31;
      BKP0R  at 16#100# range 0 .. 31;
      BKP1R  at 16#104# range 0 .. 31;
      BKP2R  at 16#108# range 0 .. 31;
      BKP3R  at 16#10C# range 0 .. 31;
      BKP4R  at 16#110# range 0 .. 31;
      BKP5R  at 16#114# range 0 .. 31;
      BKP6R  at 16#118# range 0 .. 31;
      BKP7R  at 16#11C# range 0 .. 31;
      BKP8R  at 16#120# range 0 .. 31;
      BKP9R  at 16#124# range 0 .. 31;
      BKP10R at 16#128# range 0 .. 31;
      BKP11R at 16#12C# range 0 .. 31;
      BKP12R at 16#130# range 0 .. 31;
      BKP13R at 16#134# range 0 .. 31;
      BKP14R at 16#138# range 0 .. 31;
      BKP15R at 16#13C# range 0 .. 31;
      BKP16R at 16#140# range 0 .. 31;
      BKP17R at 16#144# range 0 .. 31;
      BKP18R at 16#148# range 0 .. 31;
      BKP19R at 16#14C# range 0 .. 31;
      BKP20R at 16#150# range 0 .. 31;
      BKP21R at 16#154# range 0 .. 31;
      BKP22R at 16#158# range 0 .. 31;
      BKP23R at 16#15C# range 0 .. 31;
      BKP24R at 16#160# range 0 .. 31;
      BKP25R at 16#164# range 0 .. 31;
      BKP26R at 16#168# range 0 .. 31;
      BKP27R at 16#16C# range 0 .. 31;
      BKP28R at 16#170# range 0 .. 31;
      BKP29R at 16#174# range 0 .. 31;
      BKP30R at 16#178# range 0 .. 31;
      BKP31R at 16#17C# range 0 .. 31;
   end record;

   --  Tamper and backup registers
   TAMP_Periph : aliased TAMP_Peripheral
     with Import, Address => TAMP_Base;

end STM32_SVD.TAMP;
