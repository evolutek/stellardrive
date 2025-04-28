pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.FDCAN is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype FDCAN_CREL_DAY_Field is HAL.UInt8;
   subtype FDCAN_CREL_MON_Field is HAL.UInt8;
   subtype FDCAN_CREL_YEAR_Field is HAL.UInt4;
   subtype FDCAN_CREL_SUBSTEP_Field is HAL.UInt4;
   subtype FDCAN_CREL_STEP_Field is HAL.UInt4;
   subtype FDCAN_CREL_REL_Field is HAL.UInt4;

   --  FDCAN core release register
   type FDCAN_CREL_Register is record
      --  Read-only. 18
      DAY     : FDCAN_CREL_DAY_Field;
      --  Read-only. 12
      MON     : FDCAN_CREL_MON_Field;
      --  Read-only. 4
      YEAR    : FDCAN_CREL_YEAR_Field;
      --  Read-only. 1
      SUBSTEP : FDCAN_CREL_SUBSTEP_Field;
      --  Read-only. 2
      STEP    : FDCAN_CREL_STEP_Field;
      --  Read-only. 3
      REL     : FDCAN_CREL_REL_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_CREL_Register use record
      DAY     at 0 range 0 .. 7;
      MON     at 0 range 8 .. 15;
      YEAR    at 0 range 16 .. 19;
      SUBSTEP at 0 range 20 .. 23;
      STEP    at 0 range 24 .. 27;
      REL     at 0 range 28 .. 31;
   end record;

   subtype FDCAN_DBTP_DSJW_Field is HAL.UInt4;
   subtype FDCAN_DBTP_DTSEG2_Field is HAL.UInt4;
   subtype FDCAN_DBTP_DTSEG1_Field is HAL.UInt5;
   subtype FDCAN_DBTP_DBRP_Field is HAL.UInt5;

   --  Transceiver delay compensation
   type FDCAN_DBTP_TDC_Field is
     (--  Transceiver delay compensation disabled
      B_0x0,
      --  Transceiver delay compensation enabled
      B_0x1)
     with Size => 1;
   for FDCAN_DBTP_TDC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN data bit timing and prescaler register
   type FDCAN_DBTP_Register is record
      --  Synchronization jump width Must always be smaller than DTSEG2, valid
      --  values are 0 to 15. The value used by the hardware is the one
      --  programmed, incremented by 1: t<sub>SJW</sub>
      DSJW           : FDCAN_DBTP_DSJW_Field := 16#3#;
      --  Data time segment after sample point Valid values are 0 to 15. The
      --  value used by the hardware is the one programmed, incremented by 1,
      --  i.e. t<sub>BS2</sub>
      DTSEG2         : FDCAN_DBTP_DTSEG2_Field := 16#3#;
      --  Data time segment before sample point Valid values are 0 to 31. The
      --  value used by the hardware is the one programmed, incremented by 1,
      --  i.e. t<sub>BS1</sub>
      DTSEG1         : FDCAN_DBTP_DTSEG1_Field := 16#A#;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Data bit rate prescaler The value by which the oscillator frequency
      --  is divided to generate the bit time quanta. The bit time is built up
      --  from a multiple of this quanta. Valid values for the Baud Rate
      --  Prescaler are 0 to 31. The hardware interpreters this value as the
      --  value programmed plus 1.
      DBRP           : FDCAN_DBTP_DBRP_Field := 16#0#;
      --  unspecified
      Reserved_21_22 : HAL.UInt2 := 16#0#;
      --  Transceiver delay compensation
      TDC            : FDCAN_DBTP_TDC_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_DBTP_Register use record
      DSJW           at 0 range 0 .. 3;
      DTSEG2         at 0 range 4 .. 7;
      DTSEG1         at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DBRP           at 0 range 16 .. 20;
      Reserved_21_22 at 0 range 21 .. 22;
      TDC            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Loop back mode
   type FDCAN_TEST_LBCK_Field is
     (--  Reset value, Loop Back mode is disabled
      B_0x0,
      --  Loop Back mode is enabled (see Power down (Sleep mode))
      B_0x1)
     with Size => 1;
   for FDCAN_TEST_LBCK_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Control of transmit pin
   type FDCAN_TEST_TX_Field is
     (--  Reset value, FDCANx_TX TX is controlled by the CAN core, updated at the end
--  of the CAN bit time
      B_0x0,
      --  Sample point can be monitored at pin FDCANx_TX
      B_0x1,
      --  Dominant (0) level at pin FDCANx_TX
      B_0x2,
      --  Recessive (1) at pin FDCANx_TX
      B_0x3)
     with Size => 2;
   for FDCAN_TEST_TX_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Receive pin Monitors the actual value of pin FDCANx_RX
   type FDCAN_TEST_RX_Field is
     (--  The CAN bus is dominant (FDCANx_RX = 0)
      B_0x0,
      --  The CAN bus is recessive (FDCANx_RX = 1)
      B_0x1)
     with Size => 1;
   for FDCAN_TEST_RX_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN test register
   type FDCAN_TEST_Register is record
      --  unspecified
      Reserved_0_3  : HAL.UInt4 := 16#0#;
      --  Loop back mode
      LBCK          : FDCAN_TEST_LBCK_Field := STM32_SVD.FDCAN.B_0x0;
      --  Control of transmit pin
      TX            : FDCAN_TEST_TX_Field := STM32_SVD.FDCAN.B_0x0;
      --  Read-only. Receive pin Monitors the actual value of pin FDCANx_RX
      RX            : FDCAN_TEST_RX_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TEST_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      LBCK          at 0 range 4 .. 4;
      TX            at 0 range 5 .. 6;
      RX            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FDCAN_RWD_WDC_Field is HAL.UInt8;
   subtype FDCAN_RWD_WDV_Field is HAL.UInt8;

   --  FDCAN RAM watchdog register
   type FDCAN_RWD_Register is record
      --  Watchdog configuration Start value of the message RAM watchdog
      --  counter. With the reset value of 00, the counter is disabled. These
      --  are protected write (P) bits, write access is possible only when the
      --  bit 1 [CCE] and bit 0 [INIT] of FDCAN_CCCR register are set to 1.
      WDC            : FDCAN_RWD_WDC_Field := 16#0#;
      --  Read-only. Watchdog value Actual message RAM watchdog counter value.
      WDV            : FDCAN_RWD_WDV_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_RWD_Register use record
      WDC            at 0 range 0 .. 7;
      WDV            at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Initialization
   type FDCAN_CCCR_INIT_Field is
     (--  Normal operation
      B_0x0,
      --  Initialization started
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_INIT_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Configuration change enable
   type FDCAN_CCCR_CCE_Field is
     (--  The CPU has no write access to the protected configuration registers.
      B_0x0,
      --  The CPU has write access to the protected configuration registers (while
--  CCCR.INIT = 1).
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_CCE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  ASM restricted operation mode The restricted operation mode is intended
   --  for applications that adapt themselves to different CAN bit rates. The
   --  application tests different bit rates and leaves the Restricted
   --  operation Mode after it has received a valid frame. In the optional
   --  Restricted operation Mode the node is able to transmit and receive data
   --  and remote frames and it gives acknowledge to valid frames, but it does
   --  not send active error frames or overload frames. In case of an error
   --  condition or overload condition, it does not send dominant bits, instead
   --  it waits for the occurrence of bus idle condition to resynchronize
   --  itself to the CAN communication. The error counters are not incremented.
   --  Bit ASM can only be set by software when both CCE and INIT are set to 1.
   --  The bit can be reset by the software at any time.
   type FDCAN_CCCR_ASM_Field is
     (--  Normal CAN operation
      B_0x0,
      --  Restricted operation Mode active
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_ASM_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock stop acknowledge
   type FDCAN_CCCR_CSA_Field is
     (--  No clock stop acknowledged
      B_0x0,
      --  FDCAN may be set in power down by stopping APB clock and kernel clock.
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_CSA_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock stop request
   type FDCAN_CCCR_CSR_Field is
     (--  No clock stop requested
      B_0x0,
      --  Clock stop requested. When clock stop is requested, first INIT and then CSA
--  is set after all pending transfer requests have been completed and the CAN
--  bus reached idle.
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_CSR_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Bus monitoring mode Bit MON can only be set by software when both CCE
   --  and INIT are set to 1. The bit can be reset by the Host at any time.
   type FDCAN_CCCR_MON_Field is
     (--  Bus monitoring mode disabled
      B_0x0,
      --  Bus monitoring mode enabled
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_MON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Disable automatic retransmission
   type FDCAN_CCCR_DAR_Field is
     (--  Automatic retransmission of messages not transmitted successfully enabled
      B_0x0,
      --  Automatic retransmission disabled
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_DAR_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Test mode enable
   type FDCAN_CCCR_TEST_Field is
     (--  Normal operation, register TEST holds reset values
      B_0x0,
      --  Test Mode, write access to register TEST enabled
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_TEST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FD operation enable
   type FDCAN_CCCR_FDOE_Field is
     (--  FD operation disabled
      B_0x0,
      --  FD operation enabled
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_FDOE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN bit rate switching
   type FDCAN_CCCR_BRSE_Field is
     (--  Bit rate switching for transmissions disabled
      B_0x0,
      --  Bit rate switching for transmissions enabled
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_BRSE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Protocol exception handling disable
   type FDCAN_CCCR_PXHD_Field is
     (--  Protocol exception handling enabled
      B_0x0,
      --  Protocol exception handling disabled
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_PXHD_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Edge filtering during bus integration
   type FDCAN_CCCR_EFBI_Field is
     (--  Edge filtering disabled
      B_0x0,
      --  Two consecutive dominant tq required to detect an edge for hard
--  synchronization
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_EFBI_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  If this bit is set, the FDCAN pauses for two CAN bit times before
   --  starting the next transmission after successfully transmitting a frame.
   type FDCAN_CCCR_TXP_Field is
     (--  disabled
      B_0x0,
      --  enabled
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_TXP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Non ISO operation If this bit is set, the FDCAN uses the CAN FD frame
   --  format as specified by the Bosch CAN FD Specification V1.0.
   type FDCAN_CCCR_NISO_Field is
     (--  CAN FD frame format according to ISO11898-1
      B_0x0,
      --  CAN FD frame format according to Bosch CAN FD Specification V1.0
      B_0x1)
     with Size => 1;
   for FDCAN_CCCR_NISO_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN CC control register
   type FDCAN_CCCR_Register is record
      --  Initialization
      INIT           : FDCAN_CCCR_INIT_Field := STM32_SVD.FDCAN.B_0x1;
      --  Configuration change enable
      CCE            : FDCAN_CCCR_CCE_Field := STM32_SVD.FDCAN.B_0x0;
      --  ASM restricted operation mode The restricted operation mode is
      --  intended for applications that adapt themselves to different CAN bit
      --  rates. The application tests different bit rates and leaves the
      --  Restricted operation Mode after it has received a valid frame. In the
      --  optional Restricted operation Mode the node is able to transmit and
      --  receive data and remote frames and it gives acknowledge to valid
      --  frames, but it does not send active error frames or overload frames.
      --  In case of an error condition or overload condition, it does not send
      --  dominant bits, instead it waits for the occurrence of bus idle
      --  condition to resynchronize itself to the CAN communication. The error
      --  counters are not incremented. Bit ASM can only be set by software
      --  when both CCE and INIT are set to 1. The bit can be reset by the
      --  software at any time.
      ASM            : FDCAN_CCCR_ASM_Field := STM32_SVD.FDCAN.B_0x0;
      --  Read-only. Clock stop acknowledge
      CSA            : FDCAN_CCCR_CSA_Field := STM32_SVD.FDCAN.B_0x0;
      --  Clock stop request
      CSR            : FDCAN_CCCR_CSR_Field := STM32_SVD.FDCAN.B_0x0;
      --  Bus monitoring mode Bit MON can only be set by software when both CCE
      --  and INIT are set to 1. The bit can be reset by the Host at any time.
      MON            : FDCAN_CCCR_MON_Field := STM32_SVD.FDCAN.B_0x0;
      --  Disable automatic retransmission
      DAR            : FDCAN_CCCR_DAR_Field := STM32_SVD.FDCAN.B_0x0;
      --  Test mode enable
      TEST           : FDCAN_CCCR_TEST_Field := STM32_SVD.FDCAN.B_0x0;
      --  FD operation enable
      FDOE           : FDCAN_CCCR_FDOE_Field := STM32_SVD.FDCAN.B_0x0;
      --  FDCAN bit rate switching
      BRSE           : FDCAN_CCCR_BRSE_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Protocol exception handling disable
      PXHD           : FDCAN_CCCR_PXHD_Field := STM32_SVD.FDCAN.B_0x0;
      --  Edge filtering during bus integration
      EFBI           : FDCAN_CCCR_EFBI_Field := STM32_SVD.FDCAN.B_0x0;
      --  If this bit is set, the FDCAN pauses for two CAN bit times before
      --  starting the next transmission after successfully transmitting a
      --  frame.
      TXP            : FDCAN_CCCR_TXP_Field := STM32_SVD.FDCAN.B_0x0;
      --  Non ISO operation If this bit is set, the FDCAN uses the CAN FD frame
      --  format as specified by the Bosch CAN FD Specification V1.0.
      NISO           : FDCAN_CCCR_NISO_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_CCCR_Register use record
      INIT           at 0 range 0 .. 0;
      CCE            at 0 range 1 .. 1;
      ASM            at 0 range 2 .. 2;
      CSA            at 0 range 3 .. 3;
      CSR            at 0 range 4 .. 4;
      MON            at 0 range 5 .. 5;
      DAR            at 0 range 6 .. 6;
      TEST           at 0 range 7 .. 7;
      FDOE           at 0 range 8 .. 8;
      BRSE           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      PXHD           at 0 range 12 .. 12;
      EFBI           at 0 range 13 .. 13;
      TXP            at 0 range 14 .. 14;
      NISO           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype FDCAN_NBTP_NTSEG2_Field is HAL.UInt7;
   subtype FDCAN_NBTP_NTSEG1_Field is HAL.UInt8;
   subtype FDCAN_NBTP_NBRP_Field is HAL.UInt9;
   subtype FDCAN_NBTP_NSJW_Field is HAL.UInt7;

   --  FDCAN nominal bit timing and prescaler register
   type FDCAN_NBTP_Register is record
      --  Nominal time segment after sample point Valid values are 0 to 127.
      --  The actual interpretation by the hardware of this value is such that
      --  one more than the programmed value is used.
      NTSEG2       : FDCAN_NBTP_NTSEG2_Field := 16#3#;
      --  unspecified
      Reserved_7_7 : Boolean := False;
      --  Nominal time segment before sample point Valid values are 0 to 255.
      --  The actual interpretation by the hardware of this value is such that
      --  one more than the programmed value is used. These are protected write
      --  (P) bits, write access is possible only when the bit 1 [CCE] and bit
      --  0 [INIT] of CCCR register are set to 1.
      NTSEG1       : FDCAN_NBTP_NTSEG1_Field := 16#A#;
      --  Bit rate prescaler Value by which the oscillator frequency is divided
      --  for generating the bit time quanta. The bit time is built up from a
      --  multiple of this quanta. Valid values are 0 to 511. The actual
      --  interpretation by the hardware of this value is such that one more
      --  than the value programmed here is used. These are protected write (P)
      --  bits, write access is possible only when the bit 1 [CCE] and bit 0
      --  [INIT] of CCCR register are set to 1.
      NBRP         : FDCAN_NBTP_NBRP_Field := 16#0#;
      --  Nominal (re)synchronization jump width Valid values are 0 to 127. The
      --  actual interpretation by the hardware of this value is such that the
      --  used value is the one programmed incremented by one. These are
      --  protected write (P) bits, write access is possible only when the bit
      --  1 [CCE] and bit 0 [INIT] of CCCR register are set to 1.
      NSJW         : FDCAN_NBTP_NSJW_Field := 16#3#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_NBTP_Register use record
      NTSEG2       at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      NTSEG1       at 0 range 8 .. 15;
      NBRP         at 0 range 16 .. 24;
      NSJW         at 0 range 25 .. 31;
   end record;

   --  Timestamp select These are protected write (P) bits, write access is
   --  possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR register are
   --  set to 1.
   type FDCAN_TSCC_TSS_Field is
     (--  Timestamp counter value always 0x0000
      B_0x0,
      --  Timestamp counter value incremented according to TCP
      B_0x1,
      --  External timestamp counter from TIM3 value (tim3_cnt[0:15])
      B_0x2,
      --  Same as 00.
      B_0x3)
     with Size => 2;
   for FDCAN_TSCC_TSS_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype FDCAN_TSCC_TCP_Field is HAL.UInt4;

   --  FDCAN timestamp counter configuration register
   type FDCAN_TSCC_Register is record
      --  Timestamp select These are protected write (P) bits, write access is
      --  possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR register
      --  are set to 1.
      TSS            : FDCAN_TSCC_TSS_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_2_15  : HAL.UInt14 := 16#0#;
      --  Timestamp counter prescaler
      TCP            : FDCAN_TSCC_TCP_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TSCC_Register use record
      TSS            at 0 range 0 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      TCP            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype FDCAN_TSCV_TSC_Field is HAL.UInt16;

   --  FDCAN timestamp counter value register
   type FDCAN_TSCV_Register is record
      --  Timestamp counter
      TSC            : FDCAN_TSCV_TSC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TSCV_Register use record
      TSC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Timeout counter enable This is a protected write (P) bit, write access
   --  is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR register
   --  are set to 1.
   type FDCAN_TOCC_ETOC_Field is
     (--  Timeout counter disabled
      B_0x0,
      --  Timeout counter enabled
      B_0x1)
     with Size => 1;
   for FDCAN_TOCC_ETOC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Timeout select When operating in Continuous mode, a write to TOCV
   --  presets the counter to the value configured by TOCC[TOP] and continues
   --  down-counting. When the timeout counter is controlled by one of the
   --  FIFOs, an empty FIFO presets the counter to the value configured by
   --  TOCC[TOP]. Down-counting is started when the first FIFO element is
   --  stored. These are protected write (P) bits, write access is possible
   --  only when the bit 1 [CCE] and bit 0 [INIT] of CCCR register are set to
   --  1.
   type FDCAN_TOCC_TOS_Field is
     (--  Continuous operation
      B_0x0,
      --  Timeout controlled by Tx event FIFO
      B_0x1,
      --  Timeout controlled by Rx FIFO 0
      B_0x2,
      --  Timeout controlled by Rx FIFO 1
      B_0x3)
     with Size => 2;
   for FDCAN_TOCC_TOS_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype FDCAN_TOCC_TOP_Field is HAL.UInt16;

   --  FDCAN timeout counter configuration register
   type FDCAN_TOCC_Register is record
      --  Timeout counter enable This is a protected write (P) bit, write
      --  access is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
      --  register are set to 1.
      ETOC          : FDCAN_TOCC_ETOC_Field := STM32_SVD.FDCAN.B_0x0;
      --  Timeout select When operating in Continuous mode, a write to TOCV
      --  presets the counter to the value configured by TOCC[TOP] and
      --  continues down-counting. When the timeout counter is controlled by
      --  one of the FIFOs, an empty FIFO presets the counter to the value
      --  configured by TOCC[TOP]. Down-counting is started when the first FIFO
      --  element is stored. These are protected write (P) bits, write access
      --  is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
      --  register are set to 1.
      TOS           : FDCAN_TOCC_TOS_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_3_15 : HAL.UInt13 := 16#0#;
      --  Timeout period Start value of the timeout counter (down-counter).
      --  Configures the timeout period.
      TOP           : FDCAN_TOCC_TOP_Field := 16#FFFF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TOCC_Register use record
      ETOC          at 0 range 0 .. 0;
      TOS           at 0 range 1 .. 2;
      Reserved_3_15 at 0 range 3 .. 15;
      TOP           at 0 range 16 .. 31;
   end record;

   subtype FDCAN_TOCV_TOC_Field is HAL.UInt16;

   --  FDCAN timeout counter value register
   type FDCAN_TOCV_Register is record
      --  Timeout counter
      TOC            : FDCAN_TOCV_TOC_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TOCV_Register use record
      TOC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype FDCAN_ECR_TEC_Field is HAL.UInt8;
   subtype FDCAN_ECR_REC_Field is HAL.UInt7;

   --  Receive error passive
   type FDCAN_ECR_RP_Field is
     (--  The receive error counter is below the error passive level of 128.
      B_0x0,
      --  The receive error counter has reached the error passive level of 128.
      B_0x1)
     with Size => 1;
   for FDCAN_ECR_RP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype FDCAN_ECR_CEL_Field is HAL.UInt8;

   --  FDCAN error counter register
   type FDCAN_ECR_Register is record
      --  Read-only. Transmit error counter Actual state of the transmit error
      --  counter, values between 0 and 255. When CCCR.ASM is set, the CAN
      --  protocol controller does not increment TEC and REC when a CAN
      --  protocol error is detected, but CEL is still incremented.
      TEC            : FDCAN_ECR_TEC_Field := 16#0#;
      --  Read-only. Receive error counter Actual state of the receive error
      --  counter, values between 0 and 127.
      REC            : FDCAN_ECR_REC_Field := 16#0#;
      --  Read-only. Receive error passive
      RP             : FDCAN_ECR_RP_Field := STM32_SVD.FDCAN.B_0x0;
      --  CAN error logging The counter is incremented each time when a CAN
      --  protocol error causes the transmit error counter or the receive error
      --  counter to be incremented. It is reset by read access to CEL. The
      --  counter stops at 0xFF; the next increment of TEC or REC sets
      --  interrupt flag IR[ELO]. Access type is RX: reset on read.
      CEL            : FDCAN_ECR_CEL_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_ECR_Register use record
      TEC            at 0 range 0 .. 7;
      REC            at 0 range 8 .. 14;
      RP             at 0 range 15 .. 15;
      CEL            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Last error code The LEC indicates the type of the last error to occur on
   --  the CAN bus. This field is cleared to 0 when a message has been
   --  transferred (reception or transmission) without error. Access type is
   --  RS: set on read.
   type FDCAN_PSR_LEC_Field is
     (--  No Error: No error occurred since LEC has been reset by successful
--  reception or transmission.
      B_0x0,
      --  Stuff Error: More than 5 equal bits in a sequence have occurred in a part
--  of a received message where this is not allowed.
      B_0x1,
      --  Form Error: A fixed format part of a received frame has the wrong format.
      B_0x2,
      --  AckError: The message transmitted by the FDCAN was not acknowledged by
--  another node.
      B_0x3,
      --  Bit1Error: During the transmission of a message (with the exception of the
--  arbitration field), the device wanted to send a recessive level (bit of
--  logical value 1), but the monitored bus value was dominant.
      B_0x4,
      --  Bit0Error: During the transmission of a message (or acknowledge bit, or
--  active error flag, or overload flag), the device wanted to send a dominant
--  level (data or identifier bit logical value 0), but the monitored bus value
--  was recessive. During Bus_Off recovery this status is set each time a
--  sequence of 11 recessive bits has been monitored. This enables the CPU to
--  monitor the proceeding of the Bus_Off recovery sequence (indicating the bus
--  is not stuck at dominant or continuously disturbed).
      B_0x5,
      --  CRCError: The CRC check sum of a received message was incorrect. The CRC of
--  an incoming message does not match with the CRC calculated from the
--  received data.
      B_0x6,
      --  NoChange: Any read access to the Protocol status register re-initializes
--  the LEC to 7. When the LEC shows the value 7, no CAN bus event was detected
--  since the last CPU read access to the Protocol status register.
      B_0x7)
     with Size => 3;
   for FDCAN_PSR_LEC_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7);

   --  Activity Monitors the modules CAN communication state.
   type FDCAN_PSR_ACT_Field is
     (--  Synchronizing: node is synchronizing on CAN communication.
      B_0x0,
      --  Idle: node is neither receiver nor transmitter.
      B_0x1,
      --  Receiver: node is operating as receiver.
      B_0x2,
      --  Transmitter: node is operating as transmitter.
      B_0x3)
     with Size => 2;
   for FDCAN_PSR_ACT_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Error passive
   type FDCAN_PSR_EP_Field is
     (--  The FDCAN is in the Error_Active state. It normally takes part in bus
--  communication and sends an active error flag when an error has been
--  detected.
      B_0x0,
      --  The FDCAN is in the Error_Passive state.
      B_0x1)
     with Size => 1;
   for FDCAN_PSR_EP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Warning Sstatus
   type FDCAN_PSR_EW_Field is
     (--  Both error counters are below the Error_Warning limit of 96.
      B_0x0,
      --  At least one of error counter has reached the Error_Warning limit of 96.
      B_0x1)
     with Size => 1;
   for FDCAN_PSR_EW_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Bus_Off status
   type FDCAN_PSR_BO_Field is
     (--  The FDCAN is not Bus_Off.
      B_0x0,
      --  The FDCAN is in Bus_Off state.
      B_0x1)
     with Size => 1;
   for FDCAN_PSR_BO_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype FDCAN_PSR_DLEC_Field is HAL.UInt3;

   --  ESI flag of last received FDCAN message This bit is set together with
   --  REDL, independent of acceptance filtering. Access type is RX: reset on
   --  read.
   type FDCAN_PSR_RESI_Field is
     (--  Last received FDCAN message did not have its ESI flag set.
      B_0x0,
      --  Last received FDCAN message had its ESI flag set.
      B_0x1)
     with Size => 1;
   for FDCAN_PSR_RESI_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  BRS flag of last received FDCAN message This bit is set together with
   --  REDL, independent of acceptance filtering. Access type is RX: reset on
   --  read.
   type FDCAN_PSR_RBRS_Field is
     (--  Last received FDCAN message did not have its BRS flag set.
      B_0x0,
      --  Last received FDCAN message had its BRS flag set.
      B_0x1)
     with Size => 1;
   for FDCAN_PSR_RBRS_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Received FDCAN message This bit is set independent of acceptance
   --  filtering. Access type is RX: reset on read.
   type FDCAN_PSR_REDL_Field is
     (--  Since this bit was reset by the CPU, no FDCAN message has been received.
      B_0x0,
      --  Message in FDCAN format with EDL flag set has been received.
      B_0x1)
     with Size => 1;
   for FDCAN_PSR_REDL_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Protocol exception event
   type FDCAN_PSR_PXE_Field is
     (--  No protocol exception event occurred since last read access
      B_0x0,
      --  Protocol exception event occurred
      B_0x1)
     with Size => 1;
   for FDCAN_PSR_PXE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype FDCAN_PSR_TDCV_Field is HAL.UInt7;

   --  FDCAN protocol status register
   type FDCAN_PSR_Register is record
      --  Last error code The LEC indicates the type of the last error to occur
      --  on the CAN bus. This field is cleared to 0 when a message has been
      --  transferred (reception or transmission) without error. Access type is
      --  RS: set on read.
      LEC            : FDCAN_PSR_LEC_Field := STM32_SVD.FDCAN.B_0x7;
      --  Read-only. Activity Monitors the modules CAN communication state.
      ACT            : FDCAN_PSR_ACT_Field := STM32_SVD.FDCAN.B_0x0;
      --  Read-only. Error passive
      EP             : FDCAN_PSR_EP_Field := STM32_SVD.FDCAN.B_0x0;
      --  Read-only. Warning Sstatus
      EW             : FDCAN_PSR_EW_Field := STM32_SVD.FDCAN.B_0x0;
      --  Read-only. Bus_Off status
      BO             : FDCAN_PSR_BO_Field := STM32_SVD.FDCAN.B_0x0;
      --  Data last error code Type of last error that occurred in the data
      --  phase of a FDCAN format frame with its BRS flag set. Coding is the
      --  same as for LEC. This field is cleared to 0 when a FDCAN format frame
      --  with its BRS flag set has been transferred (reception or
      --  transmission) without error. Access type is RS: set on read.
      DLEC           : FDCAN_PSR_DLEC_Field := 16#7#;
      --  ESI flag of last received FDCAN message This bit is set together with
      --  REDL, independent of acceptance filtering. Access type is RX: reset
      --  on read.
      RESI           : FDCAN_PSR_RESI_Field := STM32_SVD.FDCAN.B_0x0;
      --  BRS flag of last received FDCAN message This bit is set together with
      --  REDL, independent of acceptance filtering. Access type is RX: reset
      --  on read.
      RBRS           : FDCAN_PSR_RBRS_Field := STM32_SVD.FDCAN.B_0x0;
      --  Received FDCAN message This bit is set independent of acceptance
      --  filtering. Access type is RX: reset on read.
      REDL           : FDCAN_PSR_REDL_Field := STM32_SVD.FDCAN.B_0x0;
      --  Protocol exception event
      PXE            : FDCAN_PSR_PXE_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_15_15 : Boolean := False;
      --  Read-only. Transmitter delay compensation value Position of the
      --  secondary sample point, defined by the sum of the measured delay from
      --  FDCAN_TX to FDCAN_RX and TDCR.TDCO. The SSP position is, in the data
      --  phase, the number of minimum time quanta (mtq) between the start of
      --  the transmitted bit and the secondary sample point. Valid values are
      --  0 to 127 mtq.
      TDCV           : FDCAN_PSR_TDCV_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_PSR_Register use record
      LEC            at 0 range 0 .. 2;
      ACT            at 0 range 3 .. 4;
      EP             at 0 range 5 .. 5;
      EW             at 0 range 6 .. 6;
      BO             at 0 range 7 .. 7;
      DLEC           at 0 range 8 .. 10;
      RESI           at 0 range 11 .. 11;
      RBRS           at 0 range 12 .. 12;
      REDL           at 0 range 13 .. 13;
      PXE            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      TDCV           at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype FDCAN_TDCR_TDCF_Field is HAL.UInt7;
   subtype FDCAN_TDCR_TDCO_Field is HAL.UInt7;

   --  FDCAN transmitter delay compensation register
   type FDCAN_TDCR_Register is record
      --  Transmitter delay compensation filter window length Defines the
      --  minimum value for the SSP position, dominant edges on FDCAN_RX that
      --  would result in an earlier SSP position are ignored for transmitter
      --  delay measurements. These are protected write (P) bits, which means
      --  that write access by the bits is possible only when the bit 1 [CCE]
      --  and bit 0 [INIT] of CCCR register are set to 1.
      TDCF           : FDCAN_TDCR_TDCF_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  Transmitter delay compensation offset Offset value defining the
      --  distance between the measured delay from FDCAN_TX to FDCAN_RX and the
      --  secondary sample point. Valid values are 0 to 127 mtq. These are
      --  protected write (P) bits, which means that write access by the bits
      --  is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
      --  register are set to 1.
      TDCO           : FDCAN_TDCR_TDCO_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TDCR_Register use record
      TDCF           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TDCO           at 0 range 8 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  Rx FIFO 0 new message
   type FDCAN_IR_RF0N_Field is
     (--  No new message written to Rx FIFO 0
      B_0x0,
      --  New message written to Rx FIFO 0
      B_0x1)
     with Size => 1;
   for FDCAN_IR_RF0N_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 0 full
   type FDCAN_IR_RF0F_Field is
     (--  Rx FIFO 0 not full
      B_0x0,
      --  Rx FIFO 0 full
      B_0x1)
     with Size => 1;
   for FDCAN_IR_RF0F_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 0 message lost
   type FDCAN_IR_RF0L_Field is
     (--  No Rx FIFO 0 message lost
      B_0x0,
      --  Rx FIFO 0 message lost
      B_0x1)
     with Size => 1;
   for FDCAN_IR_RF0L_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 1 new message
   type FDCAN_IR_RF1N_Field is
     (--  No new message written to Rx FIFO 1
      B_0x0,
      --  New message written to Rx FIFO 1
      B_0x1)
     with Size => 1;
   for FDCAN_IR_RF1N_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 1 full
   type FDCAN_IR_RF1F_Field is
     (--  Rx FIFO 1 not full
      B_0x0,
      --  Rx FIFO 1 full
      B_0x1)
     with Size => 1;
   for FDCAN_IR_RF1F_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 1 message lost
   type FDCAN_IR_RF1L_Field is
     (--  No Rx FIFO 1 message lost
      B_0x0,
      --  Rx FIFO 1 message lost
      B_0x1)
     with Size => 1;
   for FDCAN_IR_RF1L_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  High-priority message
   type FDCAN_IR_HPM_Field is
     (--  No high-priority message received
      B_0x0,
      --  High-priority message received
      B_0x1)
     with Size => 1;
   for FDCAN_IR_HPM_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Transmission completed
   type FDCAN_IR_TC_Field is
     (--  No transmission completed
      B_0x0,
      --  Transmission completed
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Transmission cancellation finished
   type FDCAN_IR_TCF_Field is
     (--  No transmission cancellation finished
      B_0x0,
      --  Transmission cancellation finished
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TCF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx FIFO empty
   type FDCAN_IR_TFE_Field is
     (--  Tx FIFO non-empty
      B_0x0,
      --  Tx FIFO empty
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TFE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx event FIFO New Entry
   type FDCAN_IR_TEFN_Field is
     (--  Tx event FIFO unchanged
      B_0x0,
      --  Tx handler wrote Tx event FIFO element.
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TEFN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx event FIFO full
   type FDCAN_IR_TEFF_Field is
     (--  Tx event FIFO Not full
      B_0x0,
      --  Tx event FIFO full
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TEFF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx event FIFO element lost
   type FDCAN_IR_TEFL_Field is
     (--  No Tx event FIFO element lost
      B_0x0,
      --  Tx event FIFO element lost
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TEFL_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Timestamp wraparound
   type FDCAN_IR_TSW_Field is
     (--  No timestamp counter wrap-around
      B_0x0,
      --  Timestamp counter wrapped around
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TSW_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Message RAM access failure The flag is set when the Rx handler: has not
   --  completed acceptance filtering or storage of an accepted message until
   --  the arbitration field of the following message has been received. In
   --  this case acceptance filtering or message storage is aborted and the Rx
   --  handler starts processing of the following message. was unable to write
   --  a message to the message RAM. In this case message storage is aborted.
   --  In both cases the FIFO put index is not updated. The partly stored
   --  message is overwritten when the next message is stored to this location.
   --  The flag is also set when the Tx Handler was not able to read a message
   --  from the Message RAM in time. In this case message transmission is
   --  aborted. In case of a Tx Handler access failure the FDCAN is switched
   --  into Restricted operation Mode (see Restricted operation mode). To leave
   --  Restricted operation Mode, the Host CPU has to reset CCCR.ASM.
   type FDCAN_IR_MRAF_Field is
     (--  No Message RAM access failure occurred
      B_0x0,
      --  Message RAM access failure occurred
      B_0x1)
     with Size => 1;
   for FDCAN_IR_MRAF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Timeout occurred
   type FDCAN_IR_TOO_Field is
     (--  No timeout
      B_0x0,
      --  Timeout reached
      B_0x1)
     with Size => 1;
   for FDCAN_IR_TOO_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Error logging overflow
   type FDCAN_IR_ELO_Field is
     (--  CAN error logging counter did not overflow.
      B_0x0,
      --  Overflow of CAN error logging counter occurred.
      B_0x1)
     with Size => 1;
   for FDCAN_IR_ELO_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Error passive
   type FDCAN_IR_EP_Field is
     (--  Error_Passive status unchanged
      B_0x0,
      --  Error_Passive status changed
      B_0x1)
     with Size => 1;
   for FDCAN_IR_EP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Warning status
   type FDCAN_IR_EW_Field is
     (--  Error_Warning status unchanged
      B_0x0,
      --  Error_Warning status changed
      B_0x1)
     with Size => 1;
   for FDCAN_IR_EW_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Bus_Off status
   type FDCAN_IR_BO_Field is
     (--  Bus_Off status unchanged
      B_0x0,
      --  Bus_Off status changed
      B_0x1)
     with Size => 1;
   for FDCAN_IR_BO_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Watchdog interrupt
   type FDCAN_IR_WDI_Field is
     (--  No message RAM watchdog event occurred
      B_0x0,
      --  Message RAM watchdog event due to missing READY
      B_0x1)
     with Size => 1;
   for FDCAN_IR_WDI_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Protocol error in arbitration phase (nominal bit time is used)
   type FDCAN_IR_PEA_Field is
     (--  No protocol error in arbitration phase
      B_0x0,
      --  Protocol error in arbitration phase detected (PSR.LEC different from 0,7)
      B_0x1)
     with Size => 1;
   for FDCAN_IR_PEA_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Protocol error in data phase (data bit time is used)
   type FDCAN_IR_PED_Field is
     (--  No protocol error in data phase
      B_0x0,
      --  Protocol error in data phase detected (PSR.DLEC different from 0,7)
      B_0x1)
     with Size => 1;
   for FDCAN_IR_PED_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Access to reserved address
   type FDCAN_IR_ARA_Field is
     (--  No access to reserved address occurred
      B_0x0,
      --  Access to reserved address occurred
      B_0x1)
     with Size => 1;
   for FDCAN_IR_ARA_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN interrupt register
   type FDCAN_IR_Register is record
      --  Rx FIFO 0 new message
      RF0N           : FDCAN_IR_RF0N_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 0 full
      RF0F           : FDCAN_IR_RF0F_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 0 message lost
      RF0L           : FDCAN_IR_RF0L_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 1 new message
      RF1N           : FDCAN_IR_RF1N_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 1 full
      RF1F           : FDCAN_IR_RF1F_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 1 message lost
      RF1L           : FDCAN_IR_RF1L_Field := STM32_SVD.FDCAN.B_0x0;
      --  High-priority message
      HPM            : FDCAN_IR_HPM_Field := STM32_SVD.FDCAN.B_0x0;
      --  Transmission completed
      TC             : FDCAN_IR_TC_Field := STM32_SVD.FDCAN.B_0x0;
      --  Transmission cancellation finished
      TCF            : FDCAN_IR_TCF_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx FIFO empty
      TFE            : FDCAN_IR_TFE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx event FIFO New Entry
      TEFN           : FDCAN_IR_TEFN_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx event FIFO full
      TEFF           : FDCAN_IR_TEFF_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx event FIFO element lost
      TEFL           : FDCAN_IR_TEFL_Field := STM32_SVD.FDCAN.B_0x0;
      --  Timestamp wraparound
      TSW            : FDCAN_IR_TSW_Field := STM32_SVD.FDCAN.B_0x0;
      --  Message RAM access failure The flag is set when the Rx handler: has
      --  not completed acceptance filtering or storage of an accepted message
      --  until the arbitration field of the following message has been
      --  received. In this case acceptance filtering or message storage is
      --  aborted and the Rx handler starts processing of the following
      --  message. was unable to write a message to the message RAM. In this
      --  case message storage is aborted. In both cases the FIFO put index is
      --  not updated. The partly stored message is overwritten when the next
      --  message is stored to this location. The flag is also set when the Tx
      --  Handler was not able to read a message from the Message RAM in time.
      --  In this case message transmission is aborted. In case of a Tx Handler
      --  access failure the FDCAN is switched into Restricted operation Mode
      --  (see Restricted operation mode). To leave Restricted operation Mode,
      --  the Host CPU has to reset CCCR.ASM.
      MRAF           : FDCAN_IR_MRAF_Field := STM32_SVD.FDCAN.B_0x0;
      --  Timeout occurred
      TOO            : FDCAN_IR_TOO_Field := STM32_SVD.FDCAN.B_0x0;
      --  Error logging overflow
      ELO            : FDCAN_IR_ELO_Field := STM32_SVD.FDCAN.B_0x0;
      --  Error passive
      EP             : FDCAN_IR_EP_Field := STM32_SVD.FDCAN.B_0x0;
      --  Warning status
      EW             : FDCAN_IR_EW_Field := STM32_SVD.FDCAN.B_0x0;
      --  Bus_Off status
      BO             : FDCAN_IR_BO_Field := STM32_SVD.FDCAN.B_0x0;
      --  Watchdog interrupt
      WDI            : FDCAN_IR_WDI_Field := STM32_SVD.FDCAN.B_0x0;
      --  Protocol error in arbitration phase (nominal bit time is used)
      PEA            : FDCAN_IR_PEA_Field := STM32_SVD.FDCAN.B_0x0;
      --  Protocol error in data phase (data bit time is used)
      PED            : FDCAN_IR_PED_Field := STM32_SVD.FDCAN.B_0x0;
      --  Access to reserved address
      ARA            : FDCAN_IR_ARA_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_IR_Register use record
      RF0N           at 0 range 0 .. 0;
      RF0F           at 0 range 1 .. 1;
      RF0L           at 0 range 2 .. 2;
      RF1N           at 0 range 3 .. 3;
      RF1F           at 0 range 4 .. 4;
      RF1L           at 0 range 5 .. 5;
      HPM            at 0 range 6 .. 6;
      TC             at 0 range 7 .. 7;
      TCF            at 0 range 8 .. 8;
      TFE            at 0 range 9 .. 9;
      TEFN           at 0 range 10 .. 10;
      TEFF           at 0 range 11 .. 11;
      TEFL           at 0 range 12 .. 12;
      TSW            at 0 range 13 .. 13;
      MRAF           at 0 range 14 .. 14;
      TOO            at 0 range 15 .. 15;
      ELO            at 0 range 16 .. 16;
      EP             at 0 range 17 .. 17;
      EW             at 0 range 18 .. 18;
      BO             at 0 range 19 .. 19;
      WDI            at 0 range 20 .. 20;
      PEA            at 0 range 21 .. 21;
      PED            at 0 range 22 .. 22;
      ARA            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Rx FIFO 0 new message interrupt enable
   type FDCAN_IE_RF0NE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_RF0NE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 0 full interrupt enable
   type FDCAN_IE_RF0FE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_RF0FE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 0 message lost interrupt enable
   type FDCAN_IE_RF0LE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_RF0LE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 1 new message interrupt enable
   type FDCAN_IE_RF1NE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_RF1NE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 1 full interrupt enable
   type FDCAN_IE_RF1FE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_RF1FE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 1 message lost interrupt enable
   type FDCAN_IE_RF1LE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_RF1LE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  High-priority message interrupt enable
   type FDCAN_IE_HPME_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_HPME_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Transmission completed interrupt enable
   type FDCAN_IE_TCE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TCE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Transmission cancellation finished interrupt enable
   type FDCAN_IE_TCFE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TCFE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx FIFO empty interrupt enable
   type FDCAN_IE_TFEE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TFEE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx event FIFO new entry interrupt enable
   type FDCAN_IE_TEFNE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TEFNE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx event FIFO full interrupt enable
   type FDCAN_IE_TEFFE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TEFFE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Tx event FIFO element lost interrupt enable
   type FDCAN_IE_TEFLE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TEFLE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Timestamp wraparound interrupt enable
   type FDCAN_IE_TSWE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TSWE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Message RAM access failure interrupt enable
   type FDCAN_IE_MRAFE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_MRAFE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Timeout occurred interrupt enable
   type FDCAN_IE_TOOE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_TOOE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Error logging overflow interrupt enable
   type FDCAN_IE_ELOE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_ELOE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Error passive interrupt enable
   type FDCAN_IE_EPE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_EPE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Warning status interrupt enable
   type FDCAN_IE_EWE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_EWE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Bus_Off status
   type FDCAN_IE_BOE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_BOE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Watchdog interrupt enable
   type FDCAN_IE_WDIE_Field is
     (--  Interrupt disabled
      B_0x0,
      --  Interrupt enabled
      B_0x1)
     with Size => 1;
   for FDCAN_IE_WDIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype FDCAN_IE_PEAE_Field is Boolean;
   subtype FDCAN_IE_PEDE_Field is Boolean;
   subtype FDCAN_IE_ARAE_Field is Boolean;

   --  FDCAN interrupt enable register
   type FDCAN_IE_Register is record
      --  Rx FIFO 0 new message interrupt enable
      RF0NE          : FDCAN_IE_RF0NE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 0 full interrupt enable
      RF0FE          : FDCAN_IE_RF0FE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 0 message lost interrupt enable
      RF0LE          : FDCAN_IE_RF0LE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 1 new message interrupt enable
      RF1NE          : FDCAN_IE_RF1NE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 1 full interrupt enable
      RF1FE          : FDCAN_IE_RF1FE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Rx FIFO 1 message lost interrupt enable
      RF1LE          : FDCAN_IE_RF1LE_Field := STM32_SVD.FDCAN.B_0x0;
      --  High-priority message interrupt enable
      HPME           : FDCAN_IE_HPME_Field := STM32_SVD.FDCAN.B_0x0;
      --  Transmission completed interrupt enable
      TCE            : FDCAN_IE_TCE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Transmission cancellation finished interrupt enable
      TCFE           : FDCAN_IE_TCFE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx FIFO empty interrupt enable
      TFEE           : FDCAN_IE_TFEE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx event FIFO new entry interrupt enable
      TEFNE          : FDCAN_IE_TEFNE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx event FIFO full interrupt enable
      TEFFE          : FDCAN_IE_TEFFE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Tx event FIFO element lost interrupt enable
      TEFLE          : FDCAN_IE_TEFLE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Timestamp wraparound interrupt enable
      TSWE           : FDCAN_IE_TSWE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Message RAM access failure interrupt enable
      MRAFE          : FDCAN_IE_MRAFE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Timeout occurred interrupt enable
      TOOE           : FDCAN_IE_TOOE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Error logging overflow interrupt enable
      ELOE           : FDCAN_IE_ELOE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Error passive interrupt enable
      EPE            : FDCAN_IE_EPE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Warning status interrupt enable
      EWE            : FDCAN_IE_EWE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Bus_Off status
      BOE            : FDCAN_IE_BOE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Watchdog interrupt enable
      WDIE           : FDCAN_IE_WDIE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Protocol error in arbitration phase enable
      PEAE           : FDCAN_IE_PEAE_Field := False;
      --  Protocol error in data phase enable
      PEDE           : FDCAN_IE_PEDE_Field := False;
      --  Access to reserved address enable
      ARAE           : FDCAN_IE_ARAE_Field := False;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_IE_Register use record
      RF0NE          at 0 range 0 .. 0;
      RF0FE          at 0 range 1 .. 1;
      RF0LE          at 0 range 2 .. 2;
      RF1NE          at 0 range 3 .. 3;
      RF1FE          at 0 range 4 .. 4;
      RF1LE          at 0 range 5 .. 5;
      HPME           at 0 range 6 .. 6;
      TCE            at 0 range 7 .. 7;
      TCFE           at 0 range 8 .. 8;
      TFEE           at 0 range 9 .. 9;
      TEFNE          at 0 range 10 .. 10;
      TEFFE          at 0 range 11 .. 11;
      TEFLE          at 0 range 12 .. 12;
      TSWE           at 0 range 13 .. 13;
      MRAFE          at 0 range 14 .. 14;
      TOOE           at 0 range 15 .. 15;
      ELOE           at 0 range 16 .. 16;
      EPE            at 0 range 17 .. 17;
      EWE            at 0 range 18 .. 18;
      BOE            at 0 range 19 .. 19;
      WDIE           at 0 range 20 .. 20;
      PEAE           at 0 range 21 .. 21;
      PEDE           at 0 range 22 .. 22;
      ARAE           at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  FDCAN_ILS_RXFIFO array element
   subtype FDCAN_ILS_RXFIFO_Element is Boolean;

   --  FDCAN_ILS_RXFIFO array
   type FDCAN_ILS_RXFIFO_Field_Array is array (0 .. 1)
     of FDCAN_ILS_RXFIFO_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for FDCAN_ILS_RXFIFO
   type FDCAN_ILS_RXFIFO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RXFIFO as a value
            Val : HAL.UInt2;
         when True =>
            --  RXFIFO as an array
            Arr : FDCAN_ILS_RXFIFO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for FDCAN_ILS_RXFIFO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype FDCAN_ILS_SMSG_Field is Boolean;
   subtype FDCAN_ILS_TFERR_Field is Boolean;
   subtype FDCAN_ILS_MISC_Field is Boolean;
   subtype FDCAN_ILS_BERR_Field is Boolean;
   subtype FDCAN_ILS_PERR_Field is Boolean;

   --  FDCAN interrupt line select register
   type FDCAN_ILS_Register is record
      --  RX FIFO bit grouping the following interruption RF0LL: Rx FIFO 0
      --  message lost interrupt line RF0FL: Rx FIFO 0 full interrupt line
      --  RF0NL: Rx FIFO 0 new message interrupt line
      RXFIFO        : FDCAN_ILS_RXFIFO_Field :=
                       (As_Array => False, Val => 16#0#);
      --  Status message bit grouping the following interruption TCFL:
      --  Transmission cancellation finished interrupt line TCL: Transmission
      --  completed interrupt line HPML: High-priority message interrupt line
      SMSG          : FDCAN_ILS_SMSG_Field := False;
      --  Tx FIFO ERROR grouping the following interruption TEFLL: Tx event
      --  FIFO element lost interrupt line TEFFL: Tx event FIFO full interrupt
      --  line TEFNL: Tx event FIFO new entry interrupt line TFEL: Tx FIFO
      --  empty interrupt line
      TFERR         : FDCAN_ILS_TFERR_Field := False;
      --  Interrupt regrouping the following interruption TOOL: Timeout
      --  occurred interrupt line MRAFL: Message RAM access failure interrupt
      --  line TSWL: Timestamp wraparound interrupt line
      MISC          : FDCAN_ILS_MISC_Field := False;
      --  Bit and line error grouping the following interruption EPL Error
      --  passive interrupt line ELOL: Error logging overflow interrupt line
      BERR          : FDCAN_ILS_BERR_Field := False;
      --  Protocol error grouping the following interruption ARAL: Access to
      --  reserved address line PEDL: Protocol error in data phase line PEAL:
      --  Protocol error in arbitration phase line WDIL: Watchdog interrupt
      --  line BOL: Bus_Off status EWL: Warning status interrupt line
      PERR          : FDCAN_ILS_PERR_Field := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_ILS_Register use record
      RXFIFO        at 0 range 0 .. 1;
      SMSG          at 0 range 2 .. 2;
      TFERR         at 0 range 3 .. 3;
      MISC          at 0 range 4 .. 4;
      BERR          at 0 range 5 .. 5;
      PERR          at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Enable interrupt line 0
   type FDCAN_ILE_EINT0_Field is
     (--  Interrupt line fdcan_intr1_it disabled
      B_0x0,
      --  Interrupt line fdcan_intr1_it enabled
      B_0x1)
     with Size => 1;
   for FDCAN_ILE_EINT0_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Enable interrupt line 1
   type FDCAN_ILE_EINT1_Field is
     (--  Interrupt line fdcan_intr0_it disabled
      B_0x0,
      --  Interrupt line fdcan_intr0_it enabled
      B_0x1)
     with Size => 1;
   for FDCAN_ILE_EINT1_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN interrupt line enable register
   type FDCAN_ILE_Register is record
      --  Enable interrupt line 0
      EINT0         : FDCAN_ILE_EINT0_Field := STM32_SVD.FDCAN.B_0x0;
      --  Enable interrupt line 1
      EINT1         : FDCAN_ILE_EINT1_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_ILE_Register use record
      EINT0         at 0 range 0 .. 0;
      EINT1         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Reject remote frames extended These are protected write (P) bits, which
   --  means that write access by the bits is possible only when the bit 1
   --  [CCE] and bit 0 [INIT] of CCCR register are set to 1.
   type FDCAN_RXGFC_RRFE_Field is
     (--  Filter remote frames with 29-bit standard IDs
      B_0x0,
      --  Reject all remote frames with 29-bit standard IDs
      B_0x1)
     with Size => 1;
   for FDCAN_RXGFC_RRFE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Reject remote frames standard These are protected write (P) bits, which
   --  means that write access by the bits is possible only when the bit 1
   --  [CCE] and bit 0 [INIT] of CCCR register are set to 1.
   type FDCAN_RXGFC_RRFS_Field is
     (--  Filter remote frames with 11-bit standard IDs
      B_0x0,
      --  Reject all remote frames with 11-bit standard IDs
      B_0x1)
     with Size => 1;
   for FDCAN_RXGFC_RRFS_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Accept non-matching frames extended Defines how received messages with
   --  29-bit IDs that do not match any element of the filter list are treated.
   --  These are protected write (P) bits, which means that write access by the
   --  bits is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
   --  register are set to 1.
   type FDCAN_RXGFC_ANFE_Field is
     (--  Accept in Rx FIFO 0
      B_0x0,
      --  Accept in Rx FIFO 1
      B_0x1,
      --  Reject
      B_0x2,
      --  Reject
      B_0x3)
     with Size => 2;
   for FDCAN_RXGFC_ANFE_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Accept Non-matching frames standard Defines how received messages with
   --  11-bit IDs that do not match any element of the filter list are treated.
   --  These are protected write (P) bits, which means that write access by the
   --  bits is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
   --  register are set to 1.
   type FDCAN_RXGFC_ANFS_Field is
     (--  Accept in Rx FIFO 0
      B_0x0,
      --  Accept in Rx FIFO 1
      B_0x1,
      --  Reject
      B_0x2,
      --  Reject
      B_0x3)
     with Size => 2;
   for FDCAN_RXGFC_ANFS_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype FDCAN_RXGFC_F1OM_Field is Boolean;
   subtype FDCAN_RXGFC_F0OM_Field is Boolean;

   --  List size standard 1 to 28: Number of standard message ID filter
   --  elements >28: Values greater than 28 are interpreted as 28. These are
   --  protected write (P) bits, which means that write access by the bits is
   --  possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR register are
   --  set to 1.
   type FDCAN_RXGFC_LSS_Field is
     (--  No standard message ID filter
      B_0x0)
     with Size => 5;
   for FDCAN_RXGFC_LSS_Field use
     (B_0x0 => 0);

   --  List size extended 1 to 8: Number of extended message ID filter elements
   --  >8: Values greater than 8 are interpreted as 8. These are protected
   --  write (P) bits, which means that write access by the bits is possible
   --  only when the bit 1 [CCE] and bit 0 [INIT] of CCCR register are set to
   --  1.
   type FDCAN_RXGFC_LSE_Field is
     (--  No extended message ID filter
      B_0x0)
     with Size => 4;
   for FDCAN_RXGFC_LSE_Field use
     (B_0x0 => 0);

   --  FDCAN global filter configuration register
   type FDCAN_RXGFC_Register is record
      --  Reject remote frames extended These are protected write (P) bits,
      --  which means that write access by the bits is possible only when the
      --  bit 1 [CCE] and bit 0 [INIT] of CCCR register are set to 1.
      RRFE           : FDCAN_RXGFC_RRFE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Reject remote frames standard These are protected write (P) bits,
      --  which means that write access by the bits is possible only when the
      --  bit 1 [CCE] and bit 0 [INIT] of CCCR register are set to 1.
      RRFS           : FDCAN_RXGFC_RRFS_Field := STM32_SVD.FDCAN.B_0x0;
      --  Accept non-matching frames extended Defines how received messages
      --  with 29-bit IDs that do not match any element of the filter list are
      --  treated. These are protected write (P) bits, which means that write
      --  access by the bits is possible only when the bit 1 [CCE] and bit 0
      --  [INIT] of CCCR register are set to 1.
      ANFE           : FDCAN_RXGFC_ANFE_Field := STM32_SVD.FDCAN.B_0x0;
      --  Accept Non-matching frames standard Defines how received messages
      --  with 11-bit IDs that do not match any element of the filter list are
      --  treated. These are protected write (P) bits, which means that write
      --  access by the bits is possible only when the bit 1 [CCE] and bit 0
      --  [INIT] of CCCR register are set to 1.
      ANFS           : FDCAN_RXGFC_ANFS_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  FIFO 1 operation mode (overwrite or blocking) This is a protected
      --  write (P) bits, which means that write access by the bits is possible
      --  only when the bit 1 [CCE] and bit 0 [INIT] of CCCR register are set
      --  to 1.
      F1OM           : FDCAN_RXGFC_F1OM_Field := False;
      --  FIFO 0 operation mode (overwrite or blocking) This is protected write
      --  (P) bits, which means that write access by the bits is possible only
      --  when the bit 1 [CCE] and bit 0 [INIT] of CCCR register are set to 1.
      F0OM           : FDCAN_RXGFC_F0OM_Field := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  List size standard 1 to 28: Number of standard message ID filter
      --  elements >28: Values greater than 28 are interpreted as 28. These are
      --  protected write (P) bits, which means that write access by the bits
      --  is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
      --  register are set to 1.
      LSS            : FDCAN_RXGFC_LSS_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  List size extended 1 to 8: Number of extended message ID filter
      --  elements >8: Values greater than 8 are interpreted as 8. These are
      --  protected write (P) bits, which means that write access by the bits
      --  is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
      --  register are set to 1.
      LSE            : FDCAN_RXGFC_LSE_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_RXGFC_Register use record
      RRFE           at 0 range 0 .. 0;
      RRFS           at 0 range 1 .. 1;
      ANFE           at 0 range 2 .. 3;
      ANFS           at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      F1OM           at 0 range 8 .. 8;
      F0OM           at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      LSS            at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      LSE            at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype FDCAN_XIDAM_EIDM_Field is HAL.UInt29;

   --  FDCAN extended ID and mask register
   type FDCAN_XIDAM_Register is record
      --  Extended ID mask For acceptance filtering of extended frames the
      --  Extended ID AND Mask is AND-ed with the Message ID of a received
      --  frame. Intended for masking of 29-bit IDs in SAE J1939. With the
      --  reset value of all bits set to 1 the mask is not active. These are
      --  protected write (P) bits, which means that write access by the bits
      --  is possible only when the bit 1 [CCE] and bit 0 [INIT] of CCCR
      --  register are set to 1.
      EIDM           : FDCAN_XIDAM_EIDM_Field := 16#1FFFFFFF#;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_XIDAM_Register use record
      EIDM           at 0 range 0 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype FDCAN_HPMS_BIDX_Field is HAL.UInt3;

   --  Message storage indicator
   type FDCAN_HPMS_MSI_Field is
     (--  No FIFO selected
      B_0x0,
      --  FIFO overrun
      B_0x1,
      --  Message stored in FIFO 0
      B_0x2,
      --  Message stored in FIFO 1
      B_0x3)
     with Size => 2;
   for FDCAN_HPMS_MSI_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype FDCAN_HPMS_FIDX_Field is HAL.UInt5;

   --  Filter list Indicates the filter list of the matching filter element.
   type FDCAN_HPMS_FLST_Field is
     (--  Standard filter list
      B_0x0,
      --  Extended filter list
      B_0x1)
     with Size => 1;
   for FDCAN_HPMS_FLST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN high-priority message status register
   type FDCAN_HPMS_Register is record
      --  Read-only. Buffer index Index of Rx FIFO element to which the message
      --  was stored. Only valid when MSI[1] = 1.
      BIDX           : FDCAN_HPMS_BIDX_Field;
      --  unspecified
      Reserved_3_5   : HAL.UInt3;
      --  Read-only. Message storage indicator
      MSI            : FDCAN_HPMS_MSI_Field;
      --  Read-only. Filter index Index of matching filter element. Range is 0
      --  to RXGFC[LSS] - 1 or RXGFC[LSE] - 1.
      FIDX           : FDCAN_HPMS_FIDX_Field;
      --  unspecified
      Reserved_13_14 : HAL.UInt2;
      --  Read-only. Filter list Indicates the filter list of the matching
      --  filter element.
      FLST           : FDCAN_HPMS_FLST_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_HPMS_Register use record
      BIDX           at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      MSI            at 0 range 6 .. 7;
      FIDX           at 0 range 8 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      FLST           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype FDCAN_RXF0S_F0FL_Field is HAL.UInt4;
   subtype FDCAN_RXF0S_F0GI_Field is HAL.UInt2;
   subtype FDCAN_RXF0S_F0PI_Field is HAL.UInt2;

   --  Rx FIFO 0 full
   type FDCAN_RXF0S_F0F_Field is
     (--  Rx FIFO 0 not full
      B_0x0,
      --  Rx FIFO 0 full
      B_0x1)
     with Size => 1;
   for FDCAN_RXF0S_F0F_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 0 message lost This bit is a copy of interrupt flag IR[RF0L].
   --  When IR[RF0L] is reset, this bit is also reset.
   type FDCAN_RXF0S_RF0L_Field is
     (--  No Rx FIFO 0 message lost
      B_0x0,
      --  Rx FIFO 0 message lost, also set after write attempt to Rx FIFO 0 of size 0
      B_0x1)
     with Size => 1;
   for FDCAN_RXF0S_RF0L_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Rx FIFO 0 status register
   type FDCAN_RXF0S_Register is record
      --  Read-only. Rx FIFO 0 fill level Number of elements stored in Rx FIFO
      --  0, range 0 to 3.
      F0FL           : FDCAN_RXF0S_F0FL_Field;
      --  unspecified
      Reserved_4_7   : HAL.UInt4;
      --  Read-only. Rx FIFO 0 get index Rx FIFO 0 read index pointer, range 0
      --  to 2.
      F0GI           : FDCAN_RXF0S_F0GI_Field;
      --  unspecified
      Reserved_10_15 : HAL.UInt6;
      --  Read-only. Rx FIFO 0 put index Rx FIFO 0 write index pointer, range 0
      --  to 2.
      F0PI           : FDCAN_RXF0S_F0PI_Field;
      --  unspecified
      Reserved_18_23 : HAL.UInt6;
      --  Read-only. Rx FIFO 0 full
      F0F            : FDCAN_RXF0S_F0F_Field;
      --  Read-only. Rx FIFO 0 message lost This bit is a copy of interrupt
      --  flag IR[RF0L]. When IR[RF0L] is reset, this bit is also reset.
      RF0L           : FDCAN_RXF0S_RF0L_Field;
      --  unspecified
      Reserved_26_31 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_RXF0S_Register use record
      F0FL           at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      F0GI           at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      F0PI           at 0 range 16 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      F0F            at 0 range 24 .. 24;
      RF0L           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype FDCAN_RXF0A_F0AI_Field is HAL.UInt3;

   --  CAN Rx FIFO 0 acknowledge register
   type FDCAN_RXF0A_Register is record
      --  Rx FIFO 0 acknowledge index After the Host has read a message or a
      --  sequence of messages from Rx FIFO 0 it has to write the buffer index
      --  of the last element read from Rx FIFO 0 to F0AI. This sets the Rx
      --  FIFO 0 get index RXF0S[F0GI] to F0AI + 1 and update the FIFO 0 fill
      --  level RXF0S[F0FL].
      F0AI          : FDCAN_RXF0A_F0AI_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_RXF0A_Register use record
      F0AI          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype FDCAN_RXF1S_F1FL_Field is HAL.UInt4;
   subtype FDCAN_RXF1S_F1GI_Field is HAL.UInt2;
   subtype FDCAN_RXF1S_F1PI_Field is HAL.UInt2;

   --  Rx FIFO 1 full
   type FDCAN_RXF1S_F1F_Field is
     (--  Rx FIFO 1 not full
      B_0x0,
      --  Rx FIFO 1 full
      B_0x1)
     with Size => 1;
   for FDCAN_RXF1S_F1F_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Rx FIFO 1 message lost This bit is a copy of interrupt flag IR[RF1L].
   --  When IR[RF1L] is reset, this bit is also reset.
   type FDCAN_RXF1S_RF1L_Field is
     (--  No Rx FIFO 1 message lost
      B_0x0,
      --  Rx FIFO 1 message lost, also set after write attempt to Rx FIFO 1 of size 0
      B_0x1)
     with Size => 1;
   for FDCAN_RXF1S_RF1L_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Rx FIFO 1 status register
   type FDCAN_RXF1S_Register is record
      --  Read-only. Rx FIFO 1 fill level Number of elements stored in Rx FIFO
      --  1, range 0 to 3.
      F1FL           : FDCAN_RXF1S_F1FL_Field;
      --  unspecified
      Reserved_4_7   : HAL.UInt4;
      --  Read-only. Rx FIFO 1 get index Rx FIFO 1 read index pointer, range 0
      --  to 2.
      F1GI           : FDCAN_RXF1S_F1GI_Field;
      --  unspecified
      Reserved_10_15 : HAL.UInt6;
      --  Read-only. Rx FIFO 1 put index Rx FIFO 1 write index pointer, range 0
      --  to 2.
      F1PI           : FDCAN_RXF1S_F1PI_Field;
      --  unspecified
      Reserved_18_23 : HAL.UInt6;
      --  Read-only. Rx FIFO 1 full
      F1F            : FDCAN_RXF1S_F1F_Field;
      --  Read-only. Rx FIFO 1 message lost This bit is a copy of interrupt
      --  flag IR[RF1L]. When IR[RF1L] is reset, this bit is also reset.
      RF1L           : FDCAN_RXF1S_RF1L_Field;
      --  unspecified
      Reserved_26_31 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_RXF1S_Register use record
      F1FL           at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      F1GI           at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      F1PI           at 0 range 16 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      F1F            at 0 range 24 .. 24;
      RF1L           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype FDCAN_RXF1A_F1AI_Field is HAL.UInt3;

   --  FDCAN Rx FIFO 1 acknowledge register
   type FDCAN_RXF1A_Register is record
      --  Rx FIFO 1 acknowledge index After the Host has read a message or a
      --  sequence of messages from Rx FIFO 1 it has to write the buffer index
      --  of the last element read from Rx FIFO 1 to F1AI. This sets the Rx
      --  FIFO 1 get index RXF1S[F1GI] to F1AI + 1 and update the FIFO 1 Fill
      --  Level RXF1S[F1FL].
      F1AI          : FDCAN_RXF1A_F1AI_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_RXF1A_Register use record
      F1AI          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Tx FIFO/queue mode This is a protected write (P) bit, which means that
   --  write access by the bits is possible only when the bit 1 [CCE] and bit 0
   --  [INIT] of CCCR register are set to 1.
   type FDCAN_TXBC_TFQM_Field is
     (--  Tx FIFO operation
      B_0x0,
      --  Tx queue operation.
      B_0x1)
     with Size => 1;
   for FDCAN_TXBC_TFQM_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer configuration register
   type FDCAN_TXBC_Register is record
      --  unspecified
      Reserved_0_23  : HAL.UInt24 := 16#0#;
      --  Tx FIFO/queue mode This is a protected write (P) bit, which means
      --  that write access by the bits is possible only when the bit 1 [CCE]
      --  and bit 0 [INIT] of CCCR register are set to 1.
      TFQM           : FDCAN_TXBC_TFQM_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBC_Register use record
      Reserved_0_23  at 0 range 0 .. 23;
      TFQM           at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype FDCAN_TXFQS_TFFL_Field is HAL.UInt3;
   subtype FDCAN_TXFQS_TFGI_Field is HAL.UInt2;
   subtype FDCAN_TXFQS_TFQPI_Field is HAL.UInt2;

   --  Tx FIFO/queue full
   type FDCAN_TXFQS_TFQF_Field is
     (--  Tx FIFO/queue not full
      B_0x0,
      --  Tx FIFO/queue full
      B_0x1)
     with Size => 1;
   for FDCAN_TXFQS_TFQF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx FIFO/queue status register
   type FDCAN_TXFQS_Register is record
      --  Read-only. Tx FIFO free level Number of consecutive free Tx FIFO
      --  elements starting from TFGI, range 0 to 3. Read as 0 when Tx queue
      --  operation is configured (TXBC[TFQM] = 1).
      TFFL           : FDCAN_TXFQS_TFFL_Field;
      --  unspecified
      Reserved_3_7   : HAL.UInt5;
      --  Read-only. Tx FIFO get index Tx FIFO read index pointer, range 0 to
      --  3. Read as 0 when Tx queue operation is configured (TXBC.TFQM = 1)
      TFGI           : FDCAN_TXFQS_TFGI_Field;
      --  unspecified
      Reserved_10_15 : HAL.UInt6;
      --  Read-only. Tx FIFO/queue put index Tx FIFO/queue write index pointer,
      --  range 0 to 3
      TFQPI          : FDCAN_TXFQS_TFQPI_Field;
      --  unspecified
      Reserved_18_20 : HAL.UInt3;
      --  Read-only. Tx FIFO/queue full
      TFQF           : FDCAN_TXFQS_TFQF_Field;
      --  unspecified
      Reserved_22_31 : HAL.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXFQS_Register use record
      TFFL           at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      TFGI           at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      TFQPI          at 0 range 16 .. 17;
      Reserved_18_20 at 0 range 18 .. 20;
      TFQF           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  Transmission request pending Each Tx buffer has its own transmission
   --  request pending bit. The bits are set via register TXBAR. The bits are
   --  reset after a requested transmission has completed or has been canceled
   --  via register TXBCR. After a TXBRP bit has been set, a Tx scan is started
   --  to check for the pending Tx request with the highest priority (Tx buffer
   --  with lowest Message ID). A cancellation request resets the corresponding
   --  transmission request pending bit of register TXBRP. In case a
   --  transmission has already been started when a cancellation is requested,
   --  this is done at the end of the transmission, regardless whether the
   --  transmission was successful or not. The cancellation request bits are
   --  reset directly after the corresponding TXBRP bit has been reset. After a
   --  cancellation has been requested, a finished cancellation is signaled via
   --  TXBCF after successful transmission together with the corresponding
   --  TXBTO bit when the transmission has not yet been started at the point of
   --  cancellation when the transmission has been aborted due to lost
   --  arbitration when an error occurred during frame transmission In DAR mode
   --  all transmissions are automatically canceled if they are not successful.
   --  The corresponding TXBCF bit is set for all unsuccessful transmissions.
   type FDCAN_TXBRP_TRP_Field is
     (--  No transmission request pending
      B_0x0,
      --  Transmission request pending
      B_0x1)
     with Size => 3;
   for FDCAN_TXBRP_TRP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer request pending register
   type FDCAN_TXBRP_Register is record
      --  Read-only. Transmission request pending Each Tx buffer has its own
      --  transmission request pending bit. The bits are set via register
      --  TXBAR. The bits are reset after a requested transmission has
      --  completed or has been canceled via register TXBCR. After a TXBRP bit
      --  has been set, a Tx scan is started to check for the pending Tx
      --  request with the highest priority (Tx buffer with lowest Message ID).
      --  A cancellation request resets the corresponding transmission request
      --  pending bit of register TXBRP. In case a transmission has already
      --  been started when a cancellation is requested, this is done at the
      --  end of the transmission, regardless whether the transmission was
      --  successful or not. The cancellation request bits are reset directly
      --  after the corresponding TXBRP bit has been reset. After a
      --  cancellation has been requested, a finished cancellation is signaled
      --  via TXBCF after successful transmission together with the
      --  corresponding TXBTO bit when the transmission has not yet been
      --  started at the point of cancellation when the transmission has been
      --  aborted due to lost arbitration when an error occurred during frame
      --  transmission In DAR mode all transmissions are automatically canceled
      --  if they are not successful. The corresponding TXBCF bit is set for
      --  all unsuccessful transmissions.
      TRP           : FDCAN_TXBRP_TRP_Field;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBRP_Register use record
      TRP           at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Add request Each Tx buffer has its own add request bit. Writing a 1 sets
   --  the corresponding add request bit; writing a 0 has no impact. This
   --  enables the Host to set transmission requests for multiple Tx buffers
   --  with one write to TXBAR. When no Tx scan is running, the bits are reset
   --  immediately, else the bits remain set until the Tx scan process has
   --  completed.
   type FDCAN_TXBAR_AR_Field is
     (--  No transmission request added
      B_0x0,
      --  Transmission requested added.
      B_0x1)
     with Size => 3;
   for FDCAN_TXBAR_AR_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer add request register
   type FDCAN_TXBAR_Register is record
      --  Add request Each Tx buffer has its own add request bit. Writing a 1
      --  sets the corresponding add request bit; writing a 0 has no impact.
      --  This enables the Host to set transmission requests for multiple Tx
      --  buffers with one write to TXBAR. When no Tx scan is running, the bits
      --  are reset immediately, else the bits remain set until the Tx scan
      --  process has completed.
      AR            : FDCAN_TXBAR_AR_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBAR_Register use record
      AR            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Cancellation request Each Tx buffer has its own cancellation request
   --  bit. Writing a 1 sets the corresponding CR bit; writing a 0 has no
   --  impact. This enables the Host to set cancellation requests for multiple
   --  Tx buffers with one write to TXBCR. The bits remain set until the
   --  corresponding TXBRP bit is reset.
   type FDCAN_TXBCR_CR_Field is
     (--  No cancellation pending
      B_0x0,
      --  Cancellation pending
      B_0x1)
     with Size => 3;
   for FDCAN_TXBCR_CR_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer cancellation request register
   type FDCAN_TXBCR_Register is record
      --  Cancellation request Each Tx buffer has its own cancellation request
      --  bit. Writing a 1 sets the corresponding CR bit; writing a 0 has no
      --  impact. This enables the Host to set cancellation requests for
      --  multiple Tx buffers with one write to TXBCR. The bits remain set
      --  until the corresponding TXBRP bit is reset.
      CR            : FDCAN_TXBCR_CR_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBCR_Register use record
      CR            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Transmission occurred. Each Tx buffer has its own TO bit. The bits are
   --  set when the corresponding TXBRP bit is cleared after a successful
   --  transmission. The bits are reset when a new transmission is requested by
   --  writing a 1 to the corresponding bit of register TXBAR.
   type FDCAN_TXBTO_TO_Field is
     (--  No transmission occurred
      B_0x0,
      --  Transmission occurred
      B_0x1)
     with Size => 3;
   for FDCAN_TXBTO_TO_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer transmission occurred register
   type FDCAN_TXBTO_Register is record
      --  Read-only. Transmission occurred. Each Tx buffer has its own TO bit.
      --  The bits are set when the corresponding TXBRP bit is cleared after a
      --  successful transmission. The bits are reset when a new transmission
      --  is requested by writing a 1 to the corresponding bit of register
      --  TXBAR.
      TO            : FDCAN_TXBTO_TO_Field;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBTO_Register use record
      TO            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Cancellation finished Each Tx buffer has its own CF bit. The bits are
   --  set when the corresponding TXBRP bit is cleared after a cancellation was
   --  requested via TXBCR. In case the corresponding TXBRP bit was not set at
   --  the point of cancellation, CF is set immediately. The bits are reset
   --  when a new transmission is requested by writing a 1 to the corresponding
   --  bit of register TXBAR.
   type FDCAN_TXBCF_CF_Field is
     (--  No transmit buffer cancellation
      B_0x0,
      --  Transmit buffer cancellation finished
      B_0x1)
     with Size => 3;
   for FDCAN_TXBCF_CF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer cancellation finished register
   type FDCAN_TXBCF_Register is record
      --  Read-only. Cancellation finished Each Tx buffer has its own CF bit.
      --  The bits are set when the corresponding TXBRP bit is cleared after a
      --  cancellation was requested via TXBCR. In case the corresponding TXBRP
      --  bit was not set at the point of cancellation, CF is set immediately.
      --  The bits are reset when a new transmission is requested by writing a
      --  1 to the corresponding bit of register TXBAR.
      CF            : FDCAN_TXBCF_CF_Field;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBCF_Register use record
      CF            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Transmission interrupt enable Each Tx buffer has its own TIE bit.
   type FDCAN_TXBTIE_TIE_Field is
     (--  Transmission interrupt disabled
      B_0x0,
      --  Transmission interrupt enable
      B_0x1)
     with Size => 3;
   for FDCAN_TXBTIE_TIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer transmission interrupt enable register
   type FDCAN_TXBTIE_Register is record
      --  Transmission interrupt enable Each Tx buffer has its own TIE bit.
      TIE           : FDCAN_TXBTIE_TIE_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBTIE_Register use record
      TIE           at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Cancellation finished interrupt enable. Each Tx buffer has its own CFIE
   --  bit.
   type FDCAN_TXBCIE_CFIE_Field is
     (--  Cancellation finished interrupt disabled
      B_0x0,
      --  Cancellation finished interrupt enabled
      B_0x1)
     with Size => 3;
   for FDCAN_TXBCIE_CFIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN Tx buffer cancellation finished interrupt enable register
   type FDCAN_TXBCIE_Register is record
      --  Cancellation finished interrupt enable. Each Tx buffer has its own
      --  CFIE bit.
      CFIE          : FDCAN_TXBCIE_CFIE_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXBCIE_Register use record
      CFIE          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype FDCAN_TXEFS_EFFL_Field is HAL.UInt3;
   subtype FDCAN_TXEFS_EFGI_Field is HAL.UInt2;
   subtype FDCAN_TXEFS_EFPI_Field is HAL.UInt2;

   --  Event FIFO full
   type FDCAN_TXEFS_EFF_Field is
     (--  Tx event FIFO not full
      B_0x0,
      --  Tx event FIFO full
      B_0x1)
     with Size => 1;
   for FDCAN_TXEFS_EFF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype FDCAN_TXEFS_TEFL_Field is Boolean;

   --  FDCAN Tx event FIFO status register
   type FDCAN_TXEFS_Register is record
      --  Read-only. Event FIFO fill level Number of elements stored in Tx
      --  event FIFO, range 0 to 3.
      EFFL           : FDCAN_TXEFS_EFFL_Field;
      --  unspecified
      Reserved_3_7   : HAL.UInt5;
      --  Read-only. Event FIFO get index Tx event FIFO read index pointer,
      --  range 0 to 3.
      EFGI           : FDCAN_TXEFS_EFGI_Field;
      --  unspecified
      Reserved_10_15 : HAL.UInt6;
      --  Read-only. Event FIFO put index Tx event FIFO write index pointer,
      --  range 0 to 3.
      EFPI           : FDCAN_TXEFS_EFPI_Field;
      --  unspecified
      Reserved_18_23 : HAL.UInt6;
      --  Read-only. Event FIFO full
      EFF            : FDCAN_TXEFS_EFF_Field;
      --  Read-only. Tx event FIFO element lost This bit is a copy of interrupt
      --  flag IR[TEFL]. When IR[TEFL] is reset, this bit is also reset. 0 No
      --  Tx event FIFO element lost 1 Tx event FIFO element lost, also set
      --  after write attempt to Tx event FIFO of size 0.
      TEFL           : FDCAN_TXEFS_TEFL_Field;
      --  unspecified
      Reserved_26_31 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXEFS_Register use record
      EFFL           at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      EFGI           at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      EFPI           at 0 range 16 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      EFF            at 0 range 24 .. 24;
      TEFL           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype FDCAN_TXEFA_EFAI_Field is HAL.UInt2;

   --  FDCAN Tx event FIFO acknowledge register
   type FDCAN_TXEFA_Register is record
      --  Event FIFO acknowledge index After the Host has read an element or a
      --  sequence of elements from the Tx event FIFO, it has to write the
      --  index of the last element read from Tx event FIFO to EFAI. This sets
      --  the Tx event FIFO get index TXEFS[EFGI] to EFAI + 1 and updates the
      --  FIFO 0 fill level TXEFS[EFFL].
      EFAI          : FDCAN_TXEFA_EFAI_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_TXEFA_Register use record
      EFAI          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  input clock divider The APB clock could be divided prior to be used by
   --  the CAN sub system. The rate must be computed using the divider output
   --  clock. These are protected write (P) bits, which means that write access
   --  by the bits is possible only when the bit 1 [CCE] and bit 0 [INIT] of
   --  CCCR register are set to 1.
   type FDCAN_CKDIV_PDIV_Field is
     (--  Divide by 1
      B_0x0,
      --  Divide by 2
      B_0x1,
      --  Divide by 4
      B_0x2,
      --  Divide by 6
      B_0x3,
      --  Divide by 8
      B_0x4,
      --  Divide by 10
      B_0x5,
      --  Divide by 12
      B_0x6,
      --  Divide by 14
      B_0x7,
      --  Divide by 16
      B_0x8,
      --  Divide by 18
      B_0x9,
      --  Divide by 20
      B_0xA,
      --  Divide by 22
      B_0xB,
      --  Divide by 24
      B_0xC,
      --  Divide by 26
      B_0xD,
      --  Divide by 28
      B_0xE,
      --  Divide by 30
      B_0xF)
     with Size => 4;
   for FDCAN_CKDIV_PDIV_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7,
      B_0x8 => 8,
      B_0x9 => 9,
      B_0xA => 10,
      B_0xB => 11,
      B_0xC => 12,
      B_0xD => 13,
      B_0xE => 14,
      B_0xF => 15);

   --  FDCAN CFG clock divider register
   type FDCAN_CKDIV_Register is record
      --  input clock divider The APB clock could be divided prior to be used
      --  by the CAN sub system. The rate must be computed using the divider
      --  output clock. These are protected write (P) bits, which means that
      --  write access by the bits is possible only when the bit 1 [CCE] and
      --  bit 0 [INIT] of CCCR register are set to 1.
      PDIV          : FDCAN_CKDIV_PDIV_Field := STM32_SVD.FDCAN.B_0x0;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FDCAN_CKDIV_Register use record
      PDIV          at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  FDCAN
   type FDCAN_Peripheral is record
      --  FDCAN core release register
      FDCAN_CREL   : aliased FDCAN_CREL_Register;
      --  FDCAN endian register
      FDCAN_ENDN   : aliased HAL.UInt32;
      --  FDCAN data bit timing and prescaler register
      FDCAN_DBTP   : aliased FDCAN_DBTP_Register;
      --  FDCAN test register
      FDCAN_TEST   : aliased FDCAN_TEST_Register;
      --  FDCAN RAM watchdog register
      FDCAN_RWD    : aliased FDCAN_RWD_Register;
      --  FDCAN CC control register
      FDCAN_CCCR   : aliased FDCAN_CCCR_Register;
      --  FDCAN nominal bit timing and prescaler register
      FDCAN_NBTP   : aliased FDCAN_NBTP_Register;
      --  FDCAN timestamp counter configuration register
      FDCAN_TSCC   : aliased FDCAN_TSCC_Register;
      --  FDCAN timestamp counter value register
      FDCAN_TSCV   : aliased FDCAN_TSCV_Register;
      --  FDCAN timeout counter configuration register
      FDCAN_TOCC   : aliased FDCAN_TOCC_Register;
      --  FDCAN timeout counter value register
      FDCAN_TOCV   : aliased FDCAN_TOCV_Register;
      --  FDCAN error counter register
      FDCAN_ECR    : aliased FDCAN_ECR_Register;
      --  FDCAN protocol status register
      FDCAN_PSR    : aliased FDCAN_PSR_Register;
      --  FDCAN transmitter delay compensation register
      FDCAN_TDCR   : aliased FDCAN_TDCR_Register;
      --  FDCAN interrupt register
      FDCAN_IR     : aliased FDCAN_IR_Register;
      --  FDCAN interrupt enable register
      FDCAN_IE     : aliased FDCAN_IE_Register;
      --  FDCAN interrupt line select register
      FDCAN_ILS    : aliased FDCAN_ILS_Register;
      --  FDCAN interrupt line enable register
      FDCAN_ILE    : aliased FDCAN_ILE_Register;
      --  FDCAN global filter configuration register
      FDCAN_RXGFC  : aliased FDCAN_RXGFC_Register;
      --  FDCAN extended ID and mask register
      FDCAN_XIDAM  : aliased FDCAN_XIDAM_Register;
      --  FDCAN high-priority message status register
      FDCAN_HPMS   : aliased FDCAN_HPMS_Register;
      --  FDCAN Rx FIFO 0 status register
      FDCAN_RXF0S  : aliased FDCAN_RXF0S_Register;
      --  CAN Rx FIFO 0 acknowledge register
      FDCAN_RXF0A  : aliased FDCAN_RXF0A_Register;
      --  FDCAN Rx FIFO 1 status register
      FDCAN_RXF1S  : aliased FDCAN_RXF1S_Register;
      --  FDCAN Rx FIFO 1 acknowledge register
      FDCAN_RXF1A  : aliased FDCAN_RXF1A_Register;
      --  FDCAN Tx buffer configuration register
      FDCAN_TXBC   : aliased FDCAN_TXBC_Register;
      --  FDCAN Tx FIFO/queue status register
      FDCAN_TXFQS  : aliased FDCAN_TXFQS_Register;
      --  FDCAN Tx buffer request pending register
      FDCAN_TXBRP  : aliased FDCAN_TXBRP_Register;
      --  FDCAN Tx buffer add request register
      FDCAN_TXBAR  : aliased FDCAN_TXBAR_Register;
      --  FDCAN Tx buffer cancellation request register
      FDCAN_TXBCR  : aliased FDCAN_TXBCR_Register;
      --  FDCAN Tx buffer transmission occurred register
      FDCAN_TXBTO  : aliased FDCAN_TXBTO_Register;
      --  FDCAN Tx buffer cancellation finished register
      FDCAN_TXBCF  : aliased FDCAN_TXBCF_Register;
      --  FDCAN Tx buffer transmission interrupt enable register
      FDCAN_TXBTIE : aliased FDCAN_TXBTIE_Register;
      --  FDCAN Tx buffer cancellation finished interrupt enable register
      FDCAN_TXBCIE : aliased FDCAN_TXBCIE_Register;
      --  FDCAN Tx event FIFO status register
      FDCAN_TXEFS  : aliased FDCAN_TXEFS_Register;
      --  FDCAN Tx event FIFO acknowledge register
      FDCAN_TXEFA  : aliased FDCAN_TXEFA_Register;
      --  FDCAN CFG clock divider register
      FDCAN_CKDIV  : aliased FDCAN_CKDIV_Register;
   end record
     with Volatile;

   for FDCAN_Peripheral use record
      FDCAN_CREL   at 16#0# range 0 .. 31;
      FDCAN_ENDN   at 16#4# range 0 .. 31;
      FDCAN_DBTP   at 16#C# range 0 .. 31;
      FDCAN_TEST   at 16#10# range 0 .. 31;
      FDCAN_RWD    at 16#14# range 0 .. 31;
      FDCAN_CCCR   at 16#18# range 0 .. 31;
      FDCAN_NBTP   at 16#1C# range 0 .. 31;
      FDCAN_TSCC   at 16#20# range 0 .. 31;
      FDCAN_TSCV   at 16#24# range 0 .. 31;
      FDCAN_TOCC   at 16#28# range 0 .. 31;
      FDCAN_TOCV   at 16#2C# range 0 .. 31;
      FDCAN_ECR    at 16#40# range 0 .. 31;
      FDCAN_PSR    at 16#44# range 0 .. 31;
      FDCAN_TDCR   at 16#48# range 0 .. 31;
      FDCAN_IR     at 16#50# range 0 .. 31;
      FDCAN_IE     at 16#54# range 0 .. 31;
      FDCAN_ILS    at 16#58# range 0 .. 31;
      FDCAN_ILE    at 16#5C# range 0 .. 31;
      FDCAN_RXGFC  at 16#80# range 0 .. 31;
      FDCAN_XIDAM  at 16#84# range 0 .. 31;
      FDCAN_HPMS   at 16#88# range 0 .. 31;
      FDCAN_RXF0S  at 16#90# range 0 .. 31;
      FDCAN_RXF0A  at 16#94# range 0 .. 31;
      FDCAN_RXF1S  at 16#98# range 0 .. 31;
      FDCAN_RXF1A  at 16#9C# range 0 .. 31;
      FDCAN_TXBC   at 16#C0# range 0 .. 31;
      FDCAN_TXFQS  at 16#C4# range 0 .. 31;
      FDCAN_TXBRP  at 16#C8# range 0 .. 31;
      FDCAN_TXBAR  at 16#CC# range 0 .. 31;
      FDCAN_TXBCR  at 16#D0# range 0 .. 31;
      FDCAN_TXBTO  at 16#D4# range 0 .. 31;
      FDCAN_TXBCF  at 16#D8# range 0 .. 31;
      FDCAN_TXBTIE at 16#DC# range 0 .. 31;
      FDCAN_TXBCIE at 16#E0# range 0 .. 31;
      FDCAN_TXEFS  at 16#E4# range 0 .. 31;
      FDCAN_TXEFA  at 16#E8# range 0 .. 31;
      FDCAN_CKDIV  at 16#100# range 0 .. 31;
   end record;

   --  FDCAN
   FDCAN_Periph : aliased FDCAN_Peripheral
     with Import, Address => FDCAN_Base;

   --  FDCAN
   FDCAN1_Periph : aliased FDCAN_Peripheral
     with Import, Address => FDCAN1_Base;

end STM32_SVD.FDCAN;
