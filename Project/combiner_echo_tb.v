module combiner_tb();
  
  reg [15:0] one, two, three;
  reg [17:0] delay;
  wire[17:0] out;
  
  combiner reader(
    .song_one(one),
    .song_two(two),
    .song_three(three),
    .out(out)
    );
  
  
  initial begin
    one = 16'd10;
    two = 16'd20;
    three = 16'd30;
    delay = 18'b0;
   
    #1
    $display("%d + %d + %d + %d = %d", one, two, three, delay, out);
   	
    delay = (one + two + three) >> 2;
    one = 16'd20;
    two = 16'd20;
    three = 16'd20;
   
    #1
    $display("%d + %d + %d + %d = %d", one, two, three, delay, out);
    
    delay = (one + two + three) >> 2;
    one = 16'd900;
    two = 16'd50;
    three = 16'd437;
   
    #1
    $display("%d + %d + %d + %d = %d", one, two, three, delay, out);
    
    delay = (one + two + three) >> 2;
    one = 16'd65535;
    two = 16'd1;
    three = 16'd0;
   
    #1
    $display("%d + %d + %d + %d = %d", one, two, three, delay, out);
    
    delay = (one + two + three) >> 2;
    one = 16'd65535;
    two = 16'd1;
    three = 16'd65535;
   
    #1
    $display("%d + %d + %d + %d = %d", one, two, three, delay, out);
    
    delay = (one + two + three) >> 2;
    one = 16'd65535;
    two = 16'd2;
    three = 16'd65535;
   
    #1
    $display("%d + %d + %d + %d = %d", one, two, three, delay, out);
    
    delay = (one + two + three) >> 2;
    one = 16'd65535;
    two = 16'd65535;
    three = 16'd65535;
   
    #1
    $display("%d + %d + %d + %d = %d", one, two, three, delay, out);
    
  end
  
endmodule
