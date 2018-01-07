`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 10:30:28
// Design Name: 
// Module Name: seven_segment_tb
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


module seven_segment_tb(

    );
    reg [3:0]x;
    wire [7:0]seg;
        seven_segment DUT1 (.x(x),.seg(seg));
        initial
            begin
                x=0;
                #10 x=1;
                #10 x=2;
                #10 x=3;
                #10 x=4;
                #10 x=5;
                #10 x=6;
                #10 x=7;
                #10 x=8;
                #10 x=9;
                #10 x=10;
            #20;
            end
endmodule
