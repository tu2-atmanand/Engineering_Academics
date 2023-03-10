
module singlePortMem(
	input [4:0]addr,
	input en,WE,rst_n, clk,
	input [7:0]data,
	output reg [7:0]o_data,
	output reg valid,
	reg [7:0]mem[31:0]
);


//reading
always@(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
			o_data<=0;
			valid<=0;
	end
	else begin
			if(en && ~WE) begin
					o_data<=mem[addr];
					valid<=1;
				end
			else begin
					o_data<=o_data;
					valid<=0;
				end
	end
end

//writing
always@(posedge clk or negedge rst_n) begin
	if(en && WE)
		mem[addr]<=data;
	else
		mem[addr] <= mem[addr];
end
endmodule