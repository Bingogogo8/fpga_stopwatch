`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/20 23:05:00
// Design Name: 
// Module Name: top_tb
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


module top_tb(
clk,
rst_n,
seg_sel,
seg_data,
stop,
up_down
    );
    
    input clk;
    input rst_n;
    input stop;
    input up_down;
    output[3:0] seg_sel;
    output[7:0] seg_data;
    reg clk_out;
    reg clk;
    reg rst_n;
    time_change uut(
    .clk(clk),
    .rst_n(rst_n),
    .clk_out(clk_out)
    );
    initial begin
        clk = 0;
        rst_n = 0;
    end
    always #1 clk=~clk;
endmodule
