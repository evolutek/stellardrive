pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.DAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype DAC_CR_EN1_Field is Boolean;
   subtype DAC_CR_TEN1_Field is Boolean;
   subtype DAC_CR_TSEL1_Field is HAL.UInt4;
   subtype DAC_CR_WAVE1_Field is HAL.UInt2;
   subtype DAC_CR_MAMP1_Field is HAL.UInt4;
   subtype DAC_CR_DMAEN1_Field is Boolean;
   subtype DAC_CR_DMAUDRIE1_Field is Boolean;
   subtype DAC_CR_CEN1_Field is Boolean;
   subtype DAC_CR_EN2_Field is Boolean;
   subtype DAC_CR_TEN2_Field is Boolean;
   subtype DAC_CR_TSEL2_Field is HAL.UInt4;
   subtype DAC_CR_WAVE2_Field is HAL.UInt2;
   subtype DAC_CR_MAMP2_Field is HAL.UInt4;
   subtype DAC_CR_DMAEN2_Field is Boolean;
   subtype DAC_CR_DMAUDRIE2_Field is Boolean;
   subtype DAC_CR_CEN2_Field is Boolean;

   --  DAC control register
   type DAC_CR_Register is record
      --  DAC channel1 enable This bit is set and cleared by software to
      --  enable/disable DAC channel1.
      EN1            : DAC_CR_EN1_Field := False;
      --  DAC channel1 trigger enable
      TEN1           : DAC_CR_TEN1_Field := False;
      --  DAC channel1 trigger selection These bits select the external event
      --  used to trigger DAC channel1. Note: Only used if bit TEN1 = 1 (DAC
      --  channel1 trigger enabled).
      TSEL1          : DAC_CR_TSEL1_Field := 16#0#;
      --  DAC channel1 noise/triangle wave generation enable These bits are set
      --  and cleared by software. Note: Only used if bit TEN1 = 1 (DAC
      --  channel1 trigger enabled).
      WAVE1          : DAC_CR_WAVE1_Field := 16#0#;
      --  DAC channel1 mask/amplitude selector These bits are written by
      --  software to select mask in wave generation mode or amplitude in
      --  triangle generation mode. = 1011: Unmask bits[11:0] of LFSR/ triangle
      --  amplitude equal to 4095
      MAMP1          : DAC_CR_MAMP1_Field := 16#0#;
      --  DAC channel1 DMA enable This bit is set and cleared by software.
      DMAEN1         : DAC_CR_DMAEN1_Field := False;
      --  DAC channel1 DMA Underrun Interrupt enable This bit is set and
      --  cleared by software.
      DMAUDRIE1      : DAC_CR_DMAUDRIE1_Field := False;
      --  DAC Channel 1 calibration enable This bit is set and cleared by
      --  software to enable/disable DAC channel 1 calibration, it can be
      --  written only if bit EN1=0 into DAC_CR (the calibration mode can be
      --  entered/exit only when the DAC channel is disabled) Otherwise, the
      --  write operation is ignored.
      CEN1           : DAC_CR_CEN1_Field := False;
      --  unspecified
      Reserved_15_15 : Boolean := False;
      --  DAC channel2 enable This bit is set and cleared by software to
      --  enable/disable DAC channel2.
      EN2            : DAC_CR_EN2_Field := False;
      --  DAC channel2 trigger enable
      TEN2           : DAC_CR_TEN2_Field := False;
      --  DAC channel2 trigger selection These bits select the external event
      --  used to trigger DAC channel2 Note: Only used if bit TEN2 = 1 (DAC
      --  channel2 trigger enabled).
      TSEL2          : DAC_CR_TSEL2_Field := 16#0#;
      --  DAC channel2 noise/triangle wave generation enable These bits are
      --  set/reset by software. 1x: Triangle wave generation enabled Note:
      --  Only used if bit TEN2 = 1 (DAC channel2 trigger enabled)
      WAVE2          : DAC_CR_WAVE2_Field := 16#0#;
      --  DAC channel2 mask/amplitude selector These bits are written by
      --  software to select mask in wave generation mode or amplitude in
      --  triangle generation mode. = 1011: Unmask bits[11:0] of LFSR/ triangle
      --  amplitude equal to 4095
      MAMP2          : DAC_CR_MAMP2_Field := 16#0#;
      --  DAC channel2 DMA enable This bit is set and cleared by software.
      DMAEN2         : DAC_CR_DMAEN2_Field := False;
      --  DAC channel2 DMA underrun interrupt enable This bit is set and
      --  cleared by software.
      DMAUDRIE2      : DAC_CR_DMAUDRIE2_Field := False;
      --  DAC Channel 2 calibration enable This bit is set and cleared by
      --  software to enable/disable DAC channel 2 calibration, it can be
      --  written only if bit EN2=0 into DAC_CR (the calibration mode can be
      --  entered/exit only when the DAC channel is disabled) Otherwise, the
      --  write operation is ignored.
      CEN2           : DAC_CR_CEN2_Field := False;
      --  unspecified
      Reserved_31_31 : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_CR_Register use record
      EN1            at 0 range 0 .. 0;
      TEN1           at 0 range 1 .. 1;
      TSEL1          at 0 range 2 .. 5;
      WAVE1          at 0 range 6 .. 7;
      MAMP1          at 0 range 8 .. 11;
      DMAEN1         at 0 range 12 .. 12;
      DMAUDRIE1      at 0 range 13 .. 13;
      CEN1           at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      EN2            at 0 range 16 .. 16;
      TEN2           at 0 range 17 .. 17;
      TSEL2          at 0 range 18 .. 21;
      WAVE2          at 0 range 22 .. 23;
      MAMP2          at 0 range 24 .. 27;
      DMAEN2         at 0 range 28 .. 28;
      DMAUDRIE2      at 0 range 29 .. 29;
      CEN2           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  DAC_SWTRGR_SWTRIG array element
   subtype DAC_SWTRGR_SWTRIG_Element is Boolean;

   --  DAC_SWTRGR_SWTRIG array
   type DAC_SWTRGR_SWTRIG_Field_Array is array (1 .. 2)
     of DAC_SWTRGR_SWTRIG_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DAC_SWTRGR_SWTRIG
   type DAC_SWTRGR_SWTRIG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWTRIG as a value
            Val : HAL.UInt2;
         when True =>
            --  SWTRIG as an array
            Arr : DAC_SWTRGR_SWTRIG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DAC_SWTRGR_SWTRIG_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DAC_SWTRGR_SWTRIGB array element
   subtype DAC_SWTRGR_SWTRIGB_Element is Boolean;

   --  DAC_SWTRGR_SWTRIGB array
   type DAC_SWTRGR_SWTRIGB_Field_Array is array (1 .. 2)
     of DAC_SWTRGR_SWTRIGB_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DAC_SWTRGR_SWTRIGB
   type DAC_SWTRGR_SWTRIGB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWTRIGB as a value
            Val : HAL.UInt2;
         when True =>
            --  SWTRIGB as an array
            Arr : DAC_SWTRGR_SWTRIGB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DAC_SWTRGR_SWTRIGB_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DAC software trigger register
   type DAC_SWTRGR_Register is record
      --  Write-only. DAC channel1 software trigger This bit is set by software
      --  to trigger the DAC in software trigger mode. Note: This bit is
      --  cleared by hardware (one APB1 clock cycle later) once the DAC_DHR1
      --  register value has been loaded into the DAC_DOR1 register.
      SWTRIG         : DAC_SWTRGR_SWTRIG_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_15  : HAL.UInt14 := 16#0#;
      --  Write-only. DAC channel1 software trigger B
      SWTRIGB        : DAC_SWTRGR_SWTRIGB_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_SWTRGR_Register use record
      SWTRIG         at 0 range 0 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      SWTRIGB        at 0 range 16 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype DAC_DHR12R1_DACC1DHR_Field is HAL.UInt12;
   subtype DAC_DHR12R1_DACC1DHRB_Field is HAL.UInt12;

   --  DAC channel1 12-bit right-aligned data holding register
   type DAC_DHR12R1_Register is record
      --  DAC channel1 12-bit right-aligned data These bits are written by
      --  software which specifies 12-bit data for DAC channel1.
      DACC1DHR       : DAC_DHR12R1_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  DAC channel1 12-bit right-aligned data B
      DACC1DHRB      : DAC_DHR12R1_DACC1DHRB_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR12R1_Register use record
      DACC1DHR       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DACC1DHRB      at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype DAC_DHR12L1_DACC1DHR_Field is HAL.UInt12;
   subtype DAC_DHR12L1_DACC1DHRB_Field is HAL.UInt12;

   --  DAC channel1 12-bit left aligned data holding register
   type DAC_DHR12L1_Register is record
      --  unspecified
      Reserved_0_3   : HAL.UInt4 := 16#0#;
      --  DAC channel1 12-bit left-aligned data These bits are written by
      --  software which specifies 12-bit data for DAC channel1.
      DACC1DHR       : DAC_DHR12L1_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_19 : HAL.UInt4 := 16#0#;
      --  DAC channel1 12-bit left-aligned data B
      DACC1DHRB      : DAC_DHR12L1_DACC1DHRB_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR12L1_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      DACC1DHR       at 0 range 4 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      DACC1DHRB      at 0 range 20 .. 31;
   end record;

   subtype DAC_DHR8R1_DACC1DHR_Field is HAL.UInt8;
   subtype DAC_DHR8R1_DACC1DHRB_Field is HAL.UInt8;

   --  DAC channel1 8-bit right aligned data holding register
   type DAC_DHR8R1_Register is record
      --  DAC channel1 8-bit right-aligned data These bits are written by
      --  software which specifies 8-bit data for DAC channel1.
      DACC1DHR       : DAC_DHR8R1_DACC1DHR_Field := 16#0#;
      --  DAC channel1 8-bit right-aligned data
      DACC1DHRB      : DAC_DHR8R1_DACC1DHRB_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR8R1_Register use record
      DACC1DHR       at 0 range 0 .. 7;
      DACC1DHRB      at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DAC_DHR12R2_DACC2DHR_Field is HAL.UInt12;
   subtype DAC_DHR12R2_DACC2DHRB_Field is HAL.UInt12;

   --  DAC channel2 12-bit right aligned data holding register
   type DAC_DHR12R2_Register is record
      --  DAC channel2 12-bit right-aligned data These bits are written by
      --  software which specifies 12-bit data for DAC channel2.
      DACC2DHR       : DAC_DHR12R2_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  DAC channel2 12-bit right-aligned data
      DACC2DHRB      : DAC_DHR12R2_DACC2DHRB_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR12R2_Register use record
      DACC2DHR       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DACC2DHRB      at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype DAC_DHR12L2_DACC2DHR_Field is HAL.UInt12;
   subtype DAC_DHR12L2_DACC2DHRB_Field is HAL.UInt12;

   --  DAC channel2 12-bit left aligned data holding register
   type DAC_DHR12L2_Register is record
      --  unspecified
      Reserved_0_3   : HAL.UInt4 := 16#0#;
      --  DAC channel2 12-bit left-aligned data These bits are written by
      --  software which specify 12-bit data for DAC channel2.
      DACC2DHR       : DAC_DHR12L2_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_19 : HAL.UInt4 := 16#0#;
      --  DAC channel2 12-bit left-aligned data B
      DACC2DHRB      : DAC_DHR12L2_DACC2DHRB_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR12L2_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      DACC2DHR       at 0 range 4 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      DACC2DHRB      at 0 range 20 .. 31;
   end record;

   subtype DAC_DHR8R2_DACC2DHR_Field is HAL.UInt8;
   subtype DAC_DHR8R2_DACC2DHRB_Field is HAL.UInt8;

   --  DAC channel2 8-bit right-aligned data holding register
   type DAC_DHR8R2_Register is record
      --  DAC channel2 8-bit right-aligned data These bits are written by
      --  software which specifies 8-bit data for DAC channel2.
      DACC2DHR       : DAC_DHR8R2_DACC2DHR_Field := 16#0#;
      --  DAC channel2 8-bit right-aligned data
      DACC2DHRB      : DAC_DHR8R2_DACC2DHRB_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR8R2_Register use record
      DACC2DHR       at 0 range 0 .. 7;
      DACC2DHRB      at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DAC_DHR12RD_DACC1DHR_Field is HAL.UInt12;
   subtype DAC_DHR12RD_DACC2DHR_Field is HAL.UInt12;

   --  Dual DAC 12-bit right-aligned data holding register
   type DAC_DHR12RD_Register is record
      --  DAC channel1 12-bit right-aligned data These bits are written by
      --  software which specifies 12-bit data for DAC channel1.
      DACC1DHR       : DAC_DHR12RD_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  DAC channel2 12-bit right-aligned data These bits are written by
      --  software which specifies 12-bit data for DAC channel2.
      DACC2DHR       : DAC_DHR12RD_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR12RD_Register use record
      DACC1DHR       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DACC2DHR       at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype DAC_DHR12LD_DACC1DHR_Field is HAL.UInt12;
   subtype DAC_DHR12LD_DACC2DHR_Field is HAL.UInt12;

   --  DUAL DAC 12-bit left aligned data holding register
   type DAC_DHR12LD_Register is record
      --  unspecified
      Reserved_0_3   : HAL.UInt4 := 16#0#;
      --  DAC channel1 12-bit left-aligned data These bits are written by
      --  software which specifies 12-bit data for DAC channel1.
      DACC1DHR       : DAC_DHR12LD_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_19 : HAL.UInt4 := 16#0#;
      --  DAC channel2 12-bit left-aligned data These bits are written by
      --  software which specifies 12-bit data for DAC channel2.
      DACC2DHR       : DAC_DHR12LD_DACC2DHR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR12LD_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      DACC1DHR       at 0 range 4 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      DACC2DHR       at 0 range 20 .. 31;
   end record;

   subtype DAC_DHR8RD_DACC1DHR_Field is HAL.UInt8;
   subtype DAC_DHR8RD_DACC2DHR_Field is HAL.UInt8;

   --  DUAL DAC 8-bit right aligned data holding register
   type DAC_DHR8RD_Register is record
      --  DAC channel1 8-bit right-aligned data These bits are written by
      --  software which specifies 8-bit data for DAC channel1.
      DACC1DHR       : DAC_DHR8RD_DACC1DHR_Field := 16#0#;
      --  DAC channel2 8-bit right-aligned data These bits are written by
      --  software which specifies 8-bit data for DAC channel2.
      DACC2DHR       : DAC_DHR8RD_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DHR8RD_Register use record
      DACC1DHR       at 0 range 0 .. 7;
      DACC2DHR       at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DAC_DOR1_DACC1DOR_Field is HAL.UInt12;
   subtype DAC_DOR1_DACC1DORB_Field is HAL.UInt12;

   --  DAC channel1 data output register
   type DAC_DOR1_Register is record
      --  Read-only. DAC channel1 data output These bits are read-only, they
      --  contain data output for DAC channel1.
      DACC1DOR       : DAC_DOR1_DACC1DOR_Field;
      --  unspecified
      Reserved_12_15 : HAL.UInt4;
      --  Read-only. DAC channel1 data output
      DACC1DORB      : DAC_DOR1_DACC1DORB_Field;
      --  unspecified
      Reserved_28_31 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DOR1_Register use record
      DACC1DOR       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DACC1DORB      at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype DAC_DOR2_DACC2DOR_Field is HAL.UInt12;
   subtype DAC_DOR2_DACC2DORB_Field is HAL.UInt12;

   --  DAC channel2 data output register
   type DAC_DOR2_Register is record
      --  Read-only. DAC channel2 data output These bits are read-only, they
      --  contain data output for DAC channel2.
      DACC2DOR       : DAC_DOR2_DACC2DOR_Field;
      --  unspecified
      Reserved_12_15 : HAL.UInt4;
      --  Read-only. DAC channel2 data output
      DACC2DORB      : DAC_DOR2_DACC2DORB_Field;
      --  unspecified
      Reserved_28_31 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_DOR2_Register use record
      DACC2DOR       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DACC2DORB      at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype DAC_SR_DAC1RDY_Field is Boolean;
   subtype DAC_SR_DORSTAT1_Field is Boolean;
   subtype DAC_SR_DMAUDR1_Field is Boolean;
   subtype DAC_SR_CAL_FLAG1_Field is Boolean;
   subtype DAC_SR_BWST1_Field is Boolean;
   subtype DAC_SR_DAC2RDY_Field is Boolean;
   subtype DAC_SR_DORSTAT2_Field is Boolean;
   subtype DAC_SR_DMAUDR2_Field is Boolean;
   subtype DAC_SR_CAL_FLAG2_Field is Boolean;
   subtype DAC_SR_BWST2_Field is Boolean;

   --  DAC status register
   type DAC_SR_Register is record
      --  unspecified
      Reserved_0_10  : HAL.UInt11 := 16#0#;
      --  DAC channel1 ready status bit
      DAC1RDY        : DAC_SR_DAC1RDY_Field := False;
      --  DAC channel1 output register status bit
      DORSTAT1       : DAC_SR_DORSTAT1_Field := False;
      --  DAC channel1 DMA underrun flag This bit is set by hardware and
      --  cleared by software (by writing it to 1).
      DMAUDR1        : DAC_SR_DMAUDR1_Field := False;
      --  Read-only. DAC Channel 1 calibration offset status This bit is set
      --  and cleared by hardware
      CAL_FLAG1      : DAC_SR_CAL_FLAG1_Field := False;
      --  Read-only. DAC Channel 1 busy writing sample time flag This bit is
      --  systematically set just after Sample & Hold mode enable and is set
      --  each time the software writes the register DAC_SHSR1, It is cleared
      --  by hardware when the write operation of DAC_SHSR1 is complete. (It
      --  takes about 3LSI periods of synchronization).
      BWST1          : DAC_SR_BWST1_Field := False;
      --  unspecified
      Reserved_16_26 : HAL.UInt11 := 16#0#;
      --  DAC channel 2 ready status bit
      DAC2RDY        : DAC_SR_DAC2RDY_Field := False;
      --  DAC channel 2 output register status bit
      DORSTAT2       : DAC_SR_DORSTAT2_Field := False;
      --  DAC channel2 DMA underrun flag This bit is set by hardware and
      --  cleared by software (by writing it to 1).
      DMAUDR2        : DAC_SR_DMAUDR2_Field := False;
      --  Read-only. DAC Channel 2 calibration offset status This bit is set
      --  and cleared by hardware
      CAL_FLAG2      : DAC_SR_CAL_FLAG2_Field := False;
      --  Read-only. DAC Channel 2 busy writing sample time flag This bit is
      --  systematically set just after Sample & Hold mode enable and is set
      --  each time the software writes the register DAC_SHSR2, It is cleared
      --  by hardware when the write operation of DAC_SHSR2 is complete. (It
      --  takes about 3 LSI periods of synchronization).
      BWST2          : DAC_SR_BWST2_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_SR_Register use record
      Reserved_0_10  at 0 range 0 .. 10;
      DAC1RDY        at 0 range 11 .. 11;
      DORSTAT1       at 0 range 12 .. 12;
      DMAUDR1        at 0 range 13 .. 13;
      CAL_FLAG1      at 0 range 14 .. 14;
      BWST1          at 0 range 15 .. 15;
      Reserved_16_26 at 0 range 16 .. 26;
      DAC2RDY        at 0 range 27 .. 27;
      DORSTAT2       at 0 range 28 .. 28;
      DMAUDR2        at 0 range 29 .. 29;
      CAL_FLAG2      at 0 range 30 .. 30;
      BWST2          at 0 range 31 .. 31;
   end record;

   subtype DAC_CCR_OTRIM1_Field is HAL.UInt5;
   subtype DAC_CCR_OTRIM2_Field is HAL.UInt5;

   --  DAC calibration control register
   type DAC_CCR_Register is record
      --  DAC Channel 1 offset trimming value
      OTRIM1         : DAC_CCR_OTRIM1_Field := 16#0#;
      --  unspecified
      Reserved_5_15  : HAL.UInt11 := 16#0#;
      --  DAC Channel 2 offset trimming value
      OTRIM2         : DAC_CCR_OTRIM2_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_CCR_Register use record
      OTRIM1         at 0 range 0 .. 4;
      Reserved_5_15  at 0 range 5 .. 15;
      OTRIM2         at 0 range 16 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype DAC_MCR_MODE1_Field is HAL.UInt3;
   subtype DAC_MCR_DMADOUBLE1_Field is Boolean;
   subtype DAC_MCR_SINFORMAT1_Field is Boolean;
   subtype DAC_MCR_HFSEL_Field is HAL.UInt2;
   subtype DAC_MCR_MODE2_Field is HAL.UInt3;
   subtype DAC_MCR_DMADOUBLE2_Field is Boolean;
   subtype DAC_MCR_SINFORMAT2_Field is Boolean;

   --  DAC mode control register
   type DAC_MCR_Register is record
      --  DAC Channel 1 mode These bits can be written only when the DAC is
      --  disabled and not in the calibration mode (when bit EN1=0 and bit CEN1
      --  =0 in the DAC_CR register). If EN1=1 or CEN1 =1 the write operation
      --  is ignored. They can be set and cleared by software to select the DAC
      --  Channel 1 mode: DAC Channel 1 in normal Mode DAC Channel 1 in sample
      --  &amp; hold mode
      MODE1          : DAC_MCR_MODE1_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  DAC Channel1 DMA double data mode
      DMADOUBLE1     : DAC_MCR_DMADOUBLE1_Field := False;
      --  Enable signed format for DAC channel1
      SINFORMAT1     : DAC_MCR_SINFORMAT1_Field := False;
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  High frequency interface mode selection
      HFSEL          : DAC_MCR_HFSEL_Field := 16#0#;
      --  DAC Channel 2 mode These bits can be written only when the DAC is
      --  disabled and not in the calibration mode (when bit EN2=0 and bit CEN2
      --  =0 in the DAC_CR register). If EN2=1 or CEN2 =1 the write operation
      --  is ignored. They can be set and cleared by software to select the DAC
      --  Channel 2 mode: DAC Channel 2 in normal Mode DAC Channel 2 in sample
      --  &amp; hold mode
      MODE2          : DAC_MCR_MODE2_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      --  DAC Channel2 DMA double data mode
      DMADOUBLE2     : DAC_MCR_DMADOUBLE2_Field := False;
      --  Enable signed format for DAC channel2
      SINFORMAT2     : DAC_MCR_SINFORMAT2_Field := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_MCR_Register use record
      MODE1          at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      DMADOUBLE1     at 0 range 8 .. 8;
      SINFORMAT1     at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      HFSEL          at 0 range 14 .. 15;
      MODE2          at 0 range 16 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      DMADOUBLE2     at 0 range 24 .. 24;
      SINFORMAT2     at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype DAC_SHSR1_TSAMPLE1_Field is HAL.UInt10;

   --  DAC Sample and Hold sample time register 1
   type DAC_SHSR1_Register is record
      --  DAC Channel 1 sample Time (only valid in sample &amp; hold mode)
      --  These bits can be written when the DAC channel1 is disabled or also
      --  during normal operation. in the latter case, the write can be done
      --  only when BWSTx of DAC_SR register is low, If BWSTx=1, the write
      --  operation is ignored.
      TSAMPLE1       : DAC_SHSR1_TSAMPLE1_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_SHSR1_Register use record
      TSAMPLE1       at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype DAC_SHSR2_TSAMPLE2_Field is HAL.UInt10;

   --  DAC Sample and Hold sample time register 2
   type DAC_SHSR2_Register is record
      --  DAC Channel 2 sample Time (only valid in sample &amp; hold mode)
      --  These bits can be written when the DAC channel2 is disabled or also
      --  during normal operation. in the latter case, the write can be done
      --  only when BWSTx of DAC_SR register is low, if BWSTx=1, the write
      --  operation is ignored.
      TSAMPLE2       : DAC_SHSR2_TSAMPLE2_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_SHSR2_Register use record
      TSAMPLE2       at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype DAC_SHHR_THOLD1_Field is HAL.UInt10;
   subtype DAC_SHHR_THOLD2_Field is HAL.UInt10;

   --  DAC Sample and Hold hold time register
   type DAC_SHHR_Register is record
      --  DAC Channel 1 hold Time (only valid in sample &amp; hold mode) Hold
      --  time= (THOLD[9:0]) x T LSI
      THOLD1         : DAC_SHHR_THOLD1_Field := 16#1#;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  DAC Channel 2 hold time (only valid in sample &amp; hold mode). Hold
      --  time= (THOLD[9:0]) x T LSI
      THOLD2         : DAC_SHHR_THOLD2_Field := 16#1#;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_SHHR_Register use record
      THOLD1         at 0 range 0 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      THOLD2         at 0 range 16 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype DAC_SHRR_TREFRESH1_Field is HAL.UInt8;
   subtype DAC_SHRR_TREFRESH2_Field is HAL.UInt8;

   --  DAC Sample and Hold refresh time register
   type DAC_SHRR_Register is record
      --  DAC Channel 1 refresh Time (only valid in sample &amp; hold mode)
      --  Refresh time= (TREFRESH[7:0]) x T LSI
      TREFRESH1      : DAC_SHRR_TREFRESH1_Field := 16#1#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  DAC Channel 2 refresh Time (only valid in sample &amp; hold mode)
      --  Refresh time= (TREFRESH[7:0]) x T LSI
      TREFRESH2      : DAC_SHRR_TREFRESH2_Field := 16#1#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_SHRR_Register use record
      TREFRESH1      at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      TREFRESH2      at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype DAC_STR1_STRSTDATA1_Field is HAL.UInt12;
   subtype DAC_STR1_STDIR1_Field is Boolean;
   subtype DAC_STR1_STINCDATA1_Field is HAL.UInt16;

   --  Sawtooth register
   type DAC_STR1_Register is record
      --  DAC Channel 1 Sawtooth reset value
      STRSTDATA1     : DAC_STR1_STRSTDATA1_Field := 16#0#;
      --  DAC Channel1 Sawtooth direction setting
      STDIR1         : DAC_STR1_STDIR1_Field := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  DAC CH1 Sawtooth increment value (12.4 bit format)
      STINCDATA1     : DAC_STR1_STINCDATA1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_STR1_Register use record
      STRSTDATA1     at 0 range 0 .. 11;
      STDIR1         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      STINCDATA1     at 0 range 16 .. 31;
   end record;

   subtype DAC_STR2_STRSTDATA2_Field is HAL.UInt12;
   subtype DAC_STR2_STDIR2_Field is Boolean;
   subtype DAC_STR2_STINCDATA2_Field is HAL.UInt16;

   --  Sawtooth register
   type DAC_STR2_Register is record
      --  DAC Channel 2 Sawtooth reset value
      STRSTDATA2     : DAC_STR2_STRSTDATA2_Field := 16#0#;
      --  DAC Channel2 Sawtooth direction setting
      STDIR2         : DAC_STR2_STDIR2_Field := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  DAC CH2 Sawtooth increment value (12.4 bit format)
      STINCDATA2     : DAC_STR2_STINCDATA2_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_STR2_Register use record
      STRSTDATA2     at 0 range 0 .. 11;
      STDIR2         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      STINCDATA2     at 0 range 16 .. 31;
   end record;

   subtype DAC_STMODR_STRSTTRIGSEL1_Field is HAL.UInt4;
   subtype DAC_STMODR_STINCTRIGSEL1_Field is HAL.UInt4;
   subtype DAC_STMODR_STRSTTRIGSEL2_Field is HAL.UInt4;
   subtype DAC_STMODR_STINCTRIGSEL2_Field is HAL.UInt4;

   --  Sawtooth Mode register
   type DAC_STMODR_Register is record
      --  DAC Channel 1 Sawtooth Reset trigger selection
      STRSTTRIGSEL1  : DAC_STMODR_STRSTTRIGSEL1_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  DAC Channel 1 Sawtooth Increment trigger selection
      STINCTRIGSEL1  : DAC_STMODR_STINCTRIGSEL1_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  DAC Channel 1 Sawtooth Reset trigger selection
      STRSTTRIGSEL2  : DAC_STMODR_STRSTTRIGSEL2_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  DAC Channel 2 Sawtooth Increment trigger selection
      STINCTRIGSEL2  : DAC_STMODR_STINCTRIGSEL2_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAC_STMODR_Register use record
      STRSTTRIGSEL1  at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      STINCTRIGSEL1  at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      STRSTTRIGSEL2  at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      STINCTRIGSEL2  at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Digital-to-analog converter
   type DAC_Peripheral is record
      --  DAC control register
      CR          : aliased DAC_CR_Register;
      --  DAC software trigger register
      SWTRIGR  : aliased DAC_SWTRGR_Register;
      --  DAC channel1 12-bit right-aligned data holding register
      DHR12R1 : aliased DAC_DHR12R1_Register;
      --  DAC channel1 12-bit left aligned data holding register
      DHR12L1 : aliased DAC_DHR12L1_Register;
      --  DAC channel1 8-bit right aligned data holding register
      DHR8R1  : aliased DAC_DHR8R1_Register;
      --  DAC channel2 12-bit right aligned data holding register
      DHR12R2 : aliased DAC_DHR12R2_Register;
      --  DAC channel2 12-bit left aligned data holding register
      DHR12L2 : aliased DAC_DHR12L2_Register;
      --  DAC channel2 8-bit right-aligned data holding register
      DHR8R2  : aliased DAC_DHR8R2_Register;
      --  Dual DAC 12-bit right-aligned data holding register
      DHR12RD : aliased DAC_DHR12RD_Register;
      --  DUAL DAC 12-bit left aligned data holding register
      DHR12LD : aliased DAC_DHR12LD_Register;
      --  DUAL DAC 8-bit right aligned data holding register
      DHR8RD  : aliased DAC_DHR8RD_Register;
      --  DAC channel1 data output register
      DOR1    : aliased DAC_DOR1_Register;
      --  DAC channel2 data output register
      DOR2    : aliased DAC_DOR2_Register;
      --  DAC status register
      SR      : aliased DAC_SR_Register;
      --  DAC calibration control register
      CCR     : aliased DAC_CCR_Register;
      --  DAC mode control register
      MCR     : aliased DAC_MCR_Register;
      --  DAC Sample and Hold sample time register 1
      SHSR1   : aliased DAC_SHSR1_Register;
      --  DAC Sample and Hold sample time register 2
      SHSR2   : aliased DAC_SHSR2_Register;
      --  DAC Sample and Hold hold time register
      SHHR    : aliased DAC_SHHR_Register;
      --  DAC Sample and Hold refresh time register
      SHRR    : aliased DAC_SHRR_Register;
      --  Sawtooth register
      STR1    : aliased DAC_STR1_Register;
      --  Sawtooth register
      STR2    : aliased DAC_STR2_Register;
      --  Sawtooth Mode register
      STMODR  : aliased DAC_STMODR_Register;
   end record
     with Volatile;

   for DAC_Peripheral use record
      CR          at 16#0# range 0 .. 31;
      SWTRIGR  at 16#4# range 0 .. 31;
      DHR12R1 at 16#8# range 0 .. 31;
      DHR12L1 at 16#C# range 0 .. 31;
      DHR8R1  at 16#10# range 0 .. 31;
      DHR12R2 at 16#14# range 0 .. 31;
      DHR12L2 at 16#18# range 0 .. 31;
      DHR8R2  at 16#1C# range 0 .. 31;
      DHR12RD at 16#20# range 0 .. 31;
      DHR12LD at 16#24# range 0 .. 31;
      DHR8RD  at 16#28# range 0 .. 31;
      DOR1    at 16#2C# range 0 .. 31;
      DOR2    at 16#30# range 0 .. 31;
      SR      at 16#34# range 0 .. 31;
      CCR     at 16#38# range 0 .. 31;
      MCR     at 16#3C# range 0 .. 31;
      SHSR1   at 16#40# range 0 .. 31;
      SHSR2   at 16#44# range 0 .. 31;
      SHHR    at 16#48# range 0 .. 31;
      SHRR    at 16#4C# range 0 .. 31;
      STR1    at 16#58# range 0 .. 31;
      STR2    at 16#5C# range 0 .. 31;
      STMODR  at 16#60# range 0 .. 31;
   end record;

   --  Digital-to-analog converter
   DAC1_Periph : aliased DAC_Peripheral
     with Import, Address => DAC1_Base;

   --  Digital-to-analog converter
   DAC2_Periph : aliased DAC_Peripheral
     with Import, Address => DAC2_Base;

   --  Digital-to-analog converter
   DAC3_Periph : aliased DAC_Peripheral
     with Import, Address => DAC3_Base;

   --  Digital-to-analog converter
   DAC4_Periph : aliased DAC_Peripheral
     with Import, Address => DAC4_Base;

end STM32_SVD.DAC;
