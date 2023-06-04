module TrafficLights(clk,rst_n,clk_out,count,y,cnt,curr_state,data);

input clk,rst_n;
output reg clk_out;
output reg [24:0]count;
output reg [5:0]y;
output reg [7:0]cnt;
output reg [2:0]curr_state;
output reg [24:0]data;


parameter A= 3'b000;
parameter B= 3'b001;
parameter C= 3'b010;
parameter D= 3'b011;
parameter E= 3'b100;
parameter F= 3'b101;


always @(posedge clk or negedge rst_n) begin
	if (~rst_n)begin
		count<=0;
		clk_out=0;
		end
	else begin
		data = data + 25'd1;
		if(count==25'd24999999)begin
			clk_out<=(~clk_out);	
			count=0;
		end
		else
			count<=count+1;
	end
end



always@(posedge clk_out or negedge rst_n) begin
	if(~rst_n)
		cnt<=0;
	else
		cnt<=cnt+1;
		
end

//control
always@(posedge clk_out) begin
	if(~rst_n)
		count<=A;
	else begin
		case(curr_state)
			A: 
				if(cnt<5)
					curr_state<=A;
				else
					curr_state<=B;
			B:
				if(cnt<=125)
					curr_state<=B;
				else
					curr_state<=C;
			C: 
				if(cnt<=130)
					curr_state<=C;
				else
					curr_state<=D;
			D:
				if(cnt<=132)
					curr_state<=D;
				else
					curr_state<=E;
			E:
				if(cnt<=162)
					curr_state<=E;
				else
					curr_state<=F;
			F:
				if(cnt<=167)
					curr_state<=F;
				else
					curr_state<=A;
			default: curr_state<=A;
		endcase
	end
end

always@(posedge clk_out) begin
	case(curr_state)
		A: 
			y<=6'd36;
		B: 
			y<=6'd12;
		C: 
			y<=6'd20;
		D: 
			y<=6'd34;
		E: 
			y<=6'd33;
		F: 
			y<=6'd34;
	endcase
end

endmodule


/*

`timescale 1ns/1ps
module TrafficLights_tb();

reg t_clk,t_rst_n;
wire t_clk_out;
wire[24:0]t_count;
wire [5:0]t_y;
wire [7:0]t_cnt;
wire [2:0]t_curr_state;
wire [24:0]t_data;



TrafficLights U1(.clk(t_clk),.rst_n(t_rst_n),.clk_out(t_clk_out),.count(t_count),.y(t_y),.cnt(t_cnt),.curr_state(t_curr_state),.data(t_data));
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

*/
