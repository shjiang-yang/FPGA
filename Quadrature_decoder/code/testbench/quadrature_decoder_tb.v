`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/15 20:15:02
// Design Name: 
// Module Name: quadrature_decoder_tb
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


module quadrature_decoder_tb();

reg clk=1'b0;
always #5 clk <= ~clk;

parameter delay=170/2;
reg A_channel=1'b0;
reg B_channel=1'b0;
initial 
    begin
        #100 A_channel=1;
        #delay B_channel=1;
        #delay A_channel=0;
        #delay B_channel=0;
        #delay A_channel=1;
        #delay B_channel=1;
        #500 A_channel=0;
        B_channel=0;
        #500 B_channel=1;
        #delay A_channel=1;
        #delay B_channel=0;
        #delay A_channel=0;
        #delay B_channel=1;
        #delay A_channel=1;
        #500 $stop;
    end

quadrature_decoder DUT(
    .clk(clk),
    .A_channel(A_channel),
    .B_channel(B_channel),
    .counter()
);
endmodule
