`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/22 20:05:00
// Design Name: 
// Module Name: VGA_Top
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


module VGA_Top(
input clear,
input clk,
input rst_n,
input  open_stop,choose1or001,up_down,get_time,switch,
output vga_hs,
output vga_vs,
output [3:0] vga_r,
output [3:0] vga_g,
output [3:0] vga_b,
output [7:0]seg_data,
output [3:0]seg_sel
    );
    
wire clk_25MHz;

wire[10:0]  x_cnt;//�м�����
wire hsync_r;//��ͬ���ź�
wire hsync_de;//��֤�����ص����������ֵ
wire[9:0]  y_cnt;//��������
wire vsync_r;//��ͬ���ź�
wire vsync_de;//��֤�����ص����������ֵ

wire [3:0]vga_r_reg;
wire [3:0]vga_g_reg;
wire [3:0]vga_b_reg;

wire [3:0]seg_sel;
wire [7:0]seg_data;
wire [3:0]result_0,result_1,result_2,result_3;

wire [11:0] color;
wire yp1;
wire yp2;
wire yp3;
wire yp4;

//��Ƶ
Vga_clkDivider(clk,rst_n,clk_25MHz);

//�����С��м������Լ��С���ͬ���ź�
vga_counter(clk_25MHz, rst_n, x_cnt, y_cnt, hsync_r, vsync_r, hsync_de, vsync_de);

//��ȡ�������
Top(clear,clk,rst_n,seg_sel,seg_data,open_stop,choose1or001,up_down,get_time,switch,result_0,result_1,result_2,result_3);

//��ʾģ��
vga_disp(clk_25MHz, rst_n,result_0,result_1,result_2,result_3,x_cnt,y_cnt, yp1, yp2,yp3,yp4,color);     
 //��ֵ
 assign vga_r_reg = color[11:8];
 assign vga_b_reg = color[7:4];
 assign vga_g_reg = color[3:0];

 assign vga_hs = hsync_r;
 assign vga_vs = vsync_r;  
 
 assign vga_r = (hsync_de & vsync_de)?vga_r_reg:4'b0000;
 assign vga_g = (hsync_de & vsync_de)?vga_g_reg:4'b0000;
 assign vga_b = (hsync_de & vsync_de)?vga_b_reg:4'b0000;
  
endmodule