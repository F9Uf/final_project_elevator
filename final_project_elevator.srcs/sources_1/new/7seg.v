`timescale 1ns / 1ps
module sevenseg(
    input clk,
    input [2:0] state,
    output reg [6:0] seg
    );
    
    always @ (posedge clk)
        case (state)
            3'b001: seg = 7'b1111001;
            3'b010: seg = 7'b0100100; //2
            3'b011: seg = 7'b0110000; //3
            3'b100: seg = 7'b0011001; //4
        endcase
endmodule
