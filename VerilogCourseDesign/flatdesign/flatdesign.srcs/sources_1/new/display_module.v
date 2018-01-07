`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/28 11:28:23
// Design Name: 
// Module Name: display_module
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


module display_module(
power,clk,data1,data2,data3,data4,data5,data6,data7,data8,seg_choose,data_choose
    );
    input clk,power;
    input [3:0] data1,data2,data3,data4,data5,data6,data7,data8;
    wire [7:0] data1s,data2s,data3s,data4s,data5s,data6s,data7s,data8s;//change to 8 bits 7 segments
    output reg [7:0] seg_choose,data_choose;
    reg [2:0]count;
    wire dclk;
    initial
        begin 
            count<=0;
        end
    dclock_1000Hz DCLOCK (.clk(clk),.dclk(dclk));//Change the Hz of the clock to fresh the segment
    seven_segment DATA1 (.x(data1),.seg(data1s));
    seven_segment DATA2 (.x(data2),.seg(data2s));
    assign data3s = 8'b11111110;
    seven_segment DATA4 (.x(data4),.seg(data4s));
    seven_segment DATA5 (.x(data5),.seg(data5s));
    assign data6s = 8'b11111110;                                           
    seven_segment DATA7 (.x(data7),.seg(data7s));
    seven_segment DATA8 (.x(data8),.seg(data8s));
    always @(posedge dclk)
         count=count+1;
    always@(count or data1s or data2s or data3s or data4s or data5s or data6s or data7s or data8s)
        begin
            if(power)
                begin
                    seg_choose <= 8'b0;
                    data_choose <= data1s;
                    case(count)
                        0:begin
                            seg_choose<=8'b11111110;
                            data_choose<=data1s;
                          end
                        1:begin
                            seg_choose<=8'b11111101;
                            data_choose<=data2s;
                          end
                        2:begin
                            seg_choose<=8'b11111011;
                            data_choose<=data3s;
                          end
                        3:begin
                            seg_choose<=8'b11110111;
                            data_choose<=data4s;
                          end
                        4:begin
                            seg_choose<=8'b11101111;
                            data_choose<=data5s;
                          end
                        5:begin
                            seg_choose<=8'b11011111;
                            data_choose<=data6s;
                          end
                        6:begin
                            seg_choose<=8'b10111111;
                            data_choose<=data7s;
                          end
                        7:begin
                            seg_choose<=8'b01111111;
                            data_choose<=data8s;
                          end
                   endcase
             end
             else
                begin
                    seg_choose <= 8'b0;
                    data_choose <= data1s;
                    case(count)
                        0:begin
                             seg_choose<=8'b11111110;
                             data_choose<=8'b11111111;
                          end
                        1:begin
                             seg_choose<=8'b11111101;
                             data_choose<=8'b11111111;
                          end
                        2:begin
                             seg_choose<=8'b11111011;
                             data_choose<=8'b11111111;
                          end
                        3:begin
                             seg_choose<=8'b11110111;
                             data_choose<=8'b11111111;
                          end
                        4:begin
                             seg_choose<=8'b11101111;
                             data_choose<=8'b11111111;
                          end
                        5:begin
                             seg_choose<=8'b11011111;
                             data_choose<=8'b11111111;
                          end
                        6:begin
                             seg_choose<=8'b10111111;
                             data_choose<=8'b11111111;
                          end
                        7:begin
                             seg_choose<=8'b01111111;
                             data_choose<=8'b11111111;
                          end
                   endcase                    
                end
       end  
endmodule
