`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/10 11:16:28
// Design Name: 
// Module Name: divide
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


module decoder2_octAndnote(
    input [5:0] numerator,
    output reg [2:0] quotient,
    output [3:0] remainder
    );

reg [1:0] remainder3to2;
always @(numerator[5:2])
case (numerator[5:2])
     4'd0: begin quotient = 3'd0; remainder3to2 = 2'd0; end 
     4'd1: begin quotient = 3'd0; remainder3to2 = 2'd1; end 
     4'd2: begin quotient = 3'd0; remainder3to2 = 2'd2; end 
     4'd3: begin quotient = 3'd1; remainder3to2 = 2'd0; end 
     4'd4: begin quotient = 3'd1; remainder3to2 = 2'd1; end 
     4'd5: begin quotient = 3'd1; remainder3to2 = 2'd2; end 
     4'd6: begin quotient = 3'd2; remainder3to2 = 2'd0; end 
     4'd7: begin quotient = 3'd2; remainder3to2 = 2'd1; end 
     4'd8: begin quotient = 3'd2; remainder3to2 = 2'd2; end 
     4'd9: begin quotient = 3'd3; remainder3to2 = 2'd0; end 
    4'd10: begin quotient = 3'd3; remainder3to2 = 2'd1; end 
    4'd11: begin quotient = 3'd3; remainder3to2 = 2'd2; end 
    4'd12: begin quotient = 3'd4; remainder3to2 = 2'd0; end 
    4'd13: begin quotient = 3'd4; remainder3to2 = 2'd1; end 
    4'd14: begin quotient = 3'd4; remainder3to2 = 2'd2; end 
    4'd15: begin quotient = 3'd5; remainder3to2 = 2'd0; end 
endcase

assign remainder = {remainder3to2, numerator[1:0]};
endmodule
