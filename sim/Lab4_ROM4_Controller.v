module ROM_Controller(clk, rst, button, q, address, data_out);
	input clk,rst;
	input button;
	input [3:0]q;
	output reg [3:0] address;
	output reg [3:0] data_out;

	reg [2:0] STATE;

	parameter
		INIT =0;
		ROM_ADDR =1;
		DELAY1=2;
		DELAY2=3;
		ROM_READ=4;

	always @(posedge clk) begin

	if(rst ==0) begin
		address <= 4'b1111;
		data_out <=0;
		STATE <=INIT;
	end

	else begin
		case(STATE)
		
			INIT : begin
				address <=4'b1111;
				if(button ==1) begin
					STATE <= ROM_ADDR;
				end
				else begin
					STATE <=INIT;
				end
			end

			ROM_ADDR : begin
				address <= address+1;
				STATE <= DELAY1;
			end
			
			DELAY1 :begin
				STATE<= DELAY2;
			end

			DELAY2: begin
				STATE <= ROM_READ;
			end

			ROM_READ: begin
				data_out <=q;
				STATE <=ROM_ADDR;
			end
			
			default : begin
				STATE <=INIT;
			end
         		endcase
		end
	end
endmodule
					