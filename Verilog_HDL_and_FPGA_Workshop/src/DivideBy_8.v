//-----------------------------------------------------------------------------
//
// Title       : DivideBy_8
// Design      : Workshop
// Author      : ATMANAND
// Company     : Home
//
//-----------------------------------------------------------------------------
//
// File        : d:\Programming\Aldec\Workshop\src\DivideBy_8.v
// Generated   : Sun Mar  5 00:01:54 2023
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description :
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {DivideBy_8}}
module DivideBy_8 ( clk_out ,clk ,rst_n );

	output reg clk_out ;
	input wire clk ;
	input wire rst_n ;

	reg [2:0]count;
	assign clk_out = count[2];
	always@(posedge clk or negedge rst_n) begin
			if(~rst_n)
				count<=0;
			else
				count<=count+1;
		end
endmodule





module divideBy_8_tb;
reg t_clk, t_rst;

DivideBy_8 U1(.clk(t_clk),.rst_n(t_rst),.clk_out(t_clk_out));
initial begin
#0 t_rst=1;
#10 t_rst=0;
#5 t_rst=1;
end

always begin
#0 t_clk=1'b0;
#10 t_clk=1'b1;
#10;
end
endmodule

