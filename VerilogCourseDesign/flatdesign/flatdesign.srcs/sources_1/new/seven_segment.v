`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/28 11:30:38
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(
x,seg);
    input [3:0] x;
    output [7:0] seg;
    assign seg[7] = 1;
    assign seg[6] = ((~x[3])&(~x[1])&(x[2]^x[0]));
    assign seg[5] = ((~x[3])&x[2]&(x[1]^x[0]));
    assign seg[4] = ((~x[3])&(~x[2])&x[1]&(~x[0]));
    assign seg[3] = ((x[0]&(~x[1])&(~x[2])&(~x[3]))|((~x[0])&(~x[1])&x[2])|(x[0]&x[1]&x[2]));
    assign seg[2] = (x[0]|((~x[1])&x[2]));
    assign seg[1] = ((x[0]&(~x[1])&(~x[2])&(~x[3]))|(x[1]&~x[2])|(x[0]&x[1]&x[2]));
    assign seg[0] = ((x[0]&x[1]&x[2]&~x[3])|(~x[3]&~x[1]&~x[2]));
endmodule
