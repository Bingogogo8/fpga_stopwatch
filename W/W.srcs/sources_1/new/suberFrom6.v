`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 23:40:45
// Design Name: 
// Module Name: suberFrom6
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


module suberFrom6(clk,rst_n,EN,oversuber,Q
    );
    input clk,rst_n;
    input EN;                //使能信号
    output oversuber;      //计数器借位输出
    output reg [3:0] Q;      // 计数器的输出
        
      
          always @(posedge clk or negedge rst_n) 
               begin
                   if (!rst_n)       
                     begin 
                      Q<=4'b0000;
                    end         
                   else if(EN==1)  
                     begin
                          if (Q==4'b0000)    
                               begin 
                                 Q<=4'b0101;    
                               end
                          else Q<=Q-4'b0001;      
                      end
               end
               assign oversuber=((EN==1)&&(Q==0))?1'b1:1'b0;
        
endmodule
