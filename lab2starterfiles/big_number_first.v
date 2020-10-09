module big_number_first (
  input wire [7:0] aIn,
  input wire [7:0] bIn,
  output reg [7:0] aOut,
  output reg [7:0] bOut

);
  
  wire [2:0] aExp = aIn[7:5];
  wire [2:0] bExp = bIn[7:5];
  
  always @(*) begin
    if (aIn > bIn) begin
      aOut = aIn;
      bOut = bIn;
    end
    else begin
      aOut = bIn;
      bOut = aIn;
    end
  end

endmodule
