`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:44:30
// Design Name: 
// Module Name: IDEX
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


module IDEX(
reg_write_in,i_type_in,lw_in,sw_in,beq_in,bne_in,jl_in,jr_in,blez_in,we_in,jal_in,lui_in,lbu_in,sys_b_in,alu_op_in,slra_in,reg1_in,reg2_in,rs_in,rt_in,shamt_in,immediate_in,jump_addr_in,pc_in,clk,clear,instruction_id,
reg_write_out,i_type_out,lw_out,sw_out,beq_out,bne_out,jl_out,jr_out,blez_out,we_out,jal_out,lui_out,lbu_out,sys_b_out,alu_op_out,slra_out,reg1_out,reg2_out,rs_out,rt_out,shamt_out,immediate_out,jump_addr_out,pc_out,instruction_ex);

input i_type_in,lw_in,sw_in,beq_in,bne_in,jl_in,jr_in,blez_in,we_in,jal_in,lui_in,lbu_in,sys_b_in,slra_in,clk,clear;
input [3:0] alu_op_in;
input [4:0] reg_write_in,rs_in,rt_in;
input [31:0] reg1_in,reg2_in,shamt_in,immediate_in,jump_addr_in,pc_in;
input [31:0] instruction_id;

output reg i_type_out,lw_out,sw_out,beq_out,bne_out,jl_out,jr_out,blez_out,we_out,jal_out,lui_out,lbu_out,sys_b_out,slra_out;
output reg [3:0] alu_op_out;
output reg [4:0] reg_write_out,rs_out,rt_out;
output reg [31:0] reg1_out,reg2_out,shamt_out,immediate_out,jump_addr_out,pc_out;
output reg [31:0] instruction_ex;
initial
    begin
         i_type_out <= 0;lw_out <= 0 ;sw_out <= 0;beq_out <= 0;bne_out <= 0;jl_out <= 0;jr_out <= 0;blez_out <= 0;we_out <= 0;jal_out <= 0;lui_out <= 0;lbu_out <= 0;sys_b_out <= 0;slra_out <= 0;
                   alu_op_out <= 0;reg_write_out <= 0;rs_out <= 0;rt_out <= 0;reg1_out <= 0;reg2_out <= 0;shamt_out <= 0;immediate_out <= 0;jump_addr_out <= 0;pc_out <= 0;instruction_ex <= 0;
    end
always @(posedge clk)
    begin
        if(clear)
            begin
                i_type_out <= 0;lw_out <= 0 ;sw_out <= 0;beq_out <= 0;bne_out <= 0;jl_out <= 0;jr_out <= 0;blez_out <= 0;we_out <= 0;jal_out <= 0;lui_out <= 0;lbu_out <= 0;sys_b_out <= 0;slra_out <= 0;
                alu_op_out <= 0;reg_write_out <= 0;rs_out <= 0;rt_out <= 0;reg1_out <= 0;reg2_out <= 0;shamt_out <= 0;immediate_out <= 0;jump_addr_out <= 0;pc_out <= 0;instruction_ex <= 0;
            end
        else 
            begin
                i_type_out <= i_type_in;lw_out <= lw_in ;sw_out <= sw_in;beq_out <= beq_in;bne_out <= bne_in;jl_out <= jl_in;jr_out <= jr_in;blez_out <= blez_in;we_out <= we_in;jal_out <= jal_in;lui_out <= lui_in;lbu_out <= lbu_in;sys_b_out <= sys_b_in;slra_out <= slra_in;
                alu_op_out <= alu_op_in;reg_write_out <= reg_write_in;rs_out <= rs_in;rt_out <= rt_in;reg1_out <= reg1_in;reg2_out <= reg2_in;shamt_out <= shamt_in;immediate_out <= immediate_in;jump_addr_out <= jump_addr_in;pc_out <= pc_in;instruction_ex <= instruction_id;
            end
    end
endmodule
