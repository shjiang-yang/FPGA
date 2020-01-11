`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/08 15:02:49
// Design Name: 
// Module Name: music_box
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


module music_box(
    input clk,
    input [3:0] note,
    input [2:0] octave,
    output reg speaker=1'd0
    );

reg [9:0] clkdivider=10'd0;
always @(note)
    case (note)
         0: clkdivider = 10'd747;//C
         1: clkdivider = 10'd705;//C#/Db
         2: clkdivider = 10'd665;//D
         3: clkdivider = 10'd627;//D#/Eb
         4: clkdivider = 10'd592;//E
         5: clkdivider = 10'd558;//F
         6: clkdivider = 10'd527;//F#/Gb
         7: clkdivider = 10'd497;//G
         8: clkdivider = 10'd469;//G#/Ab
         9: clkdivider = 10'd442;//A
        10: clkdivider = 10'd417;//A#/Bb
        11: clkdivider = 10'd394;//B
        default: clkdivider = 10'd0;
    endcase

reg [9:0] counter_note=10'd0;
always @(posedge clk) counter_note <= counter_note==10'd0 ? clkdivider : counter_note-10'd1;

reg [7:0] counter_octave=8'd0;
always @(posedge clk)
    if (counter_note==10'd0) begin
        if (counter_octave==8'd0) 
            case (octave)
                0: counter_octave <= 8'd255;
                1: counter_octave <= 8'd127;
                2: counter_octave <= 8'd63;
                3: counter_octave <= 8'd31;
                4: counter_octave <= 8'd15;
                5: counter_octave <= 8'd7;
                default: counter_octave <= 8'd0;//never happen
            endcase
        else
            counter_octave  <= counter_octave-8'd1;
    end

always @(posedge clk) if (counter_note==10'd0 && counter_octave==8'd0) speaker <= ~speaker;
endmodule
