`timescale 1ns / 1ps

module top_module(
    input clk,
    input IN1, IN2, IN3, IN4,
    input UO1, UO2, UO3,
    input DO2, DO3, DO4,

    output LI1, LI2, LI3, LI4,
    output LU1, LU2, LU3,
    output LD2, LD3, LD4,
    output ledUp, ledDown,
    output [5:0] door, //led door on board
    output [7:0] seg,
    output [3:0] an,
    output [6:0] segB
    );
        
    wire in1, in2, in3, in4, reIn1, reIn2, reIn3, reIn4;
    wire uo1, uo2, uo3, reUo1, reUo2, reUo3;
    wire do2, do3, do4, reDo2, reDo3, reDo4;
    
    wire [2:0] state;
    wire direction;
    wire delay;
    
    buttonControl
        bc(IN1, IN2, IN3, IN4,
            UO1, UO2, UO3, 
            DO2, DO3, DO4, 
            reIn1, reIn2, reIn3, reIn4, //use re
            reUo1, reUo2, reUo3, //use re
            reDo2, reDo3, reDo4, //use re
            in1, in2, in3, in4,     //use
            uo1, uo2, uo3,     //use
            do2, do3, do4 );   //use
            
    elevatorControl
        ec(clk, in1, in2, in3, in4,
                uo1, uo2, uo3,
                do2, do3, do4,
                {reIn1, reIn2, reIn3, reIn4,
                reUo1, reUo2, reUo3,
                reDo2, reDo3, reDo4},
            state, direction, delay
            );
    
//    display ds();   
    sevenseg ss(clk, state, seg);
    
    sevenseg_board sb(clk, delay, an, segB);
    
    doorAnima da(clk, delay, door);
    
    assign ledUp = direction ? 1'b1:1'b0;
    assign ledDown = ~direction ? 1'b1:1'b0;
    // light btn
    assign LI1 = in1;
    assign LI2 = in2;
    assign LI3 = in3;
    assign LI4 = in4;
    assign LU1 = uo1;
    assign LU2 = uo2;
    assign LU3 = uo3;
    assign LD2 = do2;
    assign LD3 = do3;
    assign LD4 = do4;
endmodule
