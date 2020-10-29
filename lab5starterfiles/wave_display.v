module wave_display (
    input clk,
    input reset,
    input [10:0] x,  // [0..1279]
    input [9:0]  y,  // [0..1023]
    input valid,
    input [7:0] read_value,
    input read_index,
    output wire [8:0] read_address,
    output wire valid_pixel,
    output wire [7:0] r,
    output wire [7:0] g,
    output wire [7:0] b
);
    
    
    wire[6:0] read_value_adjusted = (read_value >> 1) + 6'd32; // New value for read_value to fit our small screen.
    assign valid_pixel = ((x[9] ^ x[8] == 1) && y[9] == 0); // Pixel is valid if (x is in quadrants 1 or 2) and y MSB is 0.
    assign {r,g,b} = 24'hFFFFFF; // Make out output colors simply white for the time being.
    
    wire [7:0] prev_x; // holds value of previous x position on VGA display
    
    // propagates previous value of x position on VGA display
    dffr #(.WIDTH(8)) prevX (
        .clk(clk),
        .r(reset),
        .d(x[8:1]),
        .q(prev_x)
    );
    
    wire [8:0] prev_read_val; // holds previous RAM value read ( aka RAM[x-1] )
    
    // propagates previous RAM value read ( aka RAM[x-1] )
    dffre #(.WIDTH(9)) store (
        .clk(clk),
        .r(reset),
        .d(read_address),
        .q(prev_read_val),
        .en(prev_x && x[8:1])
    );
    
    // assigns the read_address to all zeroes if x has not changed value, otherwise assigns it to updated value
    assign read_address = (!(prev_x && x[8:1])) ? {read_index, x[8:1]} : {read_index, 8'b0}; 
    
    // assign rgb values to white if the current y val is between RAM[x] and RAM[x-1], otherwise it is black
    assign {r,g,b} = valid ? (((prev_read_val >= y[8:1]) && (y[8:1] <= read_value) || (prev_read_val <= y[8:1]) && (y[8:1] >= read_value)) ? 24'hFFFFFF : 24'b0) : 24'b0;
    
endmodule
