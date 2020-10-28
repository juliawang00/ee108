`define SWIDTH 1
`define ARMED 2'b00
`define ACTIVE 2'b01
`define WAITT 2'b10

module wave_capture (
    input clk,
    input reset,
    input new_sample_ready,
    input [15:0] new_sample_in,
    input wave_display_idle,

    output wire [8:0] write_address,
    output wire write_enable,
    output wire [7:0] write_sample,
    output wire read_index
);

    wire [8:0] count, next ;
    
    // Counter to keep track of next address to write to
    dffr #(`SWIDTH) beat32_ff(
        .clk (clk),
        .r (reset),
        .d (next), .q (count)
    );
    
    // Counter is set to zero in ARMED state, but in ACTIVE state, when we have a new sample, it increments by one.
    assign next = (state == `ARMED) ? 9'b0  : ((state == `ACTIVE) && new_sample_ready) ? (count + 1'b1) : count; 
    
    
    wire state;
    reg  next_state;

    dffr #(.WIDTH(`SWIDTH)) playing_reg (
        .clk(clk),
        .r(reset),
        .d(next_state),
        .q(state)
    );
    
    // Flip the read_index output when wave_display_idle is high. We are moving back to the armed state and need to read from the other buffer.
    assign read_index = wave_display_idle ? ~read_index : read_index;
    
    always @* begin
        case (state)
            `ARMED:  next_state = (((CROSSING ZERO))) ? `ACTIVE : state;
            `ACTIVE:   next_state = (((WROTE FINAL SAMPLE))) ? `WAIT : state;
            `WAIT: next_state = wave_display_idle ? `ARMED : state;
            default: next_state = `ARMED;
        endcase
    end

    
    
    
endmodule
