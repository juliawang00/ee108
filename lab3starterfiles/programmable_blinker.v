module programmable_blinker (
  input shift_left,
  input shift_right,
  input clk,
  input rst,
  output wire out_light
);
  
  // Initialize the shifter module
  reg shift_dir = 1'b0;
  reg [3:0] state = 4'b0001;
  reg [3:0] load_value;
  
  shifter #() shift(shift_dir, state, load_value);
  
  always @(*) begin
    if(shift_left == 1) begin
      shift_dir = 1;
    end
    else if(shift_right == 1)begin
      shift_dir = 0;
    end
    else
      shift_dir = 0;
  end
  
  //Initialize timer module
  reg switch;
  
  timer #() tim(clk, load_value, count_en, switch);
  
  // Initialize blinker module
  reg reset = 1'b00;
  reg in = 1'b1;
  reg out;
  
  blinker #() blink(clk, switch, reset, in, out);
  
  assign out_light = out;

endmodule
