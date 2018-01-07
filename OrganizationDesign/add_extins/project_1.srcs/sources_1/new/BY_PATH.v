`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 14:41:28
// Design Name: 
// Module Name: BY_PATH
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


module BY_PATH(
rs1_r,rt1_r,forward1_a,forward1_b,
rs2_r,rt2_r,forward2_a,forward2_b,reg1_write,reg2_write,we_mem,we_wb,slar_in,
rt3_r,forward3_a,forward3_b
    );

wire [1:0]tempa1,temb1;
input [4:0] rs1_r,rt1_r;
output forward1_a,forward1_b;

input [4:0]rs2_r,rt2_r;
input we_mem,we_wb,slar_in;
input [4:0] reg1_write,reg2_write;
output [1:0] forward2_a,forward2_b;

input [4:0] rt3_r;
output forward3_a,forward3_b;

assign forward1_a = (we_wb && (reg2_write) && (rs1_r == reg2_write)) ? 1:0;
assign forward1_b = (we_wb && (reg2_write) && (rt1_r == reg2_write)) ? 1:0;

assign tempa1 = ( we_wb && (reg2_write) && ((slar_in ? rt2_r : rs2_r) == reg2_write)) ? 01 : 00;
assign forward2_a = ( we_mem && (reg1_write) && ((slar_in ? rt2_r : rs2_r) == reg1_write)) ? 10 : tempa1;
assign tempb1 = ( we_wb && (reg2_write) && ((slar_in ? rs2_r : rt2_r) == reg2_write)) ? 01 : 00;
assign forward2_b = ( we_mem && (reg1_write) && ((slar_in ? rs2_r : rt2_r) == reg1_write)) ? 10 :tempb1;

assign forward3_a = ( we_wb && ( reg2_write) && (rt3_r == reg2_write) ) ? 1 : 0;
assign forward3_b = ( we_wb && ( reg2_write) && (rt2_r == reg2_write) ) ? 1 : 0;

endmodule
