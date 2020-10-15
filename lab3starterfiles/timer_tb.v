// Code your testbench here
// or browse Examples
module timer_tb ();
  reg clk;
  reg rst;
  reg[3:0] load_value;
  reg count_en;
  reg fast;
  wire q;
  timer #() DUT(.clk(clk), .rst(rst), .load_value(load_value), .count_en(count_en), .fast(fast), .q(q));
  
	initial 
      forever begin
        #5 clk = 1;
        #5 clk = 0;
      end 
  
 initial begin
   #10 rst = 0;
   #10 rst = 1;
   #10 rst = 0;
   
   rst = 1;
   load_value = 4'b0001; 
   fast = 1'b1;
   count_en = 1'b1;
   
   #100 $display("Load Value: %b, Fast: %b, count_en: %b, OUT: %d", load_value, fast, count_en, q); 
   
    #10
   $display("The output has gone to %b", q);
    #10
   $display("The output has gone to %b", q);
    #10
   $display("The output has gone to %b", q);
    #10
   $display("The output has gone to %b", q);
    #10
   $display("The output has gone to %b", q);
   
   $stop;                         
 end 
endmodule 
