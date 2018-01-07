`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/04 16:04:06
// Design Name: 
// Module Name: modle_24_tb
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


module modle_24_tb(

    );
    reg clk,reset;
    wire [7:0] fout,aout;
    integer i;
    modle_24 DUP3 (.clk(clk),.reset(reset),.fout(fout),.aout(aout));
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
