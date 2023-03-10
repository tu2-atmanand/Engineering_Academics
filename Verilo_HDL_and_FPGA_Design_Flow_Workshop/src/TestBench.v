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