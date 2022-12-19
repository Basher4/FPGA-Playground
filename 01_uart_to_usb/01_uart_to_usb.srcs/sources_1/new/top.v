`timescale 1ns / 1ps

module top(
	
	input	sys_clk,
	input	sys_nrst,
	
	input	uart_rx,
	output	uart_tx,
	
	output [7:0] leds
);
	
	wire loop_back;
	
	wire uart_clk;
	wire uart_pll_nrst;
	
	wire [7 : 0] uart_send_data;
	
	assign leds = ~uart_send_data;
	
	
	/////////////////////////////////////////////////////////////
	//	Ensure the crystal jitter
	//	reduce baud rate error rate
	/////////////////////////////////////////////////////////////
	uart_pll uart_pll_inst0(		
		.uart_clk	(uart_clk),
		.locked		(uart_pll_nrst),
		
		.resetn		(sys_nrst),
		.sys_clk	(sys_clk)
	);
	
	uart_tx #(
		.CLK_SPEED(100)
	)uart_tx_inst0(
		
		.sys_nrst		(uart_pll_nrst),
		.sys_clk		(uart_clk),
		
		.uart_send		(loop_back),
		.uart_data_tx	(uart_send_data + 1),
		.uart_tx		(uart_tx),
		.uart_ready		(),
		.uart_done		()
	);
	
	uart_rx #(
		.CLK_SPEED(100)
	)uart_rx_inst0(
		
		.sys_nrst			(uart_pll_nrst),
		.sys_clk			(uart_clk),
		
		.uart_rx			(uart_rx),
		.uart_data_rx		(uart_send_data),
		.uart_ready			(loop_back)
	);
	
endmodule
