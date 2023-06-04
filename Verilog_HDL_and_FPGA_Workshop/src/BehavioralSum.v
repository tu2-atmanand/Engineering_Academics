module sum(a,b,sum);
input [7:0]a;
input [7:0]b;
output [8:0]sum;
assign sum = {1'b0,a} + {1'b0,b};
endmodule