`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/24 23:53:03
// Design Name: 
// Module Name: mathclock_tb
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


module mathclock_tb(

    );
    reg Clk,K0,K1,K2,K3,Sclk,Reset,Choose;
    wire [7:0] Dout,Segout;
    wire Ring,Powerled,Chooseled;
    integer i;
    mathclock TOP (.Clk(Clk),.K0(K0),.K1(K1),.K2(K2),.K3(K3),.Sclk(Sclk),.Reset(Reset),
                    .Dout(Dout),.Segout(Segout),.Ring(Ring),.Powerled(Powerled),.Choose(Choose),.Chooseled(Chooseled));
    initial
        begin
            Clk=0;Choose=0;
            for(i=0;i<8000;i=i+1)
                #10 Clk=~Clk;
        end
    initial
        begin
            K0=0;K1=0;K2=0;K3=0;
            Sclk=0;
            Reset=1;
            #10 Reset=0;
            #10 Reset=1;
            #500 K1=1;
            #300 K1=0;
        end
endmodule
       