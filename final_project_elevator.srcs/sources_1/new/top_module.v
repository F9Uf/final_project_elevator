`timescale 1ns / 1ps

module top_module(
    input clk,
    input IN1, IN2, IN3, IN4,
    input UO1, UO2, UO3,
    input DO2, DO3, DO4,
       
    output ledUp, ledDown,
    output [7:0] seg
    );
        
    wire in1, in2, in3, in4, reIn1, reIn2, reIn3, reIn4;
    wire uo1, uo2, uo3, reUo1, reUo2, reUo3;
    wire do2, do3, do4, reDo2, reDo3, reDo4;
    
    wire [2:0] state;
    wire direction;
    
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
            state, direction
            );
    
//    display ds();   
    sevenseg ss(clk, state, seg);
    assign ledUp = direction ? 1'b1:1'b0;
    assign ledDown = ~direction ? 1'b1:1'b0;
endmodule
