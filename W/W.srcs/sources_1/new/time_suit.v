`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/20 17:39:58
// Design Name: 
// Module Name: time_suit
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

//–¥4∫¡√Îµƒ ±÷”
module time_suit(
clk,rst_n,clk_suit
    );
    input clk;
    input rst_n;
    output clk_suit;
    
    reg [27:0]count;
    reg clk_suit;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            count<= 0;
            clk_suit<= 0;
        end
        else
            if(count < 20000)
                count<= count+1;
             else
             begin
                count<= 0;
                clk_suit<= ~clk_suit;
             end
    end
    
endmodule
