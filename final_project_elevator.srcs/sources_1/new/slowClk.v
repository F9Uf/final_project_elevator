`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 02:36:02 PM
// Design Name: 
// Module Name: slowClk
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


module slowClk(
    input clkIn,
    input reg clkOut
    );
    reg counter;
    
    always @ (posedge clkIn) begin
        if (counter == 300000000
    end
    
    
endmodule
