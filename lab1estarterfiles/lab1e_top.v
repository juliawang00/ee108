module lab1e_top ( 
             input wire sw0,
             input wire [3:0] A,
             input wire [3:0] B,
             output reg [3:0] out);
 

    n_bit_multiplier #(4) mult (.a(A), .b(B), .p(multiplied_result));

    wire [7:0] multiplied_result;

    always @(*) begin
        if (sw0 == 1'b1)
            begin
            out = multiplied_result[7:4]; // If switch is high show MSBs
            end
        else 
            begin
            out = multiplied_result[3:0]; // If switch is low show LSBs
            end
    end
endmodule 
                                                                                                                                                                                     