pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype TR_SU_Field is HAL.UInt4;
   subtype TR_ST_Field is HAL.UInt3;
   subtype TR_MNU_Field is HAL.UInt4;
   subtype TR_MNT_Field is HAL.UInt3;
   subtype TR_HU_Field is HAL.UInt4;
   subtype TR_HT_Field is HAL.UInt2;
   subtype TR_PM_Field is Boolean;

   --  time register
   type TR_Register is record
      --  Second units in BCD format
      SU             : TR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST             : TR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  Minute units in BCD format
      MNU            : TR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT            : TR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Boolean := False;
      --  Hour units in BCD format
      HU             : TR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT             : TR_HT_Field := 16#0#;
      --  AM/PM notation
      PM             : TR_PM_Field := False;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype DR_DU_Field is HAL.UInt4;
   subtype DR_DT_Field is HAL.UInt2;
   subtype DR_MU_Field is HAL.UInt4;
   subtype DR_MT_Field is Boolean;
   subtype DR_WDU_Field is HAL.UInt3;
   subtype DR_YU_Field is HAL.UInt4;
   subtype DR_YT_Field is HAL.UInt4;

   --  date register
   type DR_Register is record
      --  Date units in BCD format
      DU             : DR_DU_Field := 16#1#;
      --  Date tens in BCD format
      DT             : DR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Month units in BCD format
      MU             : DR_MU_Field := 16#1#;
      --  Month tens in BCD format
      MT             : DR_MT_Field := False;
      --  Week day units
      WDU            : DR_WDU_Field := 16#1#;
      --  Year units in BCD format
      YU             : DR_YU_Field := 16#0#;
      --  Year tens in BCD format
      YT             : DR_YT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      YU             at 0 range 16 .. 19;
      YT             at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SSR_SS_Field is HAL.UInt16;

   --  sub second register
   type SSR_Register is record
      --  Read-only. Sub second value
      SS             : SSR_SS_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ICSR_ALRAWF_Field is Boolean;
   subtype ICSR_ALRBWF_Field is Boolean;
   subtype ICSR_WUTWF_Field is Boolean;
   subtype ICSR_SHPF_Field is Boolean;
   subtype ICSR_INITS_Field is Boolean;
   subtype ICSR_RSF_Field is Boolean;
   subtype ICSR_INITF_Field is Boolean;
   subtype ICSR_INIT_Field is Boolean;
   subtype ICSR_RECALPF_Field is Boolean;

   --  initialization and status register
   type ICSR_Register is record
      --  Read-only. Alarm A write flag
      ALRAWF         : ICSR_ALRAWF_Field := True;
      --  Read-only. Alarm B write flag
      ALRBWF         : ICSR_ALRBWF_Field := True;
      --  Read-only. Wakeup timer write flag
      WUTWF          : ICSR_WUTWF_Field := True;
      --  Shift operation pending
      SHPF           : ICSR_SHPF_Field := False;
      --  Read-only. Initialization status flag
      INITS          : ICSR_INITS_Field := False;
      --  Registers synchronization flag
      RSF            : ICSR_RSF_Field := False;
      --  Read-only. Initialization flag
      INITF          : ICSR_INITF_Field := False;
      --  Initialization mode
      INIT           : ICSR_INIT_Field := False;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Read-only. Recalibration pending Flag
      RECALPF        : ICSR_RECALPF_Field := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSR_Register use record
      ALRAWF         at 0 range 0 .. 0;
      ALRBWF         at 0 range 1 .. 1;
      WUTWF          at 0 range 2 .. 2;
      SHPF           at 0 range 3 .. 3;
      INITS          at 0 range 4 .. 4;
      RSF            at 0 range 5 .. 5;
      INITF          at 0 range 6 .. 6;
      INIT           at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      RECALPF        at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype PRER_PREDIV_S_Field is HAL.UInt15;
   subtype PRER_PREDIV_A_Field is HAL.UInt7;

   --  prescaler register
   type PRER_Register is record
      --  Synchronous prescaler factor
      PREDIV_S       : PRER_PREDIV_S_Field := 16#FF#;
      --  unspecified
      Reserved_15_15 : Boolean := False;
      --  Asynchronous prescaler factor
      PREDIV_A       : PRER_PREDIV_A_Field := 16#7F#;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRER_Register use record
      PREDIV_S       at 0 range 0 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PREDIV_A       at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WUTR_WUT_Field is HAL.UInt16;

   --  wakeup timer register
   type WUTR_Register is record
      --  Wakeup auto-reload value bits
      WUT            : WUTR_WUT_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WUTR_Register use record
      WUT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CR_WCKSEL_Field is HAL.UInt3;
   subtype CR_TSEDGE_Field is Boolean;
   subtype CR_REFCKON_Field is Boolean;
   subtype CR_BYPSHAD_Field is Boolean;
   subtype CR_FMT_Field is Boolean;
   subtype CR_ALRAE_Field is Boolean;
   subtype CR_ALRBE_Field is Boolean;
   subtype CR_WUTE_Field is Boolean;
   subtype CR_TSE_Field is Boolean;
   subtype CR_ALRAIE_Field is Boolean;
   subtype CR_ALRBIE_Field is Boolean;
   subtype CR_WUTIE_Field is Boolean;
   subtype CR_TSIE_Field is Boolean;
   subtype CR_ADD1H_Field is Boolean;
   subtype CR_SUB1H_Field is Boolean;
   subtype CR_BKP_Field is Boolean;
   subtype CR_COSEL_Field is Boolean;
   subtype CR_POL_Field is Boolean;
   subtype CR_OSEL_Field is HAL.UInt2;
   subtype CR_COE_Field is Boolean;
   subtype CR_ITSE_Field is Boolean;
   subtype CR_TAMPTS_Field is Boolean;
   subtype CR_TAMPOE_Field is Boolean;
   subtype CR_TAMPALRM_PU_Field is Boolean;
   subtype CR_TAMPALRM_TYPE_Field is Boolean;
   subtype CR_OUT2EN_Field is Boolean;

   --  control register
   type CR_Register is record
      --  Wakeup clock selection
      WCKSEL         : CR_WCKSEL_Field := 16#0#;
      --  Time-stamp event active edge
      TSEDGE         : CR_TSEDGE_Field := False;
      --  Reference clock detection enable (50 or 60 Hz)
      REFCKON        : CR_REFCKON_Field := False;
      --  Bypass the shadow registers
      BYPSHAD        : CR_BYPSHAD_Field := False;
      --  Hour format
      FMT            : CR_FMT_Field := False;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  Alarm A enable
      ALRAE          : CR_ALRAE_Field := False;
      --  Alarm B enable
      ALRBE          : CR_ALRBE_Field := False;
      --  Wakeup timer enable
      WUTE           : CR_WUTE_Field := False;
      --  Time stamp enable
      TSE            : CR_TSE_Field := False;
      --  Alarm A interrupt enable
      ALRAIE         : CR_ALRAIE_Field := False;
      --  Alarm B interrupt enable
      ALRBIE         : CR_ALRBIE_Field := False;
      --  Wakeup timer interrupt enable
      WUTIE          : CR_WUTIE_Field := False;
      --  Time-stamp interrupt enable
      TSIE           : CR_TSIE_Field := False;
      --  Add 1 hour (summer time change)
      ADD1H          : CR_ADD1H_Field := False;
      --  Subtract 1 hour (winter time change)
      SUB1H          : CR_SUB1H_Field := False;
      --  Backup
      BKP            : CR_BKP_Field := False;
      --  Calibration output selection
      COSEL          : CR_COSEL_Field := False;
      --  Output polarity
      POL            : CR_POL_Field := False;
      --  Output selection
      OSEL           : CR_OSEL_Field := 16#0#;
      --  Calibration output enable
      COE            : CR_COE_Field := False;
      --  timestamp on internal event enable
      ITSE           : CR_ITSE_Field := False;
      --  TAMPTS
      TAMPTS         : CR_TAMPTS_Field := False;
      --  TAMPOE
      TAMPOE         : CR_TAMPOE_Field := False;
      --  unspecified
      Reserved_27_28 : HAL.UInt2 := 16#0#;
      --  TAMPALRM_PU
      TAMPALRM_PU    : CR_TAMPALRM_PU_Field := False;
      --  TAMPALRM_TYPE
      TAMPALRM_TYPE  : CR_TAMPALRM_TYPE_Field := False;
      --  OUT2EN
      OUT2EN         : CR_OUT2EN_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      WCKSEL         at 0 range 0 .. 2;
      TSEDGE         at 0 range 3 .. 3;
      REFCKON        at 0 range 4 .. 4;
      BYPSHAD        at 0 range 5 .. 5;
      FMT            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      ALRAE          at 0 range 8 .. 8;
      ALRBE          at 0 range 9 .. 9;
      WUTE           at 0 range 10 .. 10;
      TSE            at 0 range 11 .. 11;
      ALRAIE         at 0 range 12 .. 12;
      ALRBIE         at 0 range 13 .. 13;
      WUTIE          at 0 range 14 .. 14;
      TSIE           at 0 range 15 .. 15;
      ADD1H          at 0 range 16 .. 16;
      SUB1H          at 0 range 17 .. 17;
      BKP            at 0 range 18 .. 18;
      COSEL          at 0 range 19 .. 19;
      POL            at 0 range 20 .. 20;
      OSEL           at 0 range 21 .. 22;
      COE            at 0 range 23 .. 23;
      ITSE           at 0 range 24 .. 24;
      TAMPTS         at 0 range 25 .. 25;
      TAMPOE         at 0 range 26 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      TAMPALRM_PU    at 0 range 29 .. 29;
      TAMPALRM_TYPE  at 0 range 30 .. 30;
      OUT2EN         at 0 range 31 .. 31;
   end record;

   subtype WPR_KEY_Field is HAL.UInt8;

   --  write protection register
   type WPR_Register is record
      --  Write-only. Write protection key
      KEY           : WPR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CALR_CALM_Field is HAL.UInt9;
   subtype CALR_CALW16_Field is Boolean;
   subtype CALR_CALW8_Field is Boolean;
   subtype CALR_CALP_Field is Boolean;

   --  calibration register
   type CALR_Register is record
      --  Calibration minus
      CALM           : CALR_CALM_Field := 16#0#;
      --  unspecified
      Reserved_9_12  : HAL.UInt4 := 16#0#;
      --  Use a 16-second calibration cycle period
      CALW16         : CALR_CALW16_Field := False;
      --  Use an 8-second calibration cycle period
      CALW8          : CALR_CALW8_Field := False;
      --  Increase frequency of RTC by 488.5 ppm
      CALP           : CALR_CALP_Field := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALR_Register use record
      CALM           at 0 range 0 .. 8;
      Reserved_9_12  at 0 range 9 .. 12;
      CALW16         at 0 range 13 .. 13;
      CALW8          at 0 range 14 .. 14;
      CALP           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SHIFTR_SUBFS_Field is HAL.UInt15;
   subtype SHIFTR_ADD1S_Field is Boolean;

   --  shift control register
   type SHIFTR_Register is record
      --  Write-only. Subtract a fraction of a second
      SUBFS          : SHIFTR_SUBFS_Field := 16#0#;
      --  unspecified
      Reserved_15_30 : HAL.UInt16 := 16#0#;
      --  Write-only. Add one second
      ADD1S          : SHIFTR_ADD1S_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHIFTR_Register use record
      SUBFS          at 0 range 0 .. 14;
      Reserved_15_30 at 0 range 15 .. 30;
      ADD1S          at 0 range 31 .. 31;
   end record;

   subtype TSTR_SU_Field is HAL.UInt4;
   subtype TSTR_ST_Field is HAL.UInt3;
   subtype TSTR_MNU_Field is HAL.UInt4;
   subtype TSTR_MNT_Field is HAL.UInt3;
   subtype TSTR_HU_Field is HAL.UInt4;
   subtype TSTR_HT_Field is HAL.UInt2;
   subtype TSTR_PM_Field is Boolean;

   --  time stamp time register
   type TSTR_Register is record
      --  Read-only. Second units in BCD format
      SU             : TSTR_SU_Field;
      --  Read-only. Second tens in BCD format
      ST             : TSTR_ST_Field;
      --  unspecified
      Reserved_7_7   : Boolean;
      --  Read-only. Minute units in BCD format
      MNU            : TSTR_MNU_Field;
      --  Read-only. Minute tens in BCD format
      MNT            : TSTR_MNT_Field;
      --  unspecified
      Reserved_15_15 : Boolean;
      --  Read-only. Hour units in BCD format
      HU             : TSTR_HU_Field;
      --  Read-only. Hour tens in BCD format
      HT             : TSTR_HT_Field;
      --  Read-only. AM/PM notation
      PM             : TSTR_PM_Field;
      --  unspecified
      Reserved_23_31 : HAL.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSTR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TSDR_DU_Field is HAL.UInt4;
   subtype TSDR_DT_Field is HAL.UInt2;
   subtype TSDR_MU_Field is HAL.UInt4;
   subtype TSDR_MT_Field is Boolean;
   subtype TSDR_WDU_Field is HAL.UInt3;

   --  time stamp date register
   type TSDR_Register is record
      --  Read-only. Date units in BCD format
      DU             : TSDR_DU_Field;
      --  Read-only. Date tens in BCD format
      DT             : TSDR_DT_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Month units in BCD format
      MU             : TSDR_MU_Field;
      --  Read-only. Month tens in BCD format
      MT             : TSDR_MT_Field;
      --  Read-only. Week day units
      WDU            : TSDR_WDU_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSDR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TSSSR_SS_Field is HAL.UInt16;

   --  timestamp sub second register
   type TSSSR_Register is record
      --  Read-only. Sub second value
      SS             : TSSSR_SS_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSSSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ALRMAR_SU_Field is HAL.UInt4;
   subtype ALRMAR_ST_Field is HAL.UInt3;
   subtype ALRMAR_MSK1_Field is Boolean;
   subtype ALRMAR_MNU_Field is HAL.UInt4;
   subtype ALRMAR_MNT_Field is HAL.UInt3;
   subtype ALRMAR_MSK2_Field is Boolean;
   subtype ALRMAR_HU_Field is HAL.UInt4;
   subtype ALRMAR_HT_Field is HAL.UInt2;
   subtype ALRMAR_PM_Field is Boolean;
   subtype ALRMAR_MSK3_Field is Boolean;
   subtype ALRMAR_DU_Field is HAL.UInt4;
   subtype ALRMAR_DT_Field is HAL.UInt2;
   subtype ALRMAR_WDSEL_Field is Boolean;
   subtype ALRMAR_MSK4_Field is Boolean;

   --  alarm A register
   type ALRMAR_Register is record
      --  Second units in BCD format
      SU    : ALRMAR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST    : ALRMAR_ST_Field := 16#0#;
      --  Alarm A seconds mask
      MSK1  : ALRMAR_MSK1_Field := False;
      --  Minute units in BCD format
      MNU   : ALRMAR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT   : ALRMAR_MNT_Field := 16#0#;
      --  Alarm A minutes mask
      MSK2  : ALRMAR_MSK2_Field := False;
      --  Hour units in BCD format
      HU    : ALRMAR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT    : ALRMAR_HT_Field := 16#0#;
      --  AM/PM notation
      PM    : ALRMAR_PM_Field := False;
      --  Alarm A hours mask
      MSK3  : ALRMAR_MSK3_Field := False;
      --  Date units or day in BCD format
      DU    : ALRMAR_DU_Field := 16#0#;
      --  Date tens in BCD format
      DT    : ALRMAR_DT_Field := 16#0#;
      --  Week day selection
      WDSEL : ALRMAR_WDSEL_Field := False;
      --  Alarm A date mask
      MSK4  : ALRMAR_MSK4_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMAR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype ALRMASSR_SS_Field is HAL.UInt15;
   subtype ALRMASSR_MASKSS_Field is HAL.UInt4;

   --  alarm A sub second register
   type ALRMASSR_Register is record
      --  Sub seconds value
      SS             : ALRMASSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : HAL.UInt9 := 16#0#;
      --  Mask the most-significant bits starting at this bit
      MASKSS         : ALRMASSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMASSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ALRMBR_SU_Field is HAL.UInt4;
   subtype ALRMBR_ST_Field is HAL.UInt3;
   subtype ALRMBR_MSK1_Field is Boolean;
   subtype ALRMBR_MNU_Field is HAL.UInt4;
   subtype ALRMBR_MNT_Field is HAL.UInt3;
   subtype ALRMBR_MSK2_Field is Boolean;
   subtype ALRMBR_HU_Field is HAL.UInt4;
   subtype ALRMBR_HT_Field is HAL.UInt2;
   subtype ALRMBR_PM_Field is Boolean;
   subtype ALRMBR_MSK3_Field is Boolean;
   subtype ALRMBR_DU_Field is HAL.UInt4;
   subtype ALRMBR_DT_Field is HAL.UInt2;
   subtype ALRMBR_WDSEL_Field is Boolean;
   subtype ALRMBR_MSK4_Field is Boolean;

   --  alarm B register
   type ALRMBR_Register is record
      --  Second units in BCD format
      SU    : ALRMBR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST    : ALRMBR_ST_Field := 16#0#;
      --  Alarm B seconds mask
      MSK1  : ALRMBR_MSK1_Field := False;
      --  Minute units in BCD format
      MNU   : ALRMBR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT   : ALRMBR_MNT_Field := 16#0#;
      --  Alarm B minutes mask
      MSK2  : ALRMBR_MSK2_Field := False;
      --  Hour units in BCD format
      HU    : ALRMBR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT    : ALRMBR_HT_Field := 16#0#;
      --  AM/PM notation
      PM    : ALRMBR_PM_Field := False;
      --  Alarm B hours mask
      MSK3  : ALRMBR_MSK3_Field := False;
      --  Date units or day in BCD format
      DU    : ALRMBR_DU_Field := 16#0#;
      --  Date tens in BCD format
      DT    : ALRMBR_DT_Field := 16#0#;
      --  Week day selection
      WDSEL : ALRMBR_WDSEL_Field := False;
      --  Alarm B date mask
      MSK4  : ALRMBR_MSK4_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype ALRMBSSR_SS_Field is HAL.UInt15;
   subtype ALRMBSSR_MASKSS_Field is HAL.UInt4;

   --  alarm B sub second register
   type ALRMBSSR_Register is record
      --  Sub seconds value
      SS             : ALRMBSSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : HAL.UInt9 := 16#0#;
      --  Mask the most-significant bits starting at this bit
      MASKSS         : ALRMBSSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBSSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype SR_ALRAF_Field is Boolean;
   subtype SR_ALRBF_Field is Boolean;
   subtype SR_WUTF_Field is Boolean;
   subtype SR_TSF_Field is Boolean;
   subtype SR_TSOVF_Field is Boolean;
   subtype SR_ITSF_Field is Boolean;

   --  status register
   type SR_Register is record
      --  Read-only. ALRAF
      ALRAF         : SR_ALRAF_Field;
      --  Read-only. ALRBF
      ALRBF         : SR_ALRBF_Field;
      --  Read-only. WUTF
      WUTF          : SR_WUTF_Field;
      --  Read-only. TSF
      TSF           : SR_TSF_Field;
      --  Read-only. TSOVF
      TSOVF         : SR_TSOVF_Field;
      --  Read-only. ITSF
      ITSF          : SR_ITSF_Field;
      --  unspecified
      Reserved_6_31 : HAL.UInt26;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      ALRAF         at 0 range 0 .. 0;
      ALRBF         at 0 range 1 .. 1;
      WUTF          at 0 range 2 .. 2;
      TSF           at 0 range 3 .. 3;
      TSOVF         at 0 range 4 .. 4;
      ITSF          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype MISR_ALRAMF_Field is Boolean;
   subtype MISR_ALRBMF_Field is Boolean;
   subtype MISR_WUTMF_Field is Boolean;
   subtype MISR_TSMF_Field is Boolean;
   subtype MISR_TSOVMF_Field is Boolean;
   subtype MISR_ITSMF_Field is Boolean;

   --  status register
   type MISR_Register is record
      --  Read-only. ALRAMF
      ALRAMF        : MISR_ALRAMF_Field;
      --  Read-only. ALRBMF
      ALRBMF        : MISR_ALRBMF_Field;
      --  Read-only. WUTMF
      WUTMF         : MISR_WUTMF_Field;
      --  Read-only. TSMF
      TSMF          : MISR_TSMF_Field;
      --  Read-only. TSOVMF
      TSOVMF        : MISR_TSOVMF_Field;
      --  Read-only. ITSMF
      ITSMF         : MISR_ITSMF_Field;
      --  unspecified
      Reserved_6_31 : HAL.UInt26;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MISR_Register use record
      ALRAMF        at 0 range 0 .. 0;
      ALRBMF        at 0 range 1 .. 1;
      WUTMF         at 0 range 2 .. 2;
      TSMF          at 0 range 3 .. 3;
      TSOVMF        at 0 range 4 .. 4;
      ITSMF         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype SCR_CALRAF_Field is Boolean;
   subtype SCR_CALRBF_Field is Boolean;
   subtype SCR_CWUTF_Field is Boolean;
   subtype SCR_CTSF_Field is Boolean;
   subtype SCR_CTSOVF_Field is Boolean;
   subtype SCR_CITSF_Field is Boolean;

   --  status register
   type SCR_Register is record
      --  Write-only. CALRAF
      CALRAF        : SCR_CALRAF_Field := False;
      --  Write-only. CALRBF
      CALRBF        : SCR_CALRBF_Field := False;
      --  Write-only. CWUTF
      CWUTF         : SCR_CWUTF_Field := False;
      --  Write-only. CTSF
      CTSF          : SCR_CTSF_Field := False;
      --  Write-only. CTSOVF
      CTSOVF        : SCR_CTSOVF_Field := False;
      --  Write-only. CITSF
      CITSF         : SCR_CITSF_Field := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      CALRAF        at 0 range 0 .. 0;
      CALRBF        at 0 range 1 .. 1;
      CWUTF         at 0 range 2 .. 2;
      CTSF          at 0 range 3 .. 3;
      CTSOVF        at 0 range 4 .. 4;
      CITSF         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Real-time clock
   type RTC_Peripheral is record
      --  time register
      TR       : aliased TR_Register;
      --  date register
      DR       : aliased DR_Register;
      --  sub second register
      SSR      : aliased SSR_Register;
      --  initialization and status register
      ICSR     : aliased ICSR_Register;
      --  prescaler register
      PRER     : aliased PRER_Register;
      --  wakeup timer register
      WUTR     : aliased WUTR_Register;
      --  control register
      CR       : aliased CR_Register;
      --  write protection register
      WPR      : aliased WPR_Register;
      --  calibration register
      CALR     : aliased CALR_Register;
      --  shift control register
      SHIFTR   : aliased SHIFTR_Register;
      --  time stamp time register
      TSTR     : aliased TSTR_Register;
      --  time stamp date register
      TSDR     : aliased TSDR_Register;
      --  timestamp sub second register
      TSSSR    : aliased TSSSR_Register;
      --  alarm A register
      ALRMAR   : aliased ALRMAR_Register;
      --  alarm A sub second register
      ALRMASSR : aliased ALRMASSR_Register;
      --  alarm B register
      ALRMBR   : aliased ALRMBR_Register;
      --  alarm B sub second register
      ALRMBSSR : aliased ALRMBSSR_Register;
      --  status register
      SR       : aliased SR_Register;
      --  status register
      MISR     : aliased MISR_Register;
      --  status register
      SCR      : aliased SCR_Register;
   end record
     with Volatile;

   for RTC_Peripheral use record
      TR       at 16#0# range 0 .. 31;
      DR       at 16#4# range 0 .. 31;
      SSR      at 16#8# range 0 .. 31;
      ICSR     at 16#C# range 0 .. 31;
      PRER     at 16#10# range 0 .. 31;
      WUTR     at 16#14# range 0 .. 31;
      CR       at 16#18# range 0 .. 31;
      WPR      at 16#24# range 0 .. 31;
      CALR     at 16#28# range 0 .. 31;
      SHIFTR   at 16#2C# range 0 .. 31;
      TSTR     at 16#30# range 0 .. 31;
      TSDR     at 16#34# range 0 .. 31;
      TSSSR    at 16#38# range 0 .. 31;
      ALRMAR   at 16#40# range 0 .. 31;
      ALRMASSR at 16#44# range 0 .. 31;
      ALRMBR   at 16#48# range 0 .. 31;
      ALRMBSSR at 16#4C# range 0 .. 31;
      SR       at 16#50# range 0 .. 31;
      MISR     at 16#54# range 0 .. 31;
      SCR      at 16#5C# range 0 .. 31;
   end record;

   --  Real-time clock
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end STM32_SVD.RTC;
