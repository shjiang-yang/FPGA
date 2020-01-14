`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/13 10:47:45
// Design Name: 
// Module Name: LedGlow
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


module LedGlow(
    input clk,
    output led
    );

reg [23:0] cnt=24'd0;
always @(posedge clk) cnt <= cnt + 24'd1;

wire [3:0] PWM_input = cnt[23] ? cnt[22:19] : ~cnt[22:19];

reg [4:0] PWM=5'd0;
always @(posedge clk) PWM <= PWM[3:0] + PWM_input;

assign led = PWM[4];
endmodule
