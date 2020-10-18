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

    // Tests
    initial begin
      step_size = 19'b00000010101000000000;
      generate_next = 1;
      
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
      #10
      $display("next state = %d, step size = %d", sample, step_size);
    end

endmodule
