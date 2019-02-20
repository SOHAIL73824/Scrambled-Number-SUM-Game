// ECE6370
// Author: Sohail Shareef 5985
// This module is to create a button shapper ,which takes a low pulse 
// to generate a single high pulse
module button_shaper(button_push, button_pulse, clk, rst);
 //declaring inputs and outputs
 input button_push;
 output button_pulse;
 reg button_pulse;

 //clock and reset
 input clk,rst;

 //register to store state
 reg[2:0] state,state_next;
 parameter s_wait=0, state1=1, state2=2, state3=3;


 always @ (state, button_push)
 begin
   case(state)
    s_wait:
     begin
      button_pulse<=0;
      if (button_push==1)
       state_next<=s_wait; 
      else
        //moving to pulse generation states when button pushed
        state_next<=state1;
     end
    //Single pulse generation
    state1:
     begin
      button_pulse<=1;
      if(button_push==1)
       state_next<=s_wait;
      else
      state_next<=state2;
     end
    state2:
     begin
      button_pulse<=0;
      if(button_push==1)
       state_next<=s_wait;
      else
      state_next<=state2;
     end
    default:
      state_next<=s_wait;
   endcase
  end

always @ (posedge clk)
begin
 if(rst==0)
  state <= s_wait;
 else
  state <= state_next;
end
endmodule
