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
    
    wire [7:0] prev_x;
    
    // clock to keep track of previous value of x
    dffr #(.WIDTH(8)) prevX (
        .clk(clk),
        .r(reset),
        .d(x[8:1]),
        .q(prev_x)
    );
    
    wire [8:0] prev_read_val;
    dffre #(.WIDTH(8)) store (
        .clk(clk),
        .r(reset),
        .d(read_address),
        .q(prev_read_val),
        .en(prev_x && x[8:1])
    );
    
    assign read_address = (!(prev_x && x[8:1])) ? {read_index, x[8:1]} : {read_index, 8'b0}; // assigns to all zeroes if x has not changed value
    
    // assign rgb values to white if the y val is between RAM[x] and RAM[x-1]
    assign {r,g,b} = valid ? (((prev_read_val >= y[8:1]) && (y[8:1] <= read_value) || (prev_read_val <= y[8:1]) && (y[8:1] >= read_value)) ? 24'hFFFFFF : 24'b0) : 24'b0;
    
endmodule
