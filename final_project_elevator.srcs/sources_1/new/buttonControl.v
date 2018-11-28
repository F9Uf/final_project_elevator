`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 01:53:42 PM
// Design Name: 
// Module Name: buttonControl
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


module buttonControl(
    input clkIn,
    input click,
    input reset,
    
    output reg Q
    );
    
    always @ (posedge clkIn) begin
        Q <= (Q | click) & ~reset;
    end
endmodule
