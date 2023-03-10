
module forLoopexp(a,b,flag,y);
input [7:0]a;
input [7:0]b;
input [7:0]flag;
integer i;
output reg [7:0]y;

always@(*) begin
for(i=0;i<8;i=i+1) begin
	if(flag[i]==0)
		y[i]=a[i]|b[i];
	else
		y[i]=a[i]&b[i];
	end
	$monitor("%b",a[i]);
end
endmodule