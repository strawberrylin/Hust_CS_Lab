`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:37:40
// Design Name: 
// Module Name: REGISTER
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


module REGISTER
#(parameter DATA_WIDTH = 32)(clk,data_in,data_out,en,reset);
input clk,en,reset;
input [DATA_WIDTH-1:0]data_in;
output reg [DATA_WIDTH-1:0]data_out;

initial
    begin
        data_out <= 32'd0;
    end

always @(posedge clk)
    begin
        if(reset)
            data_out <= 32'd0;
        else if(en)
            data_out <=data_in;
        else 
            data_out <= data_out;
    end
endmodule
