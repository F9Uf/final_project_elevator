`timescale 1ns / 1ps

module elevatorControl(
    input clk,
    input IN1, IN2, IN3, IN4,
          UO1, UO2, UO3,
          DO2, DO3, DO4,
          
          
    output reg [9:0] resetButton, //re IN1,...,IN4,UO2,...,UO4,DO1,...,DO4
    
    output [2:0] state,
    output direction,
    output door
    );
    // parameter direction
    parameter UP = 1'b1;
    parameter DOWN = 1'b0;
    // paremeter floor
    parameter floor1 = 3'b001;
    parameter floor2 = 3'b010;
    parameter floor3 = 3'b011;
    parameter floor4 = 3'b100;
    
    parameter d = 2;
    reg dir;
    reg [2:0] delay;
    reg [2:0] preFloor;
    
    initial dir = UP;
    initial delay = 3'b0;
    initial preFloor = floor1;
    
    wire slowClk;
    liffClk lf(clk, slowClk);
    
    always @ (posedge slowClk) begin
        if(preFloor == floor1|preFloor == floor2|preFloor == floor3|preFloor == floor4)begin
            resetButton = 10'b0000000000;
        end
        if(delay > 0) begin
            delay = delay - 1;
        end
        else begin
            if(dir == UP) begin
                if(preFloor == floor4) begin
                    dir = DOWN; // if up to 4-floor change direction to down
                end
                // in stop logic
                if(preFloor == floor1 & (IN1|UO1))begin
                    delay = d;
                    resetButton = 10'b1000100000;
                end
                else if(preFloor == floor2 & (IN2|UO2))begin
                    delay = d;
                    resetButton = 10'b0100010000;
                end
                else if(preFloor == floor2 & (DO2 & ~IN3 & ~IN4 & ~DO3 & ~DO4 & ~UO3))begin
                    delay = d;
                    dir = DOWN;
                    resetButton = 10'b0100000010;
                end
                else if(preFloor == floor3 & (IN3|UO3))begin
                    delay = d;
                    resetButton = 10'b0010001000;
                end
                else if(preFloor == floor3 & (DO3 & ~IN4 & ~DO4))begin
                    delay = d;
                    dir = DOWN;
                    resetButton = 10'b0010000010;
                end
                //end stop logic
                
                //in move Up logic
                if(delay == 0)begin // if not delay
                    if(preFloor == floor1 & (IN2|IN3|IN4|UO2|DO2|UO3|DO3|DO4))begin
                        preFloor = floor2; //up
                    end
                    else if(preFloor == floor2 & (IN3|IN4|UO3|DO3|DO4))begin
                        preFloor = floor3; //up
                    end
                    else if(preFloor == floor2 & (IN1|UO1) & (~IN3 & ~IN4 & ~DO3 & ~DO4 & ~UO3))begin //new***
                        dir = DOWN;
                        preFloor = floor1; //down
                    end
                    else if(preFloor == floor3 & (IN4|DO4))begin
                        preFloor = floor4; //up and change to down;
                        dir = DOWN;
                    end
                    else if(preFloor == floor3 & (IN1|IN2|UO1|UO2|DO2) & (~IN4 & ~DO4))begin //new***
                        dir = DOWN;
                        preFloor = floor2; //down
                    end
                end
                //end move Up logic
            end
            else if(dir == DOWN) begin
                if(preFloor == floor1)begin
                    dir = UP; // if down to 1-floor change direction to up.
                end
                
                //  in stop logic               
                if(preFloor == floor2 & (IN2|DO2))begin
                    delay = d;
                    resetButton = 10'b0100000100;
                end
                else if(preFloor == floor2 & (UO2 & ~IN1 & ~UO1))begin
                    delay = d;
                    resetButton = 10'b0100010000;
                    dir = UP;
                end
                else if(preFloor == floor3 & (IN3|DO3))begin
                    delay = d;
                    resetButton = 10'b0010000010;
                end
                else if(preFloor == floor3 & (UO3 & ~IN2 & ~UO2 & ~DO2 & ~IN1 & ~UO1))begin
                    delay = d;
                    resetButton = 10'b0010001000;
                    dir = UP;
                end
                else if(preFloor == floor4 & (IN4|DO4))begin
                    delay = d;
                    resetButton = 10'b0001000001;
                end
              // end stop logic
              
              // in move Down logic
                if(delay == 0)begin
                    if(preFloor == floor2 & (IN1|UO1))begin
                        preFloor = floor1;
                        dir = UP;
                    end
                    if(preFloor == floor2 & (IN3|IN4|UO3|DO3|DO4) & (~IN1 & ~UO1))begin //new***
                        dir = UP;
                        preFloor = floor3;
                    end
                    else if(preFloor == floor3 & (IN1|IN2|UO2|DO2|UO1))begin
                        preFloor = floor2;
                    end
                    else if(preFloor == floor3 & (IN4|DO4) & (~IN2 & ~IN1 & ~UO2 & ~UO1 & ~DO2))begin //new***
                        dir = UP;
                        preFloor = floor4;
                    end
                    else if(preFloor == floor4 & (IN1|IN2|IN3|UO1|UO2|DO2|UO3|DO3) )begin
                        preFloor = floor3;
                    end
                end
              //end move Down logic
            end // end check UP, DOWN
        end // end if delay
            
    
    end // end always
    
    assign state = preFloor;
    assign direction = dir == UP ? 1'b1 : 1'b0;
    assign door = delay >0 ? 1'b1 : 1'b0;
endmodule
