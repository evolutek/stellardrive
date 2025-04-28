pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.TIM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_CEN_Field is Boolean;
   subtype CR1_UDIS_Field is Boolean;
   subtype CR1_URS_Field is Boolean;
   subtype CR1_OPM_Field is Boolean;
   subtype CR1_DIR_Field is Boolean;
   subtype CR1_CMS_Field is HAL.UInt2;
   subtype CR1_ARPE_Field is Boolean;
   subtype CR1_CKD_Field is HAL.UInt2;
   subtype CR1_UIFREMAP_Field is Boolean;
   subtype CR1_DITHEN_Field is Boolean;

   --  control register 1
   type CR1_Register is record
      --  Counter enable
      CEN            : CR1_CEN_Field := False;
      --  Update disable
      UDIS           : CR1_UDIS_Field := False;
      --  Update request source
      URS            : CR1_URS_Field := False;
      --  One-pulse mode
      OPM            : CR1_OPM_Field := False;
      --  Direction
      DIR            : CR1_DIR_Field := False;
      --  Center-aligned mode selection
      CMS            : CR1_CMS_Field := 16#0#;
      --  Auto-reload preload enable
      ARPE           : CR1_ARPE_Field := False;
      --  Clock division
      CKD            : CR1_CKD_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : Boolean := False;
      --  UIF status bit remapping
      UIFREMAP       : CR1_UIFREMAP_Field := False;
      --  Dithering Enable
      DITHEN         : CR1_DITHEN_Field := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      DIR            at 0 range 4 .. 4;
      CMS            at 0 range 5 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      DITHEN         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype CR2_CCPC_Field is Boolean;
   subtype CR2_CCUS_Field is Boolean;
   subtype CR2_CCDS_Field is Boolean;
   subtype CR2_MMS_Field is HAL.UInt3;
   subtype CR2_TI1S_Field is Boolean;
   subtype CR2_OIS1_Field is Boolean;
   subtype CR2_OIS1N_Field is Boolean;
   subtype CR2_OIS2_Field is Boolean;
   subtype CR2_OIS2N_Field is Boolean;
   subtype CR2_OIS3_Field is Boolean;
   subtype CR2_OIS3N_Field is Boolean;
   subtype CR2_OIS4_Field is Boolean;
   subtype CR2_OIS4N_Field is Boolean;
   subtype CR2_OIS5_Field is Boolean;
   subtype CR2_OIS6_Field is Boolean;
   subtype CR2_MMS2_Field is HAL.UInt4;
   subtype CR2_MMS_3_Field is Boolean;

   --  control register 2
   type CR2_Register is record
      --  Capture/compare preloaded control
      CCPC           : CR2_CCPC_Field := False;
      --  unspecified
      Reserved_1_1   : Boolean := False;
      --  Capture/compare control update selection
      CCUS           : CR2_CCUS_Field := False;
      --  Capture/compare DMA selection
      CCDS           : CR2_CCDS_Field := False;
      --  Master mode selection
      MMS            : CR2_MMS_Field := 16#0#;
      --  TI1 selection
      TI1S           : CR2_TI1S_Field := False;
      --  Output Idle state 1
      OIS1           : CR2_OIS1_Field := False;
      --  Output Idle state 1
      OIS1N          : CR2_OIS1N_Field := False;
      --  Output Idle state 2
      OIS2           : CR2_OIS2_Field := False;
      --  Output Idle state 2
      OIS2N          : CR2_OIS2N_Field := False;
      --  Output Idle state 3
      OIS3           : CR2_OIS3_Field := False;
      --  Output Idle state 3
      OIS3N          : CR2_OIS3N_Field := False;
      --  Output Idle state 4
      OIS4           : CR2_OIS4_Field := False;
      --  Output Idle state 4 (OC4N output)
      OIS4N          : CR2_OIS4N_Field := False;
      --  Output Idle state 5 (OC5 output)
      OIS5           : CR2_OIS5_Field := False;
      --  unspecified
      Reserved_17_17 : Boolean := False;
      --  Output Idle state 6 (OC6 output)
      OIS6           : CR2_OIS6_Field := False;
      --  unspecified
      Reserved_19_19 : Boolean := False;
      --  Master mode selection 2
      MMS2           : CR2_MMS2_Field := 16#0#;
      --  unspecified
      Reserved_24_24 : Boolean := False;
      --  Master mode selection - bit 3
      MMS_3          : CR2_MMS_3_Field := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      MMS            at 0 range 4 .. 6;
      TI1S           at 0 range 7 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      OIS2           at 0 range 10 .. 10;
      OIS2N          at 0 range 11 .. 11;
      OIS3           at 0 range 12 .. 12;
      OIS3N          at 0 range 13 .. 13;
      OIS4           at 0 range 14 .. 14;
      OIS4N          at 0 range 15 .. 15;
      OIS5           at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      OIS6           at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      MMS2           at 0 range 20 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      MMS_3          at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype SMCR_SMS_Field is HAL.UInt3;
   subtype SMCR_OCCS_Field is Boolean;
   subtype SMCR_TS_Field is HAL.UInt3;
   subtype SMCR_MSM_Field is Boolean;
   subtype SMCR_ETF_Field is HAL.UInt4;
   subtype SMCR_ETPS_Field is HAL.UInt2;
   subtype SMCR_ECE_Field is Boolean;
   subtype SMCR_ETP_Field is Boolean;
   subtype SMCR_SMS_3_Field is Boolean;
   subtype SMCR_TS_4_3_Field is HAL.UInt2;
   subtype SMCR_SMSPE_Field is Boolean;
   subtype SMCR_SMSPS_Field is Boolean;

   --  slave mode control register
   type SMCR_Register is record
      --  Slave mode selection
      SMS            : SMCR_SMS_Field := 16#0#;
      --  OCREF clear selection
      OCCS           : SMCR_OCCS_Field := False;
      --  Trigger selection
      TS             : SMCR_TS_Field := 16#0#;
      --  Master/Slave mode
      MSM            : SMCR_MSM_Field := False;
      --  External trigger filter
      ETF            : SMCR_ETF_Field := 16#0#;
      --  External trigger prescaler
      ETPS           : SMCR_ETPS_Field := 16#0#;
      --  External clock enable
      ECE            : SMCR_ECE_Field := False;
      --  External trigger polarity
      ETP            : SMCR_ETP_Field := False;
      --  Slave mode selection - bit 3
      SMS_3          : SMCR_SMS_3_Field := False;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      --  Trigger selection - bit 4:3
      TS_4_3         : SMCR_TS_4_3_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  SMS Preload Enable
      SMSPE          : SMCR_SMSPE_Field := False;
      --  SMS Preload Source
      SMSPS          : SMCR_SMSPS_Field := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register use record
      SMS            at 0 range 0 .. 2;
      OCCS           at 0 range 3 .. 3;
      TS             at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      SMS_3          at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      TS_4_3         at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      SMSPE          at 0 range 24 .. 24;
      SMSPS          at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype DIER_UIE_Field is Boolean;
   subtype DIER_CC1IE_Field is Boolean;
   subtype DIER_CC2IE_Field is Boolean;
   subtype DIER_CC3IE_Field is Boolean;
   subtype DIER_CC4IE_Field is Boolean;
   subtype DIER_COMIE_Field is Boolean;
   subtype DIER_TIE_Field is Boolean;
   subtype DIER_BIE_Field is Boolean;
   subtype DIER_UDE_Field is Boolean;
   subtype DIER_CC1DE_Field is Boolean;
   subtype DIER_CC2DE_Field is Boolean;
   subtype DIER_CC3DE_Field is Boolean;
   subtype DIER_CC4DE_Field is Boolean;
   subtype DIER_COMDE_Field is Boolean;
   subtype DIER_TDE_Field is Boolean;
   subtype DIER_IDXIE_Field is Boolean;
   subtype DIER_DIRIE_Field is Boolean;
   subtype DIER_IERRIE_Field is Boolean;
   subtype DIER_TERRIE_Field is Boolean;

   --  DMA/Interrupt enable register
   type DIER_Register is record
      --  Update interrupt enable
      UIE            : DIER_UIE_Field := False;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : DIER_CC1IE_Field := False;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : DIER_CC2IE_Field := False;
      --  Capture/Compare 3 interrupt enable
      CC3IE          : DIER_CC3IE_Field := False;
      --  Capture/Compare 4 interrupt enable
      CC4IE          : DIER_CC4IE_Field := False;
      --  COM interrupt enable
      COMIE          : DIER_COMIE_Field := False;
      --  Trigger interrupt enable
      TIE            : DIER_TIE_Field := False;
      --  Break interrupt enable
      BIE            : DIER_BIE_Field := False;
      --  Update DMA request enable
      UDE            : DIER_UDE_Field := False;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : DIER_CC1DE_Field := False;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : DIER_CC2DE_Field := False;
      --  Capture/Compare 3 DMA request enable
      CC3DE          : DIER_CC3DE_Field := False;
      --  Capture/Compare 4 DMA request enable
      CC4DE          : DIER_CC4DE_Field := False;
      --  COM DMA request enable
      COMDE          : DIER_COMDE_Field := False;
      --  Trigger DMA request enable
      TDE            : DIER_TDE_Field := False;
      --  unspecified
      Reserved_15_19 : HAL.UInt5 := 16#0#;
      --  Index interrupt enable
      IDXIE          : DIER_IDXIE_Field := False;
      --  Direction Change interrupt enable
      DIRIE          : DIER_DIRIE_Field := False;
      --  Index Error interrupt enable
      IERRIE         : DIER_IERRIE_Field := False;
      --  Transition Error interrupt enable
      TERRIE         : DIER_TERRIE_Field := False;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      CC3IE          at 0 range 3 .. 3;
      CC4IE          at 0 range 4 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      CC3DE          at 0 range 11 .. 11;
      CC4DE          at 0 range 12 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_19 at 0 range 15 .. 19;
      IDXIE          at 0 range 20 .. 20;
      DIRIE          at 0 range 21 .. 21;
      IERRIE         at 0 range 22 .. 22;
      TERRIE         at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SR_UIF_Field is Boolean;
   subtype SR_CC1IF_Field is Boolean;
   subtype SR_CC2IF_Field is Boolean;
   subtype SR_CC3IF_Field is Boolean;
   subtype SR_CC4IF_Field is Boolean;
   subtype SR_COMIF_Field is Boolean;
   subtype SR_TIF_Field is Boolean;
   subtype SR_BIF_Field is Boolean;
   subtype SR_B2IF_Field is Boolean;
   subtype SR_CC1OF_Field is Boolean;
   subtype SR_CC2OF_Field is Boolean;
   subtype SR_CC3OF_Field is Boolean;
   subtype SR_CC4OF_Field is Boolean;
   subtype SR_SBIF_Field is Boolean;
   subtype SR_CC5IF_Field is Boolean;
   subtype SR_CC6IF_Field is Boolean;
   subtype SR_IDXF_Field is Boolean;
   subtype SR_DIRF_Field is Boolean;
   subtype SR_IERRF_Field is Boolean;
   subtype SR_TERRF_Field is Boolean;

   --  status register
   type SR_Register is record
      --  Update interrupt flag
      UIF            : SR_UIF_Field := False;
      --  Capture/compare 1 interrupt flag
      CC1IF          : SR_CC1IF_Field := False;
      --  Capture/Compare 2 interrupt flag
      CC2IF          : SR_CC2IF_Field := False;
      --  Capture/Compare 3 interrupt flag
      CC3IF          : SR_CC3IF_Field := False;
      --  Capture/Compare 4 interrupt flag
      CC4IF          : SR_CC4IF_Field := False;
      --  COM interrupt flag
      COMIF          : SR_COMIF_Field := False;
      --  Trigger interrupt flag
      TIF            : SR_TIF_Field := False;
      --  Break interrupt flag
      BIF            : SR_BIF_Field := False;
      --  Break 2 interrupt flag
      B2IF           : SR_B2IF_Field := False;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : SR_CC1OF_Field := False;
      --  Capture/compare 2 overcapture flag
      CC2OF          : SR_CC2OF_Field := False;
      --  Capture/Compare 3 overcapture flag
      CC3OF          : SR_CC3OF_Field := False;
      --  Capture/Compare 4 overcapture flag
      CC4OF          : SR_CC4OF_Field := False;
      --  System Break interrupt flag
      SBIF           : SR_SBIF_Field := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Compare 5 interrupt flag
      CC5IF          : SR_CC5IF_Field := False;
      --  Compare 6 interrupt flag
      CC6IF          : SR_CC6IF_Field := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Index interrupt flag
      IDXF           : SR_IDXF_Field := False;
      --  Direction Change interrupt flag
      DIRF           : SR_DIRF_Field := False;
      --  Index Error interrupt flag
      IERRF          : SR_IERRF_Field := False;
      --  Transition Error interrupt flag
      TERRF          : SR_TERRF_Field := False;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      CC3IF          at 0 range 3 .. 3;
      CC4IF          at 0 range 4 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      B2IF           at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      CC3OF          at 0 range 11 .. 11;
      CC4OF          at 0 range 12 .. 12;
      SBIF           at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      CC5IF          at 0 range 16 .. 16;
      CC6IF          at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      IDXF           at 0 range 20 .. 20;
      DIRF           at 0 range 21 .. 21;
      IERRF          at 0 range 22 .. 22;
      TERRF          at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype EGR_UG_Field is Boolean;
   subtype EGR_CC1G_Field is Boolean;
   subtype EGR_CC2G_Field is Boolean;
   subtype EGR_CC3G_Field is Boolean;
   subtype EGR_CC4G_Field is Boolean;
   subtype EGR_COMG_Field is Boolean;
   subtype EGR_TG_Field is Boolean;
   subtype EGR_BG_Field is Boolean;
   subtype EGR_B2G_Field is Boolean;

   --  event generation register
   type EGR_Register is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := False;
      --  Write-only. Capture/compare 1 generation
      CC1G          : EGR_CC1G_Field := False;
      --  Write-only. Capture/compare 2 generation
      CC2G          : EGR_CC2G_Field := False;
      --  Write-only. Capture/compare 3 generation
      CC3G          : EGR_CC3G_Field := False;
      --  Write-only. Capture/compare 4 generation
      CC4G          : EGR_CC4G_Field := False;
      --  Write-only. Capture/Compare control update generation
      COMG          : EGR_COMG_Field := False;
      --  Write-only. Trigger generation
      TG            : EGR_TG_Field := False;
      --  Write-only. Break generation
      BG            : EGR_BG_Field := False;
      --  Write-only. Break 2 generation
      B2G           : EGR_B2G_Field := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      COMG          at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      B2G           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype CCMR1_Output_CC1S_Field is HAL.UInt2;
   subtype CCMR1_Output_OC1FE_Field is Boolean;
   subtype CCMR1_Output_OC1PE_Field is Boolean;
   subtype CCMR1_Output_OC1M_Field is HAL.UInt3;
   subtype CCMR1_Output_OC1CE_Field is Boolean;
   subtype CCMR1_Output_CC2S_Field is HAL.UInt2;
   subtype CCMR1_Output_OC2FE_Field is Boolean;
   subtype CCMR1_Output_OC2PE_Field is Boolean;
   subtype CCMR1_Output_OC2M_Field is HAL.UInt3;
   subtype CCMR1_Output_OC2CE_Field is Boolean;
   subtype CCMR1_Output_OC1M_3_Field is Boolean;
   subtype CCMR1_Output_OC2M_3_Field is Boolean;

   --  capture/compare mode register 1 (output mode)
   type CCMR1_Output_Register is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      --  Output Compare 1 fast enable
      OC1FE          : CCMR1_Output_OC1FE_Field := False;
      --  Output Compare 1 preload enable
      OC1PE          : CCMR1_Output_OC1PE_Field := False;
      --  Output Compare 1 mode
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  Output Compare 1 clear enable
      OC1CE          : CCMR1_Output_OC1CE_Field := False;
      --  Capture/Compare 2 selection
      CC2S           : CCMR1_Output_CC2S_Field := 16#0#;
      --  Output Compare 2 fast enable
      OC2FE          : CCMR1_Output_OC2FE_Field := False;
      --  Output Compare 2 preload enable
      OC2PE          : CCMR1_Output_OC2PE_Field := False;
      --  Output Compare 2 mode
      OC2M           : CCMR1_Output_OC2M_Field := 16#0#;
      --  Output Compare 2 clear enable
      OC2CE          : CCMR1_Output_OC2CE_Field := False;
      --  Output Compare 1 mode - bit 3
      OC1M_3         : CCMR1_Output_OC1M_3_Field := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  Output Compare 2 mode - bit 3
      OC2M_3         : CCMR1_Output_OC2M_3_Field := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      OC1CE          at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      OC2CE          at 0 range 15 .. 15;
      OC1M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCMR1_Input_CC1S_Field is HAL.UInt2;
   subtype CCMR1_Input_ICPCS_Field is HAL.UInt2;
   subtype CCMR1_Input_IC1F_Field is HAL.UInt4;
   subtype CCMR1_Input_CC2S_Field is HAL.UInt2;
   subtype CCMR1_Input_IC2PSC_Field is HAL.UInt2;
   subtype CCMR1_Input_IC2F_Field is HAL.UInt4;

   --  capture/compare mode register 1 (input mode)
   type CCMR1_Input_Register is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Input_CC1S_Field := 16#0#;
      --  Input capture 1 prescaler
      ICPCS          : CCMR1_Input_ICPCS_Field := 16#0#;
      --  Input capture 1 filter
      IC1F           : CCMR1_Input_IC1F_Field := 16#0#;
      --  Capture/Compare 2 selection
      CC2S           : CCMR1_Input_CC2S_Field := 16#0#;
      --  Input capture 2 prescaler
      IC2PSC         : CCMR1_Input_IC2PSC_Field := 16#0#;
      --  Input capture 2 filter
      IC2F           : CCMR1_Input_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register use record
      CC1S           at 0 range 0 .. 1;
      ICPCS          at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PSC         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCMR2_Output_CC3S_Field is HAL.UInt2;
   subtype CCMR2_Output_OC3FE_Field is Boolean;
   subtype CCMR2_Output_OC3PE_Field is Boolean;
   subtype CCMR2_Output_OC3M_Field is HAL.UInt3;
   subtype CCMR2_Output_OC3CE_Field is Boolean;
   subtype CCMR2_Output_CC4S_Field is HAL.UInt2;
   subtype CCMR2_Output_OC4FE_Field is Boolean;
   subtype CCMR2_Output_OC4PE_Field is Boolean;
   subtype CCMR2_Output_OC4M_Field is HAL.UInt3;
   subtype CCMR2_Output_OC4CE_Field is Boolean;
   subtype CCMR2_Output_OC3M_3_Field is Boolean;
   subtype CCMR2_Output_OC4M_3_Field is Boolean;

   --  capture/compare mode register 2 (output mode)
   type CCMR2_Output_Register is record
      --  Capture/Compare 3 selection
      CC3S           : CCMR2_Output_CC3S_Field := 16#0#;
      --  Output compare 3 fast enable
      OC3FE          : CCMR2_Output_OC3FE_Field := False;
      --  Output compare 3 preload enable
      OC3PE          : CCMR2_Output_OC3PE_Field := False;
      --  Output compare 3 mode
      OC3M           : CCMR2_Output_OC3M_Field := 16#0#;
      --  Output compare 3 clear enable
      OC3CE          : CCMR2_Output_OC3CE_Field := False;
      --  Capture/Compare 4 selection
      CC4S           : CCMR2_Output_CC4S_Field := 16#0#;
      --  Output compare 4 fast enable
      OC4FE          : CCMR2_Output_OC4FE_Field := False;
      --  Output compare 4 preload enable
      OC4PE          : CCMR2_Output_OC4PE_Field := False;
      --  Output compare 4 mode
      OC4M           : CCMR2_Output_OC4M_Field := 16#0#;
      --  Output compare 4 clear enable
      OC4CE          : CCMR2_Output_OC4CE_Field := False;
      --  Output Compare 3 mode - bit 3
      OC3M_3         : CCMR2_Output_OC3M_3_Field := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  Output Compare 4 mode - bit 3
      OC4M_3         : CCMR2_Output_OC4M_3_Field := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Output_Register use record
      CC3S           at 0 range 0 .. 1;
      OC3FE          at 0 range 2 .. 2;
      OC3PE          at 0 range 3 .. 3;
      OC3M           at 0 range 4 .. 6;
      OC3CE          at 0 range 7 .. 7;
      CC4S           at 0 range 8 .. 9;
      OC4FE          at 0 range 10 .. 10;
      OC4PE          at 0 range 11 .. 11;
      OC4M           at 0 range 12 .. 14;
      OC4CE          at 0 range 15 .. 15;
      OC3M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC4M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCMR2_Input_CC3S_Field is HAL.UInt2;
   subtype CCMR2_Input_IC3PSC_Field is HAL.UInt2;
   subtype CCMR2_Input_IC3F_Field is HAL.UInt4;
   subtype CCMR2_Input_CC4S_Field is HAL.UInt2;
   subtype CCMR2_Input_IC4PSC_Field is HAL.UInt2;
   subtype CCMR2_Input_IC4F_Field is HAL.UInt4;

   --  capture/compare mode register 2 (input mode)
   type CCMR2_Input_Register is record
      --  Capture/compare 3 selection
      CC3S           : CCMR2_Input_CC3S_Field := 16#0#;
      --  Input capture 3 prescaler
      IC3PSC         : CCMR2_Input_IC3PSC_Field := 16#0#;
      --  Input capture 3 filter
      IC3F           : CCMR2_Input_IC3F_Field := 16#0#;
      --  Capture/Compare 4 selection
      CC4S           : CCMR2_Input_CC4S_Field := 16#0#;
      --  Input capture 4 prescaler
      IC4PSC         : CCMR2_Input_IC4PSC_Field := 16#0#;
      --  Input capture 4 filter
      IC4F           : CCMR2_Input_IC4F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Input_Register use record
      CC3S           at 0 range 0 .. 1;
      IC3PSC         at 0 range 2 .. 3;
      IC3F           at 0 range 4 .. 7;
      CC4S           at 0 range 8 .. 9;
      IC4PSC         at 0 range 10 .. 11;
      IC4F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCER_CC1E_Field is Boolean;
   subtype CCER_CC1P_Field is Boolean;
   subtype CCER_CC1NE_Field is Boolean;
   subtype CCER_CC1NP_Field is Boolean;
   subtype CCER_CC2E_Field is Boolean;
   subtype CCER_CC2P_Field is Boolean;
   subtype CCER_CC2NE_Field is Boolean;
   subtype CCER_CC2NP_Field is Boolean;
   subtype CCER_CC3E_Field is Boolean;
   subtype CCER_CC3P_Field is Boolean;
   subtype CCER_CC3NE_Field is Boolean;
   subtype CCER_CC3NP_Field is Boolean;
   subtype CCER_CC4E_Field is Boolean;
   subtype CCER_CC4P_Field is Boolean;
   subtype CCER_CC4NE_Field is Boolean;
   subtype CCER_CC4NP_Field is Boolean;
   subtype CCER_CC5E_Field is Boolean;
   subtype CCER_CC5P_Field is Boolean;
   subtype CCER_CC6E_Field is Boolean;
   subtype CCER_CC6P_Field is Boolean;

   --  capture/compare enable register
   type CCER_Register is record
      --  Capture/Compare 1 output enable
      CC1E           : CCER_CC1E_Field := False;
      --  Capture/Compare 1 output Polarity
      CC1P           : CCER_CC1P_Field := False;
      --  Capture/Compare 1 complementary output enable
      CC1NE          : CCER_CC1NE_Field := False;
      --  Capture/Compare 1 output Polarity
      CC1NP          : CCER_CC1NP_Field := False;
      --  Capture/Compare 2 output enable
      CC2E           : CCER_CC2E_Field := False;
      --  Capture/Compare 2 output Polarity
      CC2P           : CCER_CC2P_Field := False;
      --  Capture/Compare 2 complementary output enable
      CC2NE          : CCER_CC2NE_Field := False;
      --  Capture/Compare 2 output Polarity
      CC2NP          : CCER_CC2NP_Field := False;
      --  Capture/Compare 3 output enable
      CC3E           : CCER_CC3E_Field := False;
      --  Capture/Compare 3 output Polarity
      CC3P           : CCER_CC3P_Field := False;
      --  Capture/Compare 3 complementary output enable
      CC3NE          : CCER_CC3NE_Field := False;
      --  Capture/Compare 3 output Polarity
      CC3NP          : CCER_CC3NP_Field := False;
      --  Capture/Compare 4 output enable
      CC4E           : CCER_CC4E_Field := False;
      --  Capture/Compare 3 output Polarity
      CC4P           : CCER_CC4P_Field := False;
      --  Capture/Compare 4 complementary output enable
      CC4NE          : CCER_CC4NE_Field := False;
      --  Capture/Compare 4 complementary output polarity
      CC4NP          : CCER_CC4NP_Field := False;
      --  Capture/Compare 5 output enable
      CC5E           : CCER_CC5E_Field := False;
      --  Capture/Compare 5 output polarity
      CC5P           : CCER_CC5P_Field := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Capture/Compare 6 output enable
      CC6E           : CCER_CC6E_Field := False;
      --  Capture/Compare 6 output polarity
      CC6P           : CCER_CC6P_Field := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register use record
      CC1E           at 0 range 0 .. 0;
      CC1P           at 0 range 1 .. 1;
      CC1NE          at 0 range 2 .. 2;
      CC1NP          at 0 range 3 .. 3;
      CC2E           at 0 range 4 .. 4;
      CC2P           at 0 range 5 .. 5;
      CC2NE          at 0 range 6 .. 6;
      CC2NP          at 0 range 7 .. 7;
      CC3E           at 0 range 8 .. 8;
      CC3P           at 0 range 9 .. 9;
      CC3NE          at 0 range 10 .. 10;
      CC3NP          at 0 range 11 .. 11;
      CC4E           at 0 range 12 .. 12;
      CC4P           at 0 range 13 .. 13;
      CC4NE          at 0 range 14 .. 14;
      CC4NP          at 0 range 15 .. 15;
      CC5E           at 0 range 16 .. 16;
      CC5P           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      CC6E           at 0 range 20 .. 20;
      CC6P           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype CNT_CNT_Field is HAL.UInt16;
   subtype CNT_UIFCPY_Field is Boolean;

   --  counter
   type CNT_Register is record
      --  counter value
      CNT            : CNT_CNT_Field := 16#0#;
      --  unspecified
      Reserved_16_30 : HAL.UInt15 := 16#0#;
      --  Read-only. UIFCPY
      UIFCPY         : CNT_UIFCPY_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_30 at 0 range 16 .. 30;
      UIFCPY         at 0 range 31 .. 31;
   end record;

   subtype PSC_PSC_Field is HAL.UInt16;

   --  prescaler
   type PSC_Register is record
      --  Prescaler value
      PSC            : PSC_PSC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSC_Register use record
      PSC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ARR_ARR_Field is HAL.UInt16;

   --  auto-reload register
   type ARR_Register is record
      --  Auto-reload value
      ARR            : ARR_ARR_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RCR_REP_Field is HAL.UInt16;

   --  repetition counter register
   type RCR_Register is record
      --  Repetition counter value
      REP            : RCR_REP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      REP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR1_CCR1_Field is HAL.UInt16;

   --  capture/compare register 1
   type CCR1_Register is record
      --  Capture/Compare 1 value
      CCR1           : CCR1_CCR1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register use record
      CCR1           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR2_CCR2_Field is HAL.UInt16;

   --  capture/compare register 2
   type CCR2_Register is record
      --  Capture/Compare 2 value
      CCR2           : CCR2_CCR2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register use record
      CCR2           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR3_CCR3_Field is HAL.UInt16;

   --  capture/compare register 3
   type CCR3_Register is record
      --  Capture/Compare value
      CCR3           : CCR3_CCR3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR3_Register use record
      CCR3           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR4_CCR4_Field is HAL.UInt16;

   --  capture/compare register 4
   type CCR4_Register is record
      --  Capture/Compare value
      CCR4           : CCR4_CCR4_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR4_Register use record
      CCR4           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BDTR_DTG_Field is HAL.UInt8;
   subtype BDTR_LOCK_Field is HAL.UInt2;
   subtype BDTR_OSSI_Field is Boolean;
   subtype BDTR_OSSR_Field is Boolean;
   subtype BDTR_BKE_Field is Boolean;
   subtype BDTR_BKP_Field is Boolean;
   subtype BDTR_AOE_Field is Boolean;
   subtype BDTR_MOE_Field is Boolean;
   subtype BDTR_BKF_Field is HAL.UInt4;
   subtype BDTR_BK2F_Field is HAL.UInt4;
   subtype BDTR_BK2E_Field is Boolean;
   subtype BDTR_BK2P_Field is Boolean;
   subtype BDTR_BKDSRM_Field is Boolean;
   subtype BDTR_BK2DSRM_Field is Boolean;
   subtype BDTR_BKBID_Field is Boolean;
   subtype BDTR_BK2ID_Field is Boolean;

   --  break and dead-time register
   type BDTR_Register is record
      --  Dead-time generator setup
      DTG            : BDTR_DTG_Field := 16#0#;
      --  Lock configuration
      LOCK           : BDTR_LOCK_Field := 16#0#;
      --  Off-state selection for Idle mode
      OSSI           : BDTR_OSSI_Field := False;
      --  Off-state selection for Run mode
      OSSR           : BDTR_OSSR_Field := False;
      --  Break enable
      BKE            : BDTR_BKE_Field := False;
      --  Break polarity
      BKP            : BDTR_BKP_Field := False;
      --  Automatic output enable
      AOE            : BDTR_AOE_Field := False;
      --  Main output enable
      MOE            : BDTR_MOE_Field := False;
      --  Break filter
      BKF            : BDTR_BKF_Field := 16#0#;
      --  Break 2 filter
      BK2F           : BDTR_BK2F_Field := 16#0#;
      --  Break 2 Enable
      BK2E           : BDTR_BK2E_Field := False;
      --  Break 2 polarity
      BK2P           : BDTR_BK2P_Field := False;
      --  BKDSRM
      BKDSRM         : BDTR_BKDSRM_Field := False;
      --  BK2DSRM
      BK2DSRM        : BDTR_BK2DSRM_Field := False;
      --  BKBID
      BKBID          : BDTR_BKBID_Field := False;
      --  BK2ID
      BK2ID          : BDTR_BK2ID_Field := False;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDTR_Register use record
      DTG            at 0 range 0 .. 7;
      LOCK           at 0 range 8 .. 9;
      OSSI           at 0 range 10 .. 10;
      OSSR           at 0 range 11 .. 11;
      BKE            at 0 range 12 .. 12;
      BKP            at 0 range 13 .. 13;
      AOE            at 0 range 14 .. 14;
      MOE            at 0 range 15 .. 15;
      BKF            at 0 range 16 .. 19;
      BK2F           at 0 range 20 .. 23;
      BK2E           at 0 range 24 .. 24;
      BK2P           at 0 range 25 .. 25;
      BKDSRM         at 0 range 26 .. 26;
      BK2DSRM        at 0 range 27 .. 27;
      BKBID          at 0 range 28 .. 28;
      BK2ID          at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype CCR5_CCR5_Field is HAL.UInt16;
   --  CCR5_GC5C array element
   subtype CCR5_GC5C_Element is Boolean;

   --  CCR5_GC5C array
   type CCR5_GC5C_Field_Array is array (1 .. 3) of CCR5_GC5C_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for CCR5_GC5C
   type CCR5_GC5C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GC5C as a value
            Val : HAL.UInt3;
         when True =>
            --  GC5C as an array
            Arr : CCR5_GC5C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for CCR5_GC5C_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  capture/compare register 4
   type CCR5_Register is record
      --  Capture/Compare value
      CCR5           : CCR5_CCR5_Field := 16#0#;
      --  unspecified
      Reserved_16_28 : HAL.UInt13 := 16#0#;
      --  Group Channel 5 and Channel 1
      GC5C           : CCR5_GC5C_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR5_Register use record
      CCR5           at 0 range 0 .. 15;
      Reserved_16_28 at 0 range 16 .. 28;
      GC5C           at 0 range 29 .. 31;
   end record;

   subtype CCR6_CCR6_Field is HAL.UInt16;

   --  capture/compare register 4
   type CCR6_Register is record
      --  Capture/Compare value
      CCR6           : CCR6_CCR6_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR6_Register use record
      CCR6           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCMR3_Output_OC5FE_Field is Boolean;
   subtype CCMR3_Output_OC5PE_Field is Boolean;
   subtype CCMR3_Output_OC5M_Field is HAL.UInt3;
   subtype CCMR3_Output_OC5CE_Field is Boolean;
   subtype CCMR3_Output_OC6FE_Field is Boolean;
   subtype CCMR3_Output_OC6PE_Field is Boolean;
   subtype CCMR3_Output_OC6M_Field is HAL.UInt3;
   subtype CCMR3_Output_OC6CE_Field is Boolean;
   subtype CCMR3_Output_OC5M_bit3_Field is HAL.UInt3;
   subtype CCMR3_Output_OC6M_bit3_Field is Boolean;

   --  capture/compare mode register 2 (output mode)
   type CCMR3_Output_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Output compare 5 fast enable
      OC5FE          : CCMR3_Output_OC5FE_Field := False;
      --  Output compare 5 preload enable
      OC5PE          : CCMR3_Output_OC5PE_Field := False;
      --  Output compare 5 mode
      OC5M           : CCMR3_Output_OC5M_Field := 16#0#;
      --  Output compare 5 clear enable
      OC5CE          : CCMR3_Output_OC5CE_Field := False;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  Output compare 6 fast enable
      OC6FE          : CCMR3_Output_OC6FE_Field := False;
      --  Output compare 6 preload enable
      OC6PE          : CCMR3_Output_OC6PE_Field := False;
      --  Output compare 6 mode
      OC6M           : CCMR3_Output_OC6M_Field := 16#0#;
      --  Output compare 6 clear enable
      OC6CE          : CCMR3_Output_OC6CE_Field := False;
      --  Output Compare 5 mode bit 3
      OC5M_bit3      : CCMR3_Output_OC5M_bit3_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      --  Output Compare 6 mode bit 3
      OC6M_bit3      : CCMR3_Output_OC6M_bit3_Field := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR3_Output_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      OC5FE          at 0 range 2 .. 2;
      OC5PE          at 0 range 3 .. 3;
      OC5M           at 0 range 4 .. 6;
      OC5CE          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      OC6FE          at 0 range 10 .. 10;
      OC6PE          at 0 range 11 .. 11;
      OC6M           at 0 range 12 .. 14;
      OC6CE          at 0 range 15 .. 15;
      OC5M_bit3      at 0 range 16 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      OC6M_bit3      at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype DTR2_DTGF_Field is HAL.UInt8;
   subtype DTR2_DTAE_Field is Boolean;
   subtype DTR2_DTPE_Field is Boolean;

   --  timer Deadtime Register 2
   type DTR2_Register is record
      --  Dead-time falling edge generator setup
      DTGF           : DTR2_DTGF_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Deadtime Asymmetric Enable
      DTAE           : DTR2_DTAE_Field := False;
      --  Deadtime Preload Enable
      DTPE           : DTR2_DTPE_Field := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DTR2_Register use record
      DTGF           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      DTAE           at 0 range 16 .. 16;
      DTPE           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype ECR_IE_Field is Boolean;
   subtype ECR_IDIR_Field is HAL.UInt2;
   subtype ECR_IBLK_Field is HAL.UInt2;
   subtype ECR_FIDX_Field is Boolean;
   subtype ECR_IPOS_Field is HAL.UInt2;
   subtype ECR_PW_Field is HAL.UInt8;
   subtype ECR_PWPRSC_Field is HAL.UInt3;

   --  DMA control register
   type ECR_Register is record
      --  Index Enable
      IE             : ECR_IE_Field := False;
      --  Index Direction
      IDIR           : ECR_IDIR_Field := 16#0#;
      --  Index Blanking
      IBLK           : ECR_IBLK_Field := 16#0#;
      --  First Index
      FIDX           : ECR_FIDX_Field := False;
      --  Index Positioning
      IPOS           : ECR_IPOS_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Pulse width
      PW             : ECR_PW_Field := 16#0#;
      --  Pulse Width prescaler
      PWPRSC         : ECR_PWPRSC_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ECR_Register use record
      IE             at 0 range 0 .. 0;
      IDIR           at 0 range 1 .. 2;
      IBLK           at 0 range 3 .. 4;
      FIDX           at 0 range 5 .. 5;
      IPOS           at 0 range 6 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      PW             at 0 range 16 .. 23;
      PWPRSC         at 0 range 24 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype TISEL_TI1SEL_Field is HAL.UInt4;
   subtype TISEL_TI2SEL_Field is HAL.UInt4;
   subtype TISEL_TI3SEL_Field is HAL.UInt4;
   subtype TISEL_TI4SEL_Field is HAL.UInt4;

   --  TIM timer input selection register
   type TISEL_Register is record
      --  TI1[0] to TI1[15] input selection
      TI1SEL         : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  TI2[0] to TI2[15] input selection
      TI2SEL         : TISEL_TI2SEL_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  TI3[0] to TI3[15] input selection
      TI3SEL         : TISEL_TI3SEL_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  TI4[0] to TI4[15] input selection
      TI4SEL         : TISEL_TI4SEL_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register use record
      TI1SEL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TI2SEL         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TI3SEL         at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      TI4SEL         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype AF1_BKINE_Field is Boolean;
   subtype AF1_BKCMP1E_Field is Boolean;
   subtype AF1_BKCMP2E_Field is Boolean;
   subtype AF1_BKCMP3E_Field is Boolean;
   subtype AF1_BKCMP4E_Field is Boolean;
   subtype AF1_BKCMP5E_Field is Boolean;
   subtype AF1_BKCMP6E_Field is Boolean;
   subtype AF1_BKCMP7E_Field is Boolean;
   subtype AF1_BKINP_Field is Boolean;
   subtype AF1_BKCMP1P_Field is Boolean;
   subtype AF1_BKCMP2P_Field is Boolean;
   subtype AF1_BKCMP3P_Field is Boolean;
   subtype AF1_BKCMP4P_Field is Boolean;
   subtype AF1_ETRSEL_Field is HAL.UInt4;

   --  TIM alternate function option register 1
   type AF1_Register is record
      --  BRK BKIN input enable
      BKINE          : AF1_BKINE_Field := False;
      --  BRK COMP1 enable
      BKCMP1E        : AF1_BKCMP1E_Field := False;
      --  BRK COMP2 enable
      BKCMP2E        : AF1_BKCMP2E_Field := False;
      --  BRK COMP3 enable
      BKCMP3E        : AF1_BKCMP3E_Field := False;
      --  BRK COMP4 enable
      BKCMP4E        : AF1_BKCMP4E_Field := False;
      --  BRK COMP5 enable
      BKCMP5E        : AF1_BKCMP5E_Field := False;
      --  BRK COMP6 enable
      BKCMP6E        : AF1_BKCMP6E_Field := False;
      --  BRK COMP7 enable
      BKCMP7E        : AF1_BKCMP7E_Field := False;
      --  unspecified
      Reserved_8_8   : Boolean := False;
      --  BRK BKIN input polarity
      BKINP          : AF1_BKINP_Field := False;
      --  BRK COMP1 input polarity
      BKCMP1P        : AF1_BKCMP1P_Field := False;
      --  BRK COMP2 input polarity
      BKCMP2P        : AF1_BKCMP2P_Field := False;
      --  BRK COMP3 input polarity
      BKCMP3P        : AF1_BKCMP3P_Field := False;
      --  BRK COMP4 input polarity
      BKCMP4P        : AF1_BKCMP4P_Field := False;
      --  ETR source selection
      ETRSEL         : AF1_ETRSEL_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF1_Register use record
      BKINE          at 0 range 0 .. 0;
      BKCMP1E        at 0 range 1 .. 1;
      BKCMP2E        at 0 range 2 .. 2;
      BKCMP3E        at 0 range 3 .. 3;
      BKCMP4E        at 0 range 4 .. 4;
      BKCMP5E        at 0 range 5 .. 5;
      BKCMP6E        at 0 range 6 .. 6;
      BKCMP7E        at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      BKINP          at 0 range 9 .. 9;
      BKCMP1P        at 0 range 10 .. 10;
      BKCMP2P        at 0 range 11 .. 11;
      BKCMP3P        at 0 range 12 .. 12;
      BKCMP4P        at 0 range 13 .. 13;
      ETRSEL         at 0 range 14 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype AF2_BKINE_Field is Boolean;
   subtype AF2_BK2CMP1E_Field is Boolean;
   subtype AF2_BK2CMP2E_Field is Boolean;
   subtype AF2_BK2CMP3E_Field is Boolean;
   subtype AF2_BK2CMP4E_Field is Boolean;
   subtype AF2_BK2CMP5E_Field is Boolean;
   subtype AF2_BK2CMP6E_Field is Boolean;
   subtype AF2_BK2CMP7E_Field is Boolean;
   subtype AF2_BK2INP_Field is Boolean;
   subtype AF2_BK2CMP1P_Field is Boolean;
   subtype AF2_BK2CMP2P_Field is Boolean;
   subtype AF2_BK2CMP3P_Field is Boolean;
   subtype AF2_BK2CMP4P_Field is Boolean;
   subtype AF2_OCRSEL_Field is HAL.UInt3;

   --  TIM alternate function option register 2
   type AF2_Register is record
      --  BRK BKIN input enable
      BKINE          : AF2_BKINE_Field := False;
      --  BRK2 COMP1 enable
      BK2CMP1E       : AF2_BK2CMP1E_Field := False;
      --  BRK2 COMP2 enable
      BK2CMP2E       : AF2_BK2CMP2E_Field := False;
      --  BRK2 COMP3 enable
      BK2CMP3E       : AF2_BK2CMP3E_Field := False;
      --  BRK2 COMP4 enable
      BK2CMP4E       : AF2_BK2CMP4E_Field := False;
      --  BRK2 COMP5 enable
      BK2CMP5E       : AF2_BK2CMP5E_Field := False;
      --  BRK2 COMP6 enable
      BK2CMP6E       : AF2_BK2CMP6E_Field := False;
      --  BRK2 COMP7 enable
      BK2CMP7E       : AF2_BK2CMP7E_Field := False;
      --  unspecified
      Reserved_8_8   : Boolean := False;
      --  BRK2 BKIN input polarity
      BK2INP         : AF2_BK2INP_Field := False;
      --  BRK2 COMP1 input polarity
      BK2CMP1P       : AF2_BK2CMP1P_Field := False;
      --  BRK2 COMP2 input polarity
      BK2CMP2P       : AF2_BK2CMP2P_Field := False;
      --  BRK2 COMP3 input polarity
      BK2CMP3P       : AF2_BK2CMP3P_Field := False;
      --  BRK2 COMP4 input polarity
      BK2CMP4P       : AF2_BK2CMP4P_Field := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  OCREF_CLR source selection
      OCRSEL         : AF2_OCRSEL_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF2_Register use record
      BKINE          at 0 range 0 .. 0;
      BK2CMP1E       at 0 range 1 .. 1;
      BK2CMP2E       at 0 range 2 .. 2;
      BK2CMP3E       at 0 range 3 .. 3;
      BK2CMP4E       at 0 range 4 .. 4;
      BK2CMP5E       at 0 range 5 .. 5;
      BK2CMP6E       at 0 range 6 .. 6;
      BK2CMP7E       at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      BK2INP         at 0 range 9 .. 9;
      BK2CMP1P       at 0 range 10 .. 10;
      BK2CMP2P       at 0 range 11 .. 11;
      BK2CMP3P       at 0 range 12 .. 12;
      BK2CMP4P       at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      OCRSEL         at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype DCR_DBA_Field is HAL.UInt5;
   subtype DCR_DBL_Field is HAL.UInt5;

   --  control register
   type DCR_Register is record
      --  DMA base address
      DBA            : DCR_DBA_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  DMA burst length
      DBL            : DCR_DBL_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCR_Register use record
      DBA            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DBL            at 0 range 8 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  control register 1
   type CR1_Register_1 is record
      --  Counter enable
      CEN            : CR1_CEN_Field := False;
      --  Update disable
      UDIS           : CR1_UDIS_Field := False;
      --  Update request source
      URS            : CR1_URS_Field := False;
      --  One-pulse mode
      OPM            : CR1_OPM_Field := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  Auto-reload preload enable
      ARPE           : CR1_ARPE_Field := False;
      --  unspecified
      Reserved_8_10  : HAL.UInt3 := 16#0#;
      --  UIF status bit remapping
      UIFREMAP       : CR1_UIFREMAP_Field := False;
      --  Dithering Enable
      DITHEN         : CR1_DITHEN_Field := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_1 use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      Reserved_8_10  at 0 range 8 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      DITHEN         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  control register 2
   type CR2_Register_1 is record
      --  unspecified
      Reserved_0_3  : HAL.UInt4 := 16#0#;
      --  Master mode selection
      MMS           : CR2_MMS_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_1 use record
      Reserved_0_3  at 0 range 0 .. 3;
      MMS           at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_1 is record
      --  Update interrupt enable
      UIE           : DIER_UIE_Field := False;
      --  unspecified
      Reserved_1_7  : HAL.UInt7 := 16#0#;
      --  Update DMA request enable
      UDE           : DIER_UDE_Field := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_1 use record
      UIE           at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      UDE           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  status register
   type SR_Register_1 is record
      --  Update interrupt flag
      UIF           : SR_UIF_Field := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_1 use record
      UIF           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  event generation register
   type EGR_Register_1 is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_1 use record
      UG            at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  control register 1
   type CR1_Register_2 is record
      --  Counter enable
      CEN            : CR1_CEN_Field := False;
      --  Update disable
      UDIS           : CR1_UDIS_Field := False;
      --  Update request source
      URS            : CR1_URS_Field := False;
      --  One-pulse mode
      OPM            : CR1_OPM_Field := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  Auto-reload preload enable
      ARPE           : CR1_ARPE_Field := False;
      --  Clock division
      CKD            : CR1_CKD_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : Boolean := False;
      --  UIF status bit remapping
      UIFREMAP       : CR1_UIFREMAP_Field := False;
      --  Dithering Enable
      DITHEN         : CR1_DITHEN_Field := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_2 use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      DITHEN         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  control register 2
   type CR2_Register_2 is record
      --  Capture/compare preloaded control
      CCPC           : CR2_CCPC_Field := False;
      --  unspecified
      Reserved_1_1   : Boolean := False;
      --  Capture/compare control update selection
      CCUS           : CR2_CCUS_Field := False;
      --  Capture/compare DMA selection
      CCDS           : CR2_CCDS_Field := False;
      --  Master mode selection
      MMS            : CR2_MMS_Field := 16#0#;
      --  TI1 selection
      TI1S           : CR2_TI1S_Field := False;
      --  Output Idle state 1
      OIS1           : CR2_OIS1_Field := False;
      --  Output Idle state 1
      OIS1N          : CR2_OIS1N_Field := False;
      --  Output idle state 2 (OC2 output)
      OIS2           : CR2_OIS2_Field := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_2 use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      MMS            at 0 range 4 .. 6;
      TI1S           at 0 range 7 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      OIS2           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  slave mode control register
   type SMCR_Register_1 is record
      --  Slave mode selection
      SMS            : SMCR_SMS_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Boolean := False;
      --  Trigger selection
      TS             : SMCR_TS_Field := 16#0#;
      --  Master/Slave mode
      MSM            : SMCR_MSM_Field := False;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Slave mode selection - bit 3
      SMS_3          : SMCR_SMS_3_Field := False;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      --  Trigger selection - bit 4:3
      TS_4_3         : SMCR_TS_4_3_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register_1 use record
      SMS            at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TS             at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      SMS_3          at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      TS_4_3         at 0 range 20 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_2 is record
      --  Update interrupt enable
      UIE            : DIER_UIE_Field := False;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : DIER_CC1IE_Field := False;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : DIER_CC2IE_Field := False;
      --  unspecified
      Reserved_3_4   : HAL.UInt2 := 16#0#;
      --  COM interrupt enable
      COMIE          : DIER_COMIE_Field := False;
      --  Trigger interrupt enable
      TIE            : DIER_TIE_Field := False;
      --  Break interrupt enable
      BIE            : DIER_BIE_Field := False;
      --  Update DMA request enable
      UDE            : DIER_UDE_Field := False;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : DIER_CC1DE_Field := False;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : DIER_CC2DE_Field := False;
      --  unspecified
      Reserved_11_12 : HAL.UInt2 := 16#0#;
      --  COM DMA request enable
      COMDE          : DIER_COMDE_Field := False;
      --  Trigger DMA request enable
      TDE            : DIER_TDE_Field := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_2 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  status register
   type SR_Register_2 is record
      --  Update interrupt flag
      UIF            : SR_UIF_Field := False;
      --  Capture/compare 1 interrupt flag
      CC1IF          : SR_CC1IF_Field := False;
      --  Capture/compare 2 interrupt flag
      CC2IF          : SR_CC2IF_Field := False;
      --  unspecified
      Reserved_3_4   : HAL.UInt2 := 16#0#;
      --  COM interrupt flag
      COMIF          : SR_COMIF_Field := False;
      --  Trigger interrupt flag
      TIF            : SR_TIF_Field := False;
      --  Break interrupt flag
      BIF            : SR_BIF_Field := False;
      --  unspecified
      Reserved_8_8   : Boolean := False;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : SR_CC1OF_Field := False;
      --  Capture/Compare 2 overcapture flag
      CC2OF          : SR_CC2OF_Field := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_2 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  event generation register
   type EGR_Register_2 is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := False;
      --  Write-only. Capture/compare 1 generation
      CC1G          : EGR_CC1G_Field := False;
      --  Write-only. Capture/compare 2 generation
      CC2G          : EGR_CC2G_Field := False;
      --  unspecified
      Reserved_3_4  : HAL.UInt2 := 16#0#;
      --  Write-only. Capture/Compare control update generation
      COMG          : EGR_COMG_Field := False;
      --  Write-only. Trigger generation
      TG            : EGR_TG_Field := False;
      --  Write-only. Break generation
      BG            : EGR_BG_Field := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_2 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      COMG          at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  capture/compare mode register (output mode)
   type CCMR1_Output_Register_1 is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      --  Output Compare 1 fast enable
      OC1FE          : CCMR1_Output_OC1FE_Field := False;
      --  Output Compare 1 preload enable
      OC1PE          : CCMR1_Output_OC1PE_Field := False;
      --  Output Compare 1 mode
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  OC1CE
      OC1CE          : CCMR1_Output_OC1CE_Field := False;
      --  CC2S
      CC2S           : CCMR1_Output_CC2S_Field := 16#0#;
      --  OC2FE
      OC2FE          : CCMR1_Output_OC2FE_Field := False;
      --  OC2PE
      OC2PE          : CCMR1_Output_OC2PE_Field := False;
      --  OC2M
      OC2M           : CCMR1_Output_OC2M_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Boolean := False;
      --  Output Compare 1 mode
      OC1M_3         : CCMR1_Output_OC1M_3_Field := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  Output Compare 2 mode - bit 3
      OC2M_3         : CCMR1_Output_OC2M_3_Field := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register_1 use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      OC1CE          at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      OC1M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCMR1_Input_IC1PSC_Field is HAL.UInt2;

   --  capture/compare mode register 1 (input mode)
   type CCMR1_Input_Register_1 is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Input_CC1S_Field := 16#0#;
      --  Input capture 1 prescaler
      IC1PSC         : CCMR1_Input_IC1PSC_Field := 16#0#;
      --  Input capture 1 filter
      IC1F           : CCMR1_Input_IC1F_Field := 16#0#;
      --  CC2S
      CC2S           : CCMR1_Input_CC2S_Field := 16#0#;
      --  IC2PSC
      IC2PSC         : CCMR1_Input_IC2PSC_Field := 16#0#;
      --  IC2F
      IC2F           : CCMR1_Input_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register_1 use record
      CC1S           at 0 range 0 .. 1;
      IC1PSC         at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PSC         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  capture/compare enable register
   type CCER_Register_1 is record
      --  Capture/Compare 1 output enable
      CC1E          : CCER_CC1E_Field := False;
      --  Capture/Compare 1 output Polarity
      CC1P          : CCER_CC1P_Field := False;
      --  Capture/Compare 1 complementary output enable
      CC1NE         : CCER_CC1NE_Field := False;
      --  Capture/Compare 1 output Polarity
      CC1NP         : CCER_CC1NP_Field := False;
      --  Capture/Compare 2 output enable
      CC2E          : CCER_CC2E_Field := False;
      --  Capture/Compare 2 output polarity
      CC2P          : CCER_CC2P_Field := False;
      --  unspecified
      Reserved_6_6  : Boolean := False;
      --  Capture/Compare 2 complementary output polarity
      CC2NP         : CCER_CC2NP_Field := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_1 use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      CC1NE         at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      CC2E          at 0 range 4 .. 4;
      CC2P          at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      CC2NP         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RCR_REP_Field_1 is HAL.UInt8;

   --  repetition counter register
   type RCR_Register_1 is record
      --  Repetition counter value
      REP           : RCR_REP_Field_1 := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register_1 use record
      REP           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  break and dead-time register
   type BDTR_Register_1 is record
      --  Dead-time generator setup
      DTG            : BDTR_DTG_Field := 16#0#;
      --  Lock configuration
      LOCK           : BDTR_LOCK_Field := 16#0#;
      --  Off-state selection for Idle mode
      OSSI           : BDTR_OSSI_Field := False;
      --  Off-state selection for Run mode
      OSSR           : BDTR_OSSR_Field := False;
      --  Break enable
      BKE            : BDTR_BKE_Field := False;
      --  Break polarity
      BKP            : BDTR_BKP_Field := False;
      --  Automatic output enable
      AOE            : BDTR_AOE_Field := False;
      --  Main output enable
      MOE            : BDTR_MOE_Field := False;
      --  Break filter
      BKF            : BDTR_BKF_Field := 16#0#;
      --  unspecified
      Reserved_20_25 : HAL.UInt6 := 16#0#;
      --  BKDSRM
      BKDSRM         : BDTR_BKDSRM_Field := False;
      --  unspecified
      Reserved_27_27 : Boolean := False;
      --  BKBID
      BKBID          : BDTR_BKBID_Field := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDTR_Register_1 use record
      DTG            at 0 range 0 .. 7;
      LOCK           at 0 range 8 .. 9;
      OSSI           at 0 range 10 .. 10;
      OSSR           at 0 range 11 .. 11;
      BKE            at 0 range 12 .. 12;
      BKP            at 0 range 13 .. 13;
      AOE            at 0 range 14 .. 14;
      MOE            at 0 range 15 .. 15;
      BKF            at 0 range 16 .. 19;
      Reserved_20_25 at 0 range 20 .. 25;
      BKDSRM         at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      BKBID          at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  TIM timer input selection register
   type TISEL_Register_1 is record
      --  TI1[0] to TI1[15] input selection
      TI1SEL         : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  TI2[0] to TI2[15] input selection
      TI2SEL         : TISEL_TI2SEL_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register_1 use record
      TI1SEL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TI2SEL         at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  TIM alternate function option register 1
   type AF1_Register_1 is record
      --  BRK BKIN input enable
      BKINE          : AF1_BKINE_Field := False;
      --  BRK COMP1 enable
      BKCMP1E        : AF1_BKCMP1E_Field := False;
      --  BRK COMP2 enable
      BKCMP2E        : AF1_BKCMP2E_Field := False;
      --  BRK COMP3 enable
      BKCMP3E        : AF1_BKCMP3E_Field := False;
      --  BRK COMP4 enable
      BKCMP4E        : AF1_BKCMP4E_Field := False;
      --  BRK COMP5 enable
      BKCMP5E        : AF1_BKCMP5E_Field := False;
      --  BRK COMP6 enable
      BKCMP6E        : AF1_BKCMP6E_Field := False;
      --  BRK COMP7 enable
      BKCMP7E        : AF1_BKCMP7E_Field := False;
      --  unspecified
      Reserved_8_8   : Boolean := False;
      --  BRK BKIN input polarity
      BKINP          : AF1_BKINP_Field := False;
      --  BRK COMP1 input polarity
      BKCMP1P        : AF1_BKCMP1P_Field := False;
      --  BRK COMP2 input polarity
      BKCMP2P        : AF1_BKCMP2P_Field := False;
      --  BRK COMP3 input polarity
      BKCMP3P        : AF1_BKCMP3P_Field := False;
      --  BRK COMP4 input polarity
      BKCMP4P        : AF1_BKCMP4P_Field := False;
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF1_Register_1 use record
      BKINE          at 0 range 0 .. 0;
      BKCMP1E        at 0 range 1 .. 1;
      BKCMP2E        at 0 range 2 .. 2;
      BKCMP3E        at 0 range 3 .. 3;
      BKCMP4E        at 0 range 4 .. 4;
      BKCMP5E        at 0 range 5 .. 5;
      BKCMP6E        at 0 range 6 .. 6;
      BKCMP7E        at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      BKINP          at 0 range 9 .. 9;
      BKCMP1P        at 0 range 10 .. 10;
      BKCMP2P        at 0 range 11 .. 11;
      BKCMP3P        at 0 range 12 .. 12;
      BKCMP4P        at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  TIM alternate function option register 2
   type AF2_Register_1 is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      --  OCREF_CLR source selection
      OCRSEL         : AF2_OCRSEL_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF2_Register_1 use record
      Reserved_0_15  at 0 range 0 .. 15;
      OCRSEL         at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  control register 2
   type CR2_Register_3 is record
      --  Capture/compare preloaded control
      CCPC           : CR2_CCPC_Field := False;
      --  unspecified
      Reserved_1_1   : Boolean := False;
      --  Capture/compare control update selection
      CCUS           : CR2_CCUS_Field := False;
      --  Capture/compare DMA selection
      CCDS           : CR2_CCDS_Field := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Output Idle state 1
      OIS1           : CR2_OIS1_Field := False;
      --  Output Idle state 1
      OIS1N          : CR2_OIS1N_Field := False;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_3 use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_3 is record
      --  Update interrupt enable
      UIE            : DIER_UIE_Field := False;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : DIER_CC1IE_Field := False;
      --  unspecified
      Reserved_2_4   : HAL.UInt3 := 16#0#;
      --  COM interrupt enable
      COMIE          : DIER_COMIE_Field := False;
      --  unspecified
      Reserved_6_6   : Boolean := False;
      --  Break interrupt enable
      BIE            : DIER_BIE_Field := False;
      --  Update DMA request enable
      UDE            : DIER_UDE_Field := False;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : DIER_CC1DE_Field := False;
      --  unspecified
      Reserved_10_12 : HAL.UInt3 := 16#0#;
      --  COM DMA request enable
      COMDE          : DIER_COMDE_Field := False;
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_3 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIE          at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      COMDE          at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  status register
   type SR_Register_3 is record
      --  Update interrupt flag
      UIF            : SR_UIF_Field := False;
      --  Capture/compare 1 interrupt flag
      CC1IF          : SR_CC1IF_Field := False;
      --  unspecified
      Reserved_2_4   : HAL.UInt3 := 16#0#;
      --  COM interrupt flag
      COMIF          : SR_COMIF_Field := False;
      --  unspecified
      Reserved_6_6   : Boolean := False;
      --  Break interrupt flag
      BIF            : SR_BIF_Field := False;
      --  unspecified
      Reserved_8_8   : Boolean := False;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : SR_CC1OF_Field := False;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_3 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIF          at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  event generation register
   type EGR_Register_3 is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := False;
      --  Write-only. Capture/compare 1 generation
      CC1G          : EGR_CC1G_Field := False;
      --  unspecified
      Reserved_2_4  : HAL.UInt3 := 16#0#;
      --  Write-only. Capture/Compare control update generation
      COMG          : EGR_COMG_Field := False;
      --  unspecified
      Reserved_6_6  : Boolean := False;
      --  Write-only. Break generation
      BG            : EGR_BG_Field := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_3 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      Reserved_2_4  at 0 range 2 .. 4;
      COMG          at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  capture/compare mode register (output mode)
   type CCMR1_Output_Register_2 is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      --  Output Compare 1 fast enable
      OC1FE          : CCMR1_Output_OC1FE_Field := False;
      --  Output Compare 1 preload enable
      OC1PE          : CCMR1_Output_OC1PE_Field := False;
      --  Output Compare 1 mode
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : HAL.UInt9 := 16#0#;
      --  Output Compare 1 mode
      OC1M_3         : CCMR1_Output_OC1M_3_Field := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register_2 use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      OC1M_3         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  capture/compare mode register 1 (input mode)
   type CCMR1_Input_Register_2 is record
      --  Capture/Compare 1 selection
      CC1S          : CCMR1_Input_CC1S_Field := 16#0#;
      --  Input capture 1 prescaler
      IC1PSC        : CCMR1_Input_IC1PSC_Field := 16#0#;
      --  Input capture 1 filter
      IC1F          : CCMR1_Input_IC1F_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register_2 use record
      CC1S          at 0 range 0 .. 1;
      IC1PSC        at 0 range 2 .. 3;
      IC1F          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  capture/compare enable register
   type CCER_Register_2 is record
      --  Capture/Compare 1 output enable
      CC1E          : CCER_CC1E_Field := False;
      --  Capture/Compare 1 output Polarity
      CC1P          : CCER_CC1P_Field := False;
      --  Capture/Compare 1 complementary output enable
      CC1NE         : CCER_CC1NE_Field := False;
      --  Capture/Compare 1 output Polarity
      CC1NP         : CCER_CC1NP_Field := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_2 use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      CC1NE         at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  TIM timer input selection register
   type TISEL_Register_2 is record
      --  TI1[0] to TI1[15] input selection
      TI1SEL        : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register_2 use record
      TI1SEL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype OR1_HSE32EN_Field is Boolean;

   --  TIM option register 1
   type OR1_Register is record
      --  HSE Divided by 32 enable
      HSE32EN       : OR1_HSE32EN_Field := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR1_Register use record
      HSE32EN       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TIM1_Disc is
     (Output,
      Input);

   --  Advanced-timers
   type TIM1_Peripheral
     (Discriminent : TIM1_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register;
      --  control register 2
      CR2          : aliased CR2_Register;
      --  slave mode control register
      SMCR         : aliased SMCR_Register;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register;
      --  status register
      SR           : aliased SR_Register;
      --  event generation register
      EGR          : aliased EGR_Register;
      --  capture/compare enable register
      CCER         : aliased CCER_Register;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  capture/compare register 2
      CCR2         : aliased CCR2_Register;
      --  capture/compare register 3
      CCR3         : aliased CCR3_Register;
      --  capture/compare register 4
      CCR4         : aliased CCR4_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register;
      --  capture/compare register 4
      CCR5         : aliased CCR5_Register;
      --  capture/compare register 4
      CCR6         : aliased CCR6_Register;
      --  capture/compare mode register 2 (output mode)
      CCMR3_Output : aliased CCMR3_Output_Register;
      --  timer Deadtime Register 2
      DTR2         : aliased DTR2_Register;
      --  DMA control register
      ECR          : aliased ECR_Register;
      --  TIM timer input selection register
      TISEL        : aliased TISEL_Register;
      --  TIM alternate function option register 1
      AF1          : aliased AF1_Register;
      --  TIM alternate function option register 2
      AF2          : aliased AF2_Register;
      --  control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased HAL.UInt32;
      case Discriminent is
         when Output =>
            --  capture/compare mode register 1 (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register;
            --  capture/compare mode register 2 (output mode)
            CCMR2_Output : aliased CCMR2_Output_Register;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register;
            --  capture/compare mode register 2 (input mode)
            CCMR2_Input : aliased CCMR2_Input_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM1_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      CCR3         at 16#3C# range 0 .. 31;
      CCR4         at 16#40# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      CCR5         at 16#48# range 0 .. 31;
      CCR6         at 16#4C# range 0 .. 31;
      CCMR3_Output at 16#50# range 0 .. 31;
      DTR2         at 16#54# range 0 .. 31;
      ECR          at 16#58# range 0 .. 31;
      TISEL        at 16#5C# range 0 .. 31;
      AF1          at 16#60# range 0 .. 31;
      AF2          at 16#64# range 0 .. 31;
      DCR          at 16#3DC# range 0 .. 31;
      DMAR         at 16#3E0# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR2_Output at 16#1C# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      CCMR2_Input  at 16#1C# range 0 .. 31;
   end record;

   --  Advanced-timers
   TIM1_Periph : aliased TIM1_Peripheral
     with Import, Address => TIM1_Base;

   --  Advanced-timers
   TIM2_Periph : aliased TIM1_Peripheral
     with Import, Address => TIM2_Base;

   --  Advanced-timers
   TIM3_Periph : aliased TIM1_Peripheral
     with Import, Address => TIM3_Base;

   --  Advanced-timers
   TIM4_Periph : aliased TIM1_Peripheral
     with Import, Address => TIM4_Base;

   --  Advanced-timers
   TIM8_Periph : aliased TIM1_Peripheral
     with Import, Address => TIM8_Base;

   --  Advanced-timers
   TIM20_Periph : aliased TIM1_Peripheral
     with Import, Address => TIM20_Base;

   --  Basic-timers
   type TIM6_Peripheral is record
      --  control register 1
      CR1  : aliased CR1_Register_1;
      --  control register 2
      CR2  : aliased CR2_Register_1;
      --  DMA/Interrupt enable register
      DIER : aliased DIER_Register_1;
      --  status register
      SR   : aliased SR_Register_1;
      --  event generation register
      EGR  : aliased EGR_Register_1;
      --  counter
      CNT  : aliased CNT_Register;
      --  prescaler
      PSC  : aliased PSC_Register;
      --  auto-reload register
      ARR  : aliased ARR_Register;
   end record
     with Volatile;

   for TIM6_Peripheral use record
      CR1  at 16#0# range 0 .. 31;
      CR2  at 16#4# range 0 .. 31;
      DIER at 16#C# range 0 .. 31;
      SR   at 16#10# range 0 .. 31;
      EGR  at 16#14# range 0 .. 31;
      CNT  at 16#24# range 0 .. 31;
      PSC  at 16#28# range 0 .. 31;
      ARR  at 16#2C# range 0 .. 31;
   end record;

   --  Basic-timers
   TIM6_Periph : aliased TIM6_Peripheral
     with Import, Address => TIM6_Base;

   --  Basic-timers
   TIM7_Periph : aliased TIM6_Peripheral
     with Import, Address => TIM7_Base;

   type TIM15_Disc is
     (Output,
      Input);

   --  General purpose timers
   type TIM15_Peripheral
     (Discriminent : TIM15_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register_2;
      --  control register 2
      CR2          : aliased CR2_Register_2;
      --  slave mode control register
      SMCR         : aliased SMCR_Register_1;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_2;
      --  status register
      SR           : aliased SR_Register_2;
      --  event generation register
      EGR          : aliased EGR_Register_2;
      --  capture/compare enable register
      CCER         : aliased CCER_Register_1;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register_1;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  capture/compare register 2
      CCR2         : aliased CCR2_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register_1;
      --  timer Deadtime Register 2
      DTR2         : aliased DTR2_Register;
      --  TIM timer input selection register
      TISEL        : aliased TISEL_Register_1;
      --  TIM alternate function option register 1
      AF1          : aliased AF1_Register_1;
      --  TIM alternate function option register 2
      AF2          : aliased AF2_Register_1;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased HAL.UInt32;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register_1;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register_1;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM15_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DTR2         at 16#54# range 0 .. 31;
      TISEL        at 16#5C# range 0 .. 31;
      AF1          at 16#60# range 0 .. 31;
      AF2          at 16#64# range 0 .. 31;
      DCR          at 16#3DC# range 0 .. 31;
      DMAR         at 16#3E0# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
   end record;

   --  General purpose timers
   TIM15_Periph : aliased TIM15_Peripheral
     with Import, Address => TIM15_Base;

   type TIM16_Disc is
     (Output,
      Input);

   --  General purpose timers
   type TIM16_Peripheral
     (Discriminent : TIM16_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register_2;
      --  control register 2
      CR2          : aliased CR2_Register_3;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_3;
      --  status register
      SR           : aliased SR_Register_3;
      --  event generation register
      EGR          : aliased EGR_Register_3;
      --  capture/compare enable register
      CCER         : aliased CCER_Register_2;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register_1;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register_1;
      --  timer Deadtime Register 2
      DTR2         : aliased DTR2_Register;
      --  TIM timer input selection register
      TISEL        : aliased TISEL_Register_2;
      --  TIM alternate function option register 1
      AF1          : aliased AF1_Register_1;
      --  TIM alternate function option register 2
      AF2          : aliased AF2_Register_1;
      --  TIM option register 1
      OR1          : aliased OR1_Register;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased HAL.UInt32;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register_2;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register_2;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM16_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DTR2         at 16#54# range 0 .. 31;
      TISEL        at 16#5C# range 0 .. 31;
      AF1          at 16#60# range 0 .. 31;
      AF2          at 16#64# range 0 .. 31;
      OR1          at 16#68# range 0 .. 31;
      DCR          at 16#3DC# range 0 .. 31;
      DMAR         at 16#3E0# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
   end record;

   --  General purpose timers
   TIM16_Periph : aliased TIM16_Peripheral
     with Import, Address => TIM16_Base;

   --  General purpose timers
   TIM17_Periph : aliased TIM16_Peripheral
     with Import, Address => TIM17_Base;

end STM32_SVD.TIM;
