`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 15:08:57
// Design Name: 
// Module Name: CONTROL
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


module CONTROL(ins_op5,ins_op4,ins_op3,ins_op2,ins_op1,ins_op0,ins_funct5,ins_funct4,ins_funct3,ins_funct2,ins_funct1,ins_funct0,
slra,zero_ext,i_type,lw,sw,beq,bne,jl,jr,blez,we,jal,lui,lbu,sys_b,alu_op);
input ins_op5,ins_op4,ins_op3,ins_op2,ins_op1,ins_op0,ins_funct5,ins_funct4,ins_funct3,ins_funct2,ins_funct1,ins_funct0;
output slra,zero_ext,i_type,lw,sw,beq,bne,jl,jr,blez,we,jal,lui,lbu,sys_b;
output [3:0] alu_op;

assign slra = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& (~ins_funct5)& (~ins_funct4)& (~ins_funct3)& (~ins_funct2)& ((~ins_funct1)& (~ins_funct0) | ins_funct1& (~ins_funct0) | ins_funct1 &ins_funct0);

assign zero_ext = (~ins_op5)& (~ins_op4)& ins_op3& ((~ins_op2)& (~ins_op1)& (ins_op0) | ins_op2& (~ins_op1)& (~ins_op0) | (ins_op2)& (~ins_op1)& ins_op0 | ins_op2& ins_op1& (~ins_op0) | (~ins_op2)& ins_op1& ins_op0);

assign i_type = ins_op5 | ins_op4 | ins_op3 | ins_op2 | ins_op1 | ins_op0;

assign lw = ins_op5& (~ins_op4)& (~ins_op3)& (~ins_op2)& ins_op1& ins_op0 | ins_op5& (~ins_op4)& (~ins_op3)& ins_op2& (~ins_op1)& (~ins_op0);

assign sw = ins_op5& (~ins_op4)& ins_op3& (~ins_op2)& ins_op1& ins_op0;

assign beq = (~ins_op5)& (~ins_op4)& (~ins_op3)& ins_op2& (~ins_op1)& (~ins_op0);

assign bne = (~ins_op5)& (~ins_op4)& (~ins_op3)& ins_op2& (~ins_op1)& ins_op0;

assign jl = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& ins_op1& (~ins_op0);

assign jr = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& (~ins_funct5)& (~ins_funct4)& ins_funct3& (~ins_funct2)& (~ins_funct1)& (~ins_funct0);

assign blez = (~ins_op5)& (~ins_op4)& (~ins_op3)& ins_op2& ins_op1& (~ins_op0);

assign jal = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& ins_op1& ins_op0;

assign lui = (~ins_op5)& (~ins_op4)& ins_op3& ins_op2& ins_op1& ins_op0;

assign lbu = ins_op5& (~ins_op4)& (~ins_op3)& ins_op2& (~ins_op1)& (~ins_op0);

assign sys_b = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& (~ins_funct5)& (~ins_funct4)& ins_funct3& ins_funct2& (~ins_funct1)& (~ins_funct0);

assign alu_op[3] = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& ins_funct5& (~ins_funct4)& ((~ins_funct3)& ins_funct2& (~ins_funct1)& (ins_funct0) | (~ins_funct3)& ins_funct2& ins_funct1& (~ins_funct0) | (~ins_funct3)& ins_funct2& ins_funct1& ins_funct0 | ins_funct3& (~ins_funct2)& ins_funct1& (~ins_funct0) | ins_funct3& (~ins_funct2)& ins_funct1& ins_funct0)
                     | (~ins_op5)& (~ins_op4)& ins_op3& ins_op2& (~ins_op1)& ins_op0 | (~ins_op5)& (~ins_op4)& ins_op3& ins_op2& ins_op1& (~ins_op0) | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& ins_op1& (~ins_op0) | (~ins_op5)& (~ins_op4)& (ins_op3)& (~ins_op2)& ins_op1& ins_op0 | (~ins_op5)& (~ins_op4)& (~ins_op3)& ins_op2& ins_op1& (~ins_op0);

assign alu_op[2] = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& ins_funct5& (~ins_funct4)& ((~ins_funct3)& (~ins_funct2)& (~ins_funct1)& (~ins_funct0) | (~ins_funct3)& (~ins_funct2)& (~ins_funct1)& ins_funct0 | (~ins_funct3)& (~ins_funct2)& ins_funct1& (~ins_funct0) | (~ins_funct3)& (~ins_funct2)& ins_funct1& ins_funct0 | (~ins_funct3)& ins_funct2& (~ins_funct1)& (~ins_funct0) | ins_funct3& (~ins_funct2)& ins_funct1& ins_funct0) 
                     | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& (~ins_op1)& (~ins_op0) | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& (~ins_op1)& ins_op0 | (~ins_op5)& (~ins_op4)& ins_op3& ins_op2& (~ins_op1)& (~ins_op0) | ins_op5& (~ins_op4)& (~ins_op2)& ins_op1& ins_op0 | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& ins_op1& ins_op0 | ins_op5& (~ins_op4)& (~ins_op3)& ins_op2& (~ins_op1)& (~ins_op0);

assign alu_op[1] = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& ins_funct5& (~ins_funct4)& ((~ins_funct3)& (~ins_funct2)& ins_funct1& (~ins_funct0) | (~ins_funct3)& (~ins_funct2)& ins_funct1& ins_funct0 | (~ins_funct3)& ins_funct2& ins_funct1& ins_funct0 | (~ins_funct3)& ins_funct2& (~ins_funct1)& (~ins_funct0) | ins_funct3& (~ins_funct2)& ins_funct1& (~ins_funct0)) | (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& (~ins_funct5)& (~ins_funct4)& ((~ins_funct3)& (~ins_funct2)& ins_funct1& (~ins_funct0) | (~ins_funct3)& ins_funct2& ins_funct1& (~ins_funct0)) | (~ins_op5)& (~ins_op4)& ins_op3& ins_op2& (~ins_op1)& (~ins_op0) | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& ins_op1& (~ins_op0) | (~ins_op5)& (~ins_op4)& (~ins_op3)& ins_op2& ins_op1& (~ins_op0);

assign alu_op[0] = (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& ins_funct5& (~ins_funct4)& ((~ins_funct3)& (~ins_funct2)& (~ins_funct1)& (~ins_funct0) | (~ins_funct3)& (~ins_funct2)& (~ins_funct1)& ins_funct0 | (~ins_funct3)& ins_funct2& (~ins_funct1)& (~ins_funct0) | (~ins_funct3)& ins_funct2& ins_funct1& (~ins_funct0) | ins_funct3& (~ins_funct2)& ins_funct1& (~ins_funct0)) | (~ins_op5)& (~ins_op4)& (~ins_op3)& (~ins_op2)& (~ins_op1)& (~ins_op0)& (~ins_funct5)& (~ins_funct4)& ((~ins_funct3)& (~ins_funct2)& ins_funct1& ins_funct0 | (~ins_funct3)& ins_funct2& ins_funct1& ins_funct0) | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& (~ins_op1)& (~ins_op0) | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& (~ins_op1)& ins_op0 | (~ins_op5)& (~ins_op4)& ins_op3& ins_op2& (~ins_op1)& (~ins_op0) | (~ins_op5)& (~ins_op4)& ins_op3& ins_op2& ins_op1& (~ins_op0) | ins_op5& (~ins_op4)& (~ins_op2)& ins_op1& ins_op0 | (~ins_op5)& (~ins_op4)& ins_op3& (~ins_op2)& ins_op1& (~ins_op0) | ins_op5& (~ins_op4)& (~ins_op3)& ins_op2& (~ins_op1)& (~ins_op0) | (~ins_op5)& (~ins_op4)& (~ins_op3)& ins_op2& ins_op1& (~ins_op0);

WE UDP0(.sw(sw),.beq(beq),.bne(bne),.jl(jl),.jr(jr),.blez(blez),.we(we));

endmodule
