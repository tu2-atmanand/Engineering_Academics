module mux_4to1_assign (a,b,c,d,sel,out);
input [3:0]a;    
input [3:0]b;   
input [3:0]c;  
input [3:0]d;          
input [1:0]sel;        
output [3:0]out; 
// When sel[1] is 0, (sel[0]? b:a) is selected and sel[1] is 1, (sel[0] ? d:c) is taken  
// If sel[0] is 0, a is sent to output, else b and if sel[0] is 0, c is sent to output, else d  
assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);  
endmodule


module mux_4to1_UsingIf(aa,su,y);
input [3:0]aa;
input [1:0]su;
output reg y;
always @(*)begin
	if(su[1]==0'b1)
		if(su[0]==1'b0)
			y=aa[0];
		else
			y=aa[1];
	else
		if(su[0]==1'b0)
			y=aa[2];
		else
			y=aa[3];
	end
endmodule 


module mux_4to1_UsingCase(aaa,bbb,ccc,ddd,sss,out_2);
  input [3:0] aaa;    // 4-bit input called a
  input [3:0] bbb;    // 4-bit input called b
  input [3:0] ccc;    // 4-bit input called c
  input [3:0] ddd;    // 4-bit input called d
  input [1:0] sss;    // input sel used to select between a,b,c,d
  output reg [3:0] out_2;

  reg [3:0] selected_input;   // register to store the selected input

  // Select the input based on the value of sss using a case statement
  always @(*) begin
    case (sss)
      2'b00: selected_input = aaa;
      2'b01: selected_input = bbb;
      2'b10: selected_input = ccc;
      2'b11: selected_input = ddd;
      default: selected_input = 4'bxxxx; // default case (if sss is not 2 bits)
    endcase

    // Assign the selected input to the output
    out_2 = selected_input;
  end
endmodule
