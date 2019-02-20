
module ROM_top (clk.rst,button, data_out);
input clk,rst;
input button;


output data_out;

wire [3:0] address,q;

  ROM_Controller  ROMCon (clk, rst, button, q, address, data_out);

  Lab4_ROM1  lab4rom (address,clock,q);

endmodule
