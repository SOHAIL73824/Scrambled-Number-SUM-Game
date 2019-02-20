
module randomNumb(inputBtn,rst,clk,count);
input inputBtn;
input rst,clk;
output [3:0]count;

wire outBtn;


button_inv binv(inputBtn , outBtn, clk, rst);
counter cuntr(outBtn,clk,rst,count);

endmodule 