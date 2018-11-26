`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 02:42:41 PM
// Design Name: 
// Module Name: liffClk
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


module liffClk(
    input clkIn,
    output reg clkOut
    );
    reg [31:0] counter;
    always @(posedge clkIn) begin
        if (counter == 300000000) begin // 300-000-000 or 3 second
            counter <= 0;
            clkOut <= ~clkOut;
        end
        else begin
            counter <= counter + 1;        
        end
    end
endmodule
