`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 18:37:35
// Design Name: 
// Module Name: counterTo10
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

module counterTo10(clk,rst_n,EN,overcounter,Q);
	input clk,rst_n;
	input EN;         //使能信号
	output overcounter;      //计数器进位输出
	output reg [3:0] Q;     // 计数器的输出
        
         always @(posedge clk or negedge rst_n)  //异步清零
              begin
                  if (!rst_n)       //清零有效
                    begin 
                     Q<=4'b0000;
                   end          //完成清零操作，计数器输出为0
                  else if(EN==1) 
                    begin
                     if (Q==4'b1001)    //计数+1，若低位已经到最大数9
                      begin 
                        Q<=4'b0000;      //输出跳转到最小数0
                        end
                     else Q<=Q+4'b0001;       //若输出未到最大数，则只加1
                     end
              end
               //计到最大数9，输出overcounter为1
              assign overcounter=((EN==1)&&(Q==9))?1'b1:1'b0;
endmodule