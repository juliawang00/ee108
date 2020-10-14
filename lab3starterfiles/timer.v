// Code your design here
module timer (
  input clk, 
  input wire [3:0] load_value, 
  input wire count_en,
  output wire q
);
  
  dffre #() ff(.clk (clk),
               .r (0), 
               .en(count_en),
               .d (1), 
               .q(q)
              );

endmodule
