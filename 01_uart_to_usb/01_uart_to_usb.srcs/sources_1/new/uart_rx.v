module uart_rx #(
	parameter CLK_SPEED = 50,
	parameter BAUD = 115200
)
(
	
	input				sys_nrst,
	input				sys_clk,
	
	input				uart_rx,
	output	[7 : 0]		uart_data_rx,
	output				uart_ready
);
	
	//////////////////////////////////////////////////////////////////
	localparam PRESCALER = (CLK_SPEED * 1_000_000) / BAUD;
	localparam PRESCALER_H = PRESCALER / 2;
	//////////////////////////////////////////////////////////////////
	
	localparam stage_idle		= 2'd0;
	localparam stage_start_bit	= 2'd1;
	localparam stage_data		= 2'd2;
	localparam stage_stop_bit	= 2'd3;
	
	reg [1 : 0] stage_cnt;
	reg [2 : 0] data_cnt;
	
	reg [15 : 0] data_bit_cnt;
	
	reg [7 : 0] data_in;
	
	reg uart_ready_r;
	
	assign uart_ready = uart_ready_r;
	
	assign uart_data_rx = data_in;
	
	
	always@(posedge sys_clk	or negedge sys_nrst)begin
		
		if(!sys_nrst)begin
			
			data_in <= 8'h00;
			data_cnt <= 3'd0;
			stage_cnt <= 2'd0;
			
			uart_ready_r <= 1'b0;
			data_bit_cnt <= 16'd0;
			
		end else begin
			
			case(stage_cnt)
				
				stage_idle: begin
					if(!uart_rx)begin
						stage_cnt <= stage_start_bit;
					end
					
					uart_ready_r <= 1'b0;
					data_bit_cnt <= 16'd0;
				end
				
				stage_start_bit: begin
					
					if(data_bit_cnt == (PRESCALER_H - 3) & !uart_rx)begin
						stage_cnt <= stage_data;
						data_bit_cnt <= 16'd0;
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
				end
				
				stage_data: begin
					
					if(data_bit_cnt == (PRESCALER - 2))begin
						
						if(data_cnt == 3'd7)begin
							stage_cnt <= stage_stop_bit;
						end
						
						data_bit_cnt <= 16'd0;
						data_cnt <= data_cnt + 1'd1;
						data_in <= {uart_rx, data_in[7 : 1]};
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
				end
				
				stage_stop_bit: begin
					
					if(data_bit_cnt == (PRESCALER - 2) & uart_rx)begin
						uart_ready_r <= 1'b1;
					end
					
					if(data_bit_cnt == (PRESCALER + 4))begin
						stage_cnt <= stage_idle;
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
					
					data_cnt <= 3'd0;
				end
				
			endcase
		end
	end
	
endmodule
