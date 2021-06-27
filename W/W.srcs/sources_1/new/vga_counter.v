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
    
    parameter LinePeriod =800;           //行周期数
    parameter H_SyncPulse=96;            //行同步脉冲
    parameter Hde_start=144;
    parameter Hde_end  =784;
    
    parameter FramePeriod =525;           //列周期数
    parameter V_SyncPulse=2;              //列同步脉冲（Sync o）
    parameter Vde_start=33;
    parameter Vde_end  =513;
    
    reg[10:0]  x_cnt;//行计数器即水平计数
    reg hsync_r;//行信号
    reg hsync_de;
    reg[9:0]  y_cnt;//列计数器即垂直计数
    reg vsync_r; 
    reg vsync_de;

    //行计数器
    always @ (posedge clk_25MHz or negedge rst_n)
             begin
                  if(!rst_n)  x_cnt <= 1;
                  else if(x_cnt == LinePeriod) x_cnt <= 1;
                  else x_cnt <= x_cnt+ 1;
             end
             
    //行同步信号
    always @ (posedge clk_25MHz or negedge rst_n)
                begin
                    if(!rst_n) hsync_r <= 1'b1;
                    else if(x_cnt == 1) hsync_r <= 1'b0;            //产生hsync信号
                    else if(x_cnt == H_SyncPulse) hsync_r <= 1'b1;
                      
                    if(!rst_n) hsync_de <= 1'b0;
                    else if(x_cnt == Hde_start) hsync_de <= 1'b1;   //产生hsync_de信号
                    else if(x_cnt == Hde_end) hsync_de <= 1'b0;    
                 end
                 
    //列计数器
    always @ (posedge clk_25MHz or negedge rst_n)
           if(~rst_n) y_cnt <= 1;
           else if(y_cnt == FramePeriod) y_cnt <= 1;
           else if(x_cnt == LinePeriod) y_cnt <= y_cnt+1;
           
    //列同步信号
     always @ (posedge clk_25MHz or negedge rst_n)
       begin
            if(!rst_n) vsync_r <= 1'b1;
            else if(y_cnt == 1) vsync_r <= 1'b0;    //产生vsync信号
            else if(y_cnt == V_SyncPulse) vsync_r <= 1'b1;
              
            if(!rst_n) vsync_de <= 1'b0;
            else if(y_cnt == Vde_start) vsync_de <= 1'b1;    //产生vsync_de信号
            else if(y_cnt == Vde_end) vsync_de <= 1'b0;     
       end

endmodule
