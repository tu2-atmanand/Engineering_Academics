module half_adder(input a, b, output s0, c0);
  assign s0 = a ^ b;
  assign c0 = a & b;
endmodule

module full_adder(input a, b, cin, output s0, c0);
  assign s0 = a ^ b ^ cin;
  assign c0 = (a & b) | (b & cin) | (a & cin);
endmodule

// A can hold negative value and B can not hold negative value.
// Below code gives a flavor WTA which can work on negative value as a single argument.
// However, AND, HA and FA can also be reduced if we consider only unsigned values.
module wallace_tree_multiplier(input [3:0] A, B, output [7:0] z);
  reg signed p[8][4];
  wire [17:0] c; // c represents carry of HA/FA
  wire [10:0] s; // s represents sum of HA/FA
  // For ease and readability, two diffent name s and c are used instead of single wire name.
  genvar g;
  reg signed [7:0]M;
  assign {M[7:4],M[3:0]} = {{4{A[3]}},A}; //To extend signed bit till 7th bit
  //always@(M) $display("A=%b, M = %b",A, M);

  generate
    for(g = 0; g<4; g++) begin
      and a0(p[g][0], M[g], B[0]);
      and a1(p[g][1], M[g], B[1]);
      and a2(p[g][2], M[g], B[2]);
      and a3(p[g][3], M[g], B[3]);
    end
  endgenerate

  //Extra AND gate used for negative number multiplication
  generate
    for(g = 0; g<4; g++) and a4i(p[4][g], M[4], B[g]);
    for(g = 0; g<3; g++) and a5i(p[5][g], M[5], B[g]);
    for(g = 0; g<2; g++) and a6i(p[6][g], M[6], B[g]);
  endgenerate
  and a70(p[7][0], M[7], B[0]);

  assign z[0] = p[0][0];

  //row 0
  half_adder h0(p[0][2], p[1][1], s[0], c[0]);
  /*
  //Extended Code
  full_adder f0(p[0][3], p[1][2], p[2][1], s[1], c[1]);
  full_adder f1(p[1][3], p[2][2], p[3][1], s[2], c[2]);
  full_adder f2(p[2][3], p[3][2], p[4][1], s[3], c[3]);
  full_adder f3(p[3][3], p[4][2], p[5][1], s[4], c[4]);
  full_adder f4(p[4][3], p[5][2], p[6][1], s[5], c[5]); // c[5] - not used
  */
  //OR (using generate block)
  generate
    for(g = 0; g<5; g++) full_adder fg0(p[g][3], p[g+1][2], p[g+2][1], s[g+1], c[g+1]);
  endgenerate

  //row1
  half_adder h1(s[1], p[3][0], s[6], c[6]);
  /*
  full_adder f5(s[2], p[4][0], c[1], s[7], c[7]);
  full_adder f6(s[3], p[5][0], c[2], s[8], c[8]);
  full_adder f7(s[4], p[6][0], c[3], s[9], c[9]);
  full_adder f8(s[5], p[7][0], c[4], s[10], c[10]); // c[10] - not used
  */
  //OR (using generate block)
  generate
    for(g = 0; g<4; g++) full_adder fg1(s[g+2], p[g+4][0], c[g+1], s[g+7], c[g+7]);
  endgenerate

  //row2
  half_adder h2(p[0][1], p[1][0], z[1], c[11]);
  full_adder f9(s[0], p[2][0], c[11], z[2], c[12]);
  full_adder f10(s[6], c[0], c[12], z[3], c[13]);
  /*
  full_adder f11(s[7], c[6], c[13], z[4], c[14]);
  full_adder f12(s[8], c[7], c[14], z[5], c[15]);
  full_adder f13(s[9], c[8], c[15], z[6], c[16]);
  full_adder f14(s[10], c[9], c[16], z[7], c[17]); // c[17] - not used
  */
  //OR (using generate block)
  generate
    for(g = 0; g<4; g++) full_adder fg2(s[g+7], c[g+6], c[g+13], z[g+4], c[g+14]);
  endgenerate
endmodule






module TB;
  reg [3:0] A,B;
  wire [7:0] P;

  wallace_tree_multiplier wta(A,B,P);

  initial begin
    $monitor("A = %b: B = %b --> Product = %b", A, B, P);
    //Note that input A can be signed, but B must be unsigned
    A = 1; B = 0; #3;  // ans = 0
    A = 7; B = 5; #3;  // ans = 35
    A = -5; B = 4; #3; // ans = -20 (Take 2's complement of output)
    A = -3; B = 7; #3; // ans = -21 (Take 2's complement of output)
    A = 9; B = 7; #3;  // (-7)*7 = -49 (Take 2's complement of output)
    A = 7; B = 'hf;    // ans = 105
  end
endmodule


/*

module TB;
  reg [3:0] A,B;
  wire [7:0] P;

  wallace_tree_multiplier wta(A,B,P);

  initial begin
    $monitor("A = %b: B = %b --> Product = %b", A, B, P);
    //Note that input A can be signed, but B must be unsigned
    A = 1; B = 0; #3;  // ans = 0
    A = 7; B = 5; #3;  // ans = 35
    A = -5; B = 4; #3; // ans = -20 (Take 2's complement of output)
    A = -3; B = 7; #3; // ans = -21 (Take 2's complement of output)
    A = 9; B = 7; #3;  // (-7)*7 = -49 (Take 2's complement of output)
    A = 7; B = 'hf;    // ans = 105
  end
endmodule



*/







