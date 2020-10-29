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
    
    wire [10:0] prev_x;
    
    dffr #(.WIDTH(1)) prevX (
        .clk(clk),
        .r(reset),
        .d(x),
        .q(prev_x)
    );
    
endmodule
