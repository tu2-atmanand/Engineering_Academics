# Verilog HDL and FPGA Design Flow

#### The syntax of the verilog code is : 
module comp(a,b,y);
input a;
input b;
output y;


HDL 
-> syntehesis
	converting program into hardware
-> Map and translate 
	
-> Place and Route
	where to place the componect, or how the ckt looks like



In verilog, two kinds of statement avaialable: 
1. Assign
	can be used for combinational only
2. Always
	can be used for both combinational and sequential


To desing a nand gate : 
module comp(a,b,y);
	input a;
	input b;
	output y;
	assign y=~(a & b);
endmodule


> There are two types data : wire() and reg( like buffer or memory)

Example : 
module comp(a,b,y);
	input a;
	input b;
	output y;
	wire c;
	assign c=~(a & b);
	assign y=~c;
endmodule
 > in above example the two stat assing are called concurrent since this 
 

ternary statement : 
assign y= (a==1'b1 && b==1'b1)? 1'b0: 0'b1
> where 1 is the no of bits, b stands for binary and next 1 stands for the value



& is for and
| = or
^ = xor



#### Model
	data flow
	struct
	behavirol




#### How to create a vector
a [0:1] ;

to assing value to a vector
assing a = 4'b1001;
> to assing 4 bit value

To access value form a vector
a[0] or a[3]

#### Slicing
a[0:2]

another way of slicing : 
a[1+:2]  == this means starting from second bit and including two bits.


#### concatination
syntax : {a,b} == append b to a

#### Replication
{2{a}}

