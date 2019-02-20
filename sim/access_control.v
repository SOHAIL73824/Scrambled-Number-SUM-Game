// ECE6370
// Author: Sohail Shareef 5985
// Access control to the game
module access_control(button_pulse, toggle_switch, ld1, ld2, red_led, green_led, ld1_out, ld2_out, clk, rst);
 //Declaring inputs and outputs
 input button_pulse, ld1, ld2;
 input clk,rst;
 input [5:0]toggle_switch;
 output reg ld1_out, ld2_out;
 output reg red_led, green_led;
reg [5:0] Q;


 //register to store state
 reg [2:0] state;
 parameter s_wait=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8;

 //loop at each positive edge of the clock
 always @ (posedge clk)
 begin
 if(rst==1)
   state<=s_wait;
else
  begin
   case(state)
    //state waiting for button to be pressed to start authentication
     s_wait:
      begin
       red_led<=0;
       green_led<=0;
       ld1_out<=0;
       ld2_out<=0;
       if(button_pulse==1) begin
          Q <= toggle_switch;
	  state<=s1;
		end
       else begin
          state<=s_wait;
       end
	
	end
   //authentication begins;red LED ON
   //comparing toggle entrances in successive states(password)
     s1:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    begin
       red_led<=1;
       green_led<=0;
       if(Q[s1-1]==1) begin
           state<=s2;
        end
	else begin
           state<=s8;
         end
	
	end
       
     s2:
      begin
       red_led<=1;
       green_led<=0;
       if(Q[s2-1]==0) begin
           state<=s3;
end
         else begin
           state<=s8;
end
       
	end
       
     s3:
      begin
       red_led<=1;
       green_led<=0;
       if(Q[s3-1]==1) begin
           state<=s4;
end
         else begin
           state<=s8;
	end
       
	end
           
      s4:
      begin
       red_led<=1;
       green_led<=0;
       if(Q[s4-1]==0) begin
           state<=s5;
	end
         else begin
           state<=s8;
	end
       
	end
           

     s5:
      begin
       red_led<=1;
       green_led<=0;
       if(Q[s5-1]==1)
           state<=s6;
         else
           state<=s8;
        
	end
       
     s6:
      begin
       red_led<=1;
       green_led<=0;
       if(Q[s6-1]==1)
           state<=s7;
         else
           state<=s8;
       
	end
       
   //authentication completed;green LED ON
   //Load requests are now processed
    s7:
      begin
       red_led<=0;
       green_led<=1;
       state<=s7;
       if(red_led==0 && green_led==1 && ld1==1)
        ld1_out<=1;
       else ld1_out<=0;
       if(red_led==0 && green_led==1 && ld2==1)
        ld2_out<=1;
       else ld2_out<=0;
      	
	end
    s8:
      begin
       red_led<=1;
      end
    default:
      state<=s_wait;
   endcase
  end
end
endmodule
