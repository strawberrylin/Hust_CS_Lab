`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 15:09:59
// Design Name: 
// Module Name: WE
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


module WE(sw,beq,bne,jl,jr,blez,we);
input sw,beq,bne,jl,jr,blez;
output we;

assign we = ~(sw + beq + bne + jl + jr + blez);

endmodule
