module counter(pulse,clk,rst,count);
	input clk,rst,pulse;
	output reg [3:0] count;
	//reg [3:0] count;

	always @(posedge clk)
		begin
			if(rst == 0)
				begin
					count<=4'b0000;
				end
			else
				begin
					if(pulse==1) begin
						count <=count+4'b0001;
					end
					
				end
		end
endmodule

