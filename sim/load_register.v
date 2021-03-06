// ECE6370
// Author: Sohail Shareef 5985
// The Load Register is used to assign output based on validation from access controller module.
module load_register(I,Q,ld,clk,rst,splayer);
 input[3:0] I;
 input ld,clk,rst,splayer;
 output[3:0] Q;

 reg[3:0] R;
 
always @ (posedge clk)
begin

 if(rst==0) 
  begin
  R=4'b0000;
  end

 else if(ld==1 && splayer==1)
  begin
  R<=I;
  end
end

assign Q=R;
endmodule
