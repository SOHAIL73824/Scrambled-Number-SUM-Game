`timescale 10ns/100ps
module Test_overall();

reg[3:0]  switch_num2;
 reg button_pulse,ld1,ld2,rst,clk;
 reg [3:0] toggle_switch;
 wire[6:0] sevenseg_num1, sevenseg_num2, sevenseg_sum;
 wire green_led, red_led;
// wire [3:0]address,q;

Lab4_Sohail_M lab(button_pulse,toggle_switch,rst,clk,ld1,ld2,switch_num2,green_led,red_led,sevenseg_num1,sevenseg_num2,sevenseg_sum);
 
always begin
	#5 clk =0;
	#5 clk =1;
end

initial begin

switch_num2 = 4'b1101;
 ld1=0;
 ld2=0;


rst=0;
 ld1=0;
 ld2=0;
rst=1;
 ld1=0;
 ld2=0;

 ld1=0;
 ld2=0;	
#15 button_pulse=0;
#5 toggle_switch=4'b0001;

#15 button_pulse=0;

#5 toggle_switch=4'b0010;

#15 button_pulse=0;

/*#5 toggle_switch=1;
@(posedge clk);
#15 button_pulse=1;
@(posedge clk);
#5 button_pulse=0;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
#5 toggle_switch=0;
@(posedge clk);
#15 button_pulse=1;
@(posedge clk);
#5 button_pulse=0;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
#5 toggle_switch=1;
@(posedge clk);
#15 button_pulse=1;
@(posedge clk);
#5 button_pulse=0;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
#5 toggle_switch=0;
@(posedge clk);
#15 button_pulse=1;
@(posedge clk);
#5 button_pulse=0;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
#5 toggle_switch=1;
@(posedge clk);
#15 button_pulse=1;
@(posedge clk);
#5 button_pulse=0;*/

#5 toggle_switch=4'b0011;

#15 button_pulse=1;

#5 toggle_switch=4'b0100;

#15 button_pulse=0;

	


end

endmodule
