`timescale 1ns / 1ps


module buttonControl(
    input IN1, IN2, IN3, IN4,
    input UO1, UO2, UO3,
    input DO2, DO3, DO4,
    input reIN1, reIN2, reIN3, reIN4,
            reUO1, reUO2, reUO3,
            reDO2, reDO3, reDO4,
    
    output sIN1, sIN2, sIN3, sIN4,
    output sUO1, sUO2, sUO3,
    output sDO2, sDO3, sDO4
    );
    
    FF I1(IN1, reIN1, sIN1);
    FF I2(IN2, reIN2, sIN2);
    FF I3(IN3, reIN3, sIN3);
    FF I4(IN4, reIN4, sIN4);
    FF U1(UO1, reUO1, sUO1);
    FF U2(UO2, reUO2, sUO2);
    FF U3(UO3, reUO3, sUO3);
    FF D2(DO2, reDO2, sDO2);
    FF D3(DO3, reDO3, sDO3);
    FF D4(DO4, reDO4, sDO4);
    
endmodule
