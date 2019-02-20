// ECE6370
// Author: Sohail Shareef 5985
//Top level game module with authentication 
module Lab4_Sohail_M(button1,toggle1,rst,clk,ld1,ld2,switch_num2,green_led,red_led,sevenseg_num1,sevenseg_num2,sevenseg_sum,input1,input2,counter_min,counter_sec);
 
 input[3:0]  switch_num2;
 input button1,ld1,ld2,rst,clk;
 input [3:0] toggle1,input1,input2;
 output[6:0] sevenseg_num1, sevenseg_num2, sevenseg_sum,counter_min,counter_sec;
 output green_led, red_led;
 wire[3:0] unscrambled_num, sum,Q_num1,Q_num2,Q_sum,timerOutt1,timerOutt2;
 wire ld_1,ld_2,ld1_out,ld2_out,button_pulse;
 wire [3:0] address,q;
 wire [3:0] switch_num1;
 wire splayer;
 button_shaper b1(button1, button_pulse, clk, rst);

 button_shaper ld2button(ld2,ld_2,clk, rst);

 ROM_Top_Test rmt(address,clk, q);


 access_control a1(button_pulse, toggle1,ld1, ld_2, red_led, green_led, ld1_out, ld2_out, clk, rst,address,q);



 unscramble unscramblenum2(switch_num2, unscrambled_num);

 randomNumb rnb(ld1_out,rst,clk,switch_num1);
 
 load_register l1(switch_num1,Q_num1,ld1_out,clk,rst,1);
 load_register l2(unscrambled_num,Q_num2,ld2_out,clk,rst,splayer);


 adder addnums(Q_num1, Q_num2, sum);

 button_shaper ld1button(ld1,ld_1,clk, rst);

t_timer tim(green_led,button_pulse,ld_1,clk,rst,input1,input2,timerOutt1,timerOutt2,splayer);

 seven_seg sevensegnum1(Q_num1, sevenseg_num1);
 seven_seg sevensegnum2(Q_num2, sevenseg_num2);
 seven_seg sevensegnum3(sum, sevenseg_sum);
 seven_seg sevensegnum4(timerOutt1, counter_min);
 seven_seg sevensegnum5(timerOutt2, counter_sec);

endmodule


