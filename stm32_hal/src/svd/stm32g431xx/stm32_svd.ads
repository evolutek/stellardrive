pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G431xx.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  STM32G431
package STM32_SVD is
   pragma Preelaborate;

   --------------------
   -- Base addresses --
   --------------------

   CRC_Base : constant System.Address := System'To_Address (16#40023000#);
   IWDG_Base : constant System.Address := System'To_Address (16#40003000#);
   WWDG_Base : constant System.Address := System'To_Address (16#40002C00#);
   I2C1_Base : constant System.Address := System'To_Address (16#40005400#);
   I2C2_Base : constant System.Address := System'To_Address (16#40005800#);
   I2C3_Base : constant System.Address := System'To_Address (16#40007800#);
   FLASH_Base : constant System.Address := System'To_Address (16#40022000#);
   DBGMCU_Base : constant System.Address := System'To_Address (16#E0042000#);
   RCC_Base : constant System.Address := System'To_Address (16#40021000#);
   PWR_Base : constant System.Address := System'To_Address (16#40007000#);
   RNG_Base : constant System.Address := System'To_Address (16#50060800#);
   AES_Base : constant System.Address := System'To_Address (16#50060000#);
   GPIOA_Base : constant System.Address := System'To_Address (16#48000000#);
   GPIOB_Base : constant System.Address := System'To_Address (16#48000400#);
   GPIOC_Base : constant System.Address := System'To_Address (16#48000800#);
   GPIOD_Base : constant System.Address := System'To_Address (16#48000C00#);
   GPIOE_Base : constant System.Address := System'To_Address (16#48001000#);
   GPIOF_Base : constant System.Address := System'To_Address (16#48001400#);
   GPIOG_Base : constant System.Address := System'To_Address (16#48001800#);
   TIM15_Base : constant System.Address := System'To_Address (16#40014000#);
   TIM16_Base : constant System.Address := System'To_Address (16#40014400#);
   TIM17_Base : constant System.Address := System'To_Address (16#40014800#);
   TIM1_Base : constant System.Address := System'To_Address (16#40012C00#);
   TIM8_Base : constant System.Address := System'To_Address (16#40013400#);
   TIM20_Base : constant System.Address := System'To_Address (16#40015000#);
   TIM2_Base : constant System.Address := System'To_Address (16#40000000#);
   TIM3_Base : constant System.Address := System'To_Address (16#40000400#);
   TIM4_Base : constant System.Address := System'To_Address (16#40000800#);
   TIM6_Base : constant System.Address := System'To_Address (16#40001000#);
   TIM7_Base : constant System.Address := System'To_Address (16#40001400#);
   LPTIMER1_Base : constant System.Address := System'To_Address (16#40007C00#);
   USART1_Base : constant System.Address := System'To_Address (16#40013800#);
   USART2_Base : constant System.Address := System'To_Address (16#40004400#);
   USART3_Base : constant System.Address := System'To_Address (16#40004800#);
   UART4_Base : constant System.Address := System'To_Address (16#40004C00#);
   LPUART1_Base : constant System.Address := System'To_Address (16#40008000#);
   SPI1_Base : constant System.Address := System'To_Address (16#40013000#);
   SPI3_Base : constant System.Address := System'To_Address (16#40003C00#);
   SPI2_Base : constant System.Address := System'To_Address (16#40003800#);
   EXTI_Base : constant System.Address := System'To_Address (16#40010400#);
   RTC_Base : constant System.Address := System'To_Address (16#40002800#);
   DMA1_Base : constant System.Address := System'To_Address (16#40020000#);
   DMA2_Base : constant System.Address := System'To_Address (16#40020400#);
   DMAMUX_Base : constant System.Address := System'To_Address (16#40020800#);
   SYSCFG_Base : constant System.Address := System'To_Address (16#40010000#);
   VREFBUF_Base : constant System.Address := System'To_Address (16#40010030#);
   COMP_Base : constant System.Address := System'To_Address (16#40010200#);
   OPAMP_Base : constant System.Address := System'To_Address (16#40010300#);
   DAC1_Base : constant System.Address := System'To_Address (16#50000800#);
   DAC2_Base : constant System.Address := System'To_Address (16#50000C00#);
   DAC3_Base : constant System.Address := System'To_Address (16#50001000#);
   DAC4_Base : constant System.Address := System'To_Address (16#50001400#);
   ADC1_Base : constant System.Address := System'To_Address (16#50000000#);
   ADC2_Base : constant System.Address := System'To_Address (16#50000100#);
   ADC12_Common_Base : constant System.Address := System'To_Address (16#50000300#);
   ADC345_Common_Base : constant System.Address := System'To_Address (16#50000700#);
   FMAC_Base : constant System.Address := System'To_Address (16#40021400#);
   CORDIC_Base : constant System.Address := System'To_Address (16#40020C00#);
   SAI_Base : constant System.Address := System'To_Address (16#40015400#);
   TAMP_Base : constant System.Address := System'To_Address (16#40002400#);
   FDCAN_Base : constant System.Address := System'To_Address (16#4000A400#);
   FDCAN1_Base : constant System.Address := System'To_Address (16#40006400#);
   UCPD1_Base : constant System.Address := System'To_Address (16#4000A000#);
   USB_FS_device_Base : constant System.Address := System'To_Address (16#40005C00#);
   CRS_Base : constant System.Address := System'To_Address (16#40002000#);

end STM32_SVD;
