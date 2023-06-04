module HalfAdder(a,b,s,c);
	input a;
	input b;
	output s;
	output c;

	assign s=a^b;
	assign c=a&b;
endmodule




module HA_tb;
reg t_a;
reg t_b;
wire t_sum;
wire t_c;
HalfAdder H1(.a(t_a),.b(t_b),.s(t_sum),.c(t_c));
initial begin
t_a=0;t_b=0;
#10 t_a=0;t_b=1;
#10 t_a=1;t_b=0;
#10 t_a=1;t_b=1;
#10;
end
endmodule

