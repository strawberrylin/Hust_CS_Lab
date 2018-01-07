`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/04 13:52:30
// Design Name: 
// Module Name: modle_60_tb
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


module modle_60_tb(

    );
    reg clk,reset;
    wire cout;
    wire [3:0] fout,aout;
    integer i;
    modle_60 DUP2 (.clk(clk),.reset(reset),.cout(cout),.fout(fout),.aout(aout));
    initial
        begin
            reset =1;clk =0;
            #10 reset =0;
            #10 reset =1;
            end
    initial
        begin
            for(i=0;i<200;i=i+1)
                #10 clk=~clk;
        end
       
endmodule
