`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 23:45:38
// Design Name: 
// Module Name: suber
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


module suber(
input clk,
input rst_n,
input open_stop,
output [3:0]Q_0,
output [3:0]Q_1,
output [3:0]Q_2,
output [3:0]Q_3// 反向计数器的输出
    );
    wire oversuber_sec01,oversuber_sec10,oversuber_min01,oversuber_min10;
    suberFrom10 u1(clk,rst_n,open_stop,oversuber_sec01,Q_0);  //open_stop=1即会进行个位反向计时，可以起到开启和暂停的作用
    suberFrom6 u2(clk,rst_n,oversuber_sec01,oversuber_sec10,Q_1);
    suberFrom10 u3(clk,rst_n,oversuber_sec10,oversuber_min01,Q_2);
    suberFrom6_1 u4(clk,rst_n,oversuber_min01,oversuber_min10,Q_3);

endmodule
