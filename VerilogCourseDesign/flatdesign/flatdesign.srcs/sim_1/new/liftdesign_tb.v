`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/28 20:35:33
// Design Name: 
// Module Name: liftdesign_tb
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


module liftdesign_tb(

    );
    reg clk,power,open,close;
    reg [3:0] in_require,out_uprequire,out_downrequire;
    wire openled,closeled,upled,downled;
    wire powerled;
    wire [2:0] up_requireled,down_requireled;
    wire [7:0] Dataout,Segout;
    wire [3:0] in_requireled;
    integer i;
    main_module DUP (.clk(clk),.power(power),.open(open),.close(close),
                    .in_require(in_require),.out_uprequire(out_uprequire),.out_downrequire(out_downrequire),
                    .openled(openled),.closeled(closeled),.upled(upled),.powerled(powerled),.in_requireled(in_requireled),
                    .downled(downled),.up_requireled(up_requireled),.down_requireled(down_requireled),.Dataout(Dataout),.Segout(Segout));
    initial
        begin
            clk=0;in_require=0;out_uprequire=0;out_downrequire=0;open=0;close=0;power=0;
            for(i=0;i<10000;i=i+1)
                #0.1 clk=~clk;
        end
    initial
        begin
            #1 power=1;
            #1 out_uprequire=1;
            #1 out_uprequire=0;
            #6 out_uprequire=4'b0100;
            #1 out_uprequire=4'b0000;
        end
endmodule
