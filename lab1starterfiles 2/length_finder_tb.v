module length_finder_tb ();

   reg [63:0] in;
   wire [3:0] len;
   
   length_finder dut (
      .string (in),
      .length (len)
   );
   
   initial begin
      in = 64'hAABBCCDDEEFFAA00;
      $display("Output is %b, we expected %b", len, 4'b0001);
      #5
      in = 64'hAABBCCDDEEFFAA99;
      $display("Output is %b, we expected %b", len, 4'b1000);
      #5
      in = 64'hAABBCCDDEEFF00AA;
      $display("Output is %b, we expected %b", len, 4'b0010);
      #5
      in = 64'hAABBCCDDEE00FFAA;
      $display("Output is %b, we expected %b", len, 4'b0011);
      #5
      in = 64'hAABBCC00EE00FFAA;
      $display("Output is %b, we expected %b", len, 4'b0011);
      #5
      in = 64'h00BBCCDDEE44FFAA;
      $display("Output is %b, we expected %b", len, 4'b0111);
      #5
      in = 64'h00BBCC00EE44FFAA;
      $display("Output is %b, we expected %b", len, 4'b0101);
      #5
      in = 64'h44BBC00DEE44FFAA;
      $display("Output is %b, we expected %b", len, 4'b1000);
      #5
      in = 0;
      $display("Output is %b, we expected %b", len, 4'b0001);
      
      $stop;
   end
   
endmodule
