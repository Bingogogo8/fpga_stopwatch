`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/20 18:08:01
// Design Name: 
// Module Name: decode
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


module decode(
clk,
rst_n,
data,
seg_data
    );
input clk;
input rst_n;
input data;
wire [3:0]data;
output seg_data;
reg [7:0]seg_data;

always@(posedge clk or negedge rst_n)
    begin
    if(!rst_n) 
        begin
            seg_data <= 8'b11000000;
        end
    else 
        case(data)
            4'b0000:
                seg_data <= 8'b11000000;
            4'b0001:
                seg_data <= 8'b11111001;
            4'b0010:
                seg_data <= 8'b10100100;
            4'b0011:
                seg_data <= 8'b10110000;
            4'b0100:
                seg_data <= 8'b10011001;
            4'b0101:
                seg_data <= 8'b10010010;
            4'b0110:
                seg_data <= 8'b10000010;
            4'b0111:
                seg_data <= 8'b11111000;
            4'b1000:
                seg_data <= 8'b10000000;
            4'b1001:
                seg_data <= 8'b10010000;
                
            default:seg_data <= 8'b11000000;
        endcase
    end
endmodule
