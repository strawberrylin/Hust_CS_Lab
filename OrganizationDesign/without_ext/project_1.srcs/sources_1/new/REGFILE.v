`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:36:15
// Design Name: 
// Module Name: REGFILE
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


module REGFILE(reg1_in,reg2_in,reg_write,data_write,en_write,clk,reg_v0,reg_a0,reg1_out,reg2_out);

input [4:0] reg1_in,reg2_in,reg_write;
input [31:0] data_write;
input en_write;
input clk;

output [31:0] reg_v0,reg_a0,reg1_out,reg2_out;

reg [31:0]regfile[0:31];
initial
    begin
        regfile[0] <= 32'd0; regfile[1] <= 32'd0; regfile[2] <= 32'd0; 
        regfile[3] <= 32'd0; regfile[4] <= 32'd0; regfile[5] <= 32'd0; 
        regfile[6] <= 32'd0; regfile[7] <= 32'd0; regfile[8] <= 32'd0;
        regfile[9] <= 32'd0; regfile[10] <= 32'd0; regfile[11] <= 32'd0;
        regfile[12] <= 32'd0; regfile[13] <= 32'd0; regfile[14] <= 32'd0; 
        regfile[15] <= 32'd0; regfile[16] <= 32'd0; regfile[17] <= 32'd0; 
        regfile[18] <= 32'd0; regfile[19] <= 32'd0; regfile[20] <= 32'd0;
        regfile[21] <= 32'd0; regfile[22] <= 32'd0; regfile[23] <= 32'd0;
        regfile[24] <= 32'd0; regfile[25] <= 32'd0; regfile[26] <= 32'd0;
        regfile[27] <= 32'd0; regfile[28] <= 32'd0; regfile[29] <= 32'd0;
        regfile[30] <= 32'd0; regfile[31] <= 32'd0;
    end
always @(posedge clk)
    begin
        if(en_write && (reg_write != 0))
            begin
                regfile[reg_write] <= data_write;
            end
    end

assign reg1_out = regfile[reg1_in];
assign reg2_out = regfile[reg2_in];
assign reg_v0 = regfile[2];
assign reg_a0 = regfile[4];
endmodule
