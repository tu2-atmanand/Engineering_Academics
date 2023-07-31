module f_add(a,b,cin,sum,cout);
input a;
input b;
input cin;
output sum;
output cout;
wire i1,i2,i3;
HalfAdder H2(.a(i1),.b(cin),.c(i3),.s(sum));   // this can be a dirrent method to do the above, this is preferred
or o1(cout,i3,i2);
endmodule