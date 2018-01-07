`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 11:06:27
// Design Name: 
// Module Name: adjust_module
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


module adjust_module(
input k3,k2,k1,k0,dclk,sclk,cin_m,cin_s,output hout,mout,sout
    );
    assign hout = ~((~(k3&k0&dclk))&(~(k3&(~k0)&sclk))&(~((~k3)&cin_m)));
    assign mout = ~((~(k2&k0&dclk))&(~(k2&(~k0)&sclk))&(~((~k2)&cin_s)));
    assign sout = ~((~(k0&dclk))&(~(k1&(~k0)&sclk))&(~((~k1)&dclk)));
endmodule
