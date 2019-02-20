// ECE6370
// Author: Sohail SHareef 5985
//test bench for button_shaper
`timescale 1ns/100ps
module testbench_button_inversion();
 reg button_push, clk, rst;
 wire button_pulse;

button_inv tbtn(button_push, button_pulse, clk, rst);
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
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  button_push=1;
  @(posedge clk);
  @(posedge clk);
  button_push=0;
  @(posedge clk);
  @(posedge clk);
  button_push=1;
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  rst=0;
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  rst=1;
  button_push=0;
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  button_push=1;
  @(posedge clk);
  @(posedge clk);
  button_push=0;
  end
endmodule