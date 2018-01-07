`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/04 13:34:31
// Design Name: 
// Module Name: modle_60
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


module modle_60(
clk,reset,cout,fout,aout
    );
    input clk,reset;
    output wire cout;
    output wire [3:0] fout,aout;
    wire coutm;
    modle_ten DUPF (.clk(clk),.reset(reset),.cout(coutm),.num(aout));
    modle_six DUPA (.clk(coutm),.reset(reset),.cout(cout),.num(fout));
endmodule
