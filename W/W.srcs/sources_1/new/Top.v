`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 17:17:15
// Design Name: 
// Module Name: Top
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


module Top(

clear,
clk,
rst_n,
seg_sel,
seg_data,
open_stop,
choose1or001, //1为1s，001为0.01s
up_down,
get_time,
switch,
result_0,
result_1,
result_2,
result_3
);
input clear;
input clk,rst_n,choose1or001,switch,get_time;
input open_stop,up_down;
output [3:0]seg_sel;
output [7:0]seg_data;
output wire[3:0]result_0,result_1,result_2,result_3;

//分频模块
wire clk_1s; //1s时钟
wire clk_001s;//0.01秒时钟
divider d1(clk,rst_n,clk_1s,clk_001s);
//选择最小单位为秒还是毫秒
wire clk_choose;
assign clk_choose = (choose1or001==1)? clk_1s:clk_001s;


//计时模块
wire[3:0] C_0,C_1,C_2,C_3;// 正向计时的输出
wire[3:0] S_0,S_1,S_2,S_3;// 反向计时的输出
reg[3:0] Q_0,Q_1,Q_2,Q_3;// 最终输出
//正向计时
counter u1(clk_choose,rst_n,open_stop,C_0,C_1,C_2,C_3);
//反向计时
suber u2(clk_choose,rst_n,open_stop,S_0,S_1,S_2,S_3);
//消抖后的输出，get_time_true按下为1
wire get_time_ture;
//消抖
debounce de(get_time,clk,get_time_true);
//记时(只允许记一个数)
reg [3:0]tmp0,tmp1,tmp2,tmp3;
always@(posedge clk)
    if(get_time_true)
        begin
            tmp0<=Q_0;
            tmp1<=Q_1;
            tmp2<=Q_2;
            tmp3<=Q_3;
         end   

        
always@(posedge clk)         
     if(switch)
         begin
            Q_0 <= tmp0;
            Q_1 <= tmp1;
            Q_2 <= tmp2;
            Q_3 <= tmp3;
         end         
    else if(up_down)
            begin
             Q_0 <= C_0;
             Q_1 <= C_1;
             Q_2 <= C_2;
             Q_3 <= C_3;
            end
    else if (!up_down)
            begin
                Q_0 <= S_0;
                Q_1 <= S_1;
                Q_2 <= S_2;
                Q_3 <= S_3;
            end    
assign result_0 = Q_0;
assign result_1 = Q_1;
assign result_2 = Q_2;
assign result_3 = Q_3;

//显示模块
display d2(clear,Q_0,Q_1,Q_2,Q_3,clk,rst_n,seg_data,seg_sel);
   
    
endmodule
