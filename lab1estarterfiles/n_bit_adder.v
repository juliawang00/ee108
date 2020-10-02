module n_bit_adder #(parameter N=4)(
    input [N-1:0] a, b,
    input cin,
    output [N-1:0] out,
    output of
    );
    

    wire [N:0] carry;
    
    assign carry[0]=cin;
    assign of = carry[N];
        
    generate
        genvar i;
        for (i = 0; i < N; i=i+1) begin : full_adder_array
            full_adder adder_i (
                .a(a[i]), 
                .b(b[i]), 
                .cin(carry[i]),
                .cout(carry[i+1]), 
                .s(out[i])
            );
        end
    endgenerate
endmodule
