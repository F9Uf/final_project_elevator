`timescale 1ns / 1ps

module sevenseg_board(
    input clkIn,
    input door,
    
    output reg [3:0] an,
    output reg [6:0] seg
    );
    
    wire clkOut;
    segClk sc(clkIn, clkOut);
    
    reg tm;
    initial tm = 0;
    
    reg [2:0] first, second;
    
    always @ (posedge clkOut) begin
        if(tm)begin
            tm <= 0;
            an <= 4'b0111;
            seg <= door ? 7'b1000000 : 7'b1000110;
        end
        else begin
            tm <= 1;
            an <= 4'b1011;
            seg <= door ? 7'b0001100 : 7'b0010010;
        end
    end
endmodule
