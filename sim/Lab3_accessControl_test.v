`timescale 1ns / 1ps

module accessControl_tb;
	// Inputs

	 reg   swtch,psh,ldIn1,ldIn2;
	 reg   Clk,Rst;
	 // Outputs

	 wire  led1,led2,ld1_out,ld2_out;
	

	 // Instantiate the Unit Under Test (UUT)

	
	access_control acscnt(psh, swtch, ldIn1, ldIn2, led1, led2, ld1_out, ld2_out, Clk, Rst);
	
	always 
	begin
		Clk <= 1;
		#0.10;
		Clk <= 0;
		#0.10; 
	end
	initial 
	begin
		swtch <=0;
		ldIn1<=0;
		ldIn2<=0;
		Rst<= 1;
		psh<=1;
		@(posedge Clk);
		#0.2 Rst<=0;
		@(posedge Clk);
		@(posedge Clk);
		#0.2 psh<=1;
		@(posedge Clk);
		#0.2 swtch <=1; 
		psh<=1;
		@(posedge Clk);
		#0.2 swtch <=1;
		psh<=1;
		@(posedge Clk);
		#0.2 swtch <=0; 
		psh<=1;
		@(posedge Clk);
		#0.2 swtch <=1; 
		psh<=1;
		@(posedge Clk);
		#0.2 swtch <=0; 
		psh<=1;
		@(posedge Clk);
		#0.2 swtch <=1;
		psh<=1;
		@(posedge Clk);
		#0.2 ldIn1<=1;
		@(posedge Clk);
		ldIn2<=1;
		

  //;

		end

endmodule

