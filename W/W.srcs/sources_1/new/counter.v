`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 21:41:52
// Design Name: 
// Module Name: counter
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


module counter(
input clk,
input rst_n,
input open_stop,
output [3:0]Q_0,
output [3:0]Q_1,
output [3:0]Q_2,
output [3:0]Q_3// 计数器的输出
    );

    wire overcounter_sec01,overcounter_sec10,overcounter_min01,overcounter_min10;
    counterTo10 u1(clk,rst_n,open_stop,overcounter_sec01,Q_0);  //open_stop=1即会进行个位计时，可以起到开启和暂停的作用
    counterTo6 u2(clk,rst_n,overcounter_sec01,overcounter_sec10,Q_1);
    counterTo10 u3(clk,rst_n,overcounter_sec10,overcounter_min01,Q_2);
    counterTo6 u4(clk,rst_n,overcounter_min01,overcounter_min10,Q_3);

endmodule
