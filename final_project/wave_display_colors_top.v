module wave_display_top(
    input clk,
    input reset,
    input new_sample,
    input [15:0] combined_sample,
    input [15:0] sample1,
    input [15:0] sample2,
    input [15:0] sample3,
    input [10:0] x,  // [0..1279]
    input [9:0]  y,  // [0..1023]     
    input valid,
    input vsync,
    output [7:0] r,
    output [7:0] g,
    output [7:0] b
);

    wire [7:0] read_sample, write_sample;
    wire [8:0] read_address, write_address;
    wire read_index;
    wire write_en;
    wire wave_display_idle = ~vsync;

    wave_capture wc(
        .clk(clk),
        .reset(reset),
        .new_sample_ready(new_sample),
        .new_sample_in(sample),
        .write_address(write_address),
        .write_enable(write_en),
        .write_sample(write_sample),
        .wave_display_idle(wave_display_idle),
        .read_index(read_index)
    );
    
    ram_1w2r #(.WIDTH(8), .DEPTH(9)) sample_ram(
        .clka(clk),
        .clkb(clk),
        .wea(write_en),
        .addra(write_address),
        .dina(write_sample),
        .douta(),
        .addrb(read_address),
        .doutb(read_sample)
    );
 
    wire valid_pixel_combined;
    wire [7:0] wd_r, wd_g, wd_b;
    wave_display wd(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address),
        .read_value(read_sample),
        .read_index(read_index),
        .valid_pixel(valid_pixel_combined),
        .r(wd_r), .g(wd_g), .b(wd_b)
    );
    
    wire valid_pixel;
    wire [7:0] r1, g1, b1;
    wave_display note1(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address),
        .read_value(read_sample),
        .read_index(read_index),
        .valid_pixel(valid_pixel),
        .r(r1), .g(g1), .b(b1)
    );
    
    wire valid_pixel;
    wire [7:0] r2, g2, b2;
    wave_display note2(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address),
        .read_value(read_sample),
        .read_index(read_index),
        .valid_pixel(valid_pixel),
        .r(r2), .g(g2), .b(b2)
    );
    
    wire valid_pixel;
    wire [7:0] r3, g3, b3;
    wave_display note3(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address),
        .read_value(read_sample),
        .read_index(read_index),
        .valid_pixel(valid_pixel),
        .r(r3), .g(g3), .b(b3)
    );

    assign {r, g, b} = valid_pixel ? ({wd_r, wd_g, wd_b} == 24'hFFFFFF) ? {wd_r, wd_g, wd_b} : ({r1, g1, b1} == 24'hFFFFFF) ? 24'hFF0000 : ({r2, g2, b2} == 24'hFFFFFF) ? 24'h00FF00 : ({r3, g3, b3} == 24'hFFFFFF) ? 24'h0000FF: {3{8'b0}};

endmodule
