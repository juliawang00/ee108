module float_add (
    input wire [7:0] aIn,
    input wire [7:0] bIn,
    output wire [7:0] result
);
    reg [7:0] aOut; // contains the floating point w larger exp
    reg [7:0] bOut; // contains floating point w smaller exp
    big_number_first #() bigger_exp (
        .aIn(aIn), .bIn(bIn), .aOut(aOut), .bOut(bOut)
	);
    
    // find difference in exponents
    reg [2:0] exp_1 = aOut[7:5];
    reg [2:0] exp_2 = bOut[7:5];
    reg [2:0] diff = exp_1 - exp_2;
    
    // shift bOut's mantissa right by the difference
    reg [4:0] mantissa = bOut[4:0];
    wire [4:0] shifted_mantissa;
    
    shifter #() s (
        .in(mantissa), .distance(diff), .direction(1'b1), .out(shifted_mantissa)
    );
    
    // add aOut and bOut shifted mantissas together
    reg [4:0] a_mantissa = aOut[4:0];
    wire [4:0] sum;
    wire carry;
    adder #() add (
        .a(a_mantissa), .b(shifted_mantissa), .sum(sum), .cout(carry)
    );
    
    // deal with the carry
    always @* begin
        if(carry == 1'b1) begin
            sum = {1'b1, sum[4:1]};
        end
    end
    
    assign result = {exp_1, sum};
    

endmodule
