`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/01 08:28:59
// Design Name: 
// Module Name: dclock_tb
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


module dclock1_tb(

    );
    reg clk;
    wire dclk;
    dclock1 DUP1 (.clk(clk),.dclk(dclk));
    integer i;
    initial
        begin
            clk = 0;
            for(i=0;i<=100;i=i+1)
                 #10 clk = ~clk;
        end 
endmodule
