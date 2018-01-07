`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/04 13:33:07
// Design Name: 
// Module Name: modle_six
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


module modle_six(
clk,reset,cout,num
    );
    input clk,reset;
    output reg cout;
    output reg [3:0] num;
    always@(posedge clk or negedge reset)
        begin
            if(!reset)
                begin
                    num<= 4'b0;
                    cout<=1'b0;
                end
            else if(num== 4'd5)
                begin
                    num<= 4'b0;
                    cout<=1'b1;
                end
            else 
                begin
                    num<=num+1;
                    cout<=1'b0;
                end
        end
endmodule