#### Reduction
Syntax ; &(4'b0110) ==  this means 0&1&1&0
There can be any other operator at the & opereator










module VectorExp(a,b,y1,y2,y3,y4,y5);
input [3:0]a;
input [3:0]a;
output [1:0]y1;
output [1:0]y2;
output [1:0]y3;
output [1:0]y5;
assign y1=a[3:2];
assign y2=a[1:0];
assing y3=a&b;
assing y4=~b;
assing y5=&b;
endmodule





exercise 1: 
input a 0011 1010 1100
now b should be  :
ouptut b 1100 1010 0011

Exercise 2:
Use gray code generator.



module Multiplexer(out, a, b, c, d, s0, s1);
output out;
input a, b, c, d, s0, s1;
wire sobar, s1bar, T1, T2, T3, T4;
not (s0bar, s0), (s1bar, s1);
and (T1, a, s0bar, s1bar), (T2, b, s0bar, s1),(T3, c, s0, s1bar), (T4, d, s0, s1);
or(out, T1, T2, T3, T4);
endmodule




### Structural
example : 
module top();
nand_1(x1,x2,y1);
nand_2(y1,x3,y2);

Full adder using 2 HA

module f_add(a,b,cin,sum,cout);
input a;
input b;
input cin;
output sum;
output cout;
wire i1,i2,i3;
h_add H1(a,b,i1,i2);
h_add H2(.a(i1),.b(cin),.c(i3),.s(sum));   // this can be a dirrent method to do the above, this is preferred
or o1(.a(i3),.b(i2),.y(cout));



## Generate
	Basically  a for loop.
	it is not a sequential for loop, so this also works in a descriptive manner.


## Behavioural Programming/modelling
	This is sequential type of Programming. so we can use for loop, if else, which do not have hardware meaning but still we can use it.
	Two types of programming : 1. initial  2. Always.

for example:
assign sum=a + b;
wehere a and b are 8 bits and sum is 9 bits.

correct : assign sum = {1'b0,a} + {1'b0,b}

code :

module sum(a,b,sum);
input a;
input b;
output sum;
assign sum = {1'b0,a} + {1'b0,b}


## combinational

code:
always(*)begin


end

> alternative to begin-end is fork-join
> in always block, the LHS is always a reg.
> here we going ot use real logical operators like && -and, || -or etc.

4x1 mux using : 1. nested if else, 2. only one if-else

module swap();
assign [11:0]a;
assign [11:0]b;
assign b[3:0] = a[11:8];
assign b[7:4] = a[7:4];
assign b[11:8] = a[3:0];



### Case
• A case statement performs a comparison to an expression to evaluate one of several parallel branches.

° The case statement evaluates the branches in the order they are written.

° The first branch that evaluates to true is executed.

° If none of the branches matches, the default branch is executed.

• Do not use unsized integers in case statements. Always size integers to a specific number of bits. Otherwise, results can be unpredictable.

• casez treats all z values in any bit position of the branch alternative as a don't care.

• casex treats all x and z values in any bit position of the branch alternative as a don't care.

• The question mark (?) can be used as a don't care in either the casez or casex case statements.



> in total there are five datatypes in verilog : wire, reg-, integer-32bit, real-floating,time
> floating point is not efficient in hardware.



### for statement
sysntax :
always@(*) begin
for(i=0;i<8;i=i+1) begin
$display("%b",a[i]);
$monitor("%b",a[i])
end 

> difference betweeen monitor is that whenever the variable given changes, it will print it, unlike using display to print only one.


Example : 
module forLoopexp(q,b,flag,y);

always@(*) begin
for(i=0;i<8;i=i+1) begin
		if(flag[i]==0) begin
			y[i]=a[i]|b[i];
		else
			y[i]=a[i]&b[i];
		end
		$monitor("%b",a[i]);
end
endmodule



### D flip flop
sysntax : 
module diff(clk,d,q);
input clk;
input d;
output reg q;
always@(posedge clk)
q<=d;

> posedge is positive edge.
> here q<=q; is possible, since this is sequential, so it wont go in the infinite loop.



### blocking and non blocking
a<=b;
c<=a;
> Now if a=0, b=1, c=1, now a is not assingned yet of b. so c wiil not have value 1 but it will have value zero, the previous value, only agter the block is executed.
> the above the Blocking example.

IN the Non blocking the syntax is using only =
> again the whole assignment of final values happens only after all the statements are executed.


in seq always use blocking
in combinational always use non blocking


## Test Bench
Basically there will be initially logic block which will Generate inputs and after your main module there will be comparison block which will compare and tell passed or failed.

code : 
```
module HA_tb;
reg t_a;
reg t_b;
wire t_sum;
wire t_c;
HalfAdder H1(.a(t_a),.b(t_b),.s(t_sum),.c(t_c));
initial begin
t_a=0;t_b=0;
#10 t_a=1;t_b=0;
#10 t_a=0;t_b=1;
#10 t_a=1;t_b=1;
#10;
end
endmodule
'``
for full adder : 
``
module FA_tb;
reg t_a;
reg t_b;
reg t_cin;
wire t_sum;
wire t_cout;
FullAdder FA1(.a(t_a),.b(t_b),.cin(t_cin),.s(t_sum),.cout(t_cout));
initial begin
t_a=0;t_b=0;t_cin=0;
#10 t_a=1;t_b=0;t_cin=0;
#10 t_a=0;t_b=1;t_cin=0;
#10 t_a=1;t_b=1;t_cin=0;
#10 t_a=0;t_b=0;t_cin=1;
#10 t_a=1;t_b=0;t_cin=1;
#10 t_a=0;t_b=1;t_cin=1;
#10 t_a=1;t_b=1;t_cin=1;
#10
end
endmodule
```

we can use expected sum also : 
``
always@(*) begin
if(e=={t_c,t_sum})
	$display("pass");
else
	$display("failed");
``


## Counter
8 bit up counter

module up_down_counter (out,up_down,clk,data,reset);
output [7:0] out;
input [7:0] data;
input up_down, clk, reset;
reg [7:0] out;
always @(posedge clk)
	if (reset) begin
		out <= 8'b0;
	end 
	else if(up_down) begin
		out <= out + 1;
	end 
	else begin
		out <= out - 1;
	end
endmodule


HW : 1. updown counter, 2. 2MH to 1MH , 3. divide by 8, up or down counter (option) using Parameters



## Parameters

sysntax :
module counter();
Parameter SIZE = 8;
input clk;
output reg [SIZE -1 : 0] count;

'timescale (ns/ps)




##### counter pattern code : 0 1 2 3 2 1 0 1 2 . . . 
module counterPattern();



if(~rst_n)
	count<=0;
else 
	if(flag == 1'b0)
		count<=count+1;
		if(count ==2'b11)
			flag = 1;
		else
			flag = 




> Divide by 8 counter, to display clock
```
module up_down_counter(out,clk,rst,clk_out);
output reg [2:0]out;
input clk;
input rst;
output clk_out

always @(posedge clk or negedge rst) begin
	if (rst)
		out <= 8'b000;
	else
		out <= out + 8'b001;
	assign clk_out = out[2]
end
endmodule









input clk, rst_n;
output clk_out;
reg [0:2]count;
assign clk_out = count[2];
always@(posedge clk or negedge rst_n)
	if(~rst_n)
		count<=o;
	else 
		count<=count+1;
endmodule
````




## Finite State Machines - FSM
Tow types of machines : 
1. Moore
- based on the value of x it will change the state to which it is heading and otput will be what in that state.

2. Meelay
- Based on the value of x, it will change to the state, but the ouptut is already specified, it is not in the state to which it is heading.


Tow parts of FSM : 
1. Control Flow
2. Data flow

It important to keep the track of the state, using the varialble currstate.

inputs : clk, rst_n, x
output : y

code :
```
module FSM_1(clk, rst_n, x, y)
input clk,rst_n,x;
ouptut y;
reg curr_state;
parameter A=1'b0;
parameter B= 1'b1;

//control
always@(posedge clk or negedge rst_n) begin
	if(~rst_n)
		curr_state=0;
	else begin
		case(curr_state)
			A: 
				if(x==1'b1)
					curr_state <=A;
				else
					curr_state <= B;
			B:
				if(x==1'b1)
					curr_state <=A;
				else
					curr_state <= B;
			default :
				curr_state <= A;
		endcase
	end
end

always@(posedge clk) begin
	case(curr_state)
		A: y<=1;
		B: y<=0;
		default : y<=1;
	endcase
end

````

Code to detect the sequence 011 : 
```

module FSM_2(clk, rst_n, x, y);
input clk,rst_n,x;
ouptut y;
reg curr_state;
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




module FSM_2_tb;
reg clk,rst_n,x;                //correct this
wire y;
reg curr_state;

FSM_2 FS(.clk(t_clk),.rst_n(t_rst_n),.x(t_x),.y(t_y));
initial begin
#0 t_rst_n=1;
#10 t_rst_n=0;
#5 t_rst_n=1;
end

always begin
#0 t_x=1'b0;
#10 t_x=1'b1;
#20 t_x=1'b0;
#30 t_x=1'b0;
#40 t_x=1'b1;
#50 t_x=1'b1;
#60 t_x=1'b1;
#70 t_x=1'b0;
#70;
end
endmodule


````





## Arrays

sysntax : 
reg [7:0] mem[3:0]
Here the first 8 are the len of the array and the 4 are the storage elements or characters.
To address or use : 
mem[0]
to access a specific bit form that location ; 
mem[0][2]


exmp: reg [3:0]a : array of depth 4 and lenght 1.






Example ; 
in ; addr, data, en, WE, rst_n, clk
out ; o_data, valid


code: 
```
module singlePortMem();
input [4:0]addr;
input en,we,rst_n, clk;
input [7:0]data;
output reg [7:0]o_data;
output reg valid;
reg [7:0]mem[31:0]

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

//writing
always@(posedge clk or negedge rst_n)
	if(en && WE)
		mem[addr]<=i_data;
	else
		mem[addr] <= mem[addr];
end
endmodule


````

code : for dual port asyn R/W memory
ip : rclk, r_addr, re, wclk, w_data, w_addr,we,rst_n, en
out : o_data, valid.
```

module dualPortMem();
input [4:0]r_addr;
input [4:0]w_addr;
input en,we,rst_n, rclk,wclk,re,we;
input [7:0]w_data;
output reg [7:0]0_data;
output reg valid;
reg [7:0]mem[31:0]

//reading
always@(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
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

//writing
always@(posedge wclk or negedge rst_n)
	if(en && we s)
		mem[w_addr]<=w_data;
	else
		mem[w_addr] <= mem[w_addr];
end
endmodule



````



## Memory

### FIFO
It is the type of mem with special behavior, 

code : 
in : clk, rst_n, i_data, en, we, 
out : o_data, valid, full, empty

```


module dualPortMem();
input [4:0]r_addr;
input [4:0]w_addr;
input en,we,rst_n, rclk,wclk,re,we;
input [7:0]w_data;
output reg [7:0]0_data;
output reg valid;
reg [7:0]mem[31:0]

//reading
always@(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
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

//writing
always@(posedge wclk or negedge rst_n)
	if(en && we s)
		mem[w_addr]<=w_data;
	else
		mem[w_addr] <= mem[w_addr];
end
endmodule






````


HW : Pattern, FIFO, wallace tree Multiplier(can be done with Pipeline)

Pattern with FSM : 


H. W : FSM which is generates : 
clk		3	2	1	5	
output	1	5	8	11
after reset it should go to initial.

```


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
end

always@(posedge clk)
	case(curr_state)
		A: y<=4'd1;
		B: y<=4'd5;
		C: y<=4'd8;
		D: y<=4'd11
	endcase
end


````




wallace Tree Multiplier code : 
```
module wallace (prod,a,b);
input [3:0] a,b;
output [7:0] prod;
wire s0 s1 s2,s3,S4,S5,S6,s7 s8,s9,s10,s11,c0,c1, c2,c3,c4,c5,c6,c7, c8,c9,c10,c11;
reg p [3:21[3:0];
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
fa f6(s6 c6,s3,c2, p[3][1]):
fa f7(s7.c7.p[2][3],c3, p[3][2]);

fa f8(s8.c8,s5,c4,1'b0);
fa f9($9.c9,s6,c8,c5);
fa f10(s10 c10,s7,c6,c9);
fa f11(s11 c11,p[3][3],c7,c10):

assign prod[0] p[0][0];
assign prod[1] = s0;
assign prod[2] = $4;
assign prod[3] = s8;
assign prod[4] = s9;
assign prod[5] = $10;
assign prod[6] = s11;
assign prod[7] = c11;

endmodule

````



## Pipeline












#### Traffic light Project

	R	Y	G	R	Y	G	delays
A	1	0	0	1	0	0	5
B	0	0	1	1	0	0	120
C	0	1	0	1	0	0	5
D	1	0	0	0	1	0	2
E	1	0	0	0	0	1	30
F	1	0	0	0	1	0	5


code : 
```

module TrafficLights();

input clk,rst_n;
output reg clk_out;
output reg [24:0]count;
output reg [5:0]y;
reg [7:0]cnt;
reg [2:0]curr_state;
output [24:0]data;


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
	else
		case(curr_state)
			A: 
				if(cnt<5)
					curr_state<=A;
			B:
				if(cnt<=125)
					curr_state<=B;
			C:
				if(cnt<=130)
					curr_state<=C;
			D:
				if(cnt<=132)
					curr_state<=D;
			E:
				if(cnt<=162)
					curr_state<=E;
			F:
				if(cont<=167)
					curr_state<=F;
end

always@(posedge clk_out)
	case(curr_state)
		A: y<=6'd36;
		B: y<=6'd12;
		C: y<=6'd20;
		D: y<=6'd34;
		E: y<=6'd33;
		F: y<=6'd34;
	endcase
end

endmodule



`timescale 1ns/1ps
module TrafficLights_tb;
reg t_clk,t_rst_n;

TrafficLights U1(.data(t_data),.count(t_count),.clk(t_clk),.rst_n(t_rst_n),.clk_out(t_clk_out));
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


````




# FPGA Design FLow

## 

In ModelSim
	-> Spec
	-> arch
	-> RTL
In Quartus
	-> Synt
	-> Map & translate
		-> CLB
	-> Placing and Routing
	-> Bit file written on the FPGA throug JTAG



FPGA Developement board is to learn and proctice. The actual FPGA chip is very small and we will have to develope our special board to attach that chip for our specific application.
Cyclone 4 is the chip used





### Skills needed in Digital domain

General like what you learned in DSD and EDC, linux, python/c, verilog/VHDL
Hands on project on FPGA
Basic CMOS circuty theory
static timming analysis
	- tickle and other language
clock domain crossing
writing FSM in  verilog

>last three are interviewers favourite


### Skills needed in Analog domain
Basic network theory
passion for 
opAmp application
CMOS OpaAmp Design
intutive and logic circuit analysis


### Softwares

#### For FPGA prototyping
Xilinx ISE
Vivodo
Quartus
EDA online


Analog
	Matlab
	simulink



#### For ASIC Desing

synopsis
	Disgn compiler
	primetine
	icc
	fusion compiler


Analog
	Cadensce tool suit
	encounter
	virtuoso
	tempus
	simvision


### How to get into VLSI
Mtech/ms/phd
Internship and convert to PPO
Do VLSI courses in private insti
Join as JRF in research IITs
	See on linkedin opening and apply to IITs with stipened for a year sometimes..




### Job list
#### Digital

RTL design
verification
physical verification
testin
layout
cad


#### Analog
Analog design
verification
layout
cad
testin




Coursera FPGA capstone



Referal portal on linkedin




## Softwares for Physical Desing after what you have learned
solvenet
viosis 
opentimer



Three giants predominate eda tools. Cadence, synopsis, mentor. As a mixed-signal/analog designer, I'm using and have used lots of tools like hspice/spectre/eldo/ams/adms/virtuoso/laker.

But if we're talking about digital, I need to mention primetime, encounter,verdi,dc,etc. But still they belong to three giant company above.

Since My current work has strong relation with mems, our MEMS designers tend to use coventor, L-EDIT and ANSYS. Maybe these softwares cannot be classified as EDA tools but as MDA tools, :)


#### Books
graph partioting springer
nanometer design






## Questions : 
1. What to do after RTL program is ready, obviously i am not going to use the board as it is. Now if i want to use FPGA for a specific task, should i build the IC myself or should i use prebuilt one.
https://www.nutsvolts.com/magazine/article/designing-your-own-digital-ics-fpgas-part-2
For FPGA use prebuilt one and for ASIC design it.

2. If i dont have a hardware, than is the Quartus Software useless.
yes it is useless. You can see the analysis but not the circuit.

3. After writting the RTL code, can i generate a schematic from it. Or can i generate Netlist which i can import in an PCB designing software.

4. Now i built the whole code for a complex application, now forget PCB, thats may be easy the actual implementation of your logic will be in that black chip, (i am talking about ASIC Because FPGA is fixed IC.) which software do you use to design that square chip.

5. One thing to make clear we can direct do digital gates PCB in kikad like software, but when the logic becomes too big we have to use RTL.

6. Another thing to make clear, if we use prebuilt chip it is called FPGA and if we built the chip from scratch with not functionality it is called ASIC.