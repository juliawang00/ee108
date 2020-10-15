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

   // Expect 4 loops: 32/8 = 4
   load_value = 4'b0001; 
   fast = 1'b1;
   count_en = 1'b1;
   
   #10 $display("Load Value: %b, Fast: %b, count_en: %b, OUT: %d", load_value, fast, count_en, q); 
   
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
   
   
   // Expect 32 loops: 32/1 = 32, but since we have wait of 10, new wait is 10*8 = 80, showing us the change in four waits. 
   #10 rst = 0;
   #10 rst = 1;
   #10 rst = 0;
   
   load_value = 4'b1000; 
   fast = 1'b1;
   count_en = 1'b1;
   
   #10 $display("Load Value: %b, Fast: %b, count_en: %b, OUT: %d", load_value, fast, count_en, q); 
   
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
   
   
   // Expect 32 loops: 32/1 = 32, but since we have wait of 10, new wait is 10*8 = 80, showing us the change in four waits. 
   #10 rst = 0;
   #10 rst = 1;
   #10 rst = 0;
   
   load_value = 4'b0001; 
   fast = 0'b1;
   count_en = 1'b1;
   
   #10 $display("Load Value: %b, Fast: %b, count_en: %b, OUT: %d", load_value, fast, count_en, q); 
   
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
    #80
   $display("The output has gone to %b", q);
   
   
   // Expect 256 loops: 32/(1/8) = 356, but since we have wait of 10, new wait is 10*8*8 = 640, showing us the change in four waits. 
   #10 rst = 0;
   #10 rst = 1;
   #10 rst = 0;
   
   load_value = 4'b1000; 
   fast = 0'b1;
   count_en = 1'b1;
   
   #10 $display("Load Value: %b, Fast: %b, count_en: %b, OUT: %d", load_value, fast, count_en, q); 
   
    #640
   $display("The output has gone to %b", q);
    #640
   $display("The output has gone to %b", q);
    #640
   $display("The output has gone to %b", q);
    #640
   $display("The output has gone to %b", q);
    #640
   $display("The output has gone to %b", q);
  
   $stop;                         
 end 
endmodule 
