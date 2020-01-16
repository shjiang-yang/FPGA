`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/11 11:02:04
// Design Name: 
// Module Name: musix_box_tb
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


module musix_box_tb(
    );

reg clk=1'd0;
always #20 clk <= ~clk;

music_box_top music_box_tb(
    .clk(clk),
    .speaker()
);

endmodule
