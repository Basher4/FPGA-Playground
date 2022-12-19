-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Mon Dec 19 23:04:14 2022
-- Host        : DESKTOP-8TG7GVV running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               l:/FPGA_Projects/02_KintexBoard_Playground/01_uart_to_usb/01_uart_to_usb.gen/sources_1/ip/uart_pll/uart_pll_stub.vhdl
-- Design      : uart_pll
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_pll is
  Port ( 
    uart_clk : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    sys_clk : in STD_LOGIC
  );

end uart_pll;

architecture stub of uart_pll is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "uart_clk,resetn,locked,sys_clk";
begin
end;
