`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/17 02:39:40
// Design Name: 
// Module Name: choose_seg_tb
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


module choose_seg_tb(

    );
    reg clk,power;
    reg [7:0] data1,data2,data3,data4,data5,data6,data7,data8;
    wire [7:0]seg_choose,data_choose;
    integer i;
    choose_seg DUTC (.clk(clk),.power(power),.data1(data1),.data2(data2),.data3(data3),.data4(data4),.data5(data5),.data6(data6),
                        .data7(data7),.data8(data8),.seg_choose(seg_choose),.data_choose(data_choose));
    initial
        begin
            clk=0;power=1;data1=0;data2=1;data3=2;data4=3;data5=4;data6=5;data7=6;data8=7;
            for(i=0;i<200;i=i+1)
                begin
                    #10 clk=~clk;
                    data1=data1+1;
                    data2=data2+1;
                    data3=data3+1;
                    data4=data4+1;
                    data5=data5+1;
                    data6=data6+1;
                    data7=data7+1;
                    data8=data8+1;
                   
                end
        end
endmodule