/*

module wallace(a, b, prod);
    input [3:0] a, b;
    output [7:0] prod;
    wire [3:21][3:0] p;
    wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;
    wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;

    assign p[0] = {4{1'b0}, a};
    assign p[1] = {3{1'b0}, a};
    assign p[2] = {2{1'b0}, a};
    assign p[3] = {1'b0, a};

    assign p[4] = {4{1'b0}, b};
    assign p[5] = {3{1'b0}, b};
    assign p[6] = {2{1'b0}, b};
    assign p[7] = {1'b0, b};

    assign p[8] = {4{a[0]}, b};
    assign p[9] = {3{a[0]}, b};
    assign p[10] = {2{a[0]}, b};
    assign p[11] = {a[0], b};

    assign p[12] = {4{a[1]}, b};
    assign p[13] = {3{a[1]}, b};
    assign p[14] = {2{a[1]}, b};
    assign p[15] = {a[1], b};

    assign p[16] = {4{a[2]}, b};
    assign p[17] = {3{a[2]}, b};
    assign p[18] = {2{a[2]}, b};
    assign p[19] = {a[2], b};

    assign p[20] = {4{a[3]}, b};
    assign p[21] = {3{a[3]}, b};
    assign p[22] = {2{a[3]}, b};
    assign p[23] = {a[3], b};

	always @ (a or b) begin
	for (i=0; i<=3; i=i+1)
		for (j=0; j<=3; j=j+1)
			p[j][i]<= a[j] & b[i];

    ha h1(s0, c0, p[0][1], p[1][0]);
    fa f1(s1, c1, p[0][2], p[1][1], p[2][0]);
    fa f2(s2, c2, p[0][3], p[1][2], p[2][1]);
    fa f3(s3, c3, p[1][3], p[2][2], 1'b0);

    fa f4(s4, c4, s1, 1'b0);
    fa f5(s5, c5, s2, c1, p[3][0]);
    fa f6(s6, c6, s3, c2, p[3][1]);
    fa f7(s7, c7, p[2][3], c3, p[3][2]);

    fa f8(s8, c8, s5, c4, 1'b0);
    fa f9(s9, c9, s6, c8, c5);
    fa f10(s10, c10, s7, c6, c9);
    fa f11(s11 c11,p[3][3],c7,c10);

	assign prod[0] p[0][0];
	assign prod[1] = s0;
	assign prod[2] = $4;
	assign prod[3] = s8;
	assign prod[4] = s9;
	assign prod[5] = $10;
	assign prod[6] = s11;
	assign prod[7] = c11;

endmodule


*/



/*
module wallace(a,b,prod,s0,s1,s2,s3,S4,S5,S6,s7,s8,s9,s10,s11,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,p,i,j);
  	input [3:0] a,b;
	output [7:0]prod,
	wire s0,s1,s2,s3,S4,S5,S6,s7,s8,s9,s10,s11,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
	reg p[3:21[3:0];
	integer i,j;


always @ (a or b) begin
	for (i=0; i<=3; i=i+1)
		for (j=0; j<=3; j=j+1)
			p[j][i]<= a[j] & b[i];
end

ha h1(s0 c0,p[0][1], p[1][0]);
fa f1(s1,cl,p[0][2], p[1][1], p[2][0]);
fa f2(s2,c2,p[0][3], p[1][2], p[2][1]);
fa f3(s3 c3,p[1][3], p[2][2], 1'b0);

fa f4(s4 c4 s1,c1'b0);
fa f5(s5 c5,s2,c1, p[3][0]);
fa f6(s6 c6,s3,c2, p[3][1]);
fa f7(s7.c7.p[2][3],c3, p[3][2]);

fa f8(s8.c8,s5,c4,1'b0);
fa f9($9.c9,s6,c8,c5);
fa f10(s10 c10,s7,c6,c9);
fa f11(s11 c11,p[3][3],c7,c10);

assign prod[0] p[0][0];
assign prod[1] = s0;
assign prod[2] = $4;
assign prod[3] = s8;
assign prod[4] = s9;
assign prod[5] = $10;
assign prod[6] = s11;
assign prod[7] = c11;

endmodule

*/


/*

module tb_wallace();

  reg [3:0] a;
  reg [3:0] b;
  wire [7:0] prod;

  // Instantiate the Wallace design module
  wallace wallace_inst(
    .a(a),
    .b(b),
    .prod(prod)
  );

  // Clock signal for simulation
  reg clk;
  always #5 clk = ~clk;

  // Stimulus generation
  initial begin
    $monitor("a=%b b=%b prod=%b", a, b, prod);

    // Test multiplication of 3 and 5
    a = 3;
    b = 5;
    #10 $display("3 * 5 = %d", prod);

    // Test multiplication of 8 and 11
    a = 8;
    b = 11;
    #10 $display("8 * 11 = %d", prod);

    // End simulation
    #10 $finish;
  end

  // Drive clock signal
  always #5 clk = ~clk;

endmodule

*/