`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 16:19:16
// Design Name: 
// Module Name: ALU_MIPS
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


module ALU_MIPS(input1,input2,alu_op,alu_r,of,uof,equal);

input  [31:0]input1;
input  [31:0]input2;
input [3:0]alu_op;
output reg [31:0]alu_r;
output reg of,uof;
output equal;

wire signed [31:0] input1_s;
wire signed [31:0] input2_s;

assign input1_s = $signed(input1);
assign input2_s = $signed(input2);

reg carry1,carry2;
always @(*) 
    begin
        of <= 0;
        uof <= 0;
        case(alu_op)
            4'b0000: alu_r <= input1 << input2[4:0];
            4'b0001: alu_r <= input1_s >>> input2[4:0];
            4'b0010: alu_r <= input1 >> input2[4:0];
            4'b0011: alu_r <= input1 * input2;
            4'b0100: alu_r <= input1 / input2;
            4'b0101: 
                begin
                    {carry1,alu_r} <= input1 + input2;
                    of <= ((input1[31]&input2[31])&(~alu_r[31]))|(((~input1[31])&(~input2[31]))&alu_r[31]);
                    uof <= carry1;
                end
            4'b0110: 
                begin
                    {carry2,alu_r} <= input1 - input2;
                    of <= ((input1[31]&(~input2[31]))&(~alu_r[31]))|(((~input1[31])&(input2[31]))&alu_r[31]);
                    uof <=carry2;
                end
            4'b0111: alu_r <= input1 & input2;
            4'b1000: alu_r <= input1 | input2;
            4'b1001: alu_r <= input1 ^ input2;
            4'b1010: alu_r <= ~(input1 | input2);
            4'b1011: alu_r <= (input1_s < input2_s) ? 1 : 0;
            4'b1100: alu_r <= (input1 < input2) ? 1 : 0;
            default: alu_r <= 0;
        endcase
    end

assign equal = (input1 == input2);

endmodule
