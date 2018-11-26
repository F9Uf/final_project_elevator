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
    input act_out1, act_out2, act_out3, act_out4,
    input dir_out1, dir_out2, dir_out3, dir_out4,
    input in1, in2, in3, in4,
    
    output reg [6:0] seg
    output ledUp, ledDown
    );
    // direction of elevator
    parameter UP = 1'b1;
    parameter DOWN = 1'b0;
    // floor
    parameter floor1 = 3'b001;
    parameter floor2 = 3'b010;
    parameter floor3 = 3'b011;
    parameter floor4 = 3'b100;
    
    reg delay = 0;
    reg dir;
    reg pre_floor;
    
    initial dir = UP;
    initial pre_floor = floor1;
    
    wire liffClk;
    
    liffClk lc(clk, liffClk); // clock for change floor
    
    always @ (posedge liffClk) begin
        if (delay > 0) begin
            delay <= delay - 1 ;
        end
        else begin
            
            if (dir == UP) begin
                // for open
                if (pre_floor == floor1 & (in1|act_out1)) begin
                    delay = 1;
                    act_out1 = 0;
                    in1 = 0;
                end
                else if (pre_floor == floor2 & (in2|(act_out2 & dir_out2)|(act_out2 & ~dir_out2 & ~in3 & ~in4 & ~act_out3 & ~act_4) )) begin
                    delay = 1;
                    act_out2 = 0;
                    dir_out2 = 0;
                    in2 = 0;
                end
                else if (pre_floor == floor3 & (in3|(act_out3 & dir_out3))) begin // not finish
                    delay = 1;
                    act_out3 = 0;
                    dir_out3 = 0;
                    in2 = 0;
                end
                else if (pre_floor == floor4 & (in4|act_out4)) begin // not finish
                    delay = 1;
                    act_out4 = 0;
                    in2 = 0;             
                end
                // for go
                
                /*     
                    if there are higher dir_out = UP or higher in : floor ++;
                    else if there are higher dir_out or higher in = DOWN : floor ++;
                    else if at least 1 active : dir = DOWN; floor --;
                
                */
            end
            else if (dir == DOWN) begin // not finish
            end
        end
    end
    
endmodule
