`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 13:19:11
// Design Name: 
// Module Name: vga_get
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


module vga_get(
input clk,
input [3:0]num,
input [10:0]x,
input [9:0]y,
output reg colorOrnot
);

always@(posedge clk)
     begin
        if((y>=0&&y<=139)||(y>=340&&y<=479))
                  colorOrnot=1'b0;
        else if(y>=140&&y<=244)
              begin
                 if((num==4'd0||num==4'd2||num==4'd3||num==4'd5||num==4'd6||num==4'd7||num==4'd8||num==4'd9)&&(11'd30<=x&&x<=11'd129)&&(10'd140<=y&&y<=10'd149))
                    colorOrnot=1'b1;
                 else if((num==4'd0||num==4'd1||num==4'd2||num==4'd3||num==4'd4||num==4'd7||num==4'd8||num==4'd9)&&(10'd150<=y&&y<=10'd234)&&(11'd120<=x&&x<=11'd129))
                    colorOrnot=1'b1;
                 else if((num==4'd2||num==4'd3||num==4'd5||num==4'd6||num==4'd4||num==4'd8||num==4'd9)&&(10'd235<=y&&y<=10'd244)&&(11'd30<=x&&x<=11'd129))
                    colorOrnot=1'b1;
                 else if((num==4'd0||num==4'd4||num==4'd5||num==4'd6||num==4'd8||num==4'd9)&&(10'd145<=y&&y<=10'd234)&&(11'd30<=x&&x<=11'd39))
                    colorOrnot=1'b1;
                 else colorOrnot=1'b0;
              end
        else begin
                 if((num==4'd0||num==4'd1||num==4'd3||num==4'd4||num==4'd5||num==4'd6||num==4'd7||num==4'd8||num==4'd9)&&(10'd245<=y&&y<=10'd329)&&(11'd120<=x&&x<=11'd129))
                    colorOrnot=1'b1;
                 else if((num==4'd0||num==4'd2||num==4'd3||num==4'd5||num==4'd6||num==4'd8||num==4'd9)&&(10'd330<=y&&y<=10'd339)&&(11'd30<=x&&x<=11'd129))
                    colorOrnot=1'b1;
                 else if((num==4'd0||num==4'd2||num==4'd6||num==4'd8)&&(10'd245<=y&&y<=10'd329)&&(11'd30<=x&&x<=11'd39))
                    colorOrnot=1'b1;
                 else colorOrnot=1'b0;
              end


    end
    
       
    
endmodule
