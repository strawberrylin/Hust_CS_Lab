`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:35:03
// Design Name: 
// Module Name: ROM_INSTRUCTION
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


module ROM_INSTRUCTION#(parameter INSTRUCTION = "/home/strawberrylin/benchmark.hex")(rom_addr,rom_data);
input [9:0]rom_addr;
output [31:0]rom_data;

reg [31:0]ROM[0:1023];

initial
    begin
        $readmemh(INSTRUCTION,ROM,0,1023);
    end

assign  rom_data = ROM[rom_addr];
endmodule
