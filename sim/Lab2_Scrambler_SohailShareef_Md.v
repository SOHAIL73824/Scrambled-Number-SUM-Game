
//  ECE6370
// Author: Sohail Shareef  Mohammed - 5985
// Application : This will map every number between 0 to 15 to someother unique number between 0 to 15. This mapping will be done in accordance to index card.
module unscramble(scrambled,unScrambled);
	
	input [3:0]scrambled;
	output [3:0]unScrambled;
	reg [3:0]unScrambled;
	
	always @(scrambled)
		begin
			case(scrambled)
				4'b0000: begin unScrambled =4'b1101;end
				4'b0001: begin unScrambled =4'b0111;end
				4'b0010: begin unScrambled =4'b0100;end
				4'b0011: begin unScrambled =4'b0000;end
				4'b0100: begin unScrambled =4'b1111;end
				4'b0101: begin unScrambled =4'b1000;end
				4'b0110: begin unScrambled =4'b0001;end
				4'b0111: begin unScrambled =4'b1100;end
				4'b1000: begin unScrambled =4'b0110;end
				4'b1001: begin unScrambled =4'b1110;end
				4'b1010: begin unScrambled =4'b0011;end
				4'b1011: begin unScrambled =4'b1010;end
				4'b1100: begin unScrambled =4'b0101;end
				4'b1101: begin unScrambled =4'b0010;end
				4'b1110: begin unScrambled =4'b1001;end
				4'b1111: begin unScrambled =4'b1011;end
				default: begin unScrambled =4'b0000;end
			endcase	
		end
endmodule