`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/15 19:43:55
// Design Name: 
// Module Name: quadrature_decoder
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


module quadrature_decoder(
    input clk,
    input A_channel, B_channel,
    output [7:0] counter
    );

reg [1:0] A_delay, B_delay;
always @(posedge clk)
    begin
        A_delay <= {A_delay[0], A_channel};
        B_delay <= {B_delay[0], B_channel};
    end

wire cnt_enable;
wire forward;
assign cnt_enable = ^{A_delay, B_delay};
assign forward = A_delay[0] ^ B_delay[1];

reg [7:0] cnt=8'd0;
always @(posedge clk)
    if (cnt_enable==1'b1) cnt <= (forward==1'b1 ? cnt+8'd1 : cnt-8'd1);

assign counter = cnt;
endmodule
