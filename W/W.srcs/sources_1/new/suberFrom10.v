`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 23:41:00
// Design Name: 
// Module Name: suberFrom10
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



module suberFrom10(clk,rst_n,EN,oversuber,Q
    );
    input clk,rst_n;
    input EN;                //ʹ���ź�
    output oversuber;      //��������λ���
    output reg [3:0] Q;      // �����������
        
      
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
                                 Q<=4'b1001;    
                               end
                          else Q<=Q-4'b0001;      
                      end
               end
               assign oversuber=((EN==1)&&(Q==0))?1'b1:1'b0;
        
endmodule

