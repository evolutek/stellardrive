pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.DMA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ISR_GIF1_Field is Boolean;
   subtype ISR_TCIF1_Field is Boolean;
   subtype ISR_HTIF1_Field is Boolean;
   subtype ISR_TEIF1_Field is Boolean;
   subtype ISR_GIF2_Field is Boolean;
   subtype ISR_TCIF2_Field is Boolean;
   subtype ISR_HTIF2_Field is Boolean;
   subtype ISR_TEIF2_Field is Boolean;
   subtype ISR_GIF3_Field is Boolean;
   subtype ISR_TCIF3_Field is Boolean;
   subtype ISR_HTIF3_Field is Boolean;
   subtype ISR_TEIF3_Field is Boolean;
   subtype ISR_GIF4_Field is Boolean;
   subtype ISR_TCIF4_Field is Boolean;
   subtype ISR_HTIF4_Field is Boolean;
   subtype ISR_TEIF4_Field is Boolean;
   subtype ISR_GIF5_Field is Boolean;
   subtype ISR_TCIF5_Field is Boolean;
   subtype ISR_HTIF5_Field is Boolean;
   subtype ISR_TEIF5_Field is Boolean;
   subtype ISR_GIF6_Field is Boolean;
   subtype ISR_TCIF6_Field is Boolean;
   subtype ISR_HTIF6_Field is Boolean;
   subtype ISR_TEIF6_Field is Boolean;
   subtype ISR_GIF7_Field is Boolean;
   subtype ISR_TCIF7_Field is Boolean;
   subtype ISR_HTIF7_Field is Boolean;
   subtype ISR_TEIF7_Field is Boolean;
   subtype ISR_GIF8_Field is Boolean;
   subtype ISR_TCIF8_Field is Boolean;
   subtype ISR_HTIF8_Field is Boolean;
   subtype ISR_TEIF8_Field is Boolean;

   --  interrupt status register
   type ISR_Register is record
      --  Read-only. GIF1
      GIF1  : ISR_GIF1_Field;
      --  Read-only. TCIF1
      TCIF1 : ISR_TCIF1_Field;
      --  Read-only. HTIF1
      HTIF1 : ISR_HTIF1_Field;
      --  Read-only. TEIF1
      TEIF1 : ISR_TEIF1_Field;
      --  Read-only. GIF2
      GIF2  : ISR_GIF2_Field;
      --  Read-only. TCIF2
      TCIF2 : ISR_TCIF2_Field;
      --  Read-only. HTIF2
      HTIF2 : ISR_HTIF2_Field;
      --  Read-only. TEIF2
      TEIF2 : ISR_TEIF2_Field;
      --  Read-only. GIF3
      GIF3  : ISR_GIF3_Field;
      --  Read-only. TCIF3
      TCIF3 : ISR_TCIF3_Field;
      --  Read-only. HTIF3
      HTIF3 : ISR_HTIF3_Field;
      --  Read-only. TEIF3
      TEIF3 : ISR_TEIF3_Field;
      --  Read-only. GIF4
      GIF4  : ISR_GIF4_Field;
      --  Read-only. TCIF4
      TCIF4 : ISR_TCIF4_Field;
      --  Read-only. HTIF4
      HTIF4 : ISR_HTIF4_Field;
      --  Read-only. TEIF4
      TEIF4 : ISR_TEIF4_Field;
      --  Read-only. GIF5
      GIF5  : ISR_GIF5_Field;
      --  Read-only. TCIF5
      TCIF5 : ISR_TCIF5_Field;
      --  Read-only. HTIF5
      HTIF5 : ISR_HTIF5_Field;
      --  Read-only. TEIF5
      TEIF5 : ISR_TEIF5_Field;
      --  Read-only. GIF6
      GIF6  : ISR_GIF6_Field;
      --  Read-only. TCIF6
      TCIF6 : ISR_TCIF6_Field;
      --  Read-only. HTIF6
      HTIF6 : ISR_HTIF6_Field;
      --  Read-only. TEIF6
      TEIF6 : ISR_TEIF6_Field;
      --  Read-only. GIF7
      GIF7  : ISR_GIF7_Field;
      --  Read-only. TCIF7
      TCIF7 : ISR_TCIF7_Field;
      --  Read-only. HTIF7
      HTIF7 : ISR_HTIF7_Field;
      --  Read-only. TEIF7
      TEIF7 : ISR_TEIF7_Field;
      --  Read-only. GIF8
      GIF8  : ISR_GIF8_Field;
      --  Read-only. TCIF8
      TCIF8 : ISR_TCIF8_Field;
      --  Read-only. HTIF8
      HTIF8 : ISR_HTIF8_Field;
      --  Read-only. TEIF8
      TEIF8 : ISR_TEIF8_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      GIF1  at 0 range 0 .. 0;
      TCIF1 at 0 range 1 .. 1;
      HTIF1 at 0 range 2 .. 2;
      TEIF1 at 0 range 3 .. 3;
      GIF2  at 0 range 4 .. 4;
      TCIF2 at 0 range 5 .. 5;
      HTIF2 at 0 range 6 .. 6;
      TEIF2 at 0 range 7 .. 7;
      GIF3  at 0 range 8 .. 8;
      TCIF3 at 0 range 9 .. 9;
      HTIF3 at 0 range 10 .. 10;
      TEIF3 at 0 range 11 .. 11;
      GIF4  at 0 range 12 .. 12;
      TCIF4 at 0 range 13 .. 13;
      HTIF4 at 0 range 14 .. 14;
      TEIF4 at 0 range 15 .. 15;
      GIF5  at 0 range 16 .. 16;
      TCIF5 at 0 range 17 .. 17;
      HTIF5 at 0 range 18 .. 18;
      TEIF5 at 0 range 19 .. 19;
      GIF6  at 0 range 20 .. 20;
      TCIF6 at 0 range 21 .. 21;
      HTIF6 at 0 range 22 .. 22;
      TEIF6 at 0 range 23 .. 23;
      GIF7  at 0 range 24 .. 24;
      TCIF7 at 0 range 25 .. 25;
      HTIF7 at 0 range 26 .. 26;
      TEIF7 at 0 range 27 .. 27;
      GIF8  at 0 range 28 .. 28;
      TCIF8 at 0 range 29 .. 29;
      HTIF8 at 0 range 30 .. 30;
      TEIF8 at 0 range 31 .. 31;
   end record;

   subtype IFCR_GIF1_Field is Boolean;
   subtype IFCR_TCIF1_Field is Boolean;
   subtype IFCR_HTIF1_Field is Boolean;
   subtype IFCR_TEIF1_Field is Boolean;
   subtype IFCR_GIF2_Field is Boolean;
   subtype IFCR_TCIF2_Field is Boolean;
   subtype IFCR_HTIF2_Field is Boolean;
   subtype IFCR_TEIF2_Field is Boolean;
   subtype IFCR_GIF3_Field is Boolean;
   subtype IFCR_TCIF3_Field is Boolean;
   subtype IFCR_HTIF3_Field is Boolean;
   subtype IFCR_TEIF3_Field is Boolean;
   subtype IFCR_GIF4_Field is Boolean;
   subtype IFCR_TCIF4_Field is Boolean;
   subtype IFCR_HTIF4_Field is Boolean;
   subtype IFCR_TEIF4_Field is Boolean;
   subtype IFCR_GIF5_Field is Boolean;
   subtype IFCR_TCIF5_Field is Boolean;
   subtype IFCR_HTIF5_Field is Boolean;
   subtype IFCR_TEIF5_Field is Boolean;
   subtype IFCR_GIF6_Field is Boolean;
   subtype IFCR_TCIF6_Field is Boolean;
   subtype IFCR_HTIF6_Field is Boolean;
   subtype IFCR_TEIF6_Field is Boolean;
   subtype IFCR_GIF7_Field is Boolean;
   subtype IFCR_TCIF7_Field is Boolean;
   subtype IFCR_HTIF7_Field is Boolean;
   subtype IFCR_TEIF7_Field is Boolean;
   subtype IFCR_GIF8_Field is Boolean;
   subtype IFCR_TCIF8_Field is Boolean;
   subtype IFCR_HTIF8_Field is Boolean;
   subtype IFCR_TEIF8_Field is Boolean;

   --  DMA interrupt flag clear register
   type IFCR_Register is record
      --  Write-only. GIF1
      GIF1  : IFCR_GIF1_Field := False;
      --  Write-only. TCIF1
      TCIF1 : IFCR_TCIF1_Field := False;
      --  Write-only. HTIF1
      HTIF1 : IFCR_HTIF1_Field := False;
      --  Write-only. TEIF1
      TEIF1 : IFCR_TEIF1_Field := False;
      --  Write-only. GIF2
      GIF2  : IFCR_GIF2_Field := False;
      --  Write-only. TCIF2
      TCIF2 : IFCR_TCIF2_Field := False;
      --  Write-only. HTIF2
      HTIF2 : IFCR_HTIF2_Field := False;
      --  Write-only. TEIF2
      TEIF2 : IFCR_TEIF2_Field := False;
      --  Write-only. GIF3
      GIF3  : IFCR_GIF3_Field := False;
      --  Write-only. TCIF3
      TCIF3 : IFCR_TCIF3_Field := False;
      --  Write-only. HTIF3
      HTIF3 : IFCR_HTIF3_Field := False;
      --  Write-only. TEIF3
      TEIF3 : IFCR_TEIF3_Field := False;
      --  Write-only. GIF4
      GIF4  : IFCR_GIF4_Field := False;
      --  Write-only. TCIF4
      TCIF4 : IFCR_TCIF4_Field := False;
      --  Write-only. HTIF4
      HTIF4 : IFCR_HTIF4_Field := False;
      --  Write-only. TEIF4
      TEIF4 : IFCR_TEIF4_Field := False;
      --  Write-only. GIF5
      GIF5  : IFCR_GIF5_Field := False;
      --  Write-only. TCIF5
      TCIF5 : IFCR_TCIF5_Field := False;
      --  Write-only. HTIF5
      HTIF5 : IFCR_HTIF5_Field := False;
      --  Write-only. TEIF5
      TEIF5 : IFCR_TEIF5_Field := False;
      --  Write-only. GIF6
      GIF6  : IFCR_GIF6_Field := False;
      --  Write-only. TCIF6
      TCIF6 : IFCR_TCIF6_Field := False;
      --  Write-only. HTIF6
      HTIF6 : IFCR_HTIF6_Field := False;
      --  Write-only. TEIF6
      TEIF6 : IFCR_TEIF6_Field := False;
      --  Write-only. GIF7
      GIF7  : IFCR_GIF7_Field := False;
      --  Write-only. TCIF7
      TCIF7 : IFCR_TCIF7_Field := False;
      --  Write-only. HTIF7
      HTIF7 : IFCR_HTIF7_Field := False;
      --  Write-only. TEIF7
      TEIF7 : IFCR_TEIF7_Field := False;
      --  Write-only. GIF8
      GIF8  : IFCR_GIF8_Field := False;
      --  Write-only. TCIF8
      TCIF8 : IFCR_TCIF8_Field := False;
      --  Write-only. HTIF8
      HTIF8 : IFCR_HTIF8_Field := False;
      --  Write-only. TEIF8
      TEIF8 : IFCR_TEIF8_Field := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IFCR_Register use record
      GIF1  at 0 range 0 .. 0;
      TCIF1 at 0 range 1 .. 1;
      HTIF1 at 0 range 2 .. 2;
      TEIF1 at 0 range 3 .. 3;
      GIF2  at 0 range 4 .. 4;
      TCIF2 at 0 range 5 .. 5;
      HTIF2 at 0 range 6 .. 6;
      TEIF2 at 0 range 7 .. 7;
      GIF3  at 0 range 8 .. 8;
      TCIF3 at 0 range 9 .. 9;
      HTIF3 at 0 range 10 .. 10;
      TEIF3 at 0 range 11 .. 11;
      GIF4  at 0 range 12 .. 12;
      TCIF4 at 0 range 13 .. 13;
      HTIF4 at 0 range 14 .. 14;
      TEIF4 at 0 range 15 .. 15;
      GIF5  at 0 range 16 .. 16;
      TCIF5 at 0 range 17 .. 17;
      HTIF5 at 0 range 18 .. 18;
      TEIF5 at 0 range 19 .. 19;
      GIF6  at 0 range 20 .. 20;
      TCIF6 at 0 range 21 .. 21;
      HTIF6 at 0 range 22 .. 22;
      TEIF6 at 0 range 23 .. 23;
      GIF7  at 0 range 24 .. 24;
      TCIF7 at 0 range 25 .. 25;
      HTIF7 at 0 range 26 .. 26;
      TEIF7 at 0 range 27 .. 27;
      GIF8  at 0 range 28 .. 28;
      TCIF8 at 0 range 29 .. 29;
      HTIF8 at 0 range 30 .. 30;
      TEIF8 at 0 range 31 .. 31;
   end record;

   subtype CCR_EN_Field is Boolean;
   subtype CCR_TCIE_Field is Boolean;
   subtype CCR_HTIE_Field is Boolean;
   subtype CCR_TEIE_Field is Boolean;
   subtype CCR_DIR_Field is Boolean;
   subtype CCR_CIRC_Field is Boolean;
   subtype CCR_PINC_Field is Boolean;
   subtype CCR_MINC_Field is Boolean;
   subtype CCR_PSIZE_Field is HAL.UInt2;
   subtype CCR_MSIZE_Field is HAL.UInt2;
   subtype CCR_PL_Field is HAL.UInt2;
   subtype CCR_MEM2MEM_Field is Boolean;

   --  DMA channel 1 configuration register
   type CCR_Register is record
      --  channel enable
      EN             : CCR_EN_Field := False;
      --  TCIE
      TCIE           : CCR_TCIE_Field := False;
      --  HTIE
      HTIE           : CCR_HTIE_Field := False;
      --  TEIE
      TEIE           : CCR_TEIE_Field := False;
      --  DIR
      DIR            : CCR_DIR_Field := False;
      --  CIRC
      CIRC           : CCR_CIRC_Field := False;
      --  PINC
      PINC           : CCR_PINC_Field := False;
      --  MINC
      MINC           : CCR_MINC_Field := False;
      --  PSIZE
      PSIZE          : CCR_PSIZE_Field := 16#0#;
      --  MSIZE
      MSIZE          : CCR_MSIZE_Field := 16#0#;
      --  PL
      PL             : CCR_PL_Field := 16#0#;
      --  MEM2MEM
      MEM2MEM        : CCR_MEM2MEM_Field := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      EN             at 0 range 0 .. 0;
      TCIE           at 0 range 1 .. 1;
      HTIE           at 0 range 2 .. 2;
      TEIE           at 0 range 3 .. 3;
      DIR            at 0 range 4 .. 4;
      CIRC           at 0 range 5 .. 5;
      PINC           at 0 range 6 .. 6;
      MINC           at 0 range 7 .. 7;
      PSIZE          at 0 range 8 .. 9;
      MSIZE          at 0 range 10 .. 11;
      PL             at 0 range 12 .. 13;
      MEM2MEM        at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype CNDTR_NDT_Field is HAL.UInt16;

   --  channel x number of data to transfer register
   type CNDTR_Register is record
      --  Number of data items to transfer
      NDT            : CNDTR_NDT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNDTR_Register use record
      NDT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  DMA controller
   type DMA_Peripheral is record
      --  interrupt status register
      ISR    : aliased ISR_Register;
      --  DMA interrupt flag clear register
      IFCR   : aliased IFCR_Register;
      --  DMA channel 1 configuration register
      CCR1   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR1 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR1  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR1  : aliased HAL.UInt32;
      --  DMA channel 2 configuration register
      CCR2   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR2 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR2  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR2  : aliased HAL.UInt32;
      --  DMA channel 3 configuration register
      CCR3   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR3 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR3  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR3  : aliased HAL.UInt32;
      --  DMA channel 3 configuration register
      CCR4   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR4 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR4  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR4  : aliased HAL.UInt32;
      --  DMA channel 4 configuration register
      CCR5   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR5 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR5  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR5  : aliased HAL.UInt32;
      --  DMA channel 5 configuration register
      CCR6   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR6 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR6  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR6  : aliased HAL.UInt32;
      --  DMA channel 6 configuration register
      CCR7   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR7 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR7  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR7  : aliased HAL.UInt32;
      --  DMA channel 7 configuration register
      CCR8   : aliased CCR_Register;
      --  channel x number of data to transfer register
      CNDTR8 : aliased CNDTR_Register;
      --  DMA channel x peripheral address register
      CPAR8  : aliased HAL.UInt32;
      --  DMA channel x memory address register
      CMAR8  : aliased HAL.UInt32;
   end record
     with Volatile;

   for DMA_Peripheral use record
      ISR    at 16#0# range 0 .. 31;
      IFCR   at 16#4# range 0 .. 31;
      CCR1   at 16#8# range 0 .. 31;
      CNDTR1 at 16#C# range 0 .. 31;
      CPAR1  at 16#10# range 0 .. 31;
      CMAR1  at 16#14# range 0 .. 31;
      CCR2   at 16#1C# range 0 .. 31;
      CNDTR2 at 16#20# range 0 .. 31;
      CPAR2  at 16#24# range 0 .. 31;
      CMAR2  at 16#28# range 0 .. 31;
      CCR3   at 16#30# range 0 .. 31;
      CNDTR3 at 16#34# range 0 .. 31;
      CPAR3  at 16#38# range 0 .. 31;
      CMAR3  at 16#3C# range 0 .. 31;
      CCR4   at 16#44# range 0 .. 31;
      CNDTR4 at 16#48# range 0 .. 31;
      CPAR4  at 16#4C# range 0 .. 31;
      CMAR4  at 16#50# range 0 .. 31;
      CCR5   at 16#58# range 0 .. 31;
      CNDTR5 at 16#5C# range 0 .. 31;
      CPAR5  at 16#60# range 0 .. 31;
      CMAR5  at 16#64# range 0 .. 31;
      CCR6   at 16#6C# range 0 .. 31;
      CNDTR6 at 16#70# range 0 .. 31;
      CPAR6  at 16#74# range 0 .. 31;
      CMAR6  at 16#78# range 0 .. 31;
      CCR7   at 16#80# range 0 .. 31;
      CNDTR7 at 16#84# range 0 .. 31;
      CPAR7  at 16#88# range 0 .. 31;
      CMAR7  at 16#8C# range 0 .. 31;
      CCR8   at 16#94# range 0 .. 31;
      CNDTR8 at 16#98# range 0 .. 31;
      CPAR8  at 16#9C# range 0 .. 31;
      CMAR8  at 16#A0# range 0 .. 31;
   end record;

   --  DMA controller
   DMA1_Periph : aliased DMA_Peripheral
     with Import, Address => DMA1_Base;

   --  DMA controller
   DMA2_Periph : aliased DMA_Peripheral
     with Import, Address => DMA2_Base;

end STM32_SVD.DMA;
