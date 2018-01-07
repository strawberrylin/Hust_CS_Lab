`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/17 03:49:37
// Design Name: 
// Module Name: clock_module
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

//the fundamental clock ,only a counter which can count as s,m,h
module clock_module(
sin,min,hin,resets,resetm,reseth,couts,coutm,saout,sfout,maout,mfout,haout,hfout
    );
    input sin,min,hin,resets,resetm,reseth;
    output  couts,coutm;
    output [3:0] saout,sfout,maout,mfout,haout,hfout;
    modle_60 DUCS (.clk(sin),.reset(resets),.cout(couts),.fout(sfout),.aout(saout));
    modle_60 DUCM (.clk(min),.reset(resetm),.cout(coutm),.fout(mfout),.aout(maout));
    modle_24 DUCH (.clk(hin),.reset(reseth),.fout(hfout),.aout(haout));
endmodule
