`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/22 10:51:19
// Design Name: 
// Module Name: debounce
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


//按键去抖动 
module debounce (input sig_in, //按键低表示按下
                 input clk,
                 output  sig_out_n);//消抖后且正负逻辑转换后1表示按下

reg [7:0] register;
reg sig_out;
wire clk_1khz;
divider_1kHz d1(clk,clk_1khz);
//reg: wait for stable
always @ (posedge clk_1khz) begin
    register <= {register[6:0],sig_in}; //shift register
    if(register[7:0] == 8'b00000000)
        sig_out <= 1'b0;
    else if(register[7:0] == 8'b11111111)
        sig_out <= 1'b1;
    else sig_out <= sig_out;
    end
    
assign sig_out_n = sig_out;
endmodule
