------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2015-2016, AdaCore                     --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with System; use System;
--  with ADL_Config;

with STM32_SVD.RCC; use STM32_SVD.RCC;

package body STM32.Device is

   --  HSE_VALUE : constant := ADL_Config.High_Speed_External_Clock;
   --  External oscillator in Hz

   HSI_VALUE : constant := 16_000_000;
   --  Internal oscillator in Hz

   HSE_VALUE : constant := HSI_VALUE;

   HPRE_Presc_Table : constant array (UInt4) of UInt32 :=
     (1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 8, 16, 64, 128, 256, 512);

   PPRE_Presc_Table : constant array (UInt3) of UInt32 :=
     (1, 1, 1, 1, 2, 4, 8, 16);

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : aliased in out GPIO_Port) is
   begin
      if This'Address = GPIOA_Base then
         RCC_Periph.AHB2ENR.GPIOAEN := True;
      elsif This'Address = GPIOB_Base then
         RCC_Periph.AHB2ENR.GPIOBEN := True;
      elsif This'Address = GPIOC_Base then
         RCC_Periph.AHB2ENR.GPIOCEN := True;
      elsif This'Address = GPIOD_Base then
         RCC_Periph.AHB2ENR.GPIODEN := True;
      elsif This'Address = GPIOE_Base then
         RCC_Periph.AHB2ENR.GPIOEEN := True;
      elsif This'Address = GPIOF_Base then
         RCC_Periph.AHB2ENR.GPIOFEN := True;
      elsif This'Address = GPIOG_Base then
         RCC_Periph.AHB2ENR.GPIOGEN := True;
      else
         raise Unknown_Device;
      end if;
   end Enable_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (Point : GPIO_Point)
   is
   begin
      Enable_Clock (Point.Periph.all);
   end Enable_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (Points : GPIO_Points)
   is
   begin
      for Point of Points loop
         Enable_Clock (Point.Periph.all);
      end loop;
   end Enable_Clock;

   -----------
   -- Reset --
   -----------

   procedure Reset (This : aliased in out GPIO_Port) is
   begin
      if This'Address = GPIOA_Base then
         RCC_Periph.AHB2RSTR.GPIOARST := True;
         RCC_Periph.AHB2RSTR.GPIOARST := False;
      elsif This'Address = GPIOB_Base then
         RCC_Periph.AHB2RSTR.GPIOBRST := True;
         RCC_Periph.AHB2RSTR.GPIOBRST := False;
      elsif This'Address = GPIOC_Base then
         RCC_Periph.AHB2RSTR.GPIOCRST := True;
         RCC_Periph.AHB2RSTR.GPIOCRST := False;
      elsif This'Address = GPIOD_Base then
         RCC_Periph.AHB2RSTR.GPIODRST := True;
         RCC_Periph.AHB2RSTR.GPIODRST := False;
      elsif This'Address = GPIOE_Base then
         RCC_Periph.AHB2RSTR.GPIOERST := True;
         RCC_Periph.AHB2RSTR.GPIOERST := False;
      elsif This'Address = GPIOF_Base then
         RCC_Periph.AHB2RSTR.GPIOFRST := True;
         RCC_Periph.AHB2RSTR.GPIOFRST := False;
      elsif This'Address = GPIOG_Base then
         RCC_Periph.AHB2RSTR.GPIOGRST := True;
         RCC_Periph.AHB2RSTR.GPIOGRST := False;
      else
         raise Unknown_Device;
      end if;
   end Reset;

   -----------
   -- Reset --
   -----------

   procedure Reset (Point : GPIO_Point) is
   begin
      Reset (Point.Periph.all);
   end Reset;

   -----------
   -- Reset --
   -----------

   procedure Reset (Points : GPIO_Points)
   is
      Do_Reset : Boolean;
   begin
      for J in Points'Range loop
         Do_Reset := True;
         for K in Points'First .. J - 1 loop
            if Points (K).Periph = Points (J).Periph then
               Do_Reset := False;

               exit;
            end if;
         end loop;

         if Do_Reset then
            Reset (Points (J).Periph.all);
         end if;
      end loop;
   end Reset;

   ------------------------------
   -- GPIO_Port_Representation --
   ------------------------------

   function GPIO_Port_Representation (Port : GPIO_Port) return UInt4 is
   begin
      --  TODO: rather ugly to have this board-specific range here
      if Port'Address = GPIOA_Base then
         return 0;
      elsif Port'Address = GPIOB_Base then
         return 1;
      elsif Port'Address = GPIOC_Base then
         return 2;
      elsif Port'Address = GPIOD_Base then
         return 3;
      elsif Port'Address = GPIOE_Base then
         return 4;
      elsif Port'Address = GPIOF_Base then
         return 5;
      elsif Port'Address = GPIOG_Base then
         return 6;
