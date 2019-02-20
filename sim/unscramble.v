// ECE6370
// Author: Sohail Shareef 5985
// Unscramble logic for the game
module unscramble(num,unscramblednum);
 //declaring inputs and outputs
 input[3:0] num;
 output[3:0] unscramblednum;
 reg[3:0] unscramblednum;
 //loop for sensitivity list
 always @ (num)
 begin
 //generating unscrambled number
    unscramblednum = num+4'b0010;
 end
endmodule
