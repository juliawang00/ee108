module wave_display_top(
    input clk,
    input reset,
    input new_sample,
    input [15:0] sample,
    input [10:0] x,  // [0..1279]
    input [9:0]  y,  // [0..1023]     
    input valid,
    input vsync,
    output [7:0] r,
    output [7:0] g,
    output [7:0] b
);

    // Instantiate the wave_capture module
    wire [8:0] write_address;
    wire write_enable;
    wire [7:0] write_sample;
    wire read_index;
    
    wave_capture #() w_c ( //FILL IN THE #() PARAM
        .clk(clk),
        .reset(reset),
        .new_sample_ready(new_sample),
        .new_sample_in(sample),
        .wave_display_idle(~vsync), // The vsync goes low when done reading a frame, which is when we want the idle to go high.
        .write_address(write_address),
        .write_enable(write_enable),
        .write_sample(write_sample),
        .read_index(read_index)    
    );
    
    
     // Instantiate the wave_display module
    wire [8:0] read_address,
    wire [7:0] read_value,
    wire valid_pixel,
    
    wave_display #() w_d ( //FILL IN THE #() PARAM
        .clk(clk),
        .reset(reset),
        .x(x),  // [0..1279]
        .y(y),  // [0..1023]
        .valid(valid),
        .read_value(read_value),
        .read_index(read_index),
        .read_address(read_address),
        .valid_pixel(valid_pixel),
        .r(r),
        .g(g),
        .b(b)
    );
    
    
    // Instantiate the RAM module
    wire[7:0] douta;
    ram_1w2r #(8, 8) ram (
    /* Dual read/write port A */
        .clka(clk),
        .wea(write_enable),
        .addra(write_address),
        .dina(write_sample),
        .douta(douta),
    
    /* Read-only port B */
        .clkb(clk),
        .addrb(read_address),
        .doutb(read_value)
);
       
    
    
endmodule
