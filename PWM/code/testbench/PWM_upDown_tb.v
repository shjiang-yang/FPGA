`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/16 16:41:38
// Design Name: 
// Module Name: PWM_upDown_tb
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


module PWM_upDown_tb();

reg clk=1'b0;
always #20 clk <= ~clk;

reg [3:0] PWM_in = 4'd10;

PWM DUT(
    .clk(clk),
    .PWM_in(PWM_in),
    .PWM_out()
);
endmodule
