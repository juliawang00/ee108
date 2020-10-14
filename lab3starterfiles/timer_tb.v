// Code your testbench here
// or browse Examples
module time_tb (input clk);
  
  reg[3:0] load_value;

  reg count_en;
  
  wire q;

  timer #() DUT(.clk(clk), .load_value(load_value), .count_en(count_en), .q(q));

  //forever
  //  begin
  //    #5 clk = 1 ; 
  //    #5 clk = 0 ;
  //  end
  
 initial begin

    load_value = 4'b1000; 
  	count_en = 1'b1;
  
   #100 $display("Load Value: %04b, Load Value: %03d, OUT: %04b", load_value, count_en, q);
   
 end 
endmodule 
