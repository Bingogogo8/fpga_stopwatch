`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 17:17:40
// Design Name: 
// Module Name: divider
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

module divider(
clk,rst_n,clk_result,clk_result100
    );
    input clk;
    input rst_n;
    output clk_result;    
    output clk_result100;
    wire clk;
    wire rst_n;
    wire clk_result;
    wire clk_result100;
    
    reg [19:0]cnt;
    reg clk_100Hz;
    reg [7:0]count;
    reg clk_1Hz;
    
assign clk_result = clk_1Hz;
assign clk_result100 = clk_100Hz;
//分频成1Hz，1s
always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            cnt <=20'd0;
        else if (cnt == 20'd999_999)
            cnt <=20'd0;
        else
            cnt <= cnt + 20'd1;
    
    end
always@(posedge clk or negedge rst_n)
        begin 
            if(!rst_n)
                clk_100Hz <=1'b0;
            else if(cnt < 20'd500_000)
                clk_100Hz <=1'b1;
            else 
                clk_100Hz <= 1'b0;
        end 

//分频成100Hz，0.01s
always@(posedge clk_100Hz or negedge rst_n)
             begin 
               if(!rst_n)
                    count <= 7'd0;
               else if(count == 7'd99)
                    count <= 7'd0;
               else 
                    count <= count + 7'd1;
             end
 always@(posedge clk_100Hz or negedge rst_n)
                      begin 
                          if(!rst_n)
                              clk_1Hz <=1'b0;
                          else if(count < 7'd50)
                              clk_1Hz <=1'b1;
                          else 
                              clk_1Hz <= 1'b0;
                      end 

endmodule

