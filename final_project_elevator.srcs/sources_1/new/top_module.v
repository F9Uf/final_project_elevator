`timescale 1ns / 1ps

module top_module(
    input clk,
    input UO1, UO2, UO3, UO4,
    input DO1, DO2, DO3, DO4,
    input IN1, IN2, IN3, IN4,
       
    output ledUp, ledDown
    );
    // direction of elevator
    parameter UP = 1'b1;
    parameter DOWN = 1'b0;
    // delay
    parameter door = 4;
    parameter move = 2;
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
    
    wire in1, in2, in3, in4, reIn1, reIn2, reIn3, reIn4;
    wire uo1, uo2, uo3, uo4, reUo1, reUo2, reUo3, reUo4;
    wire do1, do2, do3, do4, reDo1, reDo2, reDo3, reDo4;
    
    buttonControl IN1(clk, IN1, reIn1, in1);
    buttonControl IN2(clk, IN2, reIn2, in2);
    buttonControl IN3(clk, IN3, reIn3, in3);
    buttonControl IN4(clk, IN4, reIn4, in4);
    buttonControl UO1(clk, UO1, reUo1, uo1);
    buttonControl UO2(clk, UO2, reUo2, uo2);
    buttonControl UO3(clk, UO3, reUo3, uo3);
    buttonControl UO4(clk, UO4, reUo4, uo4);
    buttonControl DO1(clk, DO1, reDo1, do1);
    buttonControl DO2(clk, DO2, reDo2, do2);
    buttonControl DO3(clk, DO3, reDo3, do3);
    buttonControl DO4(clk, DO4, reDo4, do4);
    
  
endmodule
