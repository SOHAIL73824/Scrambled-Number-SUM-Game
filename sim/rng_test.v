
// ECE6370
// Author: Sohail SHareef 5985
//test bench for button_shaper
`timescale 1ns/10ps
module testbench_randomNumber();
 reg pulse ;
 reg rst,clk;
 wire [3:0]count;

 randomNumb rnG(pulse,rst,clk,count);
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
#3 rst=0;
#40 pulse =1;
#40 pulse =0;
#20 rst=1;
#40 pulse =1;
#40 pulse =0;
#40 rst =1;
#40 rst =1;
#70 rst=0;
  end
endmodule