--        elsif Port'Address = GPIOH_Base then
--           return 7;
--        elsif Port'Address = GPIOI_Base then
--           return 8;
      else
         raise Program_Error;
      end if;
   end GPIO_Port_Representation;

   ------------------
   -- Enable_Clock --
   ------------------

--     procedure Enable_Clock (This : aliased in out Analog_To_Digital_Converter)
--     is
--     begin
--        if This'Address = ADC1_Base then
--           RCC_Periph.APB2ENR.ADC1EN := True;
--        elsif This'Address = ADC2_Base then
--           RCC_Periph.APB2ENR.ADC2EN := True;
--        elsif This'Address = ADC3_Base then
--           RCC_Periph.APB2ENR.ADC3EN := True;
--        else
--           raise Unknown_Device;
--        end if;
--     end Enable_Clock;

   -------------------------
   -- Reset_All_ADC_Units --
   -------------------------

   procedure Reset_All_ADC_Units is
   begin
      RCC_Periph.AHB2RSTR.ADC12RST := True;
      RCC_Periph.AHB2RSTR.ADC12RST := False;
      RCC_Periph.AHB2RSTR.ADC345RST := True;
      RCC_Periph.AHB2RSTR.ADC345RST := False;
   end Reset_All_ADC_Units;

   ------------------
   -- Enable_Clock --
   ------------------

--     procedure Enable_Clock (This : aliased in out Digital_To_Analog_Converter)
--     is
--        pragma Unreferenced (This);
--     begin
--        if This'Address = DAC1_Base then
--           RCC_Periph.AHB2ENR.DAC1EN := True;
--        elsif This'Address = DAC2_Base then
--           RCC_Periph.AHB2ENR.DAC2EN := True;
--        elsif This'Address = DAC3_Base then
--           RCC_Periph.AHB2ENR.DAC3EN := True;
--        elsif This'Address = DAC4_Base then
--           RCC_Periph.AHB2ENR.DAC4EN := True;
--        else
--           raise Unknown_Device;
--        end if;
--     end Enable_Clock;

   -----------
   -- Reset --
   -----------

