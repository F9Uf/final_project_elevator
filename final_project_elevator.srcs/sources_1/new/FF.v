`timescale 1ns / 1ps

module FF(
    input click,
    input reset,
    output reg Q
    );
    
    always @(posedge click or posedge reset) begin
//        Q <= (Q|click) & ~reset;
        if(reset)
            Q <= 0;
        else if (click)
            Q <= ~Q;
    end
endmodule




//module buttonControl(
//    input clkIn,
//    input click,
//    input reset,
    
//    output reg Q
//    );
    
//    always @ (posedge clkIn) begin
//        Q <= (Q | click) & ~reset;
//    end
//endmodule