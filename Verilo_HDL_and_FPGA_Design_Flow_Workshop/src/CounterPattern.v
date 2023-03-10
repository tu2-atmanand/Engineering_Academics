module up_counter(input clk, reset, output[2:0] counter);
reg [7:0] counter_up;

// up counter
always @(posedge clk or posedge reset)
begin
if(reset)
 counter_up <= 3'd0;
else
 counter_up <= counter_up + 3'd1;
end 
assign counter = counter_up;
endmodule



/*

// data variable to set the end limit


module upcounter_testbench();
reg clk, reset;
wire [2:0] counter;

up_counter dut(clk, reset, counter);
initial begin 
 clk=0;
 forever #5 clk=~clk;
end
initial begin
 reset=1;
 #5;
 reset=0;
end
endmodule 

*/