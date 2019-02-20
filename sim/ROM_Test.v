`timescale 10ns/100ps
module ROM_Testmodule();

reg	[3:0]  address;
	reg	  clk;
	wire	[3:0]  q;


ROM_Top_Test rnd(
	address,
	clk,
	q);
always begin
	#5 clk =0;
	#5 clk =1;
end

initial begin

	   address =4'b001;
 #10 address =4'b010;

#10 address =4'b011;
#10 address =4'b101;
#10 address =4'b101;
#10 address =4'b111;




end

endmodule
