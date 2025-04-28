pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;

package STM32_SVD.USART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_UE_Field is Boolean;
   subtype CR1_UESM_Field is Boolean;
   subtype CR1_RE_Field is Boolean;
   subtype CR1_TE_Field is Boolean;
   subtype CR1_IDLEIE_Field is Boolean;
   subtype CR1_RXNEIE_Field is Boolean;
   subtype CR1_TCIE_Field is Boolean;
   subtype CR1_TXEIE_Field is Boolean;
   subtype CR1_PEIE_Field is Boolean;
   subtype CR1_PS_Field is Boolean;
   subtype CR1_PCE_Field is Boolean;
   subtype CR1_WAKE_Field is Boolean;
   subtype CR1_M0_Field is Boolean;
   subtype CR1_MME_Field is Boolean;
   subtype CR1_CMIE_Field is Boolean;
   --  CR1_DEDT array element
   subtype CR1_DEDT_Element is Boolean;

   --  CR1_DEDT array
   type CR1_DEDT_Field_Array is array (0 .. 4) of CR1_DEDT_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for CR1_DEDT
   type CR1_DEDT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DEDT as a value
            Val : HAL.UInt5;
         when True =>
            --  DEDT as an array
            Arr : CR1_DEDT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for CR1_DEDT_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  CR1_DEAT array element
   subtype CR1_DEAT_Element is Boolean;

   --  CR1_DEAT array
   type CR1_DEAT_Field_Array is array (0 .. 4) of CR1_DEAT_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for CR1_DEAT
   type CR1_DEAT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DEAT as a value
            Val : HAL.UInt5;
         when True =>
            --  DEAT as an array
            Arr : CR1_DEAT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for CR1_DEAT_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   subtype CR1_M1_Field is Boolean;
   subtype CR1_FIFOEN_Field is Boolean;
   subtype CR1_TXFEIE_Field is Boolean;
   subtype CR1_RXFFIE_Field is Boolean;

   --  Control register 1
   type CR1_Register is record
      --  USART enable
      UE             : CR1_UE_Field := False;
      --  USART enable in Stop mode
      UESM           : CR1_UESM_Field := False;
      --  Receiver enable
      RE             : CR1_RE_Field := False;
      --  Transmitter enable
      TE             : CR1_TE_Field := False;
      --  IDLE interrupt enable
      IDLEIE         : CR1_IDLEIE_Field := False;
      --  RXNE interrupt enable
      RXNEIE         : CR1_RXNEIE_Field := False;
      --  Transmission complete interrupt enable
      TCIE           : CR1_TCIE_Field := False;
      --  interrupt enable
      TXEIE          : CR1_TXEIE_Field := False;
      --  PE interrupt enable
      PEIE           : CR1_PEIE_Field := False;
      --  Parity selection
      PS             : CR1_PS_Field := False;
      --  Parity control enable
      PCE            : CR1_PCE_Field := False;
      --  Receiver wakeup method
      WAKE           : CR1_WAKE_Field := False;
      --  Word length
      M0             : CR1_M0_Field := False;
      --  Mute mode enable
      MME            : CR1_MME_Field := False;
      --  Character match interrupt enable
      CMIE           : CR1_CMIE_Field := False;
      --  unspecified
      Reserved_15_15 : Boolean := False;
      --  DEDT0
      DEDT           : CR1_DEDT_Field := (As_Array => False, Val => 16#0#);
      --  DEAT0
      DEAT           : CR1_DEAT_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_26_27 : HAL.UInt2 := 16#0#;
      --  Word length
      M1             : CR1_M1_Field := False;
      --  FIFOEN
      FIFOEN         : CR1_FIFOEN_Field := False;
      --  TXFEIE
      TXFEIE         : CR1_TXFEIE_Field := False;
      --  RXFFIE
      RXFFIE         : CR1_RXFFIE_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      UE             at 0 range 0 .. 0;
      UESM           at 0 range 1 .. 1;
      RE             at 0 range 2 .. 2;
      TE             at 0 range 3 .. 3;
      IDLEIE         at 0 range 4 .. 4;
      RXNEIE         at 0 range 5 .. 5;
      TCIE           at 0 range 6 .. 6;
      TXEIE          at 0 range 7 .. 7;
      PEIE           at 0 range 8 .. 8;
      PS             at 0 range 9 .. 9;
      PCE            at 0 range 10 .. 10;
      WAKE           at 0 range 11 .. 11;
      M0             at 0 range 12 .. 12;
      MME            at 0 range 13 .. 13;
      CMIE           at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DEDT           at 0 range 16 .. 20;
      DEAT           at 0 range 21 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      M1             at 0 range 28 .. 28;
      FIFOEN         at 0 range 29 .. 29;
      TXFEIE         at 0 range 30 .. 30;
      RXFFIE         at 0 range 31 .. 31;
   end record;

   subtype CR2_ADDM7_Field is Boolean;
   subtype CR2_STOP_Field is HAL.UInt2;
   subtype CR2_SWAP_Field is Boolean;
   subtype CR2_RXINV_Field is Boolean;
   subtype CR2_TXINV_Field is Boolean;
   subtype CR2_TAINV_Field is Boolean;
   subtype CR2_MSBFIRST_Field is Boolean;
   subtype CR2_ADD0_3_Field is HAL.UInt4;
   subtype CR2_ADD4_7_Field is HAL.UInt4;

   --  Control register 2
   type CR2_Register is record
      --  unspecified
      Reserved_0_3   : HAL.UInt4 := 16#0#;
      --  7-bit Address Detection/4-bit Address Detection
      ADDM7          : CR2_ADDM7_Field := False;
      --  unspecified
      Reserved_5_11  : HAL.UInt7 := 16#0#;
      --  STOP bits
      STOP           : CR2_STOP_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : Boolean := False;
      --  Swap TX/RX pins
      SWAP           : CR2_SWAP_Field := False;
      --  RX pin active level inversion
      RXINV          : CR2_RXINV_Field := False;
      --  TX pin active level inversion
      TXINV          : CR2_TXINV_Field := False;
      --  Binary data inversion
      TAINV          : CR2_TAINV_Field := False;
      --  Most significant bit first
      MSBFIRST       : CR2_MSBFIRST_Field := False;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  Address of the USART node
      ADD0_3         : CR2_ADD0_3_Field := 16#0#;
      --  Address of the USART node
      ADD4_7         : CR2_ADD4_7_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      ADDM7          at 0 range 4 .. 4;
      Reserved_5_11  at 0 range 5 .. 11;
      STOP           at 0 range 12 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      SWAP           at 0 range 15 .. 15;
      RXINV          at 0 range 16 .. 16;
      TXINV          at 0 range 17 .. 17;
      TAINV          at 0 range 18 .. 18;
      MSBFIRST       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      ADD0_3         at 0 range 24 .. 27;
      ADD4_7         at 0 range 28 .. 31;
   end record;

   subtype CR3_EIE_Field is Boolean;
   subtype CR3_HDSEL_Field is Boolean;
   subtype CR3_DMAR_Field is Boolean;
   subtype CR3_DMAT_Field is Boolean;
   subtype CR3_RTSE_Field is Boolean;
   subtype CR3_CTSE_Field is Boolean;
   subtype CR3_CTSIE_Field is Boolean;
   subtype CR3_OVRDIS_Field is Boolean;
   subtype CR3_DDRE_Field is Boolean;
   subtype CR3_DEM_Field is Boolean;
   subtype CR3_DEP_Field is Boolean;
   subtype CR3_WUS_Field is HAL.UInt2;
   subtype CR3_WUFIE_Field is Boolean;
   subtype CR3_TXFTIE_Field is Boolean;
   subtype CR3_RXFTCFG_Field is HAL.UInt3;
   subtype CR3_RXFTIE_Field is Boolean;
   subtype CR3_TXFTCFG_Field is HAL.UInt3;

   --  Control register 3
   type CR3_Register is record
      --  Error interrupt enable
      EIE            : CR3_EIE_Field := False;
      --  unspecified
      Reserved_1_2   : HAL.UInt2 := 16#0#;
      --  Half-duplex selection
      HDSEL          : CR3_HDSEL_Field := False;
      --  unspecified
      Reserved_4_5   : HAL.UInt2 := 16#0#;
      --  DMA enable receiver
      DMAR           : CR3_DMAR_Field := False;
      --  DMA enable transmitter
      DMAT           : CR3_DMAT_Field := False;
      --  RTS enable
      RTSE           : CR3_RTSE_Field := False;
      --  CTS enable
      CTSE           : CR3_CTSE_Field := False;
      --  CTS interrupt enable
      CTSIE          : CR3_CTSIE_Field := False;
      --  unspecified
      Reserved_11_11 : Boolean := False;
      --  Overrun Disable
      OVRDIS         : CR3_OVRDIS_Field := False;
      --  DMA Disable on Reception Error
      DDRE           : CR3_DDRE_Field := False;
      --  Driver enable mode
      DEM            : CR3_DEM_Field := False;
      --  Driver enable polarity selection
      DEP            : CR3_DEP_Field := False;
      --  unspecified
      Reserved_16_19 : HAL.UInt4 := 16#0#;
      --  Wakeup from Stop mode interrupt flag selection
      WUS            : CR3_WUS_Field := 16#0#;
      --  Wakeup from Stop mode interrupt enable
      WUFIE          : CR3_WUFIE_Field := False;
      --  TXFTIE
      TXFTIE         : CR3_TXFTIE_Field := False;
      --  unspecified
      Reserved_24_24 : Boolean := False;
      --  RXFTCFG
      RXFTCFG        : CR3_RXFTCFG_Field := 16#0#;
      --  RXFTIE
      RXFTIE         : CR3_RXFTIE_Field := False;
      --  TXFTCFG
      TXFTCFG        : CR3_TXFTCFG_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register use record
      EIE            at 0 range 0 .. 0;
      Reserved_1_2   at 0 range 1 .. 2;
      HDSEL          at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      DMAR           at 0 range 6 .. 6;
      DMAT           at 0 range 7 .. 7;
      RTSE           at 0 range 8 .. 8;
      CTSE           at 0 range 9 .. 9;
      CTSIE          at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      OVRDIS         at 0 range 12 .. 12;
      DDRE           at 0 range 13 .. 13;
      DEM            at 0 range 14 .. 14;
      DEP            at 0 range 15 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      WUS            at 0 range 20 .. 21;
      WUFIE          at 0 range 22 .. 22;
      TXFTIE         at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      RXFTCFG        at 0 range 25 .. 27;
      RXFTIE         at 0 range 28 .. 28;
      TXFTCFG        at 0 range 29 .. 31;
   end record;

   subtype BRR_BRR_Field is HAL.UInt20;

   --  Baud rate register
   type BRR_Register is record
      --  BRR
      BRR            : BRR_BRR_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register use record
      BRR            at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype RQR_SBKRQ_Field is Boolean;
   subtype RQR_MMRQ_Field is Boolean;
   subtype RQR_RXFRQ_Field is Boolean;
   subtype RQR_TXFRQ_Field is Boolean;

   --  Request register
   type RQR_Register is record
      --  unspecified
      Reserved_0_0  : Boolean := False;
      --  Write-only. Send break request
      SBKRQ         : RQR_SBKRQ_Field := False;
      --  Write-only. Mute mode request
      MMRQ          : RQR_MMRQ_Field := False;
      --  Write-only. Receive data flush request
      RXFRQ         : RQR_RXFRQ_Field := False;
      --  Write-only. TXFRQ
      TXFRQ         : RQR_TXFRQ_Field := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RQR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SBKRQ         at 0 range 1 .. 1;
      MMRQ          at 0 range 2 .. 2;
      RXFRQ         at 0 range 3 .. 3;
      TXFRQ         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype ISR_PE_Field is Boolean;
   subtype ISR_FE_Field is Boolean;
   subtype ISR_NF_Field is Boolean;
   subtype ISR_ORE_Field is Boolean;
   subtype ISR_IDLE_Field is Boolean;
   subtype ISR_RXNE_Field is Boolean;
   subtype ISR_TC_Field is Boolean;
   subtype ISR_TXE_Field is Boolean;
   subtype ISR_CTSIF_Field is Boolean;
   subtype ISR_CTS_Field is Boolean;
   subtype ISR_BUSY_Field is Boolean;
   subtype ISR_CMF_Field is Boolean;
   subtype ISR_SBKF_Field is Boolean;
   subtype ISR_RWU_Field is Boolean;
   subtype ISR_WUF_Field is Boolean;
   subtype ISR_TEACK_Field is Boolean;
   subtype ISR_REACK_Field is Boolean;
   subtype ISR_TXFE_Field is Boolean;
   subtype ISR_RXFF_Field is Boolean;
   subtype ISR_RXFT_Field is Boolean;
   subtype ISR_TXFT_Field is Boolean;

   --  Interrupt & status register
   type ISR_Register is record
      --  Read-only. PE
      PE             : ISR_PE_Field;
      --  Read-only. FE
      FE             : ISR_FE_Field;
      --  Read-only. NF
      NF             : ISR_NF_Field;
      --  Read-only. ORE
      ORE            : ISR_ORE_Field;
      --  Read-only. IDLE
      IDLE           : ISR_IDLE_Field;
      --  Read-only. RXNE
      RXNE           : ISR_RXNE_Field;
      --  Read-only. TC
      TC             : ISR_TC_Field;
      --  Read-only. TXE
      TXE            : ISR_TXE_Field;
      --  unspecified
      Reserved_8_8   : Boolean;
      --  Read-only. CTSIF
      CTSIF          : ISR_CTSIF_Field;
      --  Read-only. CTS
      CTS            : ISR_CTS_Field;
      --  unspecified
      Reserved_11_15 : HAL.UInt5;
      --  Read-only. BUSY
      BUSY           : ISR_BUSY_Field;
      --  Read-only. CMF
      CMF            : ISR_CMF_Field;
      --  Read-only. SBKF
      SBKF           : ISR_SBKF_Field;
      --  Read-only. RWU
      RWU            : ISR_RWU_Field;
      --  Read-only. WUF
      WUF            : ISR_WUF_Field;
      --  Read-only. TEACK
      TEACK          : ISR_TEACK_Field;
      --  Read-only. REACK
      REACK          : ISR_REACK_Field;
      --  Read-only. TXFE
      TXFE           : ISR_TXFE_Field;
      --  Read-only. RXFF
      RXFF           : ISR_RXFF_Field;
      --  unspecified
      Reserved_25_25 : Boolean;
      --  Read-only. RXFT
      RXFT           : ISR_RXFT_Field;
      --  Read-only. TXFT
      TXFT           : ISR_TXFT_Field;
      --  unspecified
      Reserved_28_31 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      PE             at 0 range 0 .. 0;
      FE             at 0 range 1 .. 1;
      NF             at 0 range 2 .. 2;
      ORE            at 0 range 3 .. 3;
      IDLE           at 0 range 4 .. 4;
      RXNE           at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TXE            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CTSIF          at 0 range 9 .. 9;
      CTS            at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      BUSY           at 0 range 16 .. 16;
      CMF            at 0 range 17 .. 17;
      SBKF           at 0 range 18 .. 18;
      RWU            at 0 range 19 .. 19;
      WUF            at 0 range 20 .. 20;
      TEACK          at 0 range 21 .. 21;
      REACK          at 0 range 22 .. 22;
      TXFE           at 0 range 23 .. 23;
      RXFF           at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      RXFT           at 0 range 26 .. 26;
      TXFT           at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ICR_PECF_Field is Boolean;
   subtype ICR_FECF_Field is Boolean;
   subtype ICR_NCF_Field is Boolean;
   subtype ICR_ORECF_Field is Boolean;
   subtype ICR_IDLECF_Field is Boolean;
   subtype ICR_TCCF_Field is Boolean;
   subtype ICR_CTSCF_Field is Boolean;
   subtype ICR_CMCF_Field is Boolean;
   subtype ICR_WUCF_Field is Boolean;

   --  Interrupt flag clear register
   type ICR_Register is record
      --  Write-only. Parity error clear flag
      PECF           : ICR_PECF_Field := False;
      --  Write-only. Framing error clear flag
      FECF           : ICR_FECF_Field := False;
      --  Write-only. Noise detected clear flag
      NCF            : ICR_NCF_Field := False;
      --  Write-only. Overrun error clear flag
      ORECF          : ICR_ORECF_Field := False;
      --  Write-only. Idle line detected clear flag
      IDLECF         : ICR_IDLECF_Field := False;
      --  unspecified
      Reserved_5_5   : Boolean := False;
      --  Write-only. Transmission complete clear flag
      TCCF           : ICR_TCCF_Field := False;
      --  unspecified
      Reserved_7_8   : HAL.UInt2 := 16#0#;
      --  Write-only. CTS clear flag
      CTSCF          : ICR_CTSCF_Field := False;
      --  unspecified
      Reserved_10_16 : HAL.UInt7 := 16#0#;
      --  Write-only. Character match clear flag
      CMCF           : ICR_CMCF_Field := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Write-only. Wakeup from Stop mode clear flag
      WUCF           : ICR_WUCF_Field := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      PECF           at 0 range 0 .. 0;
      FECF           at 0 range 1 .. 1;
      NCF            at 0 range 2 .. 2;
      ORECF          at 0 range 3 .. 3;
      IDLECF         at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TCCF           at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      CTSCF          at 0 range 9 .. 9;
      Reserved_10_16 at 0 range 10 .. 16;
      CMCF           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      WUCF           at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype RDR_RDR_Field is HAL.UInt9;

   --  Receive data register
   type RDR_Register is record
      --  Read-only. Receive data value
      RDR           : RDR_RDR_Field;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RDR_Register use record
      RDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype TDR_TDR_Field is HAL.UInt9;

   --  Transmit data register
   type TDR_Register is record
      --  Transmit data value
      TDR           : TDR_TDR_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TDR_Register use record
      TDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PRESC_PRESCALER_Field is HAL.UInt4;

   --  Prescaler register
   type PRESC_Register is record
      --  PRESCALER
      PRESCALER     : PRESC_PRESCALER_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRESC_Register use record
      PRESCALER     at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CR1_OVER8_Field is Boolean;
   subtype CR1_RTOIE_Field is Boolean;
   subtype CR1_EOBIE_Field is Boolean;

   --  Control register 1
   type CR1_Register_1 is record
      --  USART enable
      UE     : CR1_UE_Field := False;
      --  USART enable in Stop mode
      UESM   : CR1_UESM_Field := False;
      --  Receiver enable
      RE     : CR1_RE_Field := False;
      --  Transmitter enable
      TE     : CR1_TE_Field := False;
      --  IDLE interrupt enable
      IDLEIE : CR1_IDLEIE_Field := False;
      --  RXNE interrupt enable
      RXNEIE : CR1_RXNEIE_Field := False;
      --  Transmission complete interrupt enable
      TCIE   : CR1_TCIE_Field := False;
      --  interrupt enable
      TXEIE  : CR1_TXEIE_Field := False;
      --  PE interrupt enable
      PEIE   : CR1_PEIE_Field := False;
      --  Parity selection
      PS     : CR1_PS_Field := False;
      --  Parity control enable
      PCE    : CR1_PCE_Field := False;
      --  Receiver wakeup method
      WAKE   : CR1_WAKE_Field := False;
      --  Word length
      M0     : CR1_M0_Field := False;
      --  Mute mode enable
      MME    : CR1_MME_Field := False;
      --  Character match interrupt enable
      CMIE   : CR1_CMIE_Field := False;
      --  Oversampling mode
      OVER8  : CR1_OVER8_Field := False;
      --  DEDT0
      DEDT   : CR1_DEDT_Field := (As_Array => False, Val => 16#0#);
      --  DEAT0
      DEAT   : CR1_DEAT_Field := (As_Array => False, Val => 16#0#);
      --  Receiver timeout interrupt enable
      RTOIE  : CR1_RTOIE_Field := False;
      --  End of Block interrupt enable
      EOBIE  : CR1_EOBIE_Field := False;
      --  M1
      M1     : CR1_M1_Field := False;
      --  FIFOEN
      FIFOEN : CR1_FIFOEN_Field := False;
      --  TXFEIE
      TXFEIE : CR1_TXFEIE_Field := False;
      --  RXFFIE
      RXFFIE : CR1_RXFFIE_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_1 use record
      UE     at 0 range 0 .. 0;
      UESM   at 0 range 1 .. 1;
      RE     at 0 range 2 .. 2;
      TE     at 0 range 3 .. 3;
      IDLEIE at 0 range 4 .. 4;
      RXNEIE at 0 range 5 .. 5;
      TCIE   at 0 range 6 .. 6;
      TXEIE  at 0 range 7 .. 7;
      PEIE   at 0 range 8 .. 8;
      PS     at 0 range 9 .. 9;
      PCE    at 0 range 10 .. 10;
      WAKE   at 0 range 11 .. 11;
      M0     at 0 range 12 .. 12;
      MME    at 0 range 13 .. 13;
      CMIE   at 0 range 14 .. 14;
      OVER8  at 0 range 15 .. 15;
      DEDT   at 0 range 16 .. 20;
      DEAT   at 0 range 21 .. 25;
      RTOIE  at 0 range 26 .. 26;
      EOBIE  at 0 range 27 .. 27;
      M1     at 0 range 28 .. 28;
      FIFOEN at 0 range 29 .. 29;
      TXFEIE at 0 range 30 .. 30;
      RXFFIE at 0 range 31 .. 31;
   end record;

   subtype CR2_SLVEN_Field is Boolean;
   subtype CR2_DIS_NSS_Field is Boolean;
   subtype CR2_LBDL_Field is Boolean;
   subtype CR2_LBDIE_Field is Boolean;
   subtype CR2_LBCL_Field is Boolean;
   subtype CR2_CPHA_Field is Boolean;
   subtype CR2_CPOL_Field is Boolean;
   subtype CR2_CLKEN_Field is Boolean;
   subtype CR2_LINEN_Field is Boolean;
   subtype CR2_ABREN_Field is Boolean;
   --  CR2_ABRMOD array element
   subtype CR2_ABRMOD_Element is Boolean;

   --  CR2_ABRMOD array
   type CR2_ABRMOD_Field_Array is array (0 .. 1) of CR2_ABRMOD_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CR2_ABRMOD
   type CR2_ABRMOD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ABRMOD as a value
            Val : HAL.UInt2;
         when True =>
            --  ABRMOD as an array
            Arr : CR2_ABRMOD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CR2_ABRMOD_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype CR2_RTOEN_Field is Boolean;

   --  Control register 2
   type CR2_Register_1 is record
      --  SLVEN
      SLVEN        : CR2_SLVEN_Field := False;
      --  unspecified
      Reserved_1_2 : HAL.UInt2 := 16#0#;
      --  DIS_NSS
      DIS_NSS      : CR2_DIS_NSS_Field := False;
      --  7-bit Address Detection/4-bit Address Detection
      ADDM7        : CR2_ADDM7_Field := False;
      --  LIN break detection length
      LBDL         : CR2_LBDL_Field := False;
      --  LIN break detection interrupt enable
      LBDIE        : CR2_LBDIE_Field := False;
      --  unspecified
      Reserved_7_7 : Boolean := False;
      --  Last bit clock pulse
      LBCL         : CR2_LBCL_Field := False;
      --  Clock phase
      CPHA         : CR2_CPHA_Field := False;
      --  Clock polarity
      CPOL         : CR2_CPOL_Field := False;
      --  Clock enable
      CLKEN        : CR2_CLKEN_Field := False;
      --  STOP bits
      STOP         : CR2_STOP_Field := 16#0#;
      --  LIN mode enable
      LINEN        : CR2_LINEN_Field := False;
      --  Swap TX/RX pins
      SWAP         : CR2_SWAP_Field := False;
      --  RX pin active level inversion
      RXINV        : CR2_RXINV_Field := False;
      --  TX pin active level inversion
      TXINV        : CR2_TXINV_Field := False;
      --  Binary data inversion
      TAINV        : CR2_TAINV_Field := False;
      --  Most significant bit first
      MSBFIRST     : CR2_MSBFIRST_Field := False;
      --  Auto baud rate enable
      ABREN        : CR2_ABREN_Field := False;
      --  ABRMOD0
      ABRMOD       : CR2_ABRMOD_Field := (As_Array => False, Val => 16#0#);
      --  Receiver timeout enable
      RTOEN        : CR2_RTOEN_Field := False;
      --  Address of the USART node
      ADD0_3       : CR2_ADD0_3_Field := 16#0#;
      --  Address of the USART node
      ADD4_7       : CR2_ADD4_7_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_1 use record
      SLVEN        at 0 range 0 .. 0;
      Reserved_1_2 at 0 range 1 .. 2;
    DIS_NSS      at 0 range 3 .. 3;
      ADDM7        at 0 range 4 .. 4;
      LBDL         at 0 range 5 .. 5;
      LBDIE        at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      LBCL         at 0 range 8 .. 8;
      CPHA         at 0 range 9 .. 9;
      CPOL         at 0 range 10 .. 10;
      CLKEN        at 0 range 11 .. 11;
      STOP         at 0 range 12 .. 13;
      LINEN        at 0 range 14 .. 14;
      SWAP         at 0 range 15 .. 15;
      RXINV        at 0 range 16 .. 16;
      TXINV        at 0 range 17 .. 17;
      TAINV        at 0 range 18 .. 18;
      MSBFIRST     at 0 range 19 .. 19;
      ABREN        at 0 range 20 .. 20;
      ABRMOD       at 0 range 21 .. 22;
      RTOEN        at 0 range 23 .. 23;
      ADD0_3       at 0 range 24 .. 27;
      ADD4_7       at 0 range 28 .. 31;
   end record;

   subtype CR3_IREN_Field is Boolean;
   subtype CR3_IRLP_Field is Boolean;
   subtype CR3_NACK_Field is Boolean;
   subtype CR3_SCEN_Field is Boolean;
   subtype CR3_ONEBIT_Field is Boolean;
   subtype CR3_SCARCNT_Field is HAL.UInt3;
   subtype CR3_TCBGTIE_Field is Boolean;

   --  Control register 3
   type CR3_Register_1 is record
      --  Error interrupt enable
      EIE            : CR3_EIE_Field := False;
      --  Ir mode enable
      IREN           : CR3_IREN_Field := False;
      --  Ir low-power
      IRLP           : CR3_IRLP_Field := False;
      --  Half-duplex selection
      HDSEL          : CR3_HDSEL_Field := False;
      --  Smartcard NACK enable
      NACK           : CR3_NACK_Field := False;
      --  Smartcard mode enable
      SCEN           : CR3_SCEN_Field := False;
      --  DMA enable receiver
      DMAR           : CR3_DMAR_Field := False;
      --  DMA enable transmitter
      DMAT           : CR3_DMAT_Field := False;
      --  RTS enable
      RTSE           : CR3_RTSE_Field := False;
      --  CTS enable
      CTSE           : CR3_CTSE_Field := False;
      --  CTS interrupt enable
      CTSIE          : CR3_CTSIE_Field := False;
      --  One sample bit method enable
      ONEBIT         : CR3_ONEBIT_Field := False;
      --  Overrun Disable
      OVRDIS         : CR3_OVRDIS_Field := False;
      --  DMA Disable on Reception Error
      DDRE           : CR3_DDRE_Field := False;
      --  Driver enable mode
      DEM            : CR3_DEM_Field := False;
      --  Driver enable polarity selection
      DEP            : CR3_DEP_Field := False;
      --  unspecified
      Reserved_16_16 : Boolean := False;
      --  Smartcard auto-retry count
      SCARCNT        : CR3_SCARCNT_Field := 16#0#;
      --  Wakeup from Stop mode interrupt flag selection
      WUS            : CR3_WUS_Field := 16#0#;
      --  Wakeup from Stop mode interrupt enable
      WUFIE          : CR3_WUFIE_Field := False;
      --  TXFTIE
      TXFTIE         : CR3_TXFTIE_Field := False;
      --  TCBGTIE
      TCBGTIE        : CR3_TCBGTIE_Field := False;
      --  RXFTCFG
      RXFTCFG        : CR3_RXFTCFG_Field := 16#0#;
      --  RXFTIE
      RXFTIE         : CR3_RXFTIE_Field := False;
      --  TXFTCFG
      TXFTCFG        : CR3_TXFTCFG_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register_1 use record
      EIE            at 0 range 0 .. 0;
      IREN           at 0 range 1 .. 1;
      IRLP           at 0 range 2 .. 2;
      HDSEL          at 0 range 3 .. 3;
      NACK           at 0 range 4 .. 4;
      SCEN           at 0 range 5 .. 5;
      DMAR           at 0 range 6 .. 6;
      DMAT           at 0 range 7 .. 7;
      RTSE           at 0 range 8 .. 8;
      CTSE           at 0 range 9 .. 9;
      CTSIE          at 0 range 10 .. 10;
      ONEBIT         at 0 range 11 .. 11;
      OVRDIS         at 0 range 12 .. 12;
      DDRE           at 0 range 13 .. 13;
      DEM            at 0 range 14 .. 14;
      DEP            at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      SCARCNT        at 0 range 17 .. 19;
      WUS            at 0 range 20 .. 21;
      WUFIE          at 0 range 22 .. 22;
      TXFTIE         at 0 range 23 .. 23;
      TCBGTIE        at 0 range 24 .. 24;
      RXFTCFG        at 0 range 25 .. 27;
      RXFTIE         at 0 range 28 .. 28;
      TXFTCFG        at 0 range 29 .. 31;
   end record;

   subtype BRR_DIV_Fraction_Field is HAL.UInt4;
   subtype BRR_DIV_Mantissa_Field is HAL.UInt12;

   --  Baud rate register
   type BRR_Register_1 is record
      --  DIV_Fraction
      DIV_Fraction   : BRR_DIV_Fraction_Field := 16#0#;
      --  DIV_Mantissa
      DIV_Mantissa   : BRR_DIV_Mantissa_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register_1 use record
      DIV_Fraction   at 0 range 0 .. 3;
      DIV_Mantissa   at 0 range 4 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype GTPR_PSC_Field is HAL.UInt8;
   subtype GTPR_GT_Field is HAL.UInt8;

   --  Guard time and prescaler register
   type GTPR_Register is record
      --  Prescaler value
      PSC            : GTPR_PSC_Field := 16#0#;
      --  Guard time value
      GT             : GTPR_GT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GTPR_Register use record
      PSC            at 0 range 0 .. 7;
      GT             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RTOR_RTO_Field is HAL.UInt24;
   subtype RTOR_BLEN_Field is HAL.UInt8;

   --  Receiver timeout register
   type RTOR_Register is record
      --  Receiver timeout value
      RTO  : RTOR_RTO_Field := 16#0#;
      --  Block Length
      BLEN : RTOR_BLEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTOR_Register use record
      RTO  at 0 range 0 .. 23;
      BLEN at 0 range 24 .. 31;
   end record;

   subtype RQR_ABRRQ_Field is Boolean;

   --  Request register
   type RQR_Register_1 is record
      --  Write-only. Auto baud rate request
      ABRRQ         : RQR_ABRRQ_Field := False;
      --  Write-only. Send break request
      SBKRQ         : RQR_SBKRQ_Field := False;
      --  Write-only. Mute mode request
      MMRQ          : RQR_MMRQ_Field := False;
      --  Write-only. Receive data flush request
      RXFRQ         : RQR_RXFRQ_Field := False;
      --  Write-only. Transmit data flush request
      TXFRQ         : RQR_TXFRQ_Field := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RQR_Register_1 use record
      ABRRQ         at 0 range 0 .. 0;
      SBKRQ         at 0 range 1 .. 1;
      MMRQ          at 0 range 2 .. 2;
      RXFRQ         at 0 range 3 .. 3;
      TXFRQ         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype ISR_LBDF_Field is Boolean;
   subtype ISR_RTOF_Field is Boolean;
   subtype ISR_EOBF_Field is Boolean;
   subtype ISR_UDR_Field is Boolean;
   subtype ISR_ABRE_Field is Boolean;
   subtype ISR_ABRF_Field is Boolean;
   subtype ISR_TCBGT_Field is Boolean;

   --  Interrupt & status register
   type ISR_Register_1 is record
      --  Read-only. PE
      PE             : ISR_PE_Field;
      --  Read-only. FE
      FE             : ISR_FE_Field;
      --  Read-only. NF
      NF             : ISR_NF_Field;
      --  Read-only. ORE
      ORE            : ISR_ORE_Field;
      --  Read-only. IDLE
      IDLE           : ISR_IDLE_Field;
      --  Read-only. RXNE
      RXNE           : ISR_RXNE_Field;
      --  Read-only. TC
      TC             : ISR_TC_Field;
      --  Read-only. TXE
      TXE            : ISR_TXE_Field;
      --  Read-only. LBDF
      LBDF           : ISR_LBDF_Field;
      --  Read-only. CTSIF
      CTSIF          : ISR_CTSIF_Field;
      --  Read-only. CTS
      CTS            : ISR_CTS_Field;
      --  Read-only. RTOF
      RTOF           : ISR_RTOF_Field;
      --  Read-only. EOBF
      EOBF           : ISR_EOBF_Field;
      --  Read-only. UDR
      UDR            : ISR_UDR_Field;
      --  Read-only. ABRE
      ABRE           : ISR_ABRE_Field;
      --  Read-only. ABRF
      ABRF           : ISR_ABRF_Field;
      --  Read-only. BUSY
      BUSY           : ISR_BUSY_Field;
      --  Read-only. CMF
      CMF            : ISR_CMF_Field;
      --  Read-only. SBKF
      SBKF           : ISR_SBKF_Field;
      --  Read-only. RWU
      RWU            : ISR_RWU_Field;
      --  Read-only. WUF
      WUF            : ISR_WUF_Field;
      --  Read-only. TEACK
      TEACK          : ISR_TEACK_Field;
      --  Read-only. REACK
      REACK          : ISR_REACK_Field;
      --  Read-only. TXFE
      TXFE           : ISR_TXFE_Field;
      --  Read-only. RXFF
      RXFF           : ISR_RXFF_Field;
      --  Read-only. TCBGT
      TCBGT          : ISR_TCBGT_Field;
      --  Read-only. RXFT
      RXFT           : ISR_RXFT_Field;
      --  Read-only. TXFT
      TXFT           : ISR_TXFT_Field;
      --  unspecified
      Reserved_28_31 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register_1 use record
      PE             at 0 range 0 .. 0;
      FE             at 0 range 1 .. 1;
      NF             at 0 range 2 .. 2;
      ORE            at 0 range 3 .. 3;
      IDLE           at 0 range 4 .. 4;
      RXNE           at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TXE            at 0 range 7 .. 7;
      LBDF           at 0 range 8 .. 8;
      CTSIF          at 0 range 9 .. 9;
      CTS            at 0 range 10 .. 10;
      RTOF           at 0 range 11 .. 11;
      EOBF           at 0 range 12 .. 12;
      UDR            at 0 range 13 .. 13;
      ABRE           at 0 range 14 .. 14;
      ABRF           at 0 range 15 .. 15;
      BUSY           at 0 range 16 .. 16;
      CMF            at 0 range 17 .. 17;
      SBKF           at 0 range 18 .. 18;
      RWU            at 0 range 19 .. 19;
      WUF            at 0 range 20 .. 20;
      TEACK          at 0 range 21 .. 21;
      REACK          at 0 range 22 .. 22;
      TXFE           at 0 range 23 .. 23;
      RXFF           at 0 range 24 .. 24;
      TCBGT          at 0 range 25 .. 25;
      RXFT           at 0 range 26 .. 26;
      TXFT           at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ICR_TXFECF_Field is Boolean;
   subtype ICR_TCBGTCF_Field is Boolean;
   subtype ICR_LBDCF_Field is Boolean;
   subtype ICR_RTOCF_Field is Boolean;
   subtype ICR_EOBCF_Field is Boolean;
   subtype ICR_UDRCF_Field is Boolean;

   --  Interrupt flag clear register
   type ICR_Register_1 is record
      --  Write-only. Parity error clear flag
      PECF           : ICR_PECF_Field := False;
      --  Write-only. Framing error clear flag
      FECF           : ICR_FECF_Field := False;
      --  Write-only. Noise detected clear flag
      NCF            : ICR_NCF_Field := False;
      --  Write-only. Overrun error clear flag
      ORECF          : ICR_ORECF_Field := False;
      --  Write-only. Idle line detected clear flag
      IDLECF         : ICR_IDLECF_Field := False;
      --  Write-only. TXFECF
      TXFECF         : ICR_TXFECF_Field := False;
      --  Write-only. Transmission complete clear flag
      TCCF           : ICR_TCCF_Field := False;
      --  Write-only. TCBGTCF
      TCBGTCF        : ICR_TCBGTCF_Field := False;
      --  Write-only. LIN break detection clear flag
      LBDCF          : ICR_LBDCF_Field := False;
      --  Write-only. CTS clear flag
      CTSCF          : ICR_CTSCF_Field := False;
      --  unspecified
      Reserved_10_10 : Boolean := False;
      --  Write-only. Receiver timeout clear flag
      RTOCF          : ICR_RTOCF_Field := False;
      --  Write-only. End of block clear flag
      EOBCF          : ICR_EOBCF_Field := False;
      --  Write-only. UDRCF
      UDRCF          : ICR_UDRCF_Field := False;
      --  unspecified
      Reserved_14_16 : HAL.UInt3 := 16#0#;
      --  Write-only. Character match clear flag
      CMCF           : ICR_CMCF_Field := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Write-only. Wakeup from Stop mode clear flag
      WUCF           : ICR_WUCF_Field := False;
      
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register_1 use record
      PECF           at 0 range 0 .. 0;
      FECF           at 0 range 1 .. 1;
      NCF            at 0 range 2 .. 2;
      ORECF          at 0 range 3 .. 3;
      IDLECF         at 0 range 4 .. 4;
      TXFECF         at 0 range 5 .. 5;
      TCCF           at 0 range 6 .. 6;
      TCBGTCF        at 0 range 7 .. 7;
      LBDCF          at 0 range 8 .. 8;
      CTSCF          at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      RTOCF          at 0 range 11 .. 11;
      EOBCF          at 0 range 12 .. 12;
      UDRCF          at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      CMCF           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      WUCF           at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Universal synchronous asynchronous receiver transmitter
   type LPUART1_Peripheral is record
      --  Control register 1
      CR1   : aliased CR1_Register;
      --  Control register 2
      CR2   : aliased CR2_Register;
      --  Control register 3
      CR3   : aliased CR3_Register;
      --  Baud rate register
      BRR   : aliased BRR_Register;
      --  Request register
      RQR   : aliased RQR_Register;
      --  Interrupt & status register
      ISR   : aliased ISR_Register;
      --  Interrupt flag clear register
      ICR   : aliased ICR_Register;
      --  Receive data register
      RDR   : aliased RDR_Register;
      --  Transmit data register
      TDR   : aliased TDR_Register;
      --  Prescaler register
      PRESC : aliased PRESC_Register;
   end record
     with Volatile;

   for LPUART1_Peripheral use record
      CR1   at 16#0# range 0 .. 31;
      CR2   at 16#4# range 0 .. 31;
      CR3   at 16#8# range 0 .. 31;
      BRR   at 16#C# range 0 .. 31;
      RQR   at 16#18# range 0 .. 31;
      ISR   at 16#1C# range 0 .. 31;
      ICR   at 16#20# range 0 .. 31;
      RDR   at 16#24# range 0 .. 31;
      TDR   at 16#28# range 0 .. 31;
      PRESC at 16#2C# range 0 .. 31;
   end record;

   --  Universal synchronous asynchronous receiver transmitter
   LPUART1_Periph : aliased LPUART1_Peripheral
     with Import, Address => LPUART1_Base;

   --  Universal synchronous asynchronous receiver transmitter
   type USART_Peripheral is record
      --  Control register 1
      CR1   : aliased CR1_Register_1;
      --  Control register 2
      CR2   : aliased CR2_Register_1;
      --  Control register 3
      CR3   : aliased CR3_Register_1;
      --  Baud rate register
      BRR   : aliased BRR_Register_1;
      --  Guard time and prescaler register
      GTPR  : aliased GTPR_Register;
      --  Receiver timeout register
      RTOR  : aliased RTOR_Register;
      --  Request register
      RQR   : aliased RQR_Register_1;
      --  Interrupt & status register
      ISR   : aliased ISR_Register_1;
      --  Interrupt flag clear register
      ICR   : aliased ICR_Register_1;
      --  Receive data register
      RDR   : aliased RDR_Register;
      --  Transmit data register
      TDR   : aliased TDR_Register;
      --  USART prescaler register
      PRESC : aliased PRESC_Register;
   end record
     with Volatile;

   for USART_Peripheral use record
      CR1   at 16#0# range 0 .. 31;
      CR2   at 16#4# range 0 .. 31;
      CR3   at 16#8# range 0 .. 31;
      BRR   at 16#C# range 0 .. 31;
      GTPR  at 16#10# range 0 .. 31;
      RTOR  at 16#14# range 0 .. 31;
      RQR   at 16#18# range 0 .. 31;
      ISR   at 16#1C# range 0 .. 31;
      ICR   at 16#20# range 0 .. 31;
      RDR   at 16#24# range 0 .. 31;
      TDR   at 16#28# range 0 .. 31;
      PRESC at 16#2C# range 0 .. 31;
   end record;

   --  Universal synchronous asynchronous receiver transmitter
   UART4_Periph : aliased USART_Peripheral
     with Import, Address => UART4_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART1_Periph : aliased USART_Peripheral
     with Import, Address => USART1_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART2_Periph : aliased USART_Peripheral
     with Import, Address => USART2_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART3_Periph : aliased USART_Peripheral
     with Import, Address => USART3_Base;

end STM32_SVD.USART;
