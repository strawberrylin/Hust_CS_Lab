`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/04 15:06:02
// Design Name: 
// Module Name: modle_24
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


module modle_24(
clk,reset,fout,aout
    );
    input clk,reset;
    output wire [3:0] fout,aout;
    reg [5:0] num;
    always @(posedge clk or negedge reset)
    begin
       if(!reset)
            begin
               num<= 5'b0;
               
            end
       else if(num== 5'd23)
            begin
                num<= 5'b0;
            end
       else 
            begin
                num<=num+1;
            end
   end
   assign fout=num/10;
   assign aout=num%10;
endmodule
