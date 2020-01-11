`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/10 21:25:27
// Design Name: 
// Module Name: music_box_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: clk: 25MHz
// 
//////////////////////////////////////////////////////////////////////////////////


module music_box_top(
    input clk,
    output speaker
    );

wire [7:0] adrs;
wire [5:0] octANDnote;
wire [2:0] octave;
wire [3:0] note;

gen_address gen_adrs2_ROM(
    .clk(clk),
    .adrs(adrs)
);

music_ROM get_music(
    .clk(clk),
    .adrs(adrs),
    .note(octANDnote)
);

decoder2_octAndnote get_octANDnote(
    .numerator(octANDnote),
    .quotient(octave),
    .remainder(note)
);

music_box gen_speaker(
    .clk(clk),
    .octave(octave),
    .note(note),
    .speaker(speaker)
);
endmodule
