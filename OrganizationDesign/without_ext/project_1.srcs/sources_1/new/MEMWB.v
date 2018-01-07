`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 14:09:29
// Design Name: 
// Module Name: MEMWB
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


module MEMWB(
pc_in,data_in,sys_b_in,reg_write_in,jal_in,we_in,clk,instruction_mem,
pc_out,data_out,sys_b_out,reg_write_out,jal_out,we_out,instruction_wb
    );
input sys_b_in,jal_in,we_in,clk;
input [4:0]reg_write_in;
input [31:0]pc_in,data_in;
input [31:0] instruction_mem;
output reg sys_b_out,jal_out,we_out;
output reg [4:0]reg_write_out;
output reg [31:0]pc_out,data_out;
output reg [31:0] instruction_wb;
initial
        begin
            pc_out <= 0;
            data_out <= 0;
            sys_b_out <= 0;
            jal_out <= 0;
            reg_write_out <= 0;
            we_out <= 0;
            instruction_wb <= 0;
        end
always @(posedge clk)
    begin
        pc_out <= pc_in;
        data_out <= data_in;
        sys_b_out <= sys_b_in;
        jal_out <= jal_in;
        reg_write_out <= reg_write_in;
        we_out <= we_in;
        instruction_wb <= instruction_mem;
    end
endmodule
