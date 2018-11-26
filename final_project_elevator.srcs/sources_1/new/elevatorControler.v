`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 04:00:12 PM
// Design Name: 
// Module Name: elevatorControler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module elevatorControler(
    input clk,
    input [1:0] out1, out2, out3, out4,
    input in1, in2, in3, in4,
    
    output [6:0] seg,
    output ledUp, ledDown
    );
endmodule
