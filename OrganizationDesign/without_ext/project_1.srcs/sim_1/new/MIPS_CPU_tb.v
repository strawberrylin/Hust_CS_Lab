`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 11:21:38
// Design Name: 
// Module Name: MIPS_CPU_tb
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


module MIPS_CPU_tb(

    );
    reg clk,power;
    wire [7:0] data_choose,seg_choose;
    
    MIPS_CPU MIPS (.CLK(clk),.power(power),.Dout(data_choose),.Segout(seg_choose));
    integer i;
    initial
       begin
           clk = 0;power = 1;
            for(i=0;i<=5000;i=i+1)
            #1 clk = ~clk;
        end
endmodule
