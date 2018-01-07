`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 22:06:14
// Design Name: 
// Module Name: by_path_tb
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


module by_path_tb(

    );
    reg [4:0] rs1_r,rt1_r;
    wire forward1_a,forward1_b;
    
    reg [4:0]rs2_r,rt2_r;
    reg we_mem,we_wb,slar_in;
    reg [4:0] reg1_write,reg2_write;
    wire [1:0] forward2_a,forward2_b;
    
    reg [4:0] rt3_r;
    wire forward3_a,forward3_b;
    
    BY_PATH djsk(.rs1_r(rs1_r),.rt1_r(rt1_r),.forward1_a(forward1_a),.forward1_b(forward1_b),
    .rs2_r(rs2_r),.rt2_r(rt2_r),.forward2_a(forward2_a),.forward2_b(forward2_b),.reg1_write(reg1_write),.reg2_write(reg2_write),.we_mem(we_mem),.we_wb(we_wb),.slar_in(slar_in),
    .rt3_r(rt3_r),.forward3_a(forward3_a),.forward3_b(forward3_b));
    
    initial
        begin
            slar_in = 0; we_mem = 1;rt2_r = 16;reg1_write = 16;
            end
endmodule
