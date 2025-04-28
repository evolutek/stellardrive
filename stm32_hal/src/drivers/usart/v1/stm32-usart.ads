------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2015, AdaCore                           --
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
--     3. Neither the name of STMicroelectronics nor the names of its       --
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
--                                                                          --
--  This file is based on:                                                  --
--                                                                          --
--   @file    stm32f4xx_hal_spi.h                                           --
--   @author  MCD Application Team                                          --
--   @version V1.1.0                                                        --
--   @date    19-June-2014                                                  --
--   @brief   Header file of SPI HAL module.                                --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

--  This file provides definitions for the STM32F4 (ARM Cortex M4F
--  from ST Microelectronics) Universal Syncrhonous/Asyncrhonous
--  Recieve/Transmit (USART) facility.

private with STM32_SVD.USART;
with HAL.UART;
with STM32.DMA;
with STM32.DMA.Interrupts; use STM32.DMA.Interrupts;
with System;

package STM32.USART is

   type Internal_USART_Port is private;

   type USART_Port (Periph : not null access Internal_USART_Port) is
      limited new HAL.UART.UART_Port with private;

   type USART_Data_Direction is
     (RX,
      TX,
      RX_TX);

   type USART_Mode is
     (Synchronous,
      Asynchronous);

   type USART_Flow_Control is
     (No_Flow_Control,
      RTS_Flow_Control,
      CTS_Flow_Control,
      RTS_CTS_Flow_Control);

   type USART_Stop_Bits is
     (Stopbits_1,
      Stopbits_2) with Size => 2;

   for USART_Stop_Bits use
     (Stopbits_1 => 0,
      Stopbits_2 => 2#10#);

   type USART_Parity is
     (No_Parity,
      Even_Parity,
      Odd_Parity);

   type USART_Oversampling is
     (Oversampling_16x,
      Oversampling_8x);

   type USART_DMA_Configuration is record
      TX_Controller          : DMA_Interrupt_Controller_Access := null;
      TX_Channel             : DMA.DMA_Channel_Selector := DMA.Channel_0;
      TX_Priority            : DMA.DMA_Priority_Level   := DMA.Priority_Medium;
      RX_Controller          : DMA_Interrupt_Controller_Access := null;
      RX_Channel             : DMA.DMA_Channel_Selector := DMA.Channel_0;
      RX_Priority            : DMA.DMA_Priority_Level   := DMA.Priority_Medium;
   end record;

   type USART_Configuration is record
      Direction           : USART_Data_Direction    := RX_TX;
      Mode                : USART_Mode              := Asynchronous;
      Data_Size           : HAL.UART.UART_Data_Size := HAL.UART.Data_Size_8b;
      Flow_Control        : USART_Flow_Control      := No_Flow_Control;
      Stop_Bits           : USART_Stop_Bits         := Stopbits_1;
      Parity              : USART_Parity            := No_Parity;
      Oversampling        : USART_Oversampling      := Oversampling_16x;
      Baud_Rate           : UInt32;
      DMA_Config          : access USART_DMA_Configuration := null;
   end record;

   procedure Configure (This : in out USART_Port; Conf : USART_Configuration);

   procedure Enable (This : in out USART_Port);

   procedure Disable (This : in out USART_Port);

   function Enabled (This : USART_Port) return Boolean;

   procedure Send (This : in out USART_Port; Data : UInt9);

   function Data (This : USART_Port) return UInt9
     with Inline;

   procedure Send (This : in out USART_Port; Data : UInt8);

   function Data (This : USART_Port) return UInt8
     with Inline;

   function DMA_Enabled (This : USART_Port) return Boolean;

   procedure Enable_DMA
     (This : in out USART_Port;
      DMA_Config : USART_DMA_Configuration);

   procedure Disable_DMA (This : USART_Port);

   function Is_Busy (This : USART_Port) return Boolean
     with Inline;

   function Rx_Is_Empty (This : USART_Port) return Boolean
     with Inline;

   function Tx_Is_Empty (This : USART_Port) return Boolean
     with Inline;

   function Tx_Is_Complete (This : USART_Port) return Boolean
     with Inline;

   function Busy (This : USART_Port) return Boolean
     with Inline;

   function Parity_Error_Indicated (This : USART_Port) return Boolean
     with Inline;

   function Framing_Error_Indicated (This : USART_Port) return Boolean
     with Inline;

   function Start_Bit_Noise_Detected (This : USART_Port) return Boolean
     with Inline;

   function Overrun_Indicated (This : USART_Port) return Boolean
     with Inline;

   function Idle_Line_Indicated (This : USART_Port) return Boolean
     with Inline;

   function LIN_Break_Detected (This : USART_Port) return Boolean
     with Inline;

   function CTS_Interrupt_Indicated (This : USART_Port) return Boolean
     with Inline;

   function CTS_Indicated (This : USART_Port) return Boolean
     with Inline;

   function Reciever_Timeout_Indicated (This : USART_Port) return Boolean
     with Inline;

   function End_Of_Block_Indicated (This : USART_Port) return Boolean
     with Inline;

   function Auto_Baud_Rate_Failed (This : USART_Port) return Boolean
     with Inline;

   function Auto_Baud_Rate_Successful (This : USART_Port) return Boolean
     with Inline;

   function Character_Match_Indicated (This : USART_Port) return Boolean
     with Inline;

   function Send_Break_Request_Indicated (This : USART_Port) return Boolean
     with Inline;

   function Reciever_Pending_Wakeup (This : USART_Port) return Boolean
     with Inline;

   function Transmit_Enable_Acknowledged (This : USART_Port) return Boolean
     with Inline;

   procedure Clear_Overrun (This : USART_Port);

   procedure Clear_Idle (This : USART_Port);

   procedure Clear_Read_Data (This : USART_Port);

   function Is_Data_Frame_9bit (This : USART_Port) return Boolean;

   function Current_Mode (This : USART_Port) return USART_Mode;

   function Current_Data_Direction (This : USART_Port) return
     USART_Data_Direction;

   --  The following I/O routines implement the higher level functionality for
   --  data direction and status indicators, among others.

   --  type UInt8_Buffer is array (Natural range <>) of UInt8
   --    with Alignment => 2;
   --  --  The alignment is set to 2 because we treat component pairs as half_word
   --  --  values when sending/receiving in 16-bit mode.

   --  Blocking

   overriding
   function Data_Size (This : USART_Port) return HAL.UART.UART_Data_Size;

   overriding
   procedure Transmit
     (This   : in out USART_Port;
      Data   : HAL.UART.UART_Data_8b;
      Status : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Transmit
     (This   : in out USART_Port;
      Data   : HAL.UART.UART_Data_9b;
      Status : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   procedure Transmit
     (This     : in out USART_Port;
      Outgoing : UInt8);

   overriding
   procedure Receive
     (This    : in out USART_Port;
      Data    : out HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out USART_Port;
      Data    : out HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   procedure Receive
     (This     : in out USART_Port;
      Incoming : out UInt8);

  --   procedure Transmit_Receive
  --     (This      : in out USART_Port;
  --      Outgoing  : UInt8_Buffer;
  --      Incoming  : out UInt8_Buffer;
  --      Size      : Positive);

  --   procedure Transmit_Receive
  --     (This      : in out USART_Port;
  --      Outgoing  : UInt8;
  --      Incoming  : out UInt8);

   --  TODO: add the other higher-level HAL routines for interrupts and DMA

   function TX_Data_Register_Address
     (This : USART_Port)
      return System.Address;
   --  For DMA transfer

   function RX_Data_Register_Address
     (This : USART_Port)
      return System.Address;
   --  For DMA transmer

private

   type Internal_USART_Port is new STM32_SVD.USART.USART_Peripheral;

   type USART_Port (Periph : not null access Internal_USART_Port) is
     limited new HAL.UART.UART_Port with null record;

   --  procedure Send_Receive_9bit_Mode
   --    (This     : in out USART_Port;
   --     Outgoing : UInt8_Buffer;
   --     Incoming : out UInt8_Buffer;
   --     Size     : Positive);

   --  procedure Send_Receive_8bit_Mode
   --    (This     : in out USART_Port;
   --     Outgoing : UInt8_Buffer;
   --     Incoming : out UInt8_Buffer;
   --     Size     : Positive);

   procedure Send_9bit_Mode
     (This     : in out USART_Port;
      Outgoing : HAL.UART.UART_Data_9b);

   procedure Send_8bit_Mode
     (This     : in out USART_Port;
      Outgoing : HAL.UART.UART_Data_8b);

   procedure Receive_9bit_Mode
     (This     : in out USART_Port;
      Incoming : out HAL.UART.UART_Data_9b);

   procedure Receive_8bit_Mode
     (This     : in out USART_Port;
      Incoming : out HAL.UART.UART_Data_8b);

end STM32.USART;
