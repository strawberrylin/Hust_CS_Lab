`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/25 16:37:58
// Design Name: 
// Module Name: ring_module
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


module ring_module(
power,dclk,main,mfin,sain,sfin,ring
    );
    input dclk,power;
    input [3:0] main,mfin,sain,sfin;
    output reg ring;
    reg lable;
    reg [3:0]count;
    initial
        begin
            ring <=0;
            count <=0;
            lable<=0;
        end
    always  @(posedge dclk)
        begin
            if(power)
                begin
                    if((mfin==4'd5)&&(main==4'd9)&&(sfin==4'd5)&&(sain==4'd9))
                        begin
                            lable<=1;
                        end
                    else if(lable&&(count<9))
                        begin
                            count=count+1;
                            ring=~ring;
                        end 
                    else
                        begin
                            lable<=0;
                            ring<=0;
                            count<=0;
                        end
              end
           else
              begin
                  lable<=0;
                  ring<=0;
                  count<=0;
              end
        end
endmodule
