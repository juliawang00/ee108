module master_fsm (
  input clk,
  input rst,
  input next,
  input faster,
  input slower
);
  programmable_blinker #(22) flash(.up_button(faster), .down_button(faster));
  // state 1: OFF (also come here at reset)
  
  // state 2: ON
  // state 3: OFF
  // state 4: FLASH 1
  // state 5: OFF
  // state 6: FLASH 2

endmodule
