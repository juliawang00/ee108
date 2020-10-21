// Code your testbench here
// or browse Examples
module sine_reader_tb();

    reg clk, reset, generate_next;
    reg [19:0] step_size;
    wire sample_ready;
  wire [15:0] sample;
  
    sine_reader reader(
        .clk(clk),
        .reset(reset),
        .step_size(step_size),
        .generate_next(generate_next),
        .sample_ready(sample_ready),
      .sample(sample)
    );

    // Clock and reset
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end
  //copy clock but say gen_next
  
  	initial begin
        generate_next = 1'b0;
        reset = 1'b1;
      repeat (10000) #10 generate_next = ~generate_next;
        reset = 1'b0;
    end

    // Tests
    initial begin
      //generate_next = 1;
      
      step_size = 19'b0001010101000000000;
      repeat(500) begin
         #10
        $display("next freq = %d, sample ready = %d, generate next = %d", sample, sample_ready, generate_next);
      end
      
            step_size = 19'b0001111111100100100;
      repeat(500) begin
         #10
        $display("next freq = %d, sample ready = %d, generate next = %d", sample, sample_ready, generate_next);
      end
      
            step_size = 19'b0001010101010001111;
      repeat(500) begin
         #10
        $display("next freq = %d, sample ready = %d, generate next = %d", sample, sample_ready, generate_next);
      end
      
            step_size = 19'b0000000101010001001;
      repeat(1000) begin
         #10
        $display("next freq = %d, sample ready = %d, generate next = %d", sample, sample_ready, generate_next);
      end
      
      step_size = 19'b0010110101010001001;
      repeat(500) begin
         #10
        $display("next freq = %d, sample ready = %d, generate next = %d", sample, sample_ready, generate_next);
      end
	$stop;
   end

endmodule
