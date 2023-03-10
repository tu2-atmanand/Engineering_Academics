module dff(clk,d,q);
input clk;
input d;
output reg q;
always@(posedge clk)begin
q<=d;
end
endmodule



/*
module dff_tb;





endmodule;

*/



module tff(clk,t,q,rst_n);
input clk;
input t;
input rst_n;
output reg q;

always@(posedge clk or negedge rst_n) begin
if(~rst_n)
	q<=1'b0;
else
	if(t==1'b1)
		q<=~q;
	else
		q<=q;
end
endmodule





/*

module tff_tb;
	reg t_t,t_clk;
	wire t_q;
	reg t_rst_n;
	
	tff T1(.clk(t_clk),.t(t_t),.q(t_q),.rst_n(t_rst_n));
	initial begin
	#0 t_rst_n=1;
	#10 t_rst_n=0;
	#5 t_rst_n=1;
	#0 t_t=1;
	#80 t_t=1;
	#10;
	end
	always begin
	#0 t_clk=1'b0;
	#10 t_clk=1'b1;
	#10;
	end
endmodule

*/