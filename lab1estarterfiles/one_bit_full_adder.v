
module one_bit_full_adder(
    input a, b, cin,
    output wire cout, s // carry and sum
    );
    
    assign s = a ^ b ^ cin ;
    assign cout = (a & b)|(a & cin)|(b & cin) ; // majority

endmodule