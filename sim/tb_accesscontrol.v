// ECE6370
// Author: Sohail Shareef 5985
//testbench for accesscontrol
`timescale 1ns/100ps
module testb_accesscontrol();
 reg button_pulse,ld1, ld2;
 reg clk,rst;
 reg [3:0]toggle_switch,q;
 wire [3:0] address;
 wire ld1_out, ld2_out;
 wire red_led, green_led; 
  

access_control acs(button_pulse, toggle_switch,ld1, ld2, red_led, green_led, ld1_out, ld2_out, clk, rst,address,q);
always 
 begin
  clk <= 0;
  #10;
  clk <= 1;
  #10;
 end // Note: Procedure repeats
// Vector Procedure
 initial 
  begin
rst=0;
ld1=1;
ld2=1;
@(posedge clk);
rst=1;
@(posedge clk);
@(posedge clk);
@(posedge clk);
#15 button_pulse=1;
#5 toggle_switch=4'b1101;
 q=4'b1101;
@(posedge clk);
#15 button_pulse=1;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
#5 toggle_switch=4'b1111;
 q=4'b1111;
#15 button_pulse=1;
@(posedge clk);
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
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
#5 toggle_switch=4'b1111;
 q=4'b1111;
#15 button_pulse=1;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);

@(posedge clk);
@(posedge clk);
#5 toggle_switch=4'b1111;
 q=4'b1111;
#15 button_pulse=1;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
#5 ld1=1;
#5 ld2=1;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);


end
endmodule
