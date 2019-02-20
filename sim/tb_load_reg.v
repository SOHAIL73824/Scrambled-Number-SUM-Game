// ECE6370
// Author: Sohail Shareef 5985
//test bench for load register
`timescale 1ns/100ps
module testb_load_reg();
 reg[3:0] I;
 reg ld,clk, rst;
 wire[3:0] Q;

load_register test_reg(I,Q,ld,clk,rst);
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
  rst=1;
  I=4'b0010;
  #5 ld=1;
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  rst=0;
  @(posedge clk);
  ld=0;
  @(posedge clk);
  @(posedge clk);
  rst=1;
  @(posedge clk);
  @(posedge clk);
  I=4'b1111;
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  ld=1;
  end
endmodule
