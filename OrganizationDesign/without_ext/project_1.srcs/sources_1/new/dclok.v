`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 16:04:13
// Design Name: 
// Module Name: dclok
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


module dclok
#(parameter count_size = 49999)(input clk,output reg dclk
    );
    reg [26:0] count;
    initial
        begin
            count<=0;
            dclk<=0;
        end
    always @(posedge clk)
        begin
            if(count==count_size)
                begin
                    count<=0;
                    dclk=~dclk;
                end
            else
                count<=count+1;
        end
endmodule