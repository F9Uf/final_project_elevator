`timescale 1ns / 1ps


module segDoor(
    input clkIn,
    input door,
    
    output reg [3:0] an,
    output reg [6:0] seg
    );
    wire clkOut;
    reg tm;
    initial tm = 0;
    segClk sc(clkIn, clkOut);
    
    always @ (posedge clkIn) begin
        if(tm) begin
            an <= 4'b0111;
            tm <= 0;
            seg <= door? 7'b1000000 : 7'b1000110;
        end
        else begin
            an <= 4'b1011; 
            tm <= 1;
            seg <= door? 7'b0001100 : 7'b0010010;
        end
    end
endmodule
