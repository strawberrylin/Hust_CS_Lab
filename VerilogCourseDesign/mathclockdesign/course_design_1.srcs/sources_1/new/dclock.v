`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/01 08:18:36
// Design Name: 
// Module Name: dclock
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


module dclock1(
input clk,output reg dclk
    );
    reg [26:0] count;
    initial
        begin
            count<=0;
            dclk<=0;
        end
    always @(posedge clk)
        begin
            if(count==49999999)
                begin
                    count<=0;
                    dclk=~dclk;
                end
            else
                count<=count+1;
        end
endmodule
