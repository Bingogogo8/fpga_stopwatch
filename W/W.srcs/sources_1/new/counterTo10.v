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
	input EN;         //ʹ���ź�
	output overcounter;      //��������λ���
	output reg [3:0] Q;     // �����������
        
         always @(posedge clk or negedge rst_n)  //�첽����
              begin
                  if (!rst_n)       //������Ч
                    begin 
                     Q<=4'b0000;
                   end          //���������������������Ϊ0
                  else if(EN==1) 
                    begin
                     if (Q==4'b1001)    //����+1������λ�Ѿ��������9
                      begin 
                        Q<=4'b0000;      //�����ת����С��0
                        end
                     else Q<=Q+4'b0001;       //�����δ�����������ֻ��1
                     end
              end
               //�Ƶ������9�����overcounterΪ1
              assign overcounter=((EN==1)&&(Q==9))?1'b1:1'b0;
endmodule