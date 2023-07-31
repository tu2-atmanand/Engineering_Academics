


// Multiplexer using case statement

module mux8_usingCase(a,sel,outmux);
input [2:0] sel;
input [7:0]a;
output reg outmux;
always@(*)
begin
case(sel)
3'b000 : outmux = a[0];
3'b001 : outmux =a[1];
3'b010 : outmux =a[2];
3'b011 : outmux =a[3];
3'b100 : outmux =a[4];
3'b101 : outmux =a[5];
3'b110 : outmux =a[6];
3'b111 : outmux =a[7];
endcase
end
endmodule