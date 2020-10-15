module master_fsm (
  input faster, 
  input slower, 
  input [3:0] next,
  output wire mux_input,
  output wire shift_left,
  output wire shift_right
);
  wire [3:0] state; // total of 6 possible states
  
  programmable_blinker #(22) flash(.up_button(faster), .down_button(faster));
  reg input;
  always @(*) begin
    case(state)
      3'b001: // ON --> call mux with high
        input = 1'b1;
      3'b011: // FLASH 1
        programmable_blinker #() fast_blinker(.up_button(faster), .down_button(slower));
      3'b101: // FLASH 2
        programmable_blinker #() slow_blinker(.up_button(faster), .down_button(slower));
      default: // OFF --> call mux with low
        input = 1'b0;
    endcase
  end
  
  assign mux_input = input;
  assign state = next;
  assign next = rst ? 3'b000 : next + 1;

endmodule
