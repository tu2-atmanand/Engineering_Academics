module FullAdder(a,b,cin,s,cout);
	input a;
	input b;
	input cin;
	output s;
	output cout;
	assign s=a^b^cin;
	assign cout=((a^b)&cin)|(a&b);
endmodule 


/*
module FA_tb;
reg t_a;
reg t_b;
reg t_cin;
wire t_sum;
wire t_cout;
FullAdder FA1(.a(t_a),.b(t_b),.cin(t_cin),.s(t_sum),.cout(t_cout));
initial begin
t_a=0;t_b=0;t_cin=0;
#10 t_a=1;t_b=0;t_cin=0;
#10 t_a=0;t_b=1;t_cin=0;
#10 t_a=1;t_b=1;t_cin=0;
#10 t_a=0;t_b=0;t_cin=1;
#10 t_a=1;t_b=0;t_cin=1;
#10 t_a=0;t_b=1;t_cin=1;
#10 t_a=1;t_b=1;t_cin=1;
#10;
end
endmodule
*/