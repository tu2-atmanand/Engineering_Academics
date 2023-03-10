
module TwoMHz(count,clk,rst_n,clk_out,data);
	output reg [19:0]data;
	output reg [19:0]count;
	input clk,rst_n;
	output reg clk_out;
	
	
	always @(posedge clk or negedge rst_n) begin
		if (~rst_n)begin
			count<=0;
			clk_out=0;
			end
		else begin
			data <= data + 20'd1;
			if(count==20'd99)begin
				clk_out<=(~clk_out);	
				count=0;
			end
			else
				count<=count+1;
		end
	end
endmodule




/*

`timescale 1ns/1ps
module TwoMHz_tb;
reg t_clk,t_rst_n;

TwoMHz U1(.data(t_data),.count(t_count),.clk(t_clk),.rst_n(t_rst_n),.clk_out(t_clk_out));
initial begin
#0 t_rst_n=1;
#10 t_rst_n=0;
#5 t_rst_n=1;
end

always begin
#0 t_clk=1'b0;
#10 t_clk=1'b1;
#10;
end
endmodule

*/