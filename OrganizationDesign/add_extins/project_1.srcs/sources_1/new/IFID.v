`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:38:32
// Design Name: 
// Module Name: IFID
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


module IFID(clk,pc_in,instruction,clear,stop,pc_out,reg_write,i_type,lw,sw,beq,bne,jl,jr,blez,we,jal,lui,lbu,sys_b,slar,alu_op,reg1_in,reg2_in,shamt,immediate,jump_addr,instruction_id);
input clk,clear,stop;
input [31:0]pc_in,instruction;

output i_type,lw,sw,beq,bne,jl,jr,blez,we,jal,lui,lbu,sys_b,slar;
output [3:0]alu_op;
output [4:0]reg_write,reg1_in,reg2_in;
output [31:0]pc_out,shamt,immediate,jump_addr;
output [31:0] instruction_id;

wire [31:0]mid_ins;
wire zero_ext;

REGISTER #(32) UDP2(.clk(clk),.data_in(pc_in),.data_out(pc_out),.en(stop),.reset(clear));
REGISTER #(32) UDP3(.clk(clk),.data_in(instruction),.data_out(mid_ins),.en(stop),.reset(clear));

assign jump_addr ={{6{1'b0}} ,(mid_ins[25:0] <<2 )};

CONTROL UDP4(.ins_op5(mid_ins[31]),.ins_op4(mid_ins[30]),.ins_op3(mid_ins[29]),.ins_op2(mid_ins[28]),.ins_op1(mid_ins[27]),.ins_op0(mid_ins[26]),.ins_funct5(mid_ins[5]),.ins_funct4(mid_ins[4]),.ins_funct3(mid_ins[3]),.ins_funct2(mid_ins[2]),.ins_funct1(mid_ins[1]),.ins_funct0(mid_ins[0]),.slra(slar),.zero_ext(zero_ext),.i_type(i_type),.lw(lw),.sw(sw),.beq(beq),.bne(bne),.jl(jl),.jr(jr),.blez(blez),.we(we),.jal(jal),.lui(lui),.lbu(lbu),.sys_b(sys_b),.alu_op(alu_op));

REGISTER UDP5 (.clk(clk),.data_in(instruction),.data_out(instruction_id),.en(stop),.reset(clear));
assign reg1_in = mid_ins[25:21];
assign reg2_in = mid_ins[20:16];
assign reg_write =jal ? 32'd31 : (i_type ? (mid_ins[20:16]) : (mid_ins[15:11]));
assign shamt = {{27{1'b0}},mid_ins[10:6]};
assign immediate = zero_ext ? {{16{1'b0}},mid_ins[15:0]} : {{16{mid_ins[15]}},mid_ins[15:0]};
endmodule
