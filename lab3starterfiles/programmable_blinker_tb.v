module programmable_blinker_tb ();
  reg up_button, down_button, clk, rst;
  wire out;
  
  programmable_blinker #() DUT(.shift_left(up_button), .shift_right(down_button), .clk(clk), .rst(rst), .rear_light(out));
  
  initial
  forever begin
    #5 clk = 1;
    #5 clk = 0;
  end
  
  
 initial begin
   
   $stop;
   
 end 
endmodule 
