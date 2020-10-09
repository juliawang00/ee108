module adder(
  input wire[4:0] in1,
  input wire[4:0] in2,
  output wire[4:0] sum,
  output wire cout
);
  
  wire[5:0] added;
  assign added = in1 + in2;
  
  assign sum[4:0] = added[4:0];
  assign cout = added[5];  
  
endmodule 
