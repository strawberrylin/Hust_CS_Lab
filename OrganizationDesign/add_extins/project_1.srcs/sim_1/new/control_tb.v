`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 08:36:35
// Design Name: 
// Module Name: control_tb
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


module control_tb(

    );
    reg ins_op5,ins_op4,ins_op3,ins_op2,ins_op1,ins_op0,ins_funct5,ins_funct4,ins_funct3,ins_funct2,ins_funct1,ins_funct0;
    wire slra,zero_ext,i_type,lw,sw,beq,bne,jl,jr,blez,we,jal,lui,lbu,sys_b;
    wire [3:0] alu_op;
    
    CONTROL CTL(ins_op5,ins_op4,ins_op3,ins_op2,ins_op1,ins_op0,ins_funct5,ins_funct4,ins_funct3,ins_funct2,ins_funct1,ins_funct0,
            slra,zero_ext,i_type,lw,sw,beq,bne,jl,jr,blez,we,jal,lui,lbu,sys_b,alu_op);
     initial
        begin
            ins_op5=0;ins_op4=0;ins_op3=0;ins_op2=0;ins_op1=0;ins_op0=0;ins_funct5=0;ins_funct4=0;ins_funct3=0;ins_funct2=0;ins_funct1=0;ins_funct0=0;
        end
     
     initial
        begin
            #10 ins_funct5=0;ins_funct4=0;ins_funct3=1;ins_funct2=1;ins_funct1=0;ins_funct0=0;
            #10 ins_funct5=1;ins_funct4=0;ins_funct3=0;ins_funct2=1;ins_funct1=0;ins_funct0=0;
            #10 ins_funct5=0;ins_funct4=1;ins_funct3=1;ins_funct2=0;ins_funct1=1;ins_funct0=0;
            #10 ins_funct5=1;ins_funct4=0;ins_funct3=0;ins_funct2=1;ins_funct1=1;ins_funct0=1;
            #10 ins_op5=0;ins_op4=0;ins_op3=1;ins_op2=0;ins_op1=0;ins_op0=0;
            #10 ins_op5=0;ins_op4=0;ins_op3=1;ins_op2=1;ins_op1=1;ins_op0=1;
            #10 ins_op5=0;ins_op4=0;ins_op3=1;ins_op2=1;ins_op1=0;ins_op0=1;
            #10 ins_op5=0;ins_op4=0;ins_op3=0;ins_op2=1;ins_op1=0;ins_op0=0;
            #10 ins_op5=0;ins_op4=0;ins_op3=0;ins_op2=1;ins_op1=1;ins_op0=0;
        end
endmodule
