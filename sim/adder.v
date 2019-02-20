// ECE6370
// Author: Sohail Shareef 5985
// Adder Module
module adder(num1, num2, sum);
 input[3:0] num1, num2;
 output[3:0] sum;
 reg[3:0] sum;

 always @ (num1, num2)
 begin
 //summation
 sum = num1 + num2;
 end
endmodule
