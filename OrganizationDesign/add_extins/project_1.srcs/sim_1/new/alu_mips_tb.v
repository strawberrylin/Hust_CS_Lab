`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 16:24:44
// Design Name: 
// Module Name: alu_mips_tb
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


module alu_mips_tb(

    );
    reg signed [31:0]input1,input2;
    reg [3:0]alu_op;
    wire [31:0]alu_r;
    wire of,uof,equal;
    
    ALU_MIPS UDP1 (.input1(input1),.input2(input2),.alu_op(alu_op),.alu_r(alu_r),.of(of),.uof(uof),.equal(equal));
    initial
        begin
            input1 = 32'd0;input2 = 32'd0;alu_op = 4'b0000;
        end
    initial
        begin
            #5 input1 = 32'd3;input2 = 32'd30;alu_op = 4'b0000;
            #5 input1 = $signed(32'h80000000);input2 = $signed(32'd31);alu_op = 4'b0001;
      
            #5 input1 = 32'd3;input2 = 32'd1;alu_op = 4'b0011;
            #5 input1 = 32'd3;input2 = 32'd2;alu_op = 4'b0100;
            #5 input1 = 32'h7fffffff;input2 = 32'd1;alu_op = 4'b0101;
            #5 input1 = 32'hffffffff;input2 = 32'd1;alu_op = 4'b0101;
           
        end
endmodule
