
with HAL.UART;

package STM32.USART.DMA is

   type USART_Port_DMA is limited new USART_Port with private;

   procedure Set_Transmit_Polling_Threshold
     (This      : in out USART_Port_DMA;
      Threshold : Natural);
   procedure Set_Receive_Polling_Threshold
     (This      : in out USART_Port_DMA;
      Threshold : Natural);

   overriding
   procedure Configure
     (This : in out USART_Port_DMA;
      Conf : USART_Configuration);

   overriding
   procedure Enable_DMA
     (This : in out USART_Port_DMA;
      DMA_Config : USART_DMA_Configuration);

   overriding
   procedure Transmit
     (This   : in out USART_Port_DMA;
      Data   : HAL.UART.UART_Data_8b;
      Status : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Transmit
     (This   : in out USART_Port_DMA;
      Data   : HAL.UART.UART_Data_9b;
      Status : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   --  overriding
   --  procedure Transmit
   --    (This     : in out USART_Port_DMA;
   --     Outgoing : UInt8);

   overriding
   procedure Receive
     (This    : in out USART_Port_DMA;
      Data    : out HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out USART_Port_DMA;
      Data    : out HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   --  overriding
   --  procedure Receive
   --    (This     : in out USART_Port_DMA;
   --     Incoming : out UInt8);

   procedure Abort_Transmit
     (This : in out USART_Port_DMA;
      Status : out HAL.UART.UART_Status);

   procedure Abort_Receive
     (This : in out USART_Port_DMA;
      Status : out HAL.UART.UART_Status);

private

   type USART_Port_DMA is limited new USART_Port with record
      TX_Controller : DMA_Interrupt_Controller_Access := null;
      RX_Controller : DMA_Interrupt_Controller_Access := null;
      TX_Threshold : Natural := 5; -- Minimum length for DMA instead of polling
      RX_Threshold : Natural := 5; -- Minimum length for DMA instead of polling
   end record;

end STM32.USART.DMA;