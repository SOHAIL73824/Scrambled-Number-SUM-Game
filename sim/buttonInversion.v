
// ECE6370
// Author: Sohail Shareef 5985
// This module is to create a button shapper ,which takes a low pulse 
// to generate a single high pulse
module button_inv(button_push, button_pulse, clk, rst);
 //declaring inputs and outputs
 input button_push;
 output button_pulse;
 reg button_pulse;

 //clock and reset
 input clk,rst;

 //register to store state
 reg[2:0] state,state_next;
 parameter s_wait=0, state1=1;

always @ (posedge clk)
begin
 if(rst==0)
  button_pulse<=0;
 else
  if(button_push==0) begin
        button_pulse<=1;
      end
  else begin
      button_pulse<=0;
 end
end
endmodule