`define SONG_WIDTH 8
`define NOTE_WIDTH 6
`define DURATION_WIDTH 6
`define MSB 1
`define OPTIONS 3

// ----------------------------------------------
// Define State Assignments
// ----------------------------------------------
`define SWIDTH 3
`define PAUSED             3'b000
`define WAIT               3'b001
`define INCREMENT_ADDRESS  3'b010
`define RETRIEVE_NOTE1     3'b011
`define RETRIEVE_NOTE2     3'b100
`define RETRIEVE_NOTE3     3'b101
`define RETRIEVE_WAIT      3'b110
`define NEW_NOTE_READY     3'b111


module song_reader(
    input clk,
    input reset,
    input play,
    input [1:0] song,
    input note_done1,
    input note_done2,
    input note_done3,
    output wire song_done,
    output wire [5:0] note1,
    output wire [5:0] duration1,
    output wire [5:0] note2,
    output wire [5:0] duration2,
    output wire [5:0] note3,
    output wire [5:0] duration3,
    output wire new_note1,
    output wire new_note2,
    output wire new_note3
);
    wire [`SONG_WIDTH-1:0] curr_note_num, next_note_num;    // Counter for addresses of a song. Up to 128.
    wire [`MSB + `NOTE_WIDTH + `DURATION_WIDTH + `OPTIONS -1:0] note_and_duration; // 16 bits. Value read from the rom and as specified in lab directions. MSB specifies if reading a note or wait period.
    wire [`SONG_WIDTH + 1:0] rom_addr = {song, curr_note_num}; // Address in the rom to read.
    
    
    //note_done is ready to load. As soon as we load with arbiter, set that new_note high {new_note1, not1, duration1} = {1, 
//     wire loaded1 = blah; 
//     wire loaded2 = blah;
//     wire loaded3 = blah;
    
//     wire availabe1 = note_done1 || ~loaded1; // HOW DO I FIGURE OUT IF A NOTE_PLAYER IS LOADED???
//     wire availabe2 = note_done2 || ~loaded2;
//     wire availabe3 = note_done3 || ~loaded3;
    
    //reg [47:0] all_notes_duration; // This wire dedicates sixteen bits for a note and duration to send to each note_player module. The module only expects 12 bits, but 16 makes computation easier.

    wire [`SWIDTH-1:0] state;
    reg  [`SWIDTH-1:0] next;
    
    wire [1:0] cur_note_module;
    wire [1:0] next_note_module;

    // For identifying when we reach the end of a song
    wire overflow;

    dffr #(`SONG_WIDTH) note_counter (
        .clk(clk),
        .r(reset),
        .d(next_note_num),
        .q(curr_note_num)
    );
    dffr #(`SWIDTH) fsm (
        .clk(clk),
        .r(reset),
        .d(next),
        .q(state)
    );
    
    dffr #(`DURATION_WIDTH) wait_countdown (
        .clk(clk),
        .r(reset),
        .e(note_and_duration[15]),
        .d(duration_to_load),
        .q(countdown)
    );

    song_rom rom(.clk(clk), .addr(rom_addr), .dout(note_and_duration));
    
    // Count down when we are in the WAIT state, otherwise set the note to the duration value. It will be properly set before we reach state WAIT.
    assign duration_to_load = (state==`WAIT) ? countdown - 1 : note_and_duration[5:0];
    wire done_wait = (countdown==6'b0);
    
    // When the MSB of note_and_duration is high, we are at a wait period and should reset the counter otherwise we increment to load the next note_player_module
//     assign next_note = note_and_duration[15] ? 2'b00 : cur_note + 1'b1; 
    
//     always @(*) begin
//         case (cur_note_module)
//             2'b00:      all_notes_duration = {all_notes_duration[47:12], note_and_duration};
//             2'b01:      all_notes_duration = {all_notes_duration[47:12], note_and_duration};
//             2'b10:      all_notes_duration = {all_notes_duration[47:12], note_and_duration};
//             2'b11:      all_notes_duration = {all_notes_duration[47:12], note_and_duration};
//             default:    all_notes_duration = {48'b0};
//         endcase
//     end
            

    always @(*) begin
        case (state)
            `PAUSED:            next = play ? `RETRIEVE_NOTE1 : `PAUSED;
            // HAVE ONLY ONE RETRIEVE STATE THAT GOES TO WAIT WHEN ARBITER OUTPUTS 0
            `RETRIEVE_NOTE1:    next = !play ? `PAUSED : note_and_duration[15] ? `WAIT : `RETRIEVE_NOTE2;
            `RETRIEVE_NOTE2:    next = !play ? `PAUSED : note_and_duration[15] ? `WAIT : `RETRIEVE_NOTE3;
            `RETRIEVE_NOTE3:    next = !play ? `PAUSED : note_and_duration[15] ? `WAIT : `RETRIEVE_WAIT;
            `RETRIEVE_WAIT:     next = play ? `NEW_NOTE_READY : `PAUSED;
            `NEW_NOTE_READY:    next = play ? `WAIT: `PAUSED;
            `WAIT:              next = !play ? `PAUSED
                                            : (done_wait ? `INCREMENT_ADDRESS
                                                          : `WAIT);
            `INCREMENT_ADDRESS: next = (play && ~overflow) ? `RETRIEVE_NOTE
                                                           : `PAUSED;
            default:            next = `PAUSED;
        endcase
    end

    // We increment when we are in one of the retrieve_note states with the MSB high, or if we are in increment address.
    assign {overflow, next_note_num} =
        ((state == `INCREMENT_ADDRESS) || ((state == `RETRIEVE_NOTE1 || state == `RETRIEVE_NOTE2 || state == `RETRIEVE_NOTE3) && ~note_and_duration[15])) ? {1'b0, curr_note_num} + 1
        : {1'b0, curr_note_num};
    
    //     assign new_note = (state == `NEW_NOTE_READY); DO IN ARBITER
    
    // These need to be done in the RETRIEVE_NOTE states; DONE IN ARBITER
//     assign {note1, duration1} = reset ? 12'b0 : ~loaded1 ? note_and_duration : {note1, duration1}; // Have to make loaded high here. Goes back to low when note_done1 is high.
//     assign {note2, duration2} = reset ? 12'b0 : ~loaded2 ? note_and_duration : {note2, duration2};
//     assign {note3, duration3} = reset ? 12'b0 : ~loaded3 ? note_and_duration : {note3, duration3};
    
    
    assign song_done = overflow;

endmodule
