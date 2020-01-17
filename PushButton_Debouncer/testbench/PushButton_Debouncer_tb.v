`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/17 16:34:12
// Design Name: 
// Module Name: PushBotton_Debouncer_tb
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


module PushButton_Debouncer_tb();

reg clk=1'b0;
always #20 clk <= ~clk;

reg PB=1'b1;
initial 
begin
    #526 PB = 1'b0;
    #123 PB = 1'b1;
    #233 PB = 1'b0;
    #567 PB = 1'b1;
    #666 PB = 1'b0;

    #15000 PB = 1'b1;
    #538 PB = 1'b0;
    #564 PB = 1'b1;
    #233 PB = 1'b0;
    #30000 PB = 1'b1;
    #10 PB = 1'b1;
    $stop;
end

PushButton_Debouncer DUT(
    .clk(clk),
    .PB(PB)
);
endmodule
