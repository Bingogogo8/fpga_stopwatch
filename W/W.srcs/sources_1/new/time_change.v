`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/20 16:19:47
// Design Name: 
// Module Name: time_change
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

////时钟模块（转换到一毫秒）
//module time_change(
//clk,
//rst_n,
//clk_out
//    );
    
//    input rst_n;
//    input clk;
//    output clk_out;
    
//    reg count;
//    reg clk_out;

//    always @(posedge clk or negedge rst_n)
//    begin
//        if(!rst_n)
//        begin
//            count<= 0;
//            clk_out<= 0;
//        end
//        else
//            if(count<15000000)
//                count<=count+1;
//            else
//                begin
//                    count<=0;
//                    clk_out<=~clk_out;
//                end 
//    end

//endmodule
module time_change(clk,rst_n,clk_out);
input clk;
input rst_n;
output clk_out;
wire clk_out,clk,rst_n;
reg r_clk;
reg [25:0] cnt;
always@(posedge clk,negedge rst_n)
begin
if(!rst_n) begin
           cnt<=26'b0;
			  r_clk<=1'b1;
			  end
else begin
     if(cnt<50000000)
	  begin
	  cnt<=cnt+1'b1;
	  r_clk<=r_clk;
	  end
	  else begin
	       cnt<=26'b0;
			 r_clk<=~r_clk;
			 end
	  end
end
assign clk_out=r_clk;
endmodule