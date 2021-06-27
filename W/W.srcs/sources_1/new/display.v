`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 19:02:04
// Design Name: 
// Module Name: display
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

module display(
input clear,
input [3:0]disp_sec01,
input [3:0]disp_sec10,
input [3:0]disp_min01,
input [3:0]disp_min10,
input clk,  //ĞèÊäÈë10nsÊ±ÖÓ
input rst_n,
output [7:0] data ,
output [3:0] sel
    );
reg  [7:0] data;
reg  [3:0] sel;
//È¡1kHzÊ±ÖÓ
wire clk_out;
divider_1kHz d1Hz(clk,clk_out);

//ÏÔÊ¾Î»ÖÃ¼ÆÊıÆ÷
reg [1:0] num = 0;
always @ (posedge clk_out)
	begin
		if (num>=3)
			num<=0;
		else
			num<=num+1;
	end

//Ñ¡ÔñÒëÂëÆ÷
always @ (posedge clk_out)
begin    
    case(num)
    0:sel<=4'b1110;
    1:sel<=4'b1101;
    2:sel<=4'b1011;
    3:sel<=4'b0111;
    default: sel<=4'b0000;
    endcase
end

//ÏÔÊ¾ÒëÂëÆ÷
reg [3:0] disp_data;
parameter data0=8'b11000000;
parameter data1=8'b11111001;
parameter data2=8'b10100100;
parameter data3=8'b10110000;
parameter data4=8'b10011001;
parameter data5=8'b10010010;
parameter data6=8'b10000010;
parameter data7=8'b11111000;
parameter data8=8'b10000000;
parameter data9=8'b10010000;
always @ (posedge clk_out)
	begin	 
	  
            case(num)
            0:disp_data<=disp_sec01;
            1:disp_data<=disp_sec10;
            2:disp_data<=disp_min01;
            3:disp_data<=disp_min10;
            default: disp_data<=4'b0000;
            endcase
	end
always@(posedge clk_out or negedge clear)
        begin
            if(!clear)
                begin
                    data <= 8'b1111_1111;
                end
            else
                begin
                    case(disp_data)
                    4'b0000: data<=data0;
                    4'b0001: data<=data1;
                    4'b0010: data<=data2;
                    4'b0011: data<=data3;
                    4'b0100: data<=data4;
                    4'b0101: data<=data5;
                    4'b0110: data<=data6;
                    4'b0111: data<=data7;
                    4'b1000: data<=data8;
                    4'b1001: data<=data9;
                    default: data<=8'b0000_0000;
                    endcase
                end
        end
    
endmodule


