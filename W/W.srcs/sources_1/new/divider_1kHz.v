`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 20:21:32
// Design Name: 
// Module Name: divider_1kHz
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


module divider_1kHz(
input clk,
output clk_out
    );
    //分频成1000Hz,用于刷新显示
    reg [19:0]cnt;
    reg clk_out;
    always@(posedge clk )
        begin

            if (cnt == 20'd999_99)
                cnt <=20'd0;
            else
                cnt <= cnt + 20'd1;
        end
    always@(posedge clk )
             
                if(cnt < 20'd500_00)
                         begin
                    clk_out <=1'b1;
                         end
                else 
                         begin
                    clk_out <= 1'b0;
                         end
            
endmodule
