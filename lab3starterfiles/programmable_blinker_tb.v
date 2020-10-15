module programmable_blinker_tb ();
  reg up_button, down_button;
  
  programmable_blinker #() DUT(.up_button(up_button), .down_button(down_button));
  
  initial
  forever
   begin
     #5 clk = 1 ; 
     #5 clk = 0 ;
   end
  
 initial begin
   
   $stop
   
 end 
endmodule 
