`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 15:50:45
// Design Name: 
// Module Name: HAZARD
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


module HAZARD(
lw,rt_ifid,rt_idex,rs_ifid,stop,clear
    );
input lw;
input [4:0] rt_ifid,rt_idex,rs_ifid;

output stop,clear;

assign clear = ((rt_idex == rs_ifid) || (rt_idex == rt_ifid)) && lw;
assign stop = !clear;
endmodule
