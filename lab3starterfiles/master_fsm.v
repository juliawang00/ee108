module master_fsm (
  input faster, 
  input slower, 
  input [3:0] next 
);
  wire [3:0] state; // total of 6 possible states
  
  programmable_blinker #(22) flash(.up_button(faster), .down_button(faster));
  always @(*) begin
    case(state)
      3'b001: // ON --> call mux with high
        mux #() light(.on(1));
      3'b011: // FLASH 1
        programmable_blinker #() fast_blinker(.up_button(faster), .down_button(slower));
      3'b101: // FLASH 2
        programmable_blinker #() fast_blinker(.up_button(faster), .down_button(slower));
      default: // OFF --> call mux with low
        mux #() light(.on(0));
    endcase
  end
  
  assign state = next;
  assign next = rst ? 3'b000 : next + 1;

endmodule
