`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/16 16:40:37
// Design Name: 
// Module Name: PWM_upDown
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


module PWM(
    input clk,
    input [3:0] PWM_in,
    output PWM_out
);

reg [3:0] cnt=4'd0;
reg cnt_dir=1'b0;  // 0 to count up, 1 to count down
wire [3:0] cnt_next = cnt_dir ? cnt-1'b1 : cnt+1'b1;
wire cnt_end = cnt_dir ? cnt==4'b0000 : cnt==4'b1111;

always @(posedge clk) cnt <= cnt_end ? PWM_in : cnt_next;
always @(posedge clk) cnt_dir <= cnt_dir ^ cnt_end;
assign PWM_out = cnt_dir;
endmodule
