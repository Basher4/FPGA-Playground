// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Dec 19 23:04:14 2022
// Host        : DESKTOP-8TG7GVV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               l:/FPGA_Projects/02_KintexBoard_Playground/01_uart_to_usb/01_uart_to_usb.gen/sources_1/ip/uart_pll/uart_pll_stub.v
// Design      : uart_pll
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module uart_pll(uart_clk, resetn, locked, sys_clk)
/* synthesis syn_black_box black_box_pad_pin="uart_clk,resetn,locked,sys_clk" */;
  output uart_clk;
  input resetn;
  output locked;
  input sys_clk;
endmodule
