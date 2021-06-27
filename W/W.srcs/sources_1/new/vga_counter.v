`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 23:17:51
// Design Name: 
// Module Name: vga_counter
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


module vga_counter(
    input clk_25MHz,
    input rst_n,
    output x_cnt,
    output y_cnt,
    output hsync_r,
    output vsync_r,
    output hsync_de,
    output vsync_de
    );
    
    parameter LinePeriod =800;           //��������
    parameter H_SyncPulse=96;            //��ͬ������
    parameter Hde_start=144;
    parameter Hde_end  =784;
    
    parameter FramePeriod =525;           //��������
    parameter V_SyncPulse=2;              //��ͬ�����壨Sync o��
    parameter Vde_start=33;
    parameter Vde_end  =513;
    
    reg[10:0]  x_cnt;//�м�������ˮƽ����
    reg hsync_r;//���ź�
    reg hsync_de;
    reg[9:0]  y_cnt;//�м���������ֱ����
    reg vsync_r; 
    reg vsync_de;

    //�м�����
    always @ (posedge clk_25MHz or negedge rst_n)
             begin
                  if(!rst_n)  x_cnt <= 1;
                  else if(x_cnt == LinePeriod) x_cnt <= 1;
                  else x_cnt <= x_cnt+ 1;
             end
             
    //��ͬ���ź�
    always @ (posedge clk_25MHz or negedge rst_n)
                begin
                    if(!rst_n) hsync_r <= 1'b1;
                    else if(x_cnt == 1) hsync_r <= 1'b0;            //����hsync�ź�
                    else if(x_cnt == H_SyncPulse) hsync_r <= 1'b1;
                      
                    if(!rst_n) hsync_de <= 1'b0;
                    else if(x_cnt == Hde_start) hsync_de <= 1'b1;   //����hsync_de�ź�
                    else if(x_cnt == Hde_end) hsync_de <= 1'b0;    
                 end
                 
    //�м�����
    always @ (posedge clk_25MHz or negedge rst_n)
           if(~rst_n) y_cnt <= 1;
           else if(y_cnt == FramePeriod) y_cnt <= 1;
           else if(x_cnt == LinePeriod) y_cnt <= y_cnt+1;
           
    //��ͬ���ź�
     always @ (posedge clk_25MHz or negedge rst_n)
       begin
            if(!rst_n) vsync_r <= 1'b1;
            else if(y_cnt == 1) vsync_r <= 1'b0;    //����vsync�ź�
            else if(y_cnt == V_SyncPulse) vsync_r <= 1'b1;
              
            if(!rst_n) vsync_de <= 1'b0;
            else if(y_cnt == Vde_start) vsync_de <= 1'b1;    //����vsync_de�ź�
            else if(y_cnt == Vde_end) vsync_de <= 1'b0;     
       end

endmodule
