module wave_display_tb ();
  reg clk, reset, valid, read_index;
  reg [10:0] x;
  reg [9:0] y;
  reg [7:0] read_value;
  wire [7:0] r, g, b;
  wire valid_pixel;
  wire [8:0] read_address;
  
  wave_display wave(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y),
    .valid(valid),
    .read_value(read_value),
    .read_index(read_index),
    .read_address(read_address),
    .valid_pixel(valid_pixel),
    .r(r),
    .g(g),
    .b(b)
  );
  
  // Clock and reset
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end
  
  	initial begin
      valid = 1'b1;
      read_value = 8'b0;
      read_index = 1'b1;
      

      $display("Not valid");
      x = 11'b00000001001;
      y = 10'b0001000101;
      valid = 1'b0;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      valid = 1'b1;
      // First Quarter, Top Half Value
      $display("First Quarter, Top Half: Should be invalid");
      x = 11'b00000001001;
      y = 10'b0001000101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      // Fourth Quarter, Top Half Value
      $display("Fourth Quarter, Top Half: Should be invalid");
      x = 11'b01100001001;
      y = 10'b0001000101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      // Third Quarter, Top Half Value
      $display("Fourth Quarter, Top Half: Should be invalid");
      x = 11'b01000001001;
      y = 10'b1001000101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      // Second Quarter, Top Half Value
      $display("Second Quarter, Top Half: Valid, value 1");
      x = 11'b00100001001;
      y = 10'b0001000101;
      read_value = 8'b00110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      $display("Second Quarter, Top Half: Valid, value 2");
      x = 11'b00100001010;
      y = 10'b0001000101;
      read_value = 8'b00110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      $display("Second Quarter, Top Half: Valid, value 3");
      x = 11'b00100001011;
      y = 10'b0001000101;
      read_value = 8'b10110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      $display("Second Quarter, Top Half: Valid, value 4");
      x = 11'b00100001100;
      y = 10'b0001000101;
      read_value = 8'b10110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      $display("Second Quarter, Top Half: Valid, value 5");
      x = 11'b00100001101;
      y = 10'b0001000101;
      read_value = 8'b10110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      $display("Second Quarter, Top Half: Valid, value 6");
      x = 11'b00100001110;
      y = 10'b0001000101;
      read_value = 8'b10110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      $display("Second Quarter, Top Half: Valid, value 7");
      x = 11'b00100001111;
      y = 10'b0001000101;
      read_value = 8'b10110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      
      $display("Second Quarter, Top Half: Valid, value 8");
      x = 11'b00100010000;
      y = 10'b0001000101;
      read_value = 8'b10110101;
      repeat(5) begin
        #10
        $display("x: %b, y: %b, Read Value: %b, Read Address: %b, Valid Pixel: %b, Red: %b, Green: %b, Blue: %b", x, y, read_value, read_address, valid_pixel, r, g, b);
      end
      $stop;
    end
 

endmodule
