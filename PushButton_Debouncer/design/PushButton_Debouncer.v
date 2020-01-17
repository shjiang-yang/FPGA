`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/17 16:03:09
// Design Name: 
// Module Name: PushBotton_Debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: '1' botton
// 
//////////////////////////////////////////////////////////////////////////////////


module PushButton_Debouncer(
    input clk,
    input PB,
    output reg PB_state=1'b0,
    output PB_up,
    output PB_down
    );

reg [7:0] cnt=8'd0;
wire cnt_max = &cnt;
reg [1:0] PB_syn;
always @(posedge clk) PB_syn <= {PB_syn[0], ~PB};

wire PB_idle = (PB_syn[1]==PB_state);

always @(posedge clk) 
    if (PB_idle) 
        cnt <= 8'd0;
    else
    begin
        cnt <= cnt + 8'd1;
        if (cnt_max) PB_state <= ~PB_state;
    end

assign PB_up = cnt_max & (PB_state) & (~PB_idle);
assign PB_down = cnt_max & (~PB_state) & (~PB_idle);
endmodule
