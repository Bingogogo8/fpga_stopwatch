`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/22 22:54:06
// Design Name: 
// Module Name: Vga_clkDivider
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


module Vga_clkDivider(
input clk,
input rst_n,
output wire clk_25MHz
    );
    //分频成25MHz,,用于刷新VGA显示
    reg [1:0]cnt;
    reg clk_out;
    always@(posedge clk or negedge rst_n)
        begin
            if(!rst_n)
                begin
                    clk_out<=1'b1;
                    cnt<=2'b0;
                end
            else
                begin
                    if(cnt<1)
                        begin
                            cnt<=cnt+1;
                            clk_out<=clk_out;
                        end
                    else
                        begin
                            cnt<=2'b0;
                            clk_out<=~clk_out;
                        end
                end            

        end
   assign clk_25MHz = clk_out;
            
endmodule
