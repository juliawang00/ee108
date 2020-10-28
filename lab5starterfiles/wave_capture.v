
`define ARMED 2'b00
`define ACTIVE 2'b01
`define WAIT 2'b10

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

    wire [8:0] count, next;
    
    // Counter to keep track of next address to write to
    dffre #(9) beat32_ff(
        .clk (clk),
        .en(new_sample_ready),
        .r (reset),
        .d (next), .q (count)
    );
    
    // Counter is set to zero in ARMED state, but in ACTIVE state, when we have a new sample, it increments by one.
    assign next = (state == `ARMED) ? 9'b0  : ((state == `ACTIVE) && new_sample_ready) ? (count + 9'b1) : count; 
    assign write_sample == (state == `ACTIVE) ? new_sample_in[15:8] : 8'b0; // Assign 8 MSB of new_sample, otherwise set to zero
    assign write_address == (state == `ACTIVE) ? {read_index, count} : 8'b0;
    
    
    wire state;
    reg  next_state;

    dffr #(.WIDTH(`SWIDTH)) playing_reg (
        .clk(clk),
        .r(reset),
        .d(next_state),
        .q(state)
    );
    
    // Flip the read_index output when wave_display_idle is high. We are moving back to the armed state and need to read from the other buffer.
    assign read_index = wave_display_idle ? ~read_index : read_index; // ISSUE REFERRING BACK TO ITSELF
    
    assign write_sample = (StateX high and counter
    
    always @* begin
        case (state)
            `ARMED:  next_state = (((CROSSING ZERO))) ? `ACTIVE : state;
            `ACTIVE:   next_state = (next == 9'b0) ? `WAIT : state; // Next is set to 0 in the active state when reset is pressed or 256 audio samples have been input (255 + 1 = 0)
            `WAIT: next_state = wave_display_idle ? `ARMED : state;
            default: next_state = `ARMED;
        endcase
    end

    
    
    
endmodule
