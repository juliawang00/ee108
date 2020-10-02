module n_bit_multiplier #(parameter N = 4)
(
	input wire [N-1:0] a, // Input 1
	input wire [N-1:0] b, // Input 2
	output wire [(2*N)-1:0] p  // Output Product: a*b
);
	wire [N-1:0] partial_products [0:N-1];	
	generate
		//assigns array of partial products
		genvar i;
		for (i=0; i<N; i=i+1) begin: array
			// assign this to a ANDed with i-th bit of b
			assign partial_products[i] = a & {N{b[i]}};
		end
	endgenerate
	
	wire [N-1:0] adder_output [0:N-1];
	wire [N-1:0] adder_carry;
	assign adder_output[0] = partial_products[0];
	assign adder_carry[0] = 1'b0;
	
	generate
		// generates n n-bit adders
		genvar j;
		for (j=1; j < N; j=j+1) begin: adders
			n_bit_adder #() adder_j (
				.a(partial_products[j]),
				.b({adder_carry[j-1], adder_output[j-1][N-1:N-3]}),
				.cin(0),
				.out(adder_output[j]),
				.of(adder_carry[j])
			);
		end
	endgenerate
	
	// assign the output
	assign p[0] = partial_product[0][0];
	generate
		genvar k;
      for(k=1; k < N-1; k=k+1) begin: part1
			assign p[k] = adder_output[k][0];
		end
      for(k=0; k < N; k=k+1)begin: part2
			assign p[k] = adder_output[N-1][k];
		end
	endgenerate
	assign p[(2*N)-1] = adder_carry[N-1];
	
	
			
 
endmodule
