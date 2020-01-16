`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/13 10:56:13
// Design Name: 
// Module Name: LedGlow_tb
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


module LedGlow_tb();

reg clk=1'd0;
always #25 clk <= ~clk;

LedGlow DUT(
    .clk(clk),
    .led()
);

endmodule
