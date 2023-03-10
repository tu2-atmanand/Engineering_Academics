module rippe_adder(a,b,s,cin,cout);
 input [1:0] a,b;
 input cin;
 output [1:0] s;
 output cout;
 wire w1;
 // instantiating 4 1-bit full adders in Verilog
 FullAdder u1(a[0], b[0],cin,s[0], w1);
 FullAdder u2(a[1],b[1],w1,s[1],cout);
endmodule