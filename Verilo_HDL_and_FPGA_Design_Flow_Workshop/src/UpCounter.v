module up_down_counter(out,clk,rst);
output reg [7:0]out;
input clk;
input rst;

always @(posedge clk or negedge rst) begin
	if (~rst)
		out <= 8'd0;
	else
		out <= out + 8'd1;
end
endmodule											 


/*

module conuter_tb;
wire [7:0]t_out;
reg t_clk, t_rst;

up_down_counter U1(.out(t_out),.clk(t_clk),.rst(t_rst));
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

*/