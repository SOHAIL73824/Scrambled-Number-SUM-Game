// ECE 6370
// Author: Sohail Shareef Md, 5985
// This module is to create a access control to allow a validation of a 6 bit password 
// by checking each bit and then produce a green light if all matches or red if 
// any fail  
module accessControl(Switch,PushB,LdOut1,ldout2,ldIn1,ldIn2, Clk, Rst,led1,led2);
input Switch ,PushB;
input [3:0] ldIn1,ldIn2;
output reg LdOut1,led1,led2,ldout2;
input Clk,Rst;
parameter Bit_Off = 0 , Bit_1 =1,Bit_2 =2,Bit_3 =3,Bit_4 =4,Bit_5 =5,Bit_6 =6,Bit_On =7; 
reg [2:0] State;
always @(posedge Clk) begin
	if (Rst == 1 )begin
		State <= Bit_Off;
		LdOut1<=0;
		ldout2<=0;
		led1<=0;
		led2<=0;
	end
	else begin
 		
		case (State)
			Bit_Off: begin
				LdOut1 <= 0;				
				if (PushB== 0) begin
					led2<=0;
					State <= Bit_Off;
				end
				else begin
					led2<=1;
					State <= Bit_1;
				end
			end
 			Bit_1: begin
				LdOut1 <= 0;
				if(PushB== 1) begin
				if (Switch == 1) begin
					State <= Bit_2;
				end
				else begin
					State <= Bit_Off;
				end
				end
				else begin
					State <= Bit_1;
				end

			end
			Bit_2: begin
				LdOut1 <= 0;
				if(PushB== 1) begin
				if (Switch == 0) begin
					State <= Bit_3;
				end
				else begin
					State <= Bit_Off;
				end
end
				else begin
					State <= Bit_2;
				end
			end
			Bit_3: begin
				LdOut1 <= 0;
				if(PushB== 1) begin
				if (Switch == 1) begin
					State <= Bit_4;
				end
				else begin
					State <= Bit_Off;
				end
				end
				else begin
					State <= Bit_3;
				end
			end
			Bit_4: begin
				LdOut1 <= 0;
				if(PushB== 1) begin
				if (Switch == 1) begin
					State <= Bit_5;
				end
				else begin
					State <= Bit_Off;
				end
				end
				else begin
					State <= Bit_4;
				end
			end
			Bit_5: begin
				LdOut1 <= 0;
				if(PushB== 1) begin
				if (Switch == 0) begin
					State <= Bit_6;
				end
				else begin
					State <= Bit_Off;
				end
				end
				else begin
					State <= Bit_5;
				end
			end
			Bit_6: begin
				LdOut1 <= 0;
				if(PushB== 1) begin
				if (Switch == 1) begin
					State <= Bit_On;
				end
				else begin
					State <= Bit_Off;
				end
				end
				else begin
					State <= Bit_6;
				end
			end
			Bit_On: begin
				led2<=0;
				led1=1;
				if(ldIn1==1)begin
					LdOut1<=1;
				end
				else begin
					LdOut1<=0;
				end
				if(ldIn2==1)begin
					ldout2<=1;
				end
				else begin
					ldout2<=0;
				end
			end
			
		endcase
	end
// StateReg

end

endmodule


