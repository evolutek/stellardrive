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
--   @file    stm32f4xx_hal_spi.c                                           --
--   @author  MCD Application Team                                          --
--   @version V1.1.0                                                        --
--   @date    19-June-2014                                                  --
--   @brief   SPI HAL module driver.                                        --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;

with System; use System;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32.Device; use STM32.Device;
with STM32.DMA; use STM32.DMA;

package body STM32.USART is

   use type HAL.UART.UART_Data_Size;

   --  type Half_Word_Pointer is access all UInt16
   --    with Storage_Size => 0;

   --  function As_Half_Word_Pointer is new Ada.Unchecked_Conversion
   --    (Source => System.Address, Target => Half_Word_Pointer);
   --  --  So that we can treat the address of a UInt8 as a pointer to a two-UInt8
   --  --  sequence representing a Half_Word quantity

   -------------------------------
   -- Periphial_Clock_Frequency --
   -------------------------------

   function Periphial_Clock_Frequency (
      This : in out USART_Port
   ) return UInt32 is
   begin
      if As_Port_Id (This) in USART_Id_1 | USART_Id_6 then
         return System_Clock_Frequencies.PCLK2;
      else
         return System_Clock_Frequencies.PCLK1;
      end if;
   end Periphial_Clock_Frequency;

   ---------------
   -- Configure --
   ---------------

   procedure Configure (
      This : in out USART_Port;
      Conf : USART_Configuration
   ) is
      Clock        : constant UInt32 := Periphial_Clock_Frequency (This);
      Int_Scale    : constant UInt32 := (
         if Conf.Oversampling = Oversampling_8x then 2 else 4
      );
      Int_Divider  : constant UInt32 := (
         (25 * Clock) / (Int_Scale * Conf.Baud_Rate)
      );
      Frac_Divider : constant UInt32 := Int_Divider rem 100;
   begin

      case Conf.Direction is
         when RX_TX =>
            This.Periph.CR1.RE := True;
            This.Periph.CR1.TE := True;
         when RX =>
            This.Periph.CR1.RE := True;
            This.Periph.CR1.TE := False;
         when TX =>
            This.Periph.CR1.RE := False;
            This.Periph.CR1.TE := True;
      end case;

      case Conf.Flow_Control is
         when No_Flow_Control =>
            This.Periph.CR3.RTSE := False;
            This.Periph.CR3.CTSE := False;
         when RTS_Flow_Control =>
            This.Periph.CR3.RTSE := True;
            This.Periph.CR3.CTSE := False;
         when CTS_Flow_Control =>
            This.Periph.CR3.RTSE := False;
            This.Periph.CR3.CTSE := True;
         when RTS_CTS_Flow_Control =>
            This.Periph.CR3.RTSE := True;
            This.Periph.CR3.CTSE := True;
      end case;

      case Conf.Parity is
         when No_Parity =>
            This.Periph.CR1.PCE := False;
         when Even_Parity =>
            This.Periph.CR1.PCE := True;
            This.Periph.CR1.PS := False;
         when Odd_Parity =>
            This.Periph.CR1.PCE := True;
            This.Periph.CR1.PS := True;
      end case;

      case Conf.Oversampling is
         when Oversampling_16x =>
            This.Periph.CR1.OVER8 := False;
            This.Periph.BRR.DIV_Fraction :=
               BRR_DIV_Fraction_Field (((Frac_Divider * 16) + 50) / 100 mod 8);
         when Oversampling_8x =>
            This.Periph.CR1.OVER8 := True;
            This.Periph.BRR.DIV_Fraction :=
               BRR_DIV_Fraction_Field (((Frac_Divider * 8) + 50) / 100 mod 8);
      end case;
      This.Periph.BRR.DIV_Mantissa :=
         BRR_DIV_Mantissa_Field (Int_Divider / 100);

      This.Periph.CR1.M0    := False; -- If true, data_size is 7 bits.
      This.Periph.CR1.M1    := Conf.Data_Size = HAL.UART.Data_Size_9b;
      --  Interrupt CR1 also contains interrupt configuration

      This.Periph.CR2.CLKEN := Conf.Mode = Synchronous;
      This.Periph.CR2.STOP := Conf.Stop_Bits'Enum_Rep;
   end Configure;

   ------------
   -- Enable --
   ------------

   procedure Enable (This : in out USART_Port) is
   begin
      This.Periph.CR1.UE := True;
   end Enable;

   -------------
   -- Disable --
   -------------

   procedure Disable (This : in out USART_Port) is
   begin
      This.Periph.CR1.UE := False;
   end Disable;

   -------------
   -- Enabled --
   -------------

   function Enabled (This : USART_Port) return Boolean is
   begin
      return This.Periph.CR1.UE;
   end Enabled;

   ----------
   -- Send --
   ----------

   procedure Send (This : in out USART_Port; Data : UInt9) is
   begin
      This.Periph.TDR.TDR := Data;
   end Send;

   ----------
   -- Data --
   ----------

   function Data (This : USART_Port) return UInt9 is
   begin
      return This.Periph.RDR.RDR;
   end Data;

   ----------
   -- Send --
   ----------

   procedure Send (This : in out USART_Port; Data : UInt8) is
   begin
      Send (This, UInt9 (Data));
   end Send;

   ----------
   -- Data --
   ----------

   function Data (This : USART_Port) return UInt8 is
   begin
      return UInt8 (UInt9'(Data (This)));
   end Data;

   -----------------
   -- DMA_Enabled --
   -----------------

   function DMA_Enabled (This : USART_Port) return Boolean is
   begin
      return This.Periph.CR3.DMAR or else This.Periph.CR3.DMAT;
   end DMA_Enabled;

   ----------------
   -- Enable_DMA --
   ----------------

   procedure Enable_DMA (
      This : in out USART_Port;
      DMA_Config : USART_DMA_Configuration
   ) is
      DMA_P  : DMA.DMA_Controller      renames DMA_1;
      TX_Stream_Config : DMA.DMA_Stream_Configuration;
      RX_Stream_Config : DMA.DMA_Stream_Configuration;
   begin
      This.Periph.CR3.DMAR := This.Periph.CR1.RE;
      This.Periph.CR3.DMAT := This.Periph.CR1.TE;

      TX_Stream_Config.Channel := DMA_Config.TX_Channel;
      TX_Stream_Config.Direction := DMA.Memory_To_Peripheral;
      TX_Stream_Config.Increment_Memory_Address := True;
      TX_Stream_Config.Operation_Mode := DMA.Peripheral_Flow_Control_Mode;
      TX_Stream_Config.Priority := DMA_Config.TX_Priority;

      RX_Stream_Config.Channel := DMA_Config.RX_Channel;
      RX_Stream_Config.Direction := DMA.Peripheral_To_Memory;
      RX_Stream_Config.Increment_Memory_Address := True;
      RX_Stream_Config.Operation_Mode := DMA.Peripheral_Flow_Control_Mode;
      RX_Stream_Config.Priority := DMA_Config.RX_Priority;

      DMA.Configure (DMA_P, DMA_Config.TX_Controller.Stream, TX_Stream_Config);
      DMA.Configure (DMA_P, DMA_Config.RX_Controller.Stream, RX_Stream_Config);
   end Enable_DMA;

   -----------------
   -- Disable DMA --
   -----------------

   procedure Disable_DMA (This : USART_Port) is
   begin
      This.Periph.CR3.DMAR := False;
      This.Periph.CR3.DMAT := False;
   end Disable_DMA;

   -------------
   -- Is_Busy --
   -------------

   function Is_Busy (This : USART_Port) return Boolean is
   begin
      return (Rx_Is_Empty (This)
              and then not Tx_Is_Complete (This))
        or else Busy (This);
   end Is_Busy;

   -----------------
   -- Tx_Is_Empty --
   -----------------

   function Tx_Is_Empty (This : USART_Port) return Boolean is
   begin
      return This.Periph.ISR.TXE;
   end Tx_Is_Empty;

   -----------------
   -- Tx_Is_Empty --
   -----------------

   function Tx_Is_Complete (This : USART_Port) return Boolean is
   begin
      return This.Periph.ISR.TC;
   end Tx_Is_Complete;

   -----------------
   -- Rx_Is_Empty --
   -----------------

   function Rx_Is_Empty (This : USART_Port) return Boolean is
   begin
      return not This.Periph.ISR.RXNE;
   end Rx_Is_Empty;

   ----------
   -- Busy --
   ----------

   function Busy (This : USART_Port) return Boolean is
   begin
      return This.Periph.ISR.BUSY;
   end Busy;

   ------------------
   -- Current_Mode --
   ------------------

   function Current_Mode (This : USART_Port) return USART_Mode is
   begin
      if This.Periph.CR2.CLKEN then
         return Synchronous;
      else
         return Asynchronous;
      end if;
   end Current_Mode;

   ----------------------------
   -- Current_Data_Direction --
   ----------------------------

   function Current_Data_Direction (
      This : USART_Port
   ) return USART_Data_Direction
   is
   begin
      if This.Periph.CR1.TE and then This.Periph.CR1.RE then
         return RX_TX;
      elsif This.Periph.CR1.TE then
         return TX;
      else
         return RX;
      end if;
   end Current_Data_Direction;

   ----------------------------
   -- Parity_Error_Indicated --
   ----------------------------

   function Parity_Error_Indicated (This : USART_Port) return Boolean is
     (This.Periph.ISR.PE);

   -----------------------------
   -- Framing_Error_Indicated --
   -----------------------------

   function Framing_Error_Indicated (This : USART_Port) return Boolean is
     (This.Periph.ISR.FE);

   ------------------------------
   -- Start_Bit_Noise_Detected --
   ------------------------------

   function Start_Bit_Noise_Detected (This : USART_Port) return Boolean is
      (This.Periph.ISR.NF);

   -----------------------
   -- Overrun_Indicated --
   -----------------------

   function Overrun_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.ORE);

   -------------------------
   -- Idle_Line_Indicated --
   -------------------------

   function Idle_Line_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.IDLE);

   ------------------------
   -- LIN_Break_Detected --
   ------------------------

   function LIN_Break_Detected (This : USART_Port) return Boolean is
      (This.Periph.ISR.LBDF);

   -----------------------------
   -- CTS_Interrupt_Indicated --
   -----------------------------

   function CTS_Interrupt_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.CTSIF);

   -------------------
   -- CTS_Indicated --
   -------------------

   function CTS_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.CTS);

   --------------------------------
   -- Reciever_Timeout_Indicated --
   --------------------------------

   function Reciever_Timeout_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.RTOF);

   ----------------------------
   -- End_Of_Block_Indicated --
   ----------------------------

   function End_Of_Block_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.EOBF);

   ---------------------------
   -- Auto_Baud_Rate_Failed --
   ---------------------------

   function Auto_Baud_Rate_Failed (This : USART_Port) return Boolean is
      (This.Periph.ISR.ABRE);

   -------------------------------
   -- Auto_Baud_Rate_Successful --
   -------------------------------

   function Auto_Baud_Rate_Successful (This : USART_Port) return Boolean is
      (This.Periph.ISR.ABRF);

   -------------------------------
   -- Character_Match_Indicated --
   -------------------------------

   function Character_Match_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.CMF);

   ----------------------------------
   -- Send_Break_Request_Indicated --
   ----------------------------------

   function Send_Break_Request_Indicated (This : USART_Port) return Boolean is
      (This.Periph.ISR.SBKF);

   -----------------------------
   -- Reciever_Pending_Wakeup --
   -----------------------------

   function Reciever_Pending_Wakeup (This : USART_Port) return Boolean is
      (This.Periph.ISR.RWU);

   ----------------------------------
   -- Transmit_Enable_Acknowledged --
   ----------------------------------

   function Transmit_Enable_Acknowledged (This : USART_Port) return Boolean is
      (This.Periph.ISR.TEACK);

   -------------------
   -- Clear_Overrun --
   -------------------

   procedure Clear_Overrun (This : USART_Port) is
   begin
      This.Periph.ICR.ORECF := True;
   end Clear_Overrun;

   ----------------
   -- Clear_Idle --
   ----------------

   procedure Clear_Idle (This : USART_Port) is
   begin
      This.Periph.ICR.IDLECF := True;
   end Clear_Idle;

   ---------------------
   -- Clear_Read_Data --
   ---------------------

   procedure Clear_Read_Data (This : USART_Port) is
   begin
      This.Periph.RQR.RXFRQ := True;
   end Clear_Read_Data;

   -------------------------
   -- Is_Data_Frame_9bit --
   -------------------------

   function Is_Data_Frame_9bit (This : USART_Port) return Boolean is
      (This.Periph.CR1.M1);

   ---------------
   -- Data_Size --
   ---------------

   overriding
   function Data_Size (This : USART_Port) return HAL.UART.UART_Data_Size is
   begin
      if This.Periph.CR1.M1 then
         return HAL.UART.Data_Size_9b;
      else
         return HAL.UART.Data_Size_8b;
      end if;
   end Data_Size;

   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit
     (This    : in out USART_Port;
      Data    : HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Timeout);
   begin
      if not Enabled (This) then
         Enable (This);
      end if;

      if not Tx_Is_Complete (This) then
         --  Transmission is already ongoing (likely through interrupts or DMA)
         Status := HAL.UART.Busy;
         return;
      end if;

      Send_8bit_Mode (This, Data);

      --  Wait until TC flag is set to indicate end of transmission
      loop
         exit when Tx_Is_Complete (This);
      end loop;

      Status := HAL.UART.Ok;
   end Transmit;

   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit
     (This    : in out USART_Port;
      Data    : HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Timeout);
   begin
      if not Enabled (This) then
         Enable (This);
      end if;

      Send_9bit_Mode (This, Data);

      --  Wait until TC flag is set to indicate end of transmission
      loop
         exit when Tx_Is_Complete (This);
      end loop;

      Status := HAL.UART.Ok;
   end Transmit;

   --------------
   -- Transmit --
   --------------

   procedure Transmit
     (This     : in out USART_Port;
      Outgoing : UInt8)
   is
   begin
      Clear_Overrun (This);

      if not Enabled (This) then
         Enable (This);
      end if;

      This.Periph.TDR.TDR := UInt9 (Outgoing);

      --  Wait until TC flag is set to indicate end of transmission
      loop
         exit when Tx_Is_Complete (This);
      end loop;

      Clear_Overrun (This);
   end Transmit;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive
     (This    : in out USART_Port;
      Data    : out HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Timeout);
   begin
      Clear_Overrun (This);

      if not Enabled (This) then
         Enable (This);
      end if;

      Receive_8bit_Mode (This, Data);

      --  Wait until BUSY flag is unset to indicate end of reception
      loop
         exit when not Busy (This);
      end loop;

      --  Return final transmission status
      if Overrun_Indicated (This) then
         Status := HAL.UART.Err_Error;
      else
         Status := HAL.UART.Ok;
      end if;
   end Receive;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive
     (This    : in out USART_Port;
      Data    : out HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Timeout);
   begin
      Clear_Overrun (This);

      if not Enabled (This) then
         Enable (This);
      end if;

      Receive_9bit_Mode (This, Data);

      --  Wait until BUSY flag is unset to indicate end of reception
      loop
         exit when not Busy (This);
      end loop;

      --  Return final transmission status
      if Overrun_Indicated (This) then
         Status := HAL.UART.Err_Error;
      else
         Status := HAL.UART.Ok;
      end if;
   end Receive;

   -------------
   -- Receive --
   -------------

   procedure Receive
     (This     : in out USART_Port;
      Incoming : out UInt8)
   is
   begin

      if not Enabled (This) then
         Enable (This);
      end if;

      loop
         exit when not Rx_Is_Empty (This);
      end loop;

      Incoming := UInt8 (This.Periph.RDR.RDR);
   end Receive;

   --  ----------------------
   --  -- Transmit_Receive --
   --  ----------------------

   --  procedure Transmit_Receive
   --    (This     : in out SPI_Port;
   --     Outgoing : UInt8_Buffer;
   --     Incoming : out UInt8_Buffer;
   --     Size     : Positive)
   --  is
   --  begin
   --     if not Enabled (This) then
   --        Enable (This);
   --     end if;

   --     if Is_Data_Frame_16bit (This) then
   --        Send_Receive_16bit_Mode (This, Outgoing, Incoming, Size);
   --     else
   --        Send_Receive_8bit_Mode (This, Outgoing, Incoming, Size);
   --     end if;

   --     while Busy (This) loop
   --        null;
   --     end loop;
   --  end Transmit_Receive;

   --  ----------------------
   --  -- Transmit_Receive --
   --  ----------------------

   --  procedure Transmit_Receive
   --    (This     : in out SPI_Port;
   --     Outgoing : UInt8;
   --     Incoming : out UInt8)
   --  is
   --  begin

   --     if not Enabled (This) then
   --        Enable (This);
   --     end if;

   --     if Is_Data_Frame_16bit (This) then
   --        raise Program_Error;
   --     end if;

   --     This.Periph.DR.DR := UInt16 (Outgoing);

   --     --  wait until data is received
   --     while Rx_Is_Empty (This) loop
   --        null;
   --     end loop;

   --     Incoming := UInt8 (This.Periph.DR.DR);

   --     while Busy (This) loop
   --        null;
   --     end loop;
   --  end Transmit_Receive;

   ------------------------------
   -- TX_Data_Register_Address --
   ------------------------------

   function TX_Data_Register_Address
     (This : USART_Port)
      return System.Address
   is
   begin
      return This.Periph.TDR'Address;
   end TX_Data_Register_Address;

   ------------------------------
   -- RX_Data_Register_Address --
   ------------------------------

   function RX_Data_Register_Address
     (This : USART_Port)
      return System.Address
   is
   begin
      return This.Periph.RDR'Address;
   end RX_Data_Register_Address;

   --  -----------------------------
   --  -- Send_Receive_16bit_Mode --
   --  -----------------------------

   --  procedure Send_Receive_9bit_Mode
   --    (This     : in out SPI_Port;
   --     Outgoing : UInt8_Buffer;
   --     Incoming : out UInt8_Buffer;
   --     Size     : Positive)
   --  is
   --     Tx_Count : Natural := Size;
   --     Outgoing_Index : Natural := Outgoing'First;
   --     Incoming_Index : Natural := Incoming'First;
   --  begin
   --     if Current_Mode (This) = Slave or else Tx_Count = 1 then
   --        This.Periph.DR.DR :=
   --          As_Half_Word_Pointer (Outgoing (Outgoing_Index)'Address).all;
   --        Outgoing_Index := Outgoing_Index + 2;
   --        Tx_Count := Tx_Count - 1;
   --     end if;

   --     if Tx_Count = 0 then

   --        --  wait until data is received
   --        while Rx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        As_Half_Word_Pointer (Incoming (Incoming_Index)'Address).all :=
   --          This.Periph.DR.DR;

   --        return;
   --     end if;

   --     while Tx_Count > 0 loop
   --        --  wait until we can send data
   --        while not Tx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        This.Periph.DR.DR :=
   --          As_Half_Word_Pointer (Outgoing (Outgoing_Index)'Address).all;
   --        Outgoing_Index := Outgoing_Index + 2;
   --        Tx_Count := Tx_Count - 1;

   --        --  wait until data is received
   --        while Rx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        As_Half_Word_Pointer (Incoming (Incoming_Index)'Address).all :=
   --          This.Periph.DR.DR;
   --        Incoming_Index := Incoming_Index + 2;
   --     end loop;

   --     --  receive the last UInt8
   --     if Current_Mode (This) = Slave then
   --        --  wait until data is received
   --        while Rx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        As_Half_Word_Pointer (Incoming (Incoming_Index)'Address).all :=
   --          This.Periph.DR.DR;
   --     end if;
   --  end Send_Receive_9bit_Mode;

   --  ----------------------------
   --  -- Send_Receive_8bit_Mode --
   --  ----------------------------

   --  procedure Send_Receive_8bit_Mode
   --    (This     : in out SPI_Port;
   --     Outgoing : UInt8_Buffer;
   --     Incoming : out UInt8_Buffer;
   --     Size     : Positive)
   --  is
   --     Tx_Count : Natural := Size;
   --     Outgoing_Index : Natural := Outgoing'First;
   --     Incoming_Index : Natural := Incoming'First;
   --  begin
   --     if Current_Mode (This) = Slave or else Tx_Count = 1 then
   --        This.Periph.DR.DR := UInt16 (Outgoing (Outgoing_Index));
   --        Outgoing_Index := Outgoing_Index + 1;
   --        Tx_Count := Tx_Count - 1;
   --     end if;

   --     if Tx_Count = 0 then

   --        --  wait until data is received
   --        while Rx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        Incoming (Incoming_Index) := UInt8 (This.Periph.DR.DR);

   --        return;

   --     end if;

   --     while Tx_Count > 0 loop
   --        --  wait until we can send data
   --        while not Tx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        This.Periph.DR.DR := UInt16 (Outgoing (Outgoing_Index));
   --        Outgoing_Index := Outgoing_Index + 1;
   --        Tx_Count := Tx_Count - 1;

   --        --  wait until data is received
   --        while Rx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        Incoming (Incoming_Index) := UInt8 (This.Periph.DR.DR);
   --        Incoming_Index := Incoming_Index + 1;
   --     end loop;

   --     if Current_Mode (This) = Slave then
   --        --  wait until data is received
   --        while Rx_Is_Empty (This) loop
   --           null;
   --        end loop;

   --        Incoming (Incoming_Index) := Data (This);
   --     end if;
   --  end Send_Receive_8bit_Mode;

   ---------------------
   -- Send_16bit_Mode --
   ---------------------

   procedure Send_9bit_Mode
     (This     : in out USART_Port;
      Outgoing : HAL.UART.UART_Data_9b)
   is
   begin
      for K of Outgoing loop
         --  wait until we can send data
         loop
            exit when Tx_Is_Empty (This);
         end loop;

         This.Periph.TDR.TDR := K;
      end loop;
   end Send_9bit_Mode;

   --------------------
   -- Send_8bit_Mode --
   --------------------

   procedure Send_8bit_Mode
     (This     : in out USART_Port;
      Outgoing : HAL.UART.UART_Data_8b)
   is
   begin
      for K of Outgoing loop
         --  wait until we can send data
         loop
            exit when Tx_Is_Empty (This);
         end loop;

         This.Periph.TDR.TDR := UInt9 (K);
      end loop;
   end Send_8bit_Mode;

   ------------------------
   -- Receive_16bit_Mode --
   ------------------------

   procedure Receive_9bit_Mode
     (This     : in out USART_Port;
      Incoming : out HAL.UART.UART_Data_9b)
   is
   begin
      for K of Incoming loop
         loop
            exit when not Rx_Is_Empty (This);
         end loop;
         K := This.Periph.RDR.RDR;
      end loop;
   end Receive_9bit_Mode;

   -----------------------
   -- Receive_8bit_Mode --
   -----------------------

   procedure Receive_8bit_Mode
     (This     : in out USART_Port;
      Incoming : out HAL.UART.UART_Data_8b)
   is
   begin
      for K of Incoming loop
         loop
            exit when not Rx_Is_Empty (This);
         end loop;
         K := UInt8 (This.Periph.RDR.RDR);
      end loop;
   end Receive_8bit_Mode;

end STM32.USART;