--     procedure Reset (This : aliased in out Digital_To_Analog_Converter) is
--        pragma Unreferenced (This);
--     begin
--        if This'Address = DAC1_Base then
--           RCC_Periph.AHB2RSTR.DAC1RST := True;
--           RCC_Periph.AHB2RSTR.DAC1RST := False;
--        elsif This'Address = DAC2_Base then
--           RCC_Periph.AHB2RSTR.DAC2RST := True;
--           RCC_Periph.AHB2RSTR.DAC2RST := False;
--        elsif This'Address = DAC3_Base then
--           RCC_Periph.AHB2RSTR.DAC3RST := True;
--           RCC_Periph.AHB2RSTR.DAC3RST := False;
--        elsif This'Address = DAC4_Base then
--           RCC_Periph.AHB2RSTR.DAC4RST := True;
--           RCC_Periph.AHB2RSTR.DAC4RST := False;
--        else
--           raise Unknown_Device;
--        end if;
--        -- Not sure what to do here since there are multiple DACs #TODO
--     end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : aliased in out USART) is
   begin
      if This.Periph.all'Address = USART1_Base then
         RCC_Periph.APB2ENR.USART1EN := True;
      elsif This.Periph.all'Address = USART2_Base then
         RCC_Periph.APB1ENR1.USART2EN := True;
      elsif This.Periph.all'Address = USART3_Base then
         RCC_Periph.APB1ENR1.USART3EN := True;
      elsif This.Periph.all'Address = UART4_Base then
         RCC_Periph.APB1ENR1.UART4EN := True;
      else
         RCC_Periph.APB1ENR1.UART5EN := True;
      end if;
   end Enable_Clock;

   -----------
   -- Reset --
   -----------

   procedure Reset (This : aliased in out USART) is
   begin
      if This.Periph.all'Address = USART1_Base then
         RCC_Periph.APB2RSTR.USART1RST := True;
         RCC_Periph.APB2RSTR.USART1RST := False;
      elsif This.Periph.all'Address = USART2_Base then
         RCC_Periph.APB1RSTR1.USART2RST := True;
         RCC_Periph.APB1RSTR1.USART2RST := False;
      elsif This.Periph.all'Address = USART3_Base then
         RCC_Periph.APB1RSTR1.USART3RST := True;
         RCC_Periph.APB1RSTR1.USART3RST := False;
      elsif This.Periph.all'Address = UART4_Base then
         RCC_Periph.APB1RSTR1.UART4RST := True;
         RCC_Periph.APB1RSTR1.UART4RST := False;
      else
         RCC_Periph.APB1RSTR1.UART5RST := True;
         RCC_Periph.APB1RSTR1.UART5RST := False;
      end if;
   end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

--     procedure Enable_Clock (This : aliased in out DMA_Controller) is
--     begin
--        if This'Address = STM32_SVD.DMA1_Base then
--           RCC_Periph.AHB1ENR.DMA1EN := True;
--        elsif This'Address = STM32_SVD.DMA2_Base then
--           RCC_Periph.AHB1ENR.DMA2EN := True;
--        else
--           raise Unknown_Device;
--        end if;
--     end Enable_Clock;

   -----------
   -- Reset --
   -----------

--     procedure Reset (This : aliased in out DMA_Controller) is
--     begin
--        if This'Address = STM32_SVD.DMA1_Base then
--           RCC_Periph.AHB1RSTR.DMA1RST := True;
--           RCC_Periph.AHB1RSTR.DMA1RST := False;
--        elsif This'Address = STM32_SVD.DMA2_Base then
--           RCC_Periph.AHB1RSTR.DMA2RST := True;
--           RCC_Periph.AHB1RSTR.DMA2RST := False;
--        else
--           raise Unknown_Device;
--        end if;
--     end Reset;

   ----------------
   -- As_Port_Id --
   ----------------

