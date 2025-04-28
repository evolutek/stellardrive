
with System; use System;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32.Device; use STM32.Device;
with STM32.DMA; use STM32.DMA;

package body STM32.USART.DMA is

   overriding
   procedure Configure
     (This : in out USART_Port_DMA;
      Conf : USART_Configuration)
   is
   begin
      Configure (USART_Port (This), Conf);

      if Conf.DMA_Config /= null then
         This.Enable_DMA (Conf.DMA_Config.all);
      end if;
   end Configure;

   ----------------
   -- Enable_DMA --
   ----------------

   overriding
   procedure Enable_DMA (
      This : in out USART_Port_DMA;
      DMA_Config : USART_DMA_Configuration
   ) is
   begin
      Enable_DMA (USART_Port (This), DMA_Config);

      This.TX_Controller := DMA_Config.TX_Controller;
      This.RX_Controller := DMA_Config.RX_Controller;
   end Enable_DMA;

   ---------------------------
   -- Set_Polling_Threshold --
   ---------------------------

   procedure Set_Transmit_Polling_Threshold
     (This      : in out USART_Port_DMA;
      Threshold : Natural)
   is
   begin
      This.TX_Threshold := Threshold;
   end Set_Transmit_Polling_Threshold;

   procedure Set_Receive_Polling_Threshold
     (This      : in out USART_Port_DMA;
      Threshold : Natural)
   is
   begin
      This.RX_Threshold := Threshold;
   end Set_Receive_Polling_Threshold;

   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit
     (This    : in out USART_Port_DMA;
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

      if not This.Periph.CR3.DMAT or else Data'Length < This.TX_Threshold then
         Send_8bit_Mode (This, Data);

         --  Wait until TC flag is set to indicate end of transmission
         loop
            exit when Tx_Is_Complete (This);
         end loop;

         Status := HAL.UART.Ok;
      else
         declare
            DMA_Status : DMA_Error_Code;
         begin
            --  Clear previous transmission complete flag for DMA periphial
            This.Periph.ICR.TCCF := True;

            This.TX_Controller.Start_Transfer
              (Source      => Data'Address,
               Destination => This.TX_Data_Register_Address,
               Data_Count  => Data'Length);

            --  TODO: move this somewhere, also add timeout
            This.TX_Controller.Wait_For_Completion (DMA_Status);

            case DMA_Status is
               when DMA_No_Error => Status := HAL.UART.Ok;
               when DMA_Timeout_Error => Status := HAL.UART.Err_Timeout;
               when others => Status := HAL.UART.Err_Error;
            end case;
         end;
      end if;
   end Transmit;

   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit
     (This    : in out USART_Port_DMA;
      Data    : HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Timeout);
   begin
      if not Enabled (This) then
         Enable (This);
      end if;

      if not This.Periph.CR3.DMAT or else Data'Length < This.TX_Threshold then
         Send_9bit_Mode (This, Data);

         --  Wait until TC flag is set to indicate end of transmission
         loop
            exit when Tx_Is_Complete (This);
         end loop;

         Status := HAL.UART.Ok;
      else
         declare
            DMA_Status : DMA_Error_Code;
         begin
            --  Clear previous transmission complete flag for DMA periphial
            This.Periph.ICR.TCCF := True;

            This.TX_Controller.Start_Transfer
              (Source      => Data'Address,
               Destination => This.TX_Data_Register_Address,
               Data_Count  => Data'Length);

            --  TODO: move this somewhere, also add timeout
            This.TX_Controller.Wait_For_Completion (DMA_Status);

            case DMA_Status is
               when DMA_No_Error => Status := HAL.UART.Ok;
               when DMA_Timeout_Error => Status := HAL.UART.Err_Timeout;
               when others => Status := HAL.UART.Err_Error;
            end case;
         end;
      end if;
   end Transmit;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive
     (This    : in out USART_Port_DMA;
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

      if not This.Periph.CR3.DMAR or else Data'Length < This.RX_Threshold then
         Receive_8bit_Mode (This, Data);

         --  Wait until BUSY flag is unset to indicate end of reception
         loop
            exit when not Busy (This);
         end loop;

         --  Status is by default OK, unless overrun is detected
         Status := HAL.UART.Ok;
      else
         declare
            DMA_Status : DMA_Error_Code;
         begin
            --  No interrupt to clear for receive

            This.RX_Controller.Start_Transfer
              (Source      => This.RX_Data_Register_Address,
               Destination => Data'Address,
               Data_Count  => Data'Length);

            This.RX_Controller.Wait_For_Completion (DMA_Status);

            case DMA_Status is
               when DMA_No_Error => Status := HAL.UART.Ok;
               when DMA_Timeout_Error => Status := HAL.UART.Err_Timeout;
               when others => Status := HAL.UART.Err_Error;
            end case;
         end;
      end if;

      --  Return final transmission status
      if Overrun_Indicated (This) then
         Status := HAL.UART.Err_Error;
      end if;
   end Receive;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive
     (This    : in out USART_Port_DMA;
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

      if not This.Periph.CR3.DMAR or else Data'Length < This.RX_Threshold then
         Receive_9bit_Mode (This, Data);

         --  Wait until BUSY flag is unset to indicate end of reception
         loop
            exit when not Busy (This);
         end loop;

         --  Status is by default OK, unless overrun is detected
         Status := HAL.UART.Ok;
      else
         declare
            DMA_Status : DMA_Error_Code;
         begin
            --  No interrupt to clear for receive

            This.RX_Controller.Start_Transfer
              (Source      => This.RX_Data_Register_Address,
               Destination => Data'Address,
               Data_Count  => Data'Length);

            This.RX_Controller.Wait_For_Completion (DMA_Status);

            case DMA_Status is
               when DMA_No_Error => Status := HAL.UART.Ok;
               when DMA_Timeout_Error => Status := HAL.UART.Err_Timeout;
               when others => Status := HAL.UART.Err_Error;
            end case;
         end;
      end if;

      --  Return final transmission status
      if Overrun_Indicated (This) then
         Status := HAL.UART.Err_Error;
      end if;
   end Receive;

   --------------
   -- Abortion --
   --------------

   procedure Abort_Transmit
     (This : in out USART_Port_DMA;
      Status : out HAL.UART.UART_Status)
   is
      Result : DMA_Error_Code;
   begin
      This.TX_Controller.Abort_Transfer (Result);

      if Result = DMA_Timeout_Error then
         Status := HAL.UART.Err_Timeout;
      end if;
   end Abort_Transmit;

   procedure Abort_Receive
     (This : in out USART_Port_DMA;
      Status : out HAL.UART.UART_Status)
   is
      Result : DMA_Error_Code;
   begin
      This.RX_Controller.Abort_Transfer (Result);

      if Result = DMA_Timeout_Error then
         Status := HAL.UART.Err_Timeout;
      end if;
   end Abort_Receive;

end STM32.USART.DMA;