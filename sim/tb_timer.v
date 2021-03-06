
// ECE6370
// Author: Sohail Shareef 5985
//testbench for counter
`timescale 1ns/100ps
module testb_timer();
 reg pulse, clk, rst;

wire [3:0] timerOut1,timerOut2timerOut1,timerOut2;
 
timer tr(pulse,clk,rst,timerOut1,timerOut2);

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
#3 rst=1;

#20 rst=0;

#40 rst =1;
#40 rst =0;
#70 rst=1;


end
endmodule
