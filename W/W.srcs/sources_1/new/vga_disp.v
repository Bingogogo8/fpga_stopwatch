`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 23:26:21
// Design Name: 
// Module Name: vga_disp
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


module vga_disp(
input clk_25MHz,
input rst_n,
input wire[3:0]result_0,
input wire[3:0]result_1,
input wire[3:0]result_2,
input wire[3:0]result_3,
input wire[10:0]x_cnt,
input wire[9:0]y_cnt,
output yp1,
output yp2,
output yp3,
output yp4,
output reg[11:0]color
    );


     parameter Hde_start=144;

    //根据输入数据判断该像素点是否可以上色
     vga_get v1(clk_25MHz,result_3,x_cnt-Hde_start-29,y_cnt-34,yp1);
     vga_get v2(clk_25MHz,result_2,x_cnt-Hde_start-159,y_cnt-34,yp2);
     vga_get v3(clk_25MHz,result_1,x_cnt-Hde_start-319,y_cnt-34,yp3);
     vga_get v4(clk_25MHz,result_0,x_cnt-Hde_start-449,y_cnt-34,yp4);
     
    
     always@(posedge clk_25MHz or negedge rst_n)
        begin
           if(!rst_n)
             color<=12'b0000_0000_0000;
           else if(x_cnt>143 && x_cnt<783&&y_cnt>34&&y_cnt<514)//&&(x_cnt<310&&x_cnt>330))
                  begin
                    //画从左到右第一个数字
                    if(x_cnt>143 && x_cnt<303)
                       begin
                              if(yp1)
                                    begin
                                     color[11:8]<=y_cnt[3:0];
                                     color[7:0]<=0;
                                    end
                              else color<=12'b1111_1111_1111;
                        end
                        
                     //画从左到右第二个数字
                    else if(x_cnt>303 && x_cnt<443)
                           begin
                               if(yp2)
                                        begin
                                            color[7:4]<=y_cnt[3:0];
                                            color[11:8]<=0;  
                                            color[3:0]<=0;                                   
                                     
                                        end
                               else color<=12'b1111_1111_1111;
                           end
                    else if(x_cnt > 443 && x_cnt < 453)
                        color<=12'b1111_1111_1111;
                  //画冒号
                    else if(x_cnt > 453 && x_cnt < 463)
                            begin
                                  if(x_cnt>460) color<=12'b1111_1111_1111;
                                  else if(y_cnt<264&&y_cnt>254)
                                         color<=12'b1111_0000_0010;
                                  else if (y_cnt>284&&y_cnt<294)
                                          color<=12'b1111_0000_0010;
                            end
                     else if(x_cnt > 463 && x_cnt < 483)
                               color<=12'b1111_1111_1111;
                 //画从左到右第三个数字
                    else if(x_cnt>483 && x_cnt<623)
                           begin
                                 if(yp3)
                                     begin                  
                                          color[7:4]<=0;
                                          color[11:8]<=0;  
                                          color[3:0]<=y_cnt[3:0]; 
                                     end
                                 else color<=12'b1111_1111_1111;
                           end
                 //画从左到右第四个数字
                    else if(x_cnt>623 && x_cnt<783)
                              begin
                                      if(yp4)
                                             begin
                                                   color[7:4]<=y_cnt[3:0];
                                                   color[11:8]<=y_cnt[3:0];  
                                                   color[3:0]<=y_cnt[3:0];
                                             end
                                      else color<=12'b1111_1111_1111;
                              end
                    end
       
          end
endmodule
