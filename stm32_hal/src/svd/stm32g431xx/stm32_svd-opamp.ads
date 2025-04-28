pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.OPAMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype OPAMP1_CSR_OPAEN_Field is Boolean;
   subtype OPAMP1_CSR_FORCE_VP_Field is Boolean;
   subtype OPAMP1_CSR_VP_SEL_Field is HAL.UInt2;
   subtype OPAMP1_CSR_USERTRIM_Field is Boolean;
   subtype OPAMP1_CSR_VM_SEL_Field is HAL.UInt2;
   subtype OPAMP1_CSR_OPAHSM_Field is Boolean;
   subtype OPAMP1_CSR_OPAINTOEN_Field is Boolean;
   subtype OPAMP1_CSR_CALON_Field is Boolean;
   subtype OPAMP1_CSR_CALSEL_Field is HAL.UInt2;
   subtype OPAMP1_CSR_PGA_GAIN_Field is HAL.UInt5;
   subtype OPAMP1_CSR_TRIMOFFSETP_Field is HAL.UInt5;
   subtype OPAMP1_CSR_TRIMOFFSETN_Field is HAL.UInt5;
   subtype OPAMP1_CSR_CALOUT_Field is Boolean;
   subtype OPAMP1_CSR_LOCK_Field is Boolean;

   --  OPAMP1 control/status register
   type OPAMP1_CSR_Register is record
      --  Operational amplifier Enable
      OPAEN          : OPAMP1_CSR_OPAEN_Field := False;
      --  FORCE_VP
      FORCE_VP       : OPAMP1_CSR_FORCE_VP_Field := False;
      --  VP_SEL
      VP_SEL         : OPAMP1_CSR_VP_SEL_Field := 16#0#;
      --  USERTRIM
      USERTRIM       : OPAMP1_CSR_USERTRIM_Field := False;
      --  VM_SEL
      VM_SEL         : OPAMP1_CSR_VM_SEL_Field := 16#0#;
      --  OPAHSM
      OPAHSM         : OPAMP1_CSR_OPAHSM_Field := False;
      --  OPAINTOEN
      OPAINTOEN      : OPAMP1_CSR_OPAINTOEN_Field := False;
      --  unspecified
      Reserved_9_10  : HAL.UInt2 := 16#0#;
      --  CALON
      CALON          : OPAMP1_CSR_CALON_Field := False;
      --  CALSEL
      CALSEL         : OPAMP1_CSR_CALSEL_Field := 16#0#;
      --  PGA_GAIN
      PGA_GAIN       : OPAMP1_CSR_PGA_GAIN_Field := 16#0#;
      --  TRIMOFFSETP
      TRIMOFFSETP    : OPAMP1_CSR_TRIMOFFSETP_Field := 16#0#;
      --  TRIMOFFSETN
      TRIMOFFSETN    : OPAMP1_CSR_TRIMOFFSETN_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : Boolean := False;
      --  CALOUT
      CALOUT         : OPAMP1_CSR_CALOUT_Field := False;
      --  LOCK
      LOCK           : OPAMP1_CSR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP1_CSR_Register use record
      OPAEN          at 0 range 0 .. 0;
      FORCE_VP       at 0 range 1 .. 1;
      VP_SEL         at 0 range 2 .. 3;
      USERTRIM       at 0 range 4 .. 4;
      VM_SEL         at 0 range 5 .. 6;
      OPAHSM         at 0 range 7 .. 7;
      OPAINTOEN      at 0 range 8 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      CALON          at 0 range 11 .. 11;
      CALSEL         at 0 range 12 .. 13;
      PGA_GAIN       at 0 range 14 .. 18;
      TRIMOFFSETP    at 0 range 19 .. 23;
      TRIMOFFSETN    at 0 range 24 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      CALOUT         at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype OPAMP2_CSR_OPAEN_Field is Boolean;
   subtype OPAMP2_CSR_FORCE_VP_Field is Boolean;
   subtype OPAMP2_CSR_VP_SEL_Field is HAL.UInt2;
   subtype OPAMP2_CSR_USERTRIM_Field is Boolean;
   subtype OPAMP2_CSR_VM_SEL_Field is HAL.UInt2;
   subtype OPAMP2_CSR_OPAHSM_Field is Boolean;
   subtype OPAMP2_CSR_OPAINTOEN_Field is Boolean;
   subtype OPAMP2_CSR_CALON_Field is Boolean;
   subtype OPAMP2_CSR_CALSEL_Field is HAL.UInt2;
   subtype OPAMP2_CSR_PGA_GAIN_Field is HAL.UInt5;
   subtype OPAMP2_CSR_TRIMOFFSETP_Field is HAL.UInt5;
   subtype OPAMP2_CSR_TRIMOFFSETN_Field is HAL.UInt5;
   subtype OPAMP2_CSR_CALOUT_Field is Boolean;
   subtype OPAMP2_CSR_LOCK_Field is Boolean;

   --  OPAMP2 control/status register
   type OPAMP2_CSR_Register is record
      --  Operational amplifier Enable
      OPAEN          : OPAMP2_CSR_OPAEN_Field := False;
      --  FORCE_VP
      FORCE_VP       : OPAMP2_CSR_FORCE_VP_Field := False;
      --  VP_SEL
      VP_SEL         : OPAMP2_CSR_VP_SEL_Field := 16#0#;
      --  USERTRIM
      USERTRIM       : OPAMP2_CSR_USERTRIM_Field := False;
      --  VM_SEL
      VM_SEL         : OPAMP2_CSR_VM_SEL_Field := 16#0#;
      --  OPAHSM
      OPAHSM         : OPAMP2_CSR_OPAHSM_Field := False;
      --  OPAINTOEN
      OPAINTOEN      : OPAMP2_CSR_OPAINTOEN_Field := False;
      --  unspecified
      Reserved_9_10  : HAL.UInt2 := 16#0#;
      --  CALON
      CALON          : OPAMP2_CSR_CALON_Field := False;
      --  CALSEL
      CALSEL         : OPAMP2_CSR_CALSEL_Field := 16#0#;
      --  PGA_GAIN
      PGA_GAIN       : OPAMP2_CSR_PGA_GAIN_Field := 16#0#;
      --  TRIMOFFSETP
      TRIMOFFSETP    : OPAMP2_CSR_TRIMOFFSETP_Field := 16#0#;
      --  TRIMOFFSETN
      TRIMOFFSETN    : OPAMP2_CSR_TRIMOFFSETN_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : Boolean := False;
      --  CALOUT
      CALOUT         : OPAMP2_CSR_CALOUT_Field := False;
      --  LOCK
      LOCK           : OPAMP2_CSR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP2_CSR_Register use record
      OPAEN          at 0 range 0 .. 0;
      FORCE_VP       at 0 range 1 .. 1;
      VP_SEL         at 0 range 2 .. 3;
      USERTRIM       at 0 range 4 .. 4;
      VM_SEL         at 0 range 5 .. 6;
      OPAHSM         at 0 range 7 .. 7;
      OPAINTOEN      at 0 range 8 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      CALON          at 0 range 11 .. 11;
      CALSEL         at 0 range 12 .. 13;
      PGA_GAIN       at 0 range 14 .. 18;
      TRIMOFFSETP    at 0 range 19 .. 23;
      TRIMOFFSETN    at 0 range 24 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      CALOUT         at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype OPAMP3_CSR_OPAEN_Field is Boolean;
   subtype OPAMP3_CSR_FORCE_VP_Field is Boolean;
   subtype OPAMP3_CSR_VP_SEL_Field is HAL.UInt2;
   subtype OPAMP3_CSR_USERTRIM_Field is Boolean;
   subtype OPAMP3_CSR_VM_SEL_Field is HAL.UInt2;
   subtype OPAMP3_CSR_OPAHSM_Field is Boolean;
   subtype OPAMP3_CSR_OPAINTOEN_Field is Boolean;
   subtype OPAMP3_CSR_CALON_Field is Boolean;
   subtype OPAMP3_CSR_CALSEL_Field is HAL.UInt2;
   subtype OPAMP3_CSR_PGA_GAIN_Field is HAL.UInt5;
   subtype OPAMP3_CSR_TRIMOFFSETP_Field is HAL.UInt5;
   subtype OPAMP3_CSR_TRIMOFFSETN_Field is HAL.UInt5;
   subtype OPAMP3_CSR_CALOUT_Field is Boolean;
   subtype OPAMP3_CSR_LOCK_Field is Boolean;

   --  OPAMP3 control/status register
   type OPAMP3_CSR_Register is record
      --  Operational amplifier Enable
      OPAEN          : OPAMP3_CSR_OPAEN_Field := False;
      --  FORCE_VP
      FORCE_VP       : OPAMP3_CSR_FORCE_VP_Field := False;
      --  VP_SEL
      VP_SEL         : OPAMP3_CSR_VP_SEL_Field := 16#0#;
      --  USERTRIM
      USERTRIM       : OPAMP3_CSR_USERTRIM_Field := False;
      --  VM_SEL
      VM_SEL         : OPAMP3_CSR_VM_SEL_Field := 16#0#;
      --  OPAHSM
      OPAHSM         : OPAMP3_CSR_OPAHSM_Field := False;
      --  OPAINTOEN
      OPAINTOEN      : OPAMP3_CSR_OPAINTOEN_Field := False;
      --  unspecified
      Reserved_9_10  : HAL.UInt2 := 16#0#;
      --  CALON
      CALON          : OPAMP3_CSR_CALON_Field := False;
      --  CALSEL
      CALSEL         : OPAMP3_CSR_CALSEL_Field := 16#0#;
      --  PGA_GAIN
      PGA_GAIN       : OPAMP3_CSR_PGA_GAIN_Field := 16#0#;
      --  TRIMOFFSETP
      TRIMOFFSETP    : OPAMP3_CSR_TRIMOFFSETP_Field := 16#0#;
      --  TRIMOFFSETN
      TRIMOFFSETN    : OPAMP3_CSR_TRIMOFFSETN_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : Boolean := False;
      --  CALOUT
      CALOUT         : OPAMP3_CSR_CALOUT_Field := False;
      --  LOCK
      LOCK           : OPAMP3_CSR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP3_CSR_Register use record
      OPAEN          at 0 range 0 .. 0;
      FORCE_VP       at 0 range 1 .. 1;
      VP_SEL         at 0 range 2 .. 3;
      USERTRIM       at 0 range 4 .. 4;
      VM_SEL         at 0 range 5 .. 6;
      OPAHSM         at 0 range 7 .. 7;
      OPAINTOEN      at 0 range 8 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      CALON          at 0 range 11 .. 11;
      CALSEL         at 0 range 12 .. 13;
      PGA_GAIN       at 0 range 14 .. 18;
      TRIMOFFSETP    at 0 range 19 .. 23;
      TRIMOFFSETN    at 0 range 24 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      CALOUT         at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype OPAMP1_TCMR_VMS_SEL_Field is Boolean;
   subtype OPAMP1_TCMR_VPS_SEL_Field is HAL.UInt2;
   subtype OPAMP1_TCMR_T1CM_EN_Field is Boolean;
   subtype OPAMP1_TCMR_T8CM_EN_Field is Boolean;
   subtype OPAMP1_TCMR_T20CM_EN_Field is Boolean;
   subtype OPAMP1_TCMR_LOCK_Field is Boolean;

   --  OPAMP1 control/status register
   type OPAMP1_TCMR_Register is record
      --  VMS_SEL
      VMS_SEL       : OPAMP1_TCMR_VMS_SEL_Field := False;
      --  VPS_SEL
      VPS_SEL       : OPAMP1_TCMR_VPS_SEL_Field := 16#0#;
      --  T1CM_EN
      T1CM_EN       : OPAMP1_TCMR_T1CM_EN_Field := False;
      --  T8CM_EN
      T8CM_EN       : OPAMP1_TCMR_T8CM_EN_Field := False;
      --  T20CM_EN
      T20CM_EN      : OPAMP1_TCMR_T20CM_EN_Field := False;
      --  unspecified
      Reserved_6_30 : HAL.UInt25 := 16#0#;
      --  LOCK
      LOCK          : OPAMP1_TCMR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP1_TCMR_Register use record
      VMS_SEL       at 0 range 0 .. 0;
      VPS_SEL       at 0 range 1 .. 2;
      T1CM_EN       at 0 range 3 .. 3;
      T8CM_EN       at 0 range 4 .. 4;
      T20CM_EN      at 0 range 5 .. 5;
      Reserved_6_30 at 0 range 6 .. 30;
      LOCK          at 0 range 31 .. 31;
   end record;

   subtype OPAMP2_TCMR_VMS_SEL_Field is Boolean;
   subtype OPAMP2_TCMR_VPS_SEL_Field is HAL.UInt2;
   subtype OPAMP2_TCMR_T1CM_EN_Field is Boolean;
   subtype OPAMP2_TCMR_T8CM_EN_Field is Boolean;
   subtype OPAMP2_TCMR_T20CM_EN_Field is Boolean;
   subtype OPAMP2_TCMR_LOCK_Field is Boolean;

   --  OPAMP2 control/status register
   type OPAMP2_TCMR_Register is record
      --  VMS_SEL
      VMS_SEL       : OPAMP2_TCMR_VMS_SEL_Field := False;
      --  VPS_SEL
      VPS_SEL       : OPAMP2_TCMR_VPS_SEL_Field := 16#0#;
      --  T1CM_EN
      T1CM_EN       : OPAMP2_TCMR_T1CM_EN_Field := False;
      --  T8CM_EN
      T8CM_EN       : OPAMP2_TCMR_T8CM_EN_Field := False;
      --  T20CM_EN
      T20CM_EN      : OPAMP2_TCMR_T20CM_EN_Field := False;
      --  unspecified
      Reserved_6_30 : HAL.UInt25 := 16#0#;
      --  LOCK
      LOCK          : OPAMP2_TCMR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP2_TCMR_Register use record
      VMS_SEL       at 0 range 0 .. 0;
      VPS_SEL       at 0 range 1 .. 2;
      T1CM_EN       at 0 range 3 .. 3;
      T8CM_EN       at 0 range 4 .. 4;
      T20CM_EN      at 0 range 5 .. 5;
      Reserved_6_30 at 0 range 6 .. 30;
      LOCK          at 0 range 31 .. 31;
   end record;

   subtype OPAMP3_TCMR_VMS_SEL_Field is Boolean;
   subtype OPAMP3_TCMR_VPS_SEL_Field is HAL.UInt2;
   subtype OPAMP3_TCMR_T1CM_EN_Field is Boolean;
   subtype OPAMP3_TCMR_T8CM_EN_Field is Boolean;
   subtype OPAMP3_TCMR_T20CM_EN_Field is Boolean;
   subtype OPAMP3_TCMR_LOCK_Field is Boolean;

   --  OPAMP3 control/status register
   type OPAMP3_TCMR_Register is record
      --  VMS_SEL
      VMS_SEL       : OPAMP3_TCMR_VMS_SEL_Field := False;
      --  VPS_SEL
      VPS_SEL       : OPAMP3_TCMR_VPS_SEL_Field := 16#0#;
      --  T1CM_EN
      T1CM_EN       : OPAMP3_TCMR_T1CM_EN_Field := False;
      --  T8CM_EN
      T8CM_EN       : OPAMP3_TCMR_T8CM_EN_Field := False;
      --  T20CM_EN
      T20CM_EN      : OPAMP3_TCMR_T20CM_EN_Field := False;
      --  unspecified
      Reserved_6_30 : HAL.UInt25 := 16#0#;
      --  LOCK
      LOCK          : OPAMP3_TCMR_LOCK_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP3_TCMR_Register use record
      VMS_SEL       at 0 range 0 .. 0;
      VPS_SEL       at 0 range 1 .. 2;
      T1CM_EN       at 0 range 3 .. 3;
      T8CM_EN       at 0 range 4 .. 4;
      T20CM_EN      at 0 range 5 .. 5;
      Reserved_6_30 at 0 range 6 .. 30;
      LOCK          at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Operational amplifiers
   type OPAMP_Peripheral is record
      --  OPAMP1 control/status register
      OPAMP1_CSR  : aliased OPAMP1_CSR_Register;
      --  OPAMP2 control/status register
      OPAMP2_CSR  : aliased OPAMP2_CSR_Register;
      --  OPAMP3 control/status register
      OPAMP3_CSR  : aliased OPAMP3_CSR_Register;
      --  OPAMP1 control/status register
      OPAMP1_TCMR : aliased OPAMP1_TCMR_Register;
      --  OPAMP2 control/status register
      OPAMP2_TCMR : aliased OPAMP2_TCMR_Register;
      --  OPAMP3 control/status register
      OPAMP3_TCMR : aliased OPAMP3_TCMR_Register;
   end record
     with Volatile;

   for OPAMP_Peripheral use record
      OPAMP1_CSR  at 16#0# range 0 .. 31;
      OPAMP2_CSR  at 16#4# range 0 .. 31;
      OPAMP3_CSR  at 16#8# range 0 .. 31;
      OPAMP1_TCMR at 16#18# range 0 .. 31;
      OPAMP2_TCMR at 16#1C# range 0 .. 31;
      OPAMP3_TCMR at 16#20# range 0 .. 31;
   end record;

   --  Operational amplifiers
   OPAMP_Periph : aliased OPAMP_Peripheral
     with Import, Address => OPAMP_Base;

end STM32_SVD.OPAMP;
