module programmable_blinker (
  input shift_left,
  input shift_right,
  input clk,
  input rst,
  output wire out_light
);
  
  // Initialize the shifter module
  wire shift_dir;
  reg [3:0] state = 4'b0001;
  reg [3:0] load_value;
  
  assign shift_dir = (shift_left) ? 1 : 0;
  
  shifter #() shift(shift_dir, state, load_value);
  
  //Initialize timer module
  reg switch;
  reg count_en;
  
  timer #() tim(clk, load_value, count_en, switch);
  
  // Initialize blinker module
  reg reset;
  reg out;
  
  blinker #() blink(clk, switch, reset, out);
  
  assign out_light = out;

endmodule
