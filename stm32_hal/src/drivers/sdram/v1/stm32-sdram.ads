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

with System;
with STM32.FMC; use STM32.FMC;

package STM32.SDRAM is

  procedure Initialize
   (Sysclk                : UInt32; SDRAM_Base : UInt32;
    SDRAM_Bank            : FMC_SDRAM_Cmd_Target_Bank;
    SDRAM_CAS_Latency     : FMC_SDRAM_CAS_Latency; 
    SDRAM_Refresh_Cnt     : UInt32;
    SDRAM_Min_Delay_In_ns : UInt32;
    SDRAM_Row_Bits        : FMC_SDRAM_Row_Address_Bits;
    SDRAM_Mem_Width       : FMC_SDRAM_Memory_Bus_Width;
    SDRAM_CLOCK_Period    : FMC_SDRAM_Clock_Configuration;
    SDRAM_Read_Burst      : FMC_SDRAM_Burst_Read;
    SDRAM_Read_Pipe       : FMC_SDRAM_Read_Pipe_Delay);

  function Base_Address return System.Address;

  function Reserve
   (Amount : UInt32; Align : UInt32 := Standard'Maximum_Alignment)
    return System.Address;

end STM32.SDRAM;