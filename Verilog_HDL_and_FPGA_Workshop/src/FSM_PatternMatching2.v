
module FSM_pattern_2(
input clk,rst_n,x,
output reg y,
reg [1:0]curr_state,
reg [3:0]count
);
parameter A=2'b00;
parameter B= 2'b01;
parameter C=2'b11;
parameter D= 2'b11;


always@(posedge clk or negedge rst_n) begin
		if(~rst_n)
			count<=0;
		else
			if(count<=4'b10)
				count<=0;
			else
				count<=count+1;
		
	end

//control
always@(posedge clk) begin
if(~rst_n)
	count<=A;
else
	case(curr_state)
		A: 
			if(count<2)
				curr_state<=A;
		B:
			if(count<=4)
				curr_state<=B;
		C:
			if(count<=5)
				curr_state<=B;
		D:
			if(count<=10)
				curr_state<=B; 
		
	endcase	
end

always@(posedge clk) begin
	case(curr_state)
		A: y<=4'd1;
		B: y<=4'd5;
		C: y<=4'd8;
		D: y<=4'd11;
	endcase
end
endmodule