`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 12:06:37
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(
pc_in,alur_in,memdata_in,sys_b_in,reg_write_in,lbu_in,lw_in,sw_in,jal_in,immediate_in,we_in,lui_in,clk,rs_in,instruction_ex,
pc_out,alur_out,memdata_out,sys_b_out,reg_write_out,lbu_out,lw_out,sw_out,jal_out,immediate_out,we_out,lui_out,rs_out,instruction_mem
    );
input sys_b_in,lbu_in,lw_in,sw_in,jal_in,we_in,lui_in,clk;
input [4:0]reg_write_in,rs_in;
input [31:0]pc_in,alur_in,memdata_in,immediate_in;
input [31:0] instruction_ex;

output reg sys_b_out,lbu_out,lw_out,sw_out,jal_out,we_out,lui_out;
output reg [4:0]reg_write_out,rs_out;
output reg [31:0]pc_out,alur_out,memdata_out,immediate_out;
output reg [31:0] instruction_mem;
initial
    begin
            pc_out <= 0;
           alur_out <= 0;
           memdata_out <= 0;
           immediate_out <= 0;
           sys_b_out <= 0;
           reg_write_out <= 0;
           lbu_out <= 0;
           lui_out <= 0;
           lw_out <= 0;
           sw_out <= 0;
           jal_out <= 0;
           we_out <= 0;
           rs_out <= 0;
           instruction_mem <= 0;
    end
always @(posedge clk)
    begin
       pc_out <= pc_in;
       alur_out <= alur_in;
       memdata_out <= memdata_in;
       immediate_out <= immediate_in;
       sys_b_out <= sys_b_in;
       reg_write_out <= reg_write_in;
       lbu_out <= lbu_in;
       lui_out <= lui_in;
       lw_out <= lw_in;
       sw_out <= sw_in;
       jal_out <= jal_in;
       we_out <= we_in;
       rs_out <= rs_in;
       instruction_mem <= instruction_ex ;
    end
endmodule
