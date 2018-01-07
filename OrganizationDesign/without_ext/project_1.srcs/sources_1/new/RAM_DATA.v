`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:33:55
// Design Name: 
// Module Name: RAM_DATA
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


module RAM_DATA(clk,sw,lw,ram_addr,ram_datain,ram_dataout,ram_0,ram_1,ram_2,ram_3,ram_4,ram_5,ram_6,ram_7,ram_8,ram_9,ram_10,,ram_11,ram_12,ram_13,ram_14);
input clk,sw,lw;
input [9:0] ram_addr;
input [31:0] ram_datain;
output [31:0] ram_dataout;
output [31:0] ram_0,ram_1,ram_2,ram_3,ram_4,ram_5,ram_6,ram_7,ram_8,ram_9,ram_10,ram_11,ram_12,ram_13,ram_14;

reg [31:0]RAM[0:1023];
integer i;
initial
    begin
        for(i = 0;i < 1024; i = i + 1)
            RAM[i] = 32'b0;
     end
always @(posedge clk)
    begin
        if(sw)
            begin
                RAM[ram_addr] <= ram_datain;
            end
    end

assign ram_dataout = lw ? RAM[ram_addr] : 32'b0;
assign ram_0 = RAM[0];
assign ram_1 = RAM[1];
assign ram_2 = RAM[2];
assign ram_3 = RAM[3];
assign ram_4 = RAM[4];
assign ram_5 = RAM[5];                        
assign ram_6 = RAM[6];
assign ram_7 = RAM[7];
assign ram_8 = RAM[8];
assign ram_9 = RAM[9];
assign ram_10 = RAM[10];
assign ram_11 = RAM[11];
assign ram_12 = RAM[12];                        
assign ram_13 = RAM[13];
assign ram_14 = RAM[14];

endmodule
