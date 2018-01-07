`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 16:01:08
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(x,seg);
    input [3:0] x;
    output reg [7:0] seg;
    always @(x)
        begin
            case(x)
                 4'b0000:    seg <= 8'b11000000;    // 0
                 4'b0001:    seg <= 8'b11111001;    // 1
                 4'b0010:    seg <= 8'b10100100;    // 2
                 4'b0011:    seg <= 8'b10110000;    // 3
                 4'b0100:    seg <= 8'b10011001;    // 4
                 4'b0101:    seg <= 8'b10010010;    // 5
                 4'b0110:    seg <= 8'b10000010;    // 6
                 4'b0111:    seg <= 8'b11111000;    // 7
                 4'b1000:    seg <= 8'b10000000;    // 8
                 4'b1001:    seg <= 8'b10010000;    // 9
                 4'b1010:    seg <= 8'b10001000;    // a
                 4'b1011:    seg <= 8'b10000011;    // b
                 4'b1100:    seg <= 8'b11000110;    // c
                 4'b1101:    seg <= 8'b10100001;    // d
                 4'b1110:    seg <= 8'b10000110;    // e
                 4'b1111:    seg <= 8'b10001110;    // f
                 default:    seg <= 8'b11111111;    // off
            endcase
       end
endmodule
