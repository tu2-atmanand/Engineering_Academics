module VectorExp(a,b,y1,y2,y3,y4,y5);
input [3:0]a;
input [3:0]b;
output [1:0]y1;
output [1:0]y2;
output [1:0]y3;
output [1:0]y4;
output [1:0]y5;
assign y1=a[3:2];
assign y2=a[1:0];
assign y3=a&b;
assign y4=~b;
assign y5=&b;
endmodule