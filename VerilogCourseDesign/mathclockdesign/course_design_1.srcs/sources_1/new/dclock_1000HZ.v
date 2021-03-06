`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/17 01:33:11
// Design Name: 
// Module Name: dclock_1000HZ
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


module dclock_1000HZ(
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
            if(count==49999)
                begin
                    count<=0;
                    dclk=~dclk;
                end
            else
                count<=count+1;
        end
endmodule
