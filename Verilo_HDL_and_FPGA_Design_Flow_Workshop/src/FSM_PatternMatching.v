

module FSM_2(clk, rst_n, x, y);
input clk,rst_n,x;
output reg y;
reg [1:0]curr_state;
parameter A=2'b00;
parameter B= 2'b01;
parameter C=2'b11;
parameter D= 2'b11;

//control
always@(posedge clk or negedge rst_n) begin
	if(~rst_n)
		curr_state=0;
	else begin
		case(curr_state)
			A: 
				if(x==1'b1)
					curr_state <=B;
				else
					curr_state <= A;
			B:
				if(x==1'b1)
					curr_state <=C;
				else
					curr_state <= A;
			C:
				if(x==1'b1)
					curr_state <=C;
				else
					curr_state <= D;
			D:
				if(x==1'b1)
					curr_state <=B;
				else
					curr_state <= A;
			default :
				curr_state <= A;
		endcase
	end
end

always@(posedge clk) begin
	case(curr_state)
		A: y<=0;
		B: y<=0;
		C: y<=0;
		D: y<=1;
		default : y<=1;
	endcase
end
endmodule




/*

module FSM_2_tb;
reg t_clk,t_rst_n,t_x;                //correct this
wire t_y;

FSM_2 FS(.clk(t_clk),.rst_n(t_rst_n),.x(t_x),.y(t_y));
initial begin
#0 t_rst_n<=1;t_x<=0;
#5 t_rst_n<=0;
#5 t_rst_n<=1;
#10 t_x<=1;
#5 t_x<=0;
#5 t_x<=1;
#5 t_x<=1;
#5 t_x<=0;
#5 t_x<=1;
end


always begin
#0 t_clk=1'b0;
#5 t_clk=1'b1;
#5;
end
endmodule


*/