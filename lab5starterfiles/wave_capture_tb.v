// Code your testbench here
// or browse Examples
module wave_capture_tb ();
  
  	reg clk;
    reg reset;
    reg new_sample_ready;
  reg [15:0] new_sample_in;
    reg wave_display_idle;
  
  	wire [8:0] write_address;
    wire write_enable;
  	wire [7:0] write_sample;
    wire read_index;
  
    wave_capture wave(
        .clk(clk),
        .reset(reset),
      	.new_sample_ready(new_sample_ready),
      	.new_sample_in(new_sample_in),
        .wave_display_idle(wave_display_idle),
      
      	.write_address(write_address), 
      	.write_enable(write_enable), 
      	.write_sample(write_sample),
      	.read_index(read_index)
    );

    // Clock and reset
    initial begin
        clk = 1'b0;
        reset = 1'b1;
      repeat (4) #10 clk = ~clk;
        reset = 1'b0;
        forever #10 clk = ~clk;
    end
  
    initial begin
        new_sample_ready = 1'b1;
      repeat (10000) #10 new_sample_ready = ~new_sample_ready;
    end
  
  	initial begin
      //Sample changing from high to low
      #10
      new_sample_in = 16'b1000000100000000;	
      $display("Write Address: %b, Write enabled: %b, Write sample: %b, Read Index: %b, New Sample Ready: %b, Sample In: %b, Reset: %b", write_address, write_enable, write_sample, read_index, new_sample_ready, new_sample_in, reset);
      #10
      new_sample_in = 16'b0000000100000000;
      wave_display_idle = 1'b0;
      
      repeat(256) begin
        #10
        $display("Write Address: %b, Write enabled: %b, Write sample: %b, Read Index: %b, New Sample Ready: %b, Sample In: %b, Reset: %b", write_address, write_enable, write_sample, read_index, new_sample_ready, new_sample_in, reset);
      end
      
      //Expect nothing to change
      wave_display_idle = 1'b1;
            repeat(256) begin
        #10
        $display("Write Address: %b, Write enabled: %b, Write sample: %b, Read Index: %b, New Sample Ready: %b, Sample In: %b, Reset: %b", write_address, write_enable, write_sample, read_index, new_sample_ready, new_sample_in, reset);
      end	
      
      //Nothing should happen not changing from positive to negative
       #10
      new_sample_in = 16'b1000000100000000;
      
      #10
      new_sample_in = 16'b10011100100000000;
      wave_display_idle = 1'b0;
      
      repeat(256) begin
        #10
        $display("Write Address: %b, Write enabled: %b, Write sample: %b, Read Index: %b, New Sample Ready: %b, Sample In: %b, Reset: %b", write_address, write_enable, write_sample, read_index, new_sample_ready, new_sample_in, reset);
      end
      
       //Another final regular check 
       #10
      new_sample_in = 16'b1000000100000000;
      
      #10
      new_sample_in = 16'b00011100100000000;
      wave_display_idle = 1'b0;
      
      repeat(256) begin
        #10
        $display("Write Address: %b, Write enabled: %b, Write sample: %b, Read Index: %b, New Sample Ready: %b, Sample In: %b, Reset: %b", write_address, write_enable, write_sample, read_index, new_sample_ready, new_sample_in, reset);
      end
      
    end 
  	
endmodule
