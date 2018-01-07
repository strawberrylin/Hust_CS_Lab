`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/17 03:37:34
// Design Name: 
// Module Name: mathclock
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


module mathclock(
Clk,K0,K1,K2,K3,Sclk,Reset,Dout,Segout,Ring,Powerled,Choose,Chooseled
    );
    input Clk,K0,K1,K2,K3,Sclk,Reset,Choose;
    output [7:0] Dout,Segout;
    output Ring,Powerled,Chooseled;
    wire dclk_1Hz,dclk_2Hz,dclk_1000Hz; //1000Hz dlk
    wire hout,mout,sout;//for the clk of s,m,h
    wire scout,mcout;//the cout of s,m
    wire [3:0] sfout,saout,mfout,maout,hfout,haout;//s,m,h the frout and the after number 
    wire [7:0] seg_choose,data_choose;//the input of the seven segment
    wire clk_choose;
    
    dclock1 DCLK1 (.clk(Clk),.dclk(dclk_1Hz));
    dclock2 DCLK2 (.clk(Clk),.dclk(dclk_2Hz));
    assign clk_choose=Choose?dclk_2Hz:dclk_1Hz;
    adjust_module ADJUST (.dclk(clk_choose),.sclk(Sclk),.k0(K0),.k1(K1),.k2(K2),.k3(K3),.cin_m(mcout),.cin_s(scout),.hout(hout),.mout(mout),.sout(sout));
    clock_module CLOCK (.hin(hout),.min(mout),.sin(sout),.reseth(Reset),.resetm(Reset),.resets(Reset),.coutm(mcout),.couts(scout),.sfout(sfout),.saout(saout),
                        .mfout(mfout),.maout(maout),.hfout(hfout),.haout(haout));
    choose_seg SEGMENT (.clk(Clk),.power(Reset),.data1(saout),.data2(sfout),.data3(4'b0),.data4(maout),.data5(mfout),.data6(4'b0),.data7(haout),.data8(hfout),.seg_choose(Segout),
                        .data_choose(Dout));
    ring_module RING (.power(Reset),.dclk(dclk_1Hz),.mfin(mfout),.main(maout),.sfin(sfout),.sain(saout),.ring(Ring));
    assign Powerled=Reset;
    assign Chooseled=Choose;
endmodule
