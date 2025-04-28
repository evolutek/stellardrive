pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.UCPD is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CFG1_HBITCLKDIV_Field is HAL.UInt6;
   subtype CFG1_IFRGAP_Field is HAL.UInt5;
   subtype CFG1_TRANSWIN_Field is HAL.UInt5;
   subtype CFG1_PSC_USBPDCLK_Field is HAL.UInt3;
   subtype CFG1_RXORDSETEN_Field is HAL.UInt9;
   subtype CFG1_TXDMAEN_Field is Boolean;
   subtype CFG1_RXDMAEN_Field is Boolean;
   subtype CFG1_UCPDEN_Field is Boolean;

   --  UCPD configuration register 1
   type CFG1_Register is record
      --  HBITCLKDIV
      HBITCLKDIV     : CFG1_HBITCLKDIV_Field := 16#0#;
      --  IFRGAP
      IFRGAP         : CFG1_IFRGAP_Field := 16#0#;
      --  TRANSWIN
      TRANSWIN       : CFG1_TRANSWIN_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Boolean := False;
      --  PSC_USBPDCLK
      PSC_USBPDCLK   : CFG1_PSC_USBPDCLK_Field := 16#0#;
      --  RXORDSETEN
      RXORDSETEN     : CFG1_RXORDSETEN_Field := 16#0#;
      --  TXDMAEN
      TXDMAEN        : CFG1_TXDMAEN_Field := False;
      --  RXDMAEN
      RXDMAEN        : CFG1_RXDMAEN_Field := False;
      --  UCPDEN
      UCPDEN         : CFG1_UCPDEN_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFG1_Register use record
      HBITCLKDIV     at 0 range 0 .. 5;
      IFRGAP         at 0 range 6 .. 10;
      TRANSWIN       at 0 range 11 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      PSC_USBPDCLK   at 0 range 17 .. 19;
      RXORDSETEN     at 0 range 20 .. 28;
      TXDMAEN        at 0 range 29 .. 29;
      RXDMAEN        at 0 range 30 .. 30;
      UCPDEN         at 0 range 31 .. 31;
   end record;

   subtype CFG2_RXFILTDIS_Field is Boolean;
   subtype CFG2_RXFILT2N3_Field is Boolean;
   subtype CFG2_FORCECLK_Field is Boolean;
   subtype CFG2_WUPEN_Field is Boolean;

   --  UCPD configuration register 2
   type CFG2_Register is record
      --  RXFILTDIS
      RXFILTDIS     : CFG2_RXFILTDIS_Field := False;
      --  RXFILT2N3
      RXFILT2N3     : CFG2_RXFILT2N3_Field := False;
      --  FORCECLK
      FORCECLK      : CFG2_FORCECLK_Field := False;
      --  WUPEN
      WUPEN         : CFG2_WUPEN_Field := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFG2_Register use record
      RXFILTDIS     at 0 range 0 .. 0;
      RXFILT2N3     at 0 range 1 .. 1;
      FORCECLK      at 0 range 2 .. 2;
      WUPEN         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CR_TXMODE_Field is HAL.UInt2;
   subtype CR_TXSEND_Field is Boolean;
   subtype CR_TXHRST_Field is Boolean;
   subtype CR_RXMODE_Field is Boolean;
   subtype CR_PHYRXEN_Field is Boolean;
   subtype CR_PHYCCSEL_Field is Boolean;
   subtype CR_ANASUBMODE_Field is HAL.UInt2;
   subtype CR_ANAMODE_Field is Boolean;
   subtype CR_CCENABLE_Field is HAL.UInt2;
   subtype CR_FRSRXEN_Field is Boolean;
   subtype CR_FRSTX_Field is Boolean;
   subtype CR_RDCH_Field is Boolean;
   subtype CR_CC1TCDIS_Field is Boolean;
   subtype CR_CC2TCDIS_Field is Boolean;

   --  UCPD configuration register 2
   type CR_Register is record
      --  TXMODE
      TXMODE         : CR_TXMODE_Field := 16#0#;
      --  TXSEND
      TXSEND         : CR_TXSEND_Field := False;
      --  TXHRST
      TXHRST         : CR_TXHRST_Field := False;
      --  RXMODE
      RXMODE         : CR_RXMODE_Field := False;
      --  PHYRXEN
      PHYRXEN        : CR_PHYRXEN_Field := False;
      --  PHYCCSEL
      PHYCCSEL       : CR_PHYCCSEL_Field := False;
      --  ANASUBMODE
      ANASUBMODE     : CR_ANASUBMODE_Field := 16#0#;
      --  ANAMODE
      ANAMODE        : CR_ANAMODE_Field := False;
      --  CCENABLE
      CCENABLE       : CR_CCENABLE_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  FRSRXEN
      FRSRXEN        : CR_FRSRXEN_Field := False;
      --  FRSTX
      FRSTX          : CR_FRSTX_Field := False;
      --  RDCH
      RDCH           : CR_RDCH_Field := False;
      --  unspecified
      Reserved_19_19 : Boolean := False;
      --  CC1TCDIS
      CC1TCDIS       : CR_CC1TCDIS_Field := False;
      --  CC2TCDIS
      CC2TCDIS       : CR_CC2TCDIS_Field := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      TXMODE         at 0 range 0 .. 1;
      TXSEND         at 0 range 2 .. 2;
      TXHRST         at 0 range 3 .. 3;
      RXMODE         at 0 range 4 .. 4;
      PHYRXEN        at 0 range 5 .. 5;
      PHYCCSEL       at 0 range 6 .. 6;
      ANASUBMODE     at 0 range 7 .. 8;
      ANAMODE        at 0 range 9 .. 9;
      CCENABLE       at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      FRSRXEN        at 0 range 16 .. 16;
      FRSTX          at 0 range 17 .. 17;
      RDCH           at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      CC1TCDIS       at 0 range 20 .. 20;
      CC2TCDIS       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype IMR_TXISIE_Field is Boolean;
   subtype IMR_TXMSGDISCIE_Field is Boolean;
   subtype IMR_TXMSGSENTIE_Field is Boolean;
   subtype IMR_TXMSGABTIE_Field is Boolean;
   subtype IMR_HRSTDISCIE_Field is Boolean;
   subtype IMR_HRSTSENTIE_Field is Boolean;
   subtype IMR_TXUNDIE_Field is Boolean;
   subtype IMR_RXNEIE_Field is Boolean;
   subtype IMR_RXORDDETIE_Field is Boolean;
   subtype IMR_RXHRSTDETIE_Field is Boolean;
   subtype IMR_RXOVRIE_Field is Boolean;
   subtype IMR_RXMSGENDIE_Field is Boolean;
   subtype IMR_TYPECEVT1IE_Field is Boolean;
   subtype IMR_TYPECEVT2IE_Field is Boolean;
   subtype IMR_FRSEVTIE_Field is Boolean;

   --  UCPD Interrupt Mask Register
   type IMR_Register is record
      --  TXISIE
      TXISIE         : IMR_TXISIE_Field := False;
      --  TXMSGDISCIE
      TXMSGDISCIE    : IMR_TXMSGDISCIE_Field := False;
      --  TXMSGSENTIE
      TXMSGSENTIE    : IMR_TXMSGSENTIE_Field := False;
      --  TXMSGABTIE
      TXMSGABTIE     : IMR_TXMSGABTIE_Field := False;
      --  HRSTDISCIE
      HRSTDISCIE     : IMR_HRSTDISCIE_Field := False;
      --  HRSTSENTIE
      HRSTSENTIE     : IMR_HRSTSENTIE_Field := False;
      --  TXUNDIE
      TXUNDIE        : IMR_TXUNDIE_Field := False;
      --  unspecified
      Reserved_7_7   : Boolean := False;
      --  RXNEIE
      RXNEIE         : IMR_RXNEIE_Field := False;
      --  RXORDDETIE
      RXORDDETIE     : IMR_RXORDDETIE_Field := False;
      --  RXHRSTDETIE
      RXHRSTDETIE    : IMR_RXHRSTDETIE_Field := False;
      --  RXOVRIE
      RXOVRIE        : IMR_RXOVRIE_Field := False;
      --  RXMSGENDIE
      RXMSGENDIE     : IMR_RXMSGENDIE_Field := False;
      --  unspecified
      Reserved_13_13 : Boolean := False;
      --  TYPECEVT1IE
      TYPECEVT1IE    : IMR_TYPECEVT1IE_Field := False;
      --  TYPECEVT2IE
      TYPECEVT2IE    : IMR_TYPECEVT2IE_Field := False;
      --  unspecified
      Reserved_16_19 : HAL.UInt4 := 16#0#;
      --  FRSEVTIE
      FRSEVTIE       : IMR_FRSEVTIE_Field := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      TXISIE         at 0 range 0 .. 0;
      TXMSGDISCIE    at 0 range 1 .. 1;
      TXMSGSENTIE    at 0 range 2 .. 2;
      TXMSGABTIE     at 0 range 3 .. 3;
      HRSTDISCIE     at 0 range 4 .. 4;
      HRSTSENTIE     at 0 range 5 .. 5;
      TXUNDIE        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      RXNEIE         at 0 range 8 .. 8;
      RXORDDETIE     at 0 range 9 .. 9;
      RXHRSTDETIE    at 0 range 10 .. 10;
      RXOVRIE        at 0 range 11 .. 11;
      RXMSGENDIE     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      TYPECEVT1IE    at 0 range 14 .. 14;
      TYPECEVT2IE    at 0 range 15 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      FRSEVTIE       at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype SR_TXIS_Field is Boolean;
   subtype SR_TXMSGDISC_Field is Boolean;
   subtype SR_TXMSGSENT_Field is Boolean;
   subtype SR_TXMSGABT_Field is Boolean;
   subtype SR_HRSTDISC_Field is Boolean;
   subtype SR_HRSTSENT_Field is Boolean;
   subtype SR_TXUND_Field is Boolean;
   subtype SR_RXNE_Field is Boolean;
   subtype SR_RXORDDET_Field is Boolean;
   subtype SR_RXHRSTDET_Field is Boolean;
   subtype SR_RXOVR_Field is Boolean;
   subtype SR_RXMSGEND_Field is Boolean;
   subtype SR_RXERR_Field is Boolean;
   --  SR_TYPECEVT array element
   subtype SR_TYPECEVT_Element is Boolean;

   --  SR_TYPECEVT array
   type SR_TYPECEVT_Field_Array is array (1 .. 2) of SR_TYPECEVT_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SR_TYPECEVT
   type SR_TYPECEVT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TYPECEVT as a value
            Val : HAL.UInt2;
         when True =>
            --  TYPECEVT as an array
            Arr : SR_TYPECEVT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SR_TYPECEVT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  SR_TYPEC_VSTATE_CC array element
   subtype SR_TYPEC_VSTATE_CC_Element is HAL.UInt2;

   --  SR_TYPEC_VSTATE_CC array
   type SR_TYPEC_VSTATE_CC_Field_Array is array (1 .. 2)
     of SR_TYPEC_VSTATE_CC_Element
     with Component_Size => 2, Size => 4;

   --  Type definition for SR_TYPEC_VSTATE_CC
   type SR_TYPEC_VSTATE_CC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TYPEC_VSTATE_CC as a value
            Val : HAL.UInt4;
         when True =>
            --  TYPEC_VSTATE_CC as an array
            Arr : SR_TYPEC_VSTATE_CC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for SR_TYPEC_VSTATE_CC_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype SR_FRSEVT_Field is Boolean;

   --  UCPD Status Register
   type SR_Register is record
      --  TXIS
      TXIS            : SR_TXIS_Field := False;
      --  TXMSGDISC
      TXMSGDISC       : SR_TXMSGDISC_Field := False;
      --  TXMSGSENT
      TXMSGSENT       : SR_TXMSGSENT_Field := False;
      --  TXMSGABT
      TXMSGABT        : SR_TXMSGABT_Field := False;
      --  HRSTDISC
      HRSTDISC        : SR_HRSTDISC_Field := False;
      --  HRSTSENT
      HRSTSENT        : SR_HRSTSENT_Field := False;
      --  TXUND
      TXUND           : SR_TXUND_Field := False;
      --  unspecified
      Reserved_7_7    : Boolean := False;
      --  RXNE
      RXNE            : SR_RXNE_Field := False;
      --  RXORDDET
      RXORDDET        : SR_RXORDDET_Field := False;
      --  RXHRSTDET
      RXHRSTDET       : SR_RXHRSTDET_Field := False;
      --  RXOVR
      RXOVR           : SR_RXOVR_Field := False;
      --  RXMSGEND
      RXMSGEND        : SR_RXMSGEND_Field := False;
      --  RXERR
      RXERR           : SR_RXERR_Field := False;
      --  TYPECEVT1
      TYPECEVT        : SR_TYPECEVT_Field :=
                         (As_Array => False, Val => 16#0#);
      --  TYPEC_VSTATE_CC1
      TYPEC_VSTATE_CC : SR_TYPEC_VSTATE_CC_Field :=
                         (As_Array => False, Val => 16#0#);
      --  FRSEVT
      FRSEVT          : SR_FRSEVT_Field := False;
      --  unspecified
      Reserved_21_31  : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      TXIS            at 0 range 0 .. 0;
      TXMSGDISC       at 0 range 1 .. 1;
      TXMSGSENT       at 0 range 2 .. 2;
      TXMSGABT        at 0 range 3 .. 3;
      HRSTDISC        at 0 range 4 .. 4;
      HRSTSENT        at 0 range 5 .. 5;
      TXUND           at 0 range 6 .. 6;
      Reserved_7_7    at 0 range 7 .. 7;
      RXNE            at 0 range 8 .. 8;
      RXORDDET        at 0 range 9 .. 9;
      RXHRSTDET       at 0 range 10 .. 10;
      RXOVR           at 0 range 11 .. 11;
      RXMSGEND        at 0 range 12 .. 12;
      RXERR           at 0 range 13 .. 13;
      TYPECEVT        at 0 range 14 .. 15;
      TYPEC_VSTATE_CC at 0 range 16 .. 19;
      FRSEVT          at 0 range 20 .. 20;
      Reserved_21_31  at 0 range 21 .. 31;
   end record;

   subtype ICR_TXMSGDISCCF_Field is Boolean;
   subtype ICR_TXMSGSENTCF_Field is Boolean;
   subtype ICR_TXMSGABTCF_Field is Boolean;
   subtype ICR_HRSTDISCCF_Field is Boolean;
   subtype ICR_HRSTSENTCF_Field is Boolean;
   subtype ICR_TXUNDCF_Field is Boolean;
   subtype ICR_RXORDDETCF_Field is Boolean;
   subtype ICR_RXHRSTDETCF_Field is Boolean;
   subtype ICR_RXOVRCF_Field is Boolean;
   subtype ICR_RXMSGENDCF_Field is Boolean;
   subtype ICR_TYPECEVT1CF_Field is Boolean;
   subtype ICR_TYPECEVT2CF_Field is Boolean;
   subtype ICR_FRSEVTCF_Field is Boolean;

   --  UCPD Interrupt Clear Register
   type ICR_Register is record
      --  unspecified
      Reserved_0_0   : Boolean := False;
      --  TXMSGDISCCF
      TXMSGDISCCF    : ICR_TXMSGDISCCF_Field := False;
      --  TXMSGSENTCF
      TXMSGSENTCF    : ICR_TXMSGSENTCF_Field := False;
      --  TXMSGABTCF
      TXMSGABTCF     : ICR_TXMSGABTCF_Field := False;
      --  HRSTDISCCF
      HRSTDISCCF     : ICR_HRSTDISCCF_Field := False;
      --  HRSTSENTCF
      HRSTSENTCF     : ICR_HRSTSENTCF_Field := False;
      --  TXUNDCF
      TXUNDCF        : ICR_TXUNDCF_Field := False;
      --  unspecified
      Reserved_7_8   : HAL.UInt2 := 16#0#;
      --  RXORDDETCF
      RXORDDETCF     : ICR_RXORDDETCF_Field := False;
      --  RXHRSTDETCF
      RXHRSTDETCF    : ICR_RXHRSTDETCF_Field := False;
      --  RXOVRCF
      RXOVRCF        : ICR_RXOVRCF_Field := False;
      --  RXMSGENDCF
      RXMSGENDCF     : ICR_RXMSGENDCF_Field := False;
      --  unspecified
      Reserved_13_13 : Boolean := False;
      --  TYPECEVT1CF
      TYPECEVT1CF    : ICR_TYPECEVT1CF_Field := False;
      --  TYPECEVT2CF
      TYPECEVT2CF    : ICR_TYPECEVT2CF_Field := False;
      --  unspecified
      Reserved_16_19 : HAL.UInt4 := 16#0#;
      --  FRSEVTCF
      FRSEVTCF       : ICR_FRSEVTCF_Field := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      TXMSGDISCCF    at 0 range 1 .. 1;
      TXMSGSENTCF    at 0 range 2 .. 2;
      TXMSGABTCF     at 0 range 3 .. 3;
      HRSTDISCCF     at 0 range 4 .. 4;
      HRSTSENTCF     at 0 range 5 .. 5;
      TXUNDCF        at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      RXORDDETCF     at 0 range 9 .. 9;
      RXHRSTDETCF    at 0 range 10 .. 10;
      RXOVRCF        at 0 range 11 .. 11;
      RXMSGENDCF     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      TYPECEVT1CF    at 0 range 14 .. 14;
      TYPECEVT2CF    at 0 range 15 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      FRSEVTCF       at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype TX_ORDSET_TXORDSET_Field is HAL.UInt20;

   --  UCPD Tx Ordered Set Type Register
   type TX_ORDSET_Register is record
      --  TXORDSET
      TXORDSET       : TX_ORDSET_TXORDSET_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TX_ORDSET_Register use record
      TXORDSET       at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype TX_PAYSZ_TXPAYSZ_Field is HAL.UInt10;

   --  UCPD Tx Paysize Register
   type TX_PAYSZ_Register is record
      --  TXPAYSZ
      TXPAYSZ        : TX_PAYSZ_TXPAYSZ_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TX_PAYSZ_Register use record
      TXPAYSZ        at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype TXDR_TXDATA_Field is HAL.UInt8;

   --  UCPD Tx Data Register
   type TXDR_Register is record
      --  TXDATA
      TXDATA        : TXDR_TXDATA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXDR_Register use record
      TXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RX_ORDSET_RXORDSET_Field is HAL.UInt3;
   subtype RX_ORDSET_RXSOP3OF4_Field is Boolean;
   subtype RX_ORDSET_RXSOPKINVALID_Field is HAL.UInt3;

   --  UCPD Rx Ordered Set Register
   type RX_ORDSET_Register is record
      --  Read-only. RXORDSET
      RXORDSET      : RX_ORDSET_RXORDSET_Field;
      --  Read-only. RXSOP3OF4
      RXSOP3OF4     : RX_ORDSET_RXSOP3OF4_Field;
      --  Read-only. RXSOPKINVALID
      RXSOPKINVALID : RX_ORDSET_RXSOPKINVALID_Field;
      --  unspecified
      Reserved_7_31 : HAL.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RX_ORDSET_Register use record
      RXORDSET      at 0 range 0 .. 2;
      RXSOP3OF4     at 0 range 3 .. 3;
      RXSOPKINVALID at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype RX_PAYSZ_RXPAYSZ_Field is HAL.UInt10;

   --  UCPD Rx Paysize Register
   type RX_PAYSZ_Register is record
      --  Read-only. RXPAYSZ
      RXPAYSZ        : RX_PAYSZ_RXPAYSZ_Field;
      --  unspecified
      Reserved_10_31 : HAL.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RX_PAYSZ_Register use record
      RXPAYSZ        at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype RXDR_RXDATA_Field is HAL.UInt8;

   --  UCPD Rx Data Register
   type RXDR_Register is record
      --  Read-only. RXDATA
      RXDATA        : RXDR_RXDATA_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXDR_Register use record
      RXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RX_ORDEXT1_RXSOPX1_Field is HAL.UInt20;

   --  UCPD Rx Ordered Set Extension Register 1
   type RX_ORDEXT1_Register is record
      --  RXSOPX1
      RXSOPX1        : RX_ORDEXT1_RXSOPX1_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RX_ORDEXT1_Register use record
      RXSOPX1        at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype RX_ORDEXT2_RXSOPX2_Field is HAL.UInt20;

   --  UCPD Rx Ordered Set Extension Register 2
   type RX_ORDEXT2_Register is record
      --  RXSOPX2
      RXSOPX2        : RX_ORDEXT2_RXSOPX2_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RX_ORDEXT2_Register use record
      RXSOPX2        at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  UCPD1
   type UCPD1_Peripheral is record
      --  UCPD configuration register 1
      CFG1       : aliased CFG1_Register;
      --  UCPD configuration register 2
      CFG2       : aliased CFG2_Register;
      --  UCPD configuration register 2
      CR         : aliased CR_Register;
      --  UCPD Interrupt Mask Register
      IMR        : aliased IMR_Register;
      --  UCPD Status Register
      SR         : aliased SR_Register;
      --  UCPD Interrupt Clear Register
      ICR        : aliased ICR_Register;
      --  UCPD Tx Ordered Set Type Register
      TX_ORDSET  : aliased TX_ORDSET_Register;
      --  UCPD Tx Paysize Register
      TX_PAYSZ   : aliased TX_PAYSZ_Register;
      --  UCPD Tx Data Register
      TXDR       : aliased TXDR_Register;
      --  UCPD Rx Ordered Set Register
      RX_ORDSET  : aliased RX_ORDSET_Register;
      --  UCPD Rx Paysize Register
      RX_PAYSZ   : aliased RX_PAYSZ_Register;
      --  UCPD Rx Data Register
      RXDR       : aliased RXDR_Register;
      --  UCPD Rx Ordered Set Extension Register 1
      RX_ORDEXT1 : aliased RX_ORDEXT1_Register;
      --  UCPD Rx Ordered Set Extension Register 2
      RX_ORDEXT2 : aliased RX_ORDEXT2_Register;
   end record
     with Volatile;

   for UCPD1_Peripheral use record
      CFG1       at 16#0# range 0 .. 31;
      CFG2       at 16#4# range 0 .. 31;
      CR         at 16#C# range 0 .. 31;
      IMR        at 16#10# range 0 .. 31;
      SR         at 16#14# range 0 .. 31;
      ICR        at 16#18# range 0 .. 31;
      TX_ORDSET  at 16#1C# range 0 .. 31;
      TX_PAYSZ   at 16#20# range 0 .. 31;
      TXDR       at 16#24# range 0 .. 31;
      RX_ORDSET  at 16#28# range 0 .. 31;
      RX_PAYSZ   at 16#2C# range 0 .. 31;
      RXDR       at 16#30# range 0 .. 31;
      RX_ORDEXT1 at 16#34# range 0 .. 31;
      RX_ORDEXT2 at 16#38# range 0 .. 31;
   end record;

   --  UCPD1
   UCPD1_Periph : aliased UCPD1_Peripheral
     with Import, Address => UCPD1_Base;

end STM32_SVD.UCPD;
