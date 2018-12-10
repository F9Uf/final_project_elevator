`timescale 1ns / 1ps

module doorClk(
    input clkIn,
    output reg clkOut
    );
    reg [31:0] counter;
    always @(posedge clkIn) begin
        if (counter == 50000000) begin // 100-000-000 or 1 second
            counter <= 0;
            clkOut <= ~clkOut;
        end
        else begin
            counter <= counter + 1;        
        end
    end
endmodule
