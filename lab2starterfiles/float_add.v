module float_add (
    input wire [7:0] aIn,
    input wire [7:0] bIn,
    output wire [7:0] result
);
    wire [7:0] aOut; // contains the floating point w larger exp
    wire [7:0] bOut; // contains floating point w smaller exp
    big_number_first #() bigger_exp (
        .aIn(aIn), .bIn(bIn), .aOut(aOut), .bOut(bOut)
	);
    
    // find difference in exponents
  wire [2:0] exp_1;
  assign exp_1 = aOut[7:5];
  wire [2:0] exp_2;
  assign exp_2 = bOut[7:5];
  wire [2:0] diff;
  assign diff = exp_1 - exp_2;
    
    // shift bOut's mantissa right by the difference
  wire [4:0] mantissa;
  assign mantissa = bOut[4:0];
    wire [4:0] shifted_mantissa;
    
    shifter #() s (
        .in(mantissa), .distance(diff), .direction(1'b1), .out(shifted_mantissa)
    );
    
    // add aOut and bOut shifted mantissas together
  wire [4:0] a_mantissa;
  assign a_mantissa = aOut[4:0];
    wire [4:0] sum;
    wire carry;
    adder #() add (
      .in1(a_mantissa), .in2(shifted_mantissa), .sum(sum), .cout(carry)
    );
    
    // deal with the carry
  reg [4:0] assign_sum;
    always @* begin
        if(carry == 1'b1) begin
            assign_sum = {1'b1, sum[4:1]};
        end
      else begin
        assign_sum = sum;
      end
    end
    
  assign result = {exp_1, assign_sum};
    

endmodule
