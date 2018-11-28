`timescale 1ns / 1ps

module liffClk(
    input clkIn,
    output reg clkOut
    );
    reg [31:0] counter;
    always @(posedge clkIn) begin
        if (counter == 200000000) begin // 200-000-000 or 2 second
            counter <= 0;
            clkOut <= ~clkOut;
        end
        else begin
            counter <= counter + 1;        
        end
    end
endmodule
