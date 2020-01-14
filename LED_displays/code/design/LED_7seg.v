`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/14 11:17:46
// Design Name: 
// Module Name: LED_7seg
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


module LED_7seg(
    input clk,
    output [7:0] seg_ABCDEFG_DP
    );

reg [23:0] cnt=24'd0;
always @(posedge clk) cnt <= cnt + 24'd1;
wire cntvof = &cnt;

reg [3:0] BCD_new = 4'd0;
reg [3:0] BCD_old = 4'd0;
always @(posedge clk) if (cntvof) BCD_new <= (BCD_new==4'd9 ? 4'd0 : BCD_new+4'd1);
always @(posedge clk) if (cntvof) BCD_old <= BCD_new;

reg [4:0] PWM = 5'd0;
wire [3:0] PWM_input = cnt[22:19];
always @(posedge clk) PWM <= PWM[3:0] + PWM_input;
wire [3:0] BCD = (cnt[23] | PWM[4]) ? BCD_new : BCD_old;

reg [7:0] SevenSeg;
always @(*)
case (BCD)
    4'd0: SevenSeg = 8'b1111_1100;
    4'd1: SevenSeg = 8'b0110_0000;
    4'd2: SevenSeg = 8'b1101_1010;
    4'd3: SevenSeg = 8'b1111_0010;
    4'd4: SevenSeg = 8'b0110_0110;
    4'd5: SevenSeg = 8'b1011_1110;
    4'd6: SevenSeg = 8'b1011_1110;
    4'd7: SevenSeg = 8'b1110_0000;
    4'd8: SevenSeg = 8'b1111_1110;
    4'd9: SevenSeg = 8'b1111_0110;
    default: SevenSeg = 8'b0000_0000;
endcase

assign seg_ABCDEFG_DP = SevenSeg;
endmodule
