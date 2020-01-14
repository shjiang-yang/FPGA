`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/14 15:13:00
// Design Name: 
// Module Name: LED_7seg_tb
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


module LED_7seg_tb();

reg clk = 1'b0;
always #25 clk <= ~clk;

LED_7seg DUT(
    .clk(clk),
    .seg_ABCDEFG_DP()
);

endmodule
