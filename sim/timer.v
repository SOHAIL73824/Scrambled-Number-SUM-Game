module t_timer(led,button_pulse,pulse,clk,rst,input1,input2,timerOutt1,timerOutt2,splayer);
	input clk,rst,pulse,led,button_pulse;
	input [3:0]input1,input2;
        //output  reg [6:0] outSignal1,outSignal;
	output reg [3:0] timerOutt1,timerOutt2;
	output reg splayer;
	// reg [25:0] swire;
	 reg [25:0] slow_clk;
	 reg [3:0]timer1,timer2;
	 reg flag=0;
	 reg flag1=0;
	always @(posedge clk)
		begin
			if(rst == 0)
				begin
					timer1<=0;
					timer2<=0;
					slow_clk <= 0;
					flag=0;
					flag1=0;
					splayer=0;
				end
			else
				begin  
					if(timer1 == 4'b0000 && timer2 == 4'b0000) begin
						flag=0;
						flag1=0;
						splayer=0;
					end
					if(button_pulse==1 && led ==1) begin
						timer1<=input2;
						timer2<=input1;
						flag=1;
					 end
					if(pulse==1 && flag==1) begin
						flag1=1;
						splayer=1;
					end
					if(flag1==1) begin
					if(timer1 > 4'b1001) begin
						timer1<= 4'b1001;
					end
					if(timer2 > 4'b1001) begin
						timer2<= 4'b1001;
					end
					if (slow_clk == 26'd50000000) begin
						if(timer1==4'b0000) begin
							timer2 <= timer2 - 1'b1;
						end		        
							timer1 <= timer1 - 1'b1;
						
					        slow_clk<= 0;
					 end
  					    else begin
					        slow_clk <= slow_clk + 1'b1;
					    end
					if(timer1 > 4'b1001) begin
						timer1<= 4'b1001;
					end
					if(timer2 > 4'b1001) begin
						timer2<= 4'b1001;
					end
					end
					
					
					 timerOutt1=timer2;
				 	 timerOutt2=timer1;
					//assign swire=slow_clk;
				end
		end
		/* always @(timer1)
		begin
			case(timer1)
				4'b0000: begin outSignal =7'b0000001;end
				4'b0001: begin outSignal =7'b1001111;end
				4'b0010: begin outSignal =7'b0010010;end
				4'b0011: begin outSignal =7'b0000110;end
				4'b0100: begin outSignal =7'b1001100;end
				4'b0101: begin outSignal =7'b0100100;end
				4'b0110: begin outSignal =7'b0100000;end
				4'b0111: begin outSignal =7'b0001111;end
				4'b1000: begin outSignal =7'b0000000;end
				4'b1001: begin outSignal =7'b0000100;end
				4'b1010: begin outSignal =7'b0001000;end
				4'b1011: begin outSignal =7'b1100000;end
				4'b1100: begin outSignal =7'b0110001;end
				4'b1101: begin outSignal =7'b1000010;end
				4'b1110: begin outSignal =7'b0110000;end
				4'b1111: begin outSignal =7'b0111000;end
				default: begin outSignal =7'b0000000;end
			endcase	
		end
	   always @(timer2)
		begin
			case(timer2)
				4'b0000: begin outSignal1 =7'b0000001;end
				4'b0001: begin outSignal1 =7'b1001111;end
				4'b0010: begin outSignal1 =7'b0010010;end
				4'b0011: begin outSignal1 =7'b0000110;end
				4'b0100: begin outSignal1 =7'b1001100;end
				4'b0101: begin outSignal1 =7'b0100100;end
				4'b0110: begin outSignal1 =7'b0100000;end
				4'b0111: begin outSignal1 =7'b0001111;end
				4'b1000: begin outSignal1 =7'b0000000;end
				4'b1001: begin outSignal1 =7'b0000100;end
				4'b1010: begin outSignal1 =7'b0001000;end
				4'b1011: begin outSignal1 =7'b1100000;end
				4'b1100: begin outSignal1 =7'b0110001;end
				4'b1101: begin outSignal1 =7'b1000010;end
				4'b1110: begin outSignal1 =7'b0110000;end
				4'b1111: begin outSignal1 =7'b0111000;end
				default: begin outSignal1 =7'b0000000;end
			endcase	
		end*/
endmodule

