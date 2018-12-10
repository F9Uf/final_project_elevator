`timescale 1ns / 1ps


module doorAnima(
    input clkIn,
    input door,
    
    output reg [5:0] led
    );
    
    wire clkOut;
    doorClk dc(clkIn, clkOut);
    
    reg [4:0] count;
    initial count = 0;

    always @ (posedge clkOut) begin
        if(door) begin
            if(count == 5)
                count <= 0;
            else
                count <= count +1;
        end
        
    end
    
    always @ (posedge clkOut) begin
        if(door)begin
            case(count)
                5'b00000: led <= 6'b111111;
                5'b00001: led <= 6'b110011;
                5'b00010: led <= 6'b100001;
                5'b00011: led <= 6'b100001;
                5'b00100: led <= 6'b110011;
                5'b00101: led <= 6'b111111;
                
            endcase
        end
        else begin
            led <= 6'b111111;
        end
    end
endmodule
