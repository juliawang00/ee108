`timescale 1ns/1ps
module lab0_top_tb();
 
    reg sim_left_pushbutton;
    reg sim_right_pushbutton;
    reg [3:0] sim_A;
    reg [3:0] sim_B;
    wire [3:0] sim_out;
    
    lab0_top DUT(.left_pushbutton(sim_left_pushbutton),
                .right_pushbutton(sim_right_pushbutton),
                .A(sim_A),
                .B(sim_B),
                .out(sim_out));
    initial begin
    
        sim_left_pushbutton = 1'b0;
        sim_right_pushbutton = 1'b0;
        sim_A = 4'b0;
        sim_B = 4'b0;
        
        #5
        
        sim_left_pushbutton = 1'b1;
        sim_A = 4'b1100;
        sim_B = 4'b1010;
        
        #5
        
        $display("Output is %b, we expected %b", sim_out, (4'b1100 & 4'b1010));

        sim_left_pushbutton = 1'b0;
        sim_right_pushbutton = 1'b1;
        sim_A = 4'b1100;
        sim_B = 4'b1010;
        #5
         
        $display("Output is %b, we expected %b", sim_out, (4'b1100 + 4'b1010));
        // Try changing our inputs, note that we're still adding!
        sim_A = 4'b0001;
        sim_B = 4'b0011;
        #5
         
        $display("Output is %b, we expected %b", sim_out, (4'b0001 + 4'b0011));
         
        // Let's go back to ANDing
        sim_left_pushbutton = 1'b1;
        sim_right_pushbutton = 1'b0;
        #5
         
        $display("Output is %b, we expected %b", sim_out, (4'b0001 & 4'b0011));

        $stop;
    end
 
endmodule