--     function As_Port_Id (Port : I2C_Port'Class) return I2C_Port_Id is
--     begin
--        if Port.Periph.all'Address = I2C1_Base then
--           return I2C_Id_1;
--        elsif Port.Periph.all'Address = I2C2_Base then
--           return I2C_Id_2;
--        elsif Port.Periph.all'Address = I2C3_Base then
--           return I2C_Id_3;
--        else
--           raise Unknown_Device;
--        end if;
--     end As_Port_Id;

   ------------------
   -- Enable_Clock --
   ------------------

--     procedure Enable_Clock (This : aliased I2C_Port'Class) is
--     begin
--        Enable_Clock (As_Port_Id (This));
--     end Enable_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

--     procedure Enable_Clock (This : I2C_Port_Id) is
--     begin
--        case This is
--           when I2C_Id_1 =>
--              RCC_Periph.APB1ENR1.I2C1EN := True;
--           when I2C_Id_2 =>
--              RCC_Periph.APB1ENR1.I2C2EN := True;
--           when I2C_Id_3 =>
--              RCC_Periph.APB1ENR1.I2C3EN := True;
--           when I2C_Id_4 =>
--              RCC_Periph.APB1ENR2.I2C4EN := True;
--        end case;
--     end Enable_Clock;

   -----------
   -- Reset --
   -----------

--     procedure Reset (This : I2C_Port'Class) is
--     begin
--        Reset (As_Port_Id (This));
--     end Reset;

   -----------
   -- Reset --
   -----------

--     procedure Reset (This : I2C_Port_Id) is
--     begin
--        case This is
--           when I2C_Id_1 =>
--              RCC_Periph.APB1RSTR1.I2C1RST := True;
--              RCC_Periph.APB1RSTR1.I2C1RST := False;
--           when I2C_Id_2 =>
--              RCC_Periph.APB1RSTR1.I2C2RST := True;
--              RCC_Periph.APB1RSTR1.I2C2RST := False;
--           when I2C_Id_3 =>
--              RCC_Periph.APB1RSTR1.I2C3RST := True;
--              RCC_Periph.APB1RSTR1.I2C3RST := False;
--           when I2C_Id_4 =>
--              RCC_Periph.APB1RSTR2.I2C4RST := True;
--              RCC_Periph.APB1RSTR2.I2C4RST := False;
--        end case;
--     end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : SPI_Port'Class) is
   begin
      if This.Periph.all'Address = SPI1_Base then
         RCC_Periph.APB2ENR.SPI1EN := True;
      elsif This.Periph.all'Address = SPI2_Base then
         RCC_Periph.APB1ENR1.SPI2EN := True;
      elsif This.Periph.all'Address = SPI3_Base then
         RCC_Periph.APB1ENR1.SPI3EN := True;
      else
         RCC_Periph.APB2ENR.SPI4EN := True;
      end if;
   end Enable_Clock;

   -----------
   -- Reset --
   -----------

   procedure Reset (This : in out SPI_Port'Class) is
   begin
      if This.Periph.all'Address = SPI1_Base then
         RCC_Periph.APB2RSTR.SPI1RST := True;
         RCC_Periph.APB2RSTR.SPI1RST := False;
      elsif This.Periph.all'Address = SPI2_Base then
         RCC_Periph.APB1RSTR1.SPI2RST := True;
         RCC_Periph.APB1RSTR1.SPI2RST := False;
      elsif This.Periph.all'Address = SPI3_Base then
         RCC_Periph.APB1RSTR1.SPI3RST := True;
         RCC_Periph.APB1RSTR1.SPI3RST := False;
      else
         RCC_Periph.APB2RSTR.SPI4RST := True;
         RCC_Periph.APB2RSTR.SPI4RST := False;
      end if;
   end Reset;

   ------------------
   -- Enable_Clock --
   ------------------
   --  Not sure about this one TODO FIX:

--     procedure Enable_Clock (This : I2S_Port) is
--     begin
--        if This.Periph.all'Address = SPI1_Base then
--           RCC_Periph.APB2ENR.SPI1EN := True;
--        elsif This.Periph.all'Address = SPI2_Base
--          or else
--              This.Periph.all'Address = I2S2ext_Base
--        then
--           RCC_Periph.APB1ENR1.SPI2EN := True;
--        elsif This.Periph.all'Address = SPI3_Base
--          or else
--              This.Periph.all'Address = I2S3ext_Base
--        then
--           RCC_Periph.APB1ENR1.SPI3EN := True;
--        else
--           raise Unknown_Device;
--        end if;
--     end Enable_Clock;

   -----------
   -- Reset --
   -----------
   --  Not sure about this one TODO FIX:

--     procedure Reset (This : in out I2S_Port) is
--     begin
--        if This.Periph.all'Address = SPI1_Base then
--           RCC_Periph.APB2RSTR.SPI1RST := True;
--           RCC_Periph.APB2RSTR.SPI1RST := False;
--        elsif This.Periph.all'Address = SPI2_Base then
--           RCC_Periph.APB1RSTR1.SPI2RST := True;
--           RCC_Periph.APB1RSTR1.SPI2RST := False;
--        elsif This.Periph.all'Address = SPI3_Base then
--           RCC_Periph.APB1RSTR1.SPI3RST := True;
--           RCC_Periph.APB1RSTR1.SPI3RST := False;
--        else
--           raise Unknown_Device;
--        end if;
--     end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : in out Timer) is
   begin
      if This'Address = TIM1_Base then
         RCC_Periph.APB2ENR.TIM1EN := True;
      elsif This'Address = TIM2_Base then
         RCC_Periph.APB1ENR1.TIM2EN := True;
      elsif This'Address = TIM3_Base then
         RCC_Periph.APB1ENR1.TIM3EN := True;
      elsif This'Address = TIM4_Base then
         RCC_Periph.APB1ENR1.TIM4EN := True;
      elsif This'Address = TIM6_Base then
         RCC_Periph.APB1ENR1.TIM6EN := True;
      elsif This'Address = TIM7_Base then
         RCC_Periph.APB1ENR1.TIM7EN := True;
      elsif This'Address = TIM8_Base then
         RCC_Periph.APB2ENR.TIM8EN := True;
      elsif This'Address = TIM15_Base then
         RCC_Periph.APB2ENR.TIM15EN := True;
      elsif This'Address = TIM16_Base then
         RCC_Periph.APB2ENR.TIM16EN := True;
      elsif This'Address = TIM17_Base then
         RCC_Periph.APB2ENR.TIM17EN := True;
      elsif This'Address = TIM20_Base then
         RCC_Periph.APB2ENR.TIM20EN := True;
      else
         raise Unknown_Device;
      end if;
   end Enable_Clock;

   -----------
   -- Reset --
   -----------

   procedure Reset (This : in out Timer) is
   begin
      if This'Address = TIM1_Base then
         RCC_Periph.APB2RSTR.TIM1RST := True;
         RCC_Periph.APB2RSTR.TIM1RST := False;
      elsif This'Address = TIM2_Base then
         RCC_Periph.APB1RSTR1.TIM2RST := True;
         RCC_Periph.APB1RSTR1.TIM2RST := False;
      elsif This'Address = TIM3_Base then
         RCC_Periph.APB1RSTR1.TIM3RST := True;
         RCC_Periph.APB1RSTR1.TIM3RST := False;
      elsif This'Address = TIM4_Base then
         RCC_Periph.APB1RSTR1.TIM4RST := True;
         RCC_Periph.APB1RSTR1.TIM4RST := False;
      elsif This'Address = TIM6_Base then
         RCC_Periph.APB1RSTR1.TIM6RST := True;
         RCC_Periph.APB1RSTR1.TIM6RST := False;
      elsif This'Address = TIM7_Base then
         RCC_Periph.APB1RSTR1.TIM7RST := True;
         RCC_Periph.APB1RSTR1.TIM7RST := False;
      elsif This'Address = TIM8_Base then
         RCC_Periph.APB2RSTR.TIM8RST := True;
         RCC_Periph.APB2RSTR.TIM8RST := False;
      elsif This'Address = TIM15_Base then
         RCC_Periph.APB2RSTR.TIM15RST := True;
         RCC_Periph.APB2RSTR.TIM15RST := False;
      elsif This'Address = TIM16_Base then
         RCC_Periph.APB2RSTR.TIM16RST := True;
         RCC_Periph.APB2RSTR.TIM16RST := False;
      elsif This'Address = TIM17_Base then
         RCC_Periph.APB2RSTR.TIM17RST := True;
         RCC_Periph.APB2RSTR.TIM17RST := False;
      elsif This'Address = TIM20_Base then
         RCC_Periph.APB2RSTR.TIM20RST := True;
         RCC_Periph.APB2RSTR.TIM20RST := False;
      else
         raise Unknown_Device;
      end if;
   end Reset;

   ------------------------------
   -- System_Clock_Frequencies --
   ------------------------------

   function System_Clock_Frequencies return RCC_System_Clocks
   is
      Source       : constant UInt2 := RCC_Periph.CFGR.SWS.Val;
      Result       : RCC_System_Clocks;
   begin
      Result.I2SCLK := 0;

      case Source is
         when 1 =>
            --  HSI as source
            Result.SYSCLK := HSI_VALUE;
         when 2 =>
            --  HSE as source
            Result.SYSCLK := HSE_VALUE;
         when 3 =>
            --  PLL as source
            declare
               HSE_Source : constant Boolean := RCC_Periph.PLLCFGR.PLLSRC;
               Pllm       : constant UInt32 :=
                 UInt32 (RCC_Periph.PLLCFGR.PLLM);
               Plln       : constant
                 UInt32 :=
                   UInt32 (RCC_Periph.PLLCFGR.PLLN.Val);
               Pllp       : constant
                 UInt32 :=
                   (UInt32 (Boolean'Pos (RCC_Periph.PLLCFGR.PLLP)) + 1) * 2;  --  FIX:This is incorrect
               Pllvco     : UInt32;
            begin
               if not HSE_Source then
                  Pllvco := HSI_VALUE;
               else
                  Pllvco := HSE_VALUE;
               end if;

               Pllvco := Pllvco / Pllm;

               Result.I2SCLK := Pllvco;

               Pllvco := Pllvco * Plln;

               Result.SYSCLK := Pllvco / Pllp;
            end;
         when others =>
            Result.SYSCLK := HSI_VALUE;
      end case;

      declare
         HPRE  : constant UInt4 := RCC_Periph.CFGR.HPRE.Val;
         PPRE1 : constant UInt3 := UInt3 (RCC_Periph.CFGR.PPRE.Arr (1));
         PPRE2 : constant UInt3 := UInt3 (RCC_Periph.CFGR.PPRE.Arr (2));
      begin
         Result.HCLK  := Result.SYSCLK / HPRE_Presc_Table (HPRE);
         Result.PCLK1 := Result.HCLK / PPRE_Presc_Table (PPRE1);
         Result.PCLK2 := Result.HCLK / PPRE_Presc_Table (PPRE2);

         --  Timer clocks
         --  If the APB prescaler (PPRE1, PPRE2 in the RCC_CFGR register)
         --  is configured to a division factor of 1, TIMxCLK = PCLKx.
         --  Otherwise, the timer clock frequencies are set to twice to the
         --  frequency of the APB domain to which the timers are connected :
         --  TIMxCLK = 2xPCLKx.
         if PPRE_Presc_Table (PPRE1) = 1 then
            Result.TIMCLK1 := Result.PCLK1;
         else
            Result.TIMCLK1 := Result.PCLK1 * 2;
         end if;
         if PPRE_Presc_Table (PPRE2) = 1 then
            Result.TIMCLK2 := Result.PCLK2;
         else
            Result.TIMCLK2 := Result.PCLK2 * 2;
         end if;
      end;

      -- I2S Clock --
      if RCC_Periph.CCIPR.I2S23SEL.Val = 0 then
         --  System clock selected
         Result.I2SCLK := Result.SYSCLK;
      elsif RCC_Periph.CCIPR.I2S23SEL.Val = 2 then
         --  External clock source
         Result.I2SCLK := 0;
         raise Program_Error with "External I2S clock value is unknown";
      elsif RCC_Periph.CCIPR.I2S23SEL.Val = 3 then
         --  HSI16 clock source
         Result.I2SCLK := HSI_VALUE;
      else
         --  Pllq clock source
         declare
            Plln       : constant
              UInt32 :=
                UInt32 (RCC_Periph.PLLCFGR.PLLN.Val);
            Pllq       : constant
              UInt32 :=
                ((UInt32 (RCC_Periph.PLLCFGR.PLLQ.Val)) + 1) * 2;
         begin
            Result.I2SCLK := (Result.I2SCLK * Plln) / Pllq;
         end;
      end if;

      return Result;
   end System_Clock_Frequencies;

   --------------------
   -- PLLI2S_Enabled --
   --------------------
--  DONE maybe
   function PLLI2S_Enabled return Boolean is
     (RCC_Periph.CCIPR.I2S23SEL.Val = 1);

   ------------------------
   -- Set_PLLI2S_Factors --
   ------------------------
--  TODO: Needs to be redone

--     procedure Set_PLLI2S_Factors (Pll_N : UInt9;
--                                   Pll_R : UInt3)
--     is
--     begin
--        RCC_Periph.PLLI2SCFGR.PLLI2SNx := Pll_N;
--        RCC_Periph.PLLI2SCFGR.PLLI2SRx := Pll_R;
--     end Set_PLLI2S_Factors;

   -------------------
   -- Enable_PLLI2S --
   -------------------
--  TODO: Needs to be redone

--     procedure Enable_PLLI2S is
--     begin
--        RCC_Periph.CR.PLLI2SON := True;
--        loop
--           exit when PLLI2S_Enabled;
--        end loop;
--     end Enable_PLLI2S;

   --------------------
   -- Disable_PLLI2S --
   --------------------
--  TODO: Needs to be redone

--     procedure Disable_PLLI2S is
--     begin
--        RCC_Periph.CR.PLLI2SON := False;
--        loop
--           exit when not PLLI2S_Enabled;
--        end loop;
--     end Disable_PLLI2S;

   -----------------------
   -- Enable_DCMI_Clock --
   -----------------------

--     procedure Enable_DCMI_Clock is
--     begin
--        RCC_Periph.AHB2ENR.DCMIEN := True;
--     end Enable_DCMI_Clock;

   ----------------
   -- Reset_DCMI --
   ----------------

--     procedure Reset_DCMI is
--     begin
--        RCC_Periph.AHB2RSTR.DCMIRST := True;
--        RCC_Periph.AHB2RSTR.DCMIRST := False;
--     end Reset_DCMI;

   -----------------------
   -- Enable_FSMC_Clock --
   -----------------------

   procedure Enable_FSMC_Clock is
   begin
      STM32_SVD.RCC.RCC_Periph.AHB3ENR.FMCEN := True;
   end Enable_FSMC_Clock;

   ------------------------
   -- Disable_FSMC_Clock --
   ------------------------

   procedure Disable_FSMC_Clock is
   begin
      STM32_SVD.RCC.RCC_Periph.AHB3ENR.FMCEN := False;
   end Disable_FSMC_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

--     procedure Enable_Clock (This : in out SDMMC_Controller)
--     is
--     begin
--        if This.Periph.all'Address /= SDIO_Base then
--           raise Unknown_Device;
--        end if;

--        RCC_Periph.APB2ENR.SDIOEN := True;
--     end Enable_Clock;

   -----------
   -- Reset --
   -----------

--     procedure Reset (This : in out SDMMC_Controller)
--     is
--     begin
--        if This.Periph.all'Address /= SDIO_Base then
--           raise Unknown_Device;
--        end if;

--        RCC_Periph.APB2RSTR.SDIORST := True;
--        RCC_Periph.APB2RSTR.SDIORST := False;
--     end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : in out CRC_32) is
      pragma Unreferenced (This);
   begin
      RCC_Periph.AHB1ENR.CRCEN := True;
   end Enable_Clock;

   -------------------
   -- Disable_Clock --
   -------------------

   procedure Disable_Clock (This : in out CRC_32) is
      pragma Unreferenced (This);
   begin
      RCC_Periph.AHB1ENR.CRCEN := False;
   end Disable_Clock;

   -----------
   -- Reset --
   -----------

   procedure Reset (This : in out CRC_32) is
      pragma Unreferenced (This);
   begin
      RCC_Periph.AHB1RSTR.CRCRST := True;
      RCC_Periph.AHB1RSTR.CRCRST := False;
   end Reset;

end STM32.Device;
