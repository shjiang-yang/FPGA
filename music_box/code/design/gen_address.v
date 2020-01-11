`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/10 21:45:40
// Design Name: 
// Module Name: gen_address
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


module gen_address(
    input clk,
    output [7:0] adrs
    );

reg [29:0] tone=30'd0;
always @(posedge clk) tone <= tone + 30'd1;

assign adrs = tone[29:22];
endmodule
