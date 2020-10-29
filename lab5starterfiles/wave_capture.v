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
    
    
    // Counter DFF to keep track of next address to write to
    wire [8:0] count, next;
    dffre #(9) track_address(
        .clk (clk),
        .en(new_sample_ready),
        .r (reset),
        .d (next), .q (count)
    );
    // Counter is set to zero in ARMED state, but in ACTIVE state, when we have a new sample, it increments by one.
    assign next = (state == `ARMED) ? 9'b0  : ((state == `ACTIVE) && new_sample_ready) ? (count + 9'b1) : count;
    
    
    // DFF to check for zero crossing 
    wire prev_sample; // Keeps track of the MSB of the past sample_in
    dffre #(.WIDTH(1)) zero_crossing (
        .clk(clk),
        .r(reset),
        .en(new_sample_ready),
        .d(new_sample_in[15]), // MSB of new_sample input
        .q(prev_sample) // MSB of the last sample input
    ); 
    
    
        
    // Flip the read_index output when wave_display_idle is high. We are moving back to the armed state and need to read from the other buffer.
    // Read_index DFF. It inverts read_index when wave_display is high
    dffre #(.WIDTH(1)) read_flip (
        .clk(clk),
        .r(reset),
        .en(wave_display_idle),
        .d(read_index + 1'b1),
        .q(read_index)
    );

    
    // State DFF
    wire[1:0] state;
    reg[1:0]  next_state;
    dffr #(.WIDTH(2)) state_dff (
        .clk(clk),
        .r(reset),
        .d(next_state),
        .q(state)
    );
    
    // Assigning outputs
    assign write_sample = (state == `ACTIVE) ? new_sample_in[15:8] + 8'b10000000 : 8'b0; // Assign 8 MSB of new_sample, otherwise set to zero. The addition turns shifts 2-signed integers to the positive range.
    assign write_address = (state == `ACTIVE) ? {~read_index, count} : 9'b0; // read_index inverted here since its value is passed to display
    assign write_enable = ((state == `ACTIVE) && new_sample_ready); // We write in the active state when we get a new sample
    
    always @* begin
        case (state)
            // Change state on zero crossing. Do not allow on reset, since this interrupts the flow, and we need two consecutive samples for evaluation.
            `ARMED:  next_state = (prev_sample == 1 && new_sample_in[15] == 0 && !reset) ? `ACTIVE : state; 
            
            // Next is set to 0 in the active state when reset is pressed or 256 audio samples have been input (255 + 1 = 0)
            `ACTIVE:   next_state = (next == 9'b0) ? `WAIT : state; 
            
            // This state prevents us from inverting read_index while indices are still being read by wave_reader.v
            `WAIT: next_state = wave_display_idle ? `ARMED : state;
            default: next_state = `ARMED;
        endcase
    end
    
endmodule
