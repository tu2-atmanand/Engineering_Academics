
module dualPortMem(
	input [4:0]r_addr,
	input [4:0]w_addr,
	input en,we,rst_n, rclk,wclk,re,
	input [7:0]w_data,
	output reg [7:0]o_data,
	output reg valid,
	reg [7:0]mem[31:0]
	
);


//reading
always@(posedge rclk or negedge rst_n)begin
	if(~rst_n)begin
		o_data<=0;
		valid<=0;
	end
	else begin
		if(en && re && ~we) begin
			o_data<=mem[r_addr];
			valid<=1;
		end
		else begin
			o_data<=o_data;
			valid<=0;
		end
	end
end

//writing
always@(posedge wclk or negedge rst_n) begin
	if(en && we)
		mem[w_addr]<=w_data;
	else
		mem[w_addr] <= mem[w_addr];
end
endmodule