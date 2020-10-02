module n_bit_multiplier #(parameter N = 4)
(
	input wire [N-1:0] a, // Input 1
	input wire [N-1:0] b, // Input 2
	output wire [(2*N)-1:0] p  // Output Product: a*b
);
	wire [N-1:0] partial_products [N-1:0];	
	generate
		//assigns array of partial products
		genvar i;
		for (i=0; i<N; i=i+1) begin: partial_products
			// assign this to a ANDed with i-th bit of b
			assign partial_products[i] = a & N{b[i]};
		end
	endgenerate
	
	wire [N-1:0] adder_output [N-1:0];
	wire [N-1:0] adder_carry;
	assign adder_output[0] = partial_products[0];
	assign adder_carry[0] = 0;
	
	generate
		// generates n n-bit adders
		genvar i;
		for (i=1; i < N; i=i+1) begin: adders
			b_input = {adder_carry[i-1], adder_output[i-1][N-1:N-3]};
			N_bit_full_adder #() adder_i (
				.a(partial_products[i]),
				.b(b_input),
				.cin(0),
				.out(adder_output[i]),
				.of(adder_carry[i])
			)
		end
	endgenerate
	
	// assign the output
	generate
		assign p[0] = partial_product[0][0];
		for(i=1; i < N-1; i=i+1) begin:
			assign p[i] = adder_output[i][0];
		end
		for(i=0; i < N; i=i+1)begin:
			assign p[i] = adder_output[N-1][i];
		end
		assign p[(2*N)-1] = adder_carry[N-1];
	endgenerate
	
	
			
 
endmodule
