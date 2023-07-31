
module fifo_mem(data_out,fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow,clk, rst_n, wr, rd, data_in);
  input wr, rd, clk, rst_n;
  input[7:0] data_in;
  output[7:0] data_out;
  output fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;
  wire[4:0] wptr,rptr;
  wire fifo_we,fifo_rd;
  write_pointer top1(wptr,fifo_we,wr,fifo_full,clk,rst_n);
  read_pointer top2(rptr,fifo_rd,rd,fifo_empty,clk,rst_n);
  memory_array top3(data_out, data_in, clk,fifo_we, wptr,rptr);
  status_signal top4(fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow, wr, rd, fifo_we, fifo_rd, wptr,rptr,clk,rst_n);
endmodule

module memory_array(data_out, data_in, clk,fifo_we, wptr,rptr);
  input[7:0] data_in;
  input clk,fifo_we;
  input[4:0] wptr,rptr;
  output[7:0] data_out;
  reg[7:0] data_out2[15:0];
  wire[7:0] data_out;
  always @(posedge clk) begin
   if(fifo_we)
      data_out2[wptr[3:0]] <=data_in ;
  end
  assign data_out = data_out2[rptr[3:0]];
endmodule

module read_pointer(rptr,fifo_rd,rd,fifo_empty,clk,rst_n);
  input rd,fifo_empty,clk,rst_n;
  output[4:0] rptr;
  output fifo_rd;
  reg[4:0] rptr;
  assign fifo_rd = (~fifo_empty)& rd;
  always @(posedge clk or negedge rst_n) begin
   if(~rst_n) rptr <= 5'b000000;
   else if(fifo_rd)
    rptr <= rptr + 5'b000001;
   else
    rptr <= rptr;
  end
endmodule

 module status_signal(fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow, wr, rd, fifo_we, fifo_rd, wptr,rptr,clk,rst_n);
  input wr, rd, fifo_we, fifo_rd,clk,rst_n;
  input[4:0] wptr, rptr;
  output fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;
  wire fbit_comp, overflow_set, underflow_set;
  wire pointer_equal;
  wire[4:0] pointer_result;
  reg fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;
  assign fbit_comp = wptr[4] ^ rptr[4];
  assign pointer_equal = (wptr[3:0] - rptr[3:0]) ? 0:1;
  assign pointer_result = wptr[4:0] - rptr[4:0];
  assign overflow_set = fifo_full & wr;
  assign underflow_set = fifo_empty&rd;
  always @(*)
  begin
   fifo_full =fbit_comp & pointer_equal;
   fifo_empty = (~fbit_comp) & pointer_equal;
   fifo_threshold = (pointer_result[4]||pointer_result[3]) ? 1:0;
  end
  always @(posedge clk or negedge rst_n)
  begin
  if(~rst_n) fifo_overflow <=0;
  else if((overflow_set==1)&&(fifo_rd==0))
   fifo_overflow <=1;
   else if(fifo_rd)
    fifo_overflow <=0;
    else
     fifo_overflow <= fifo_overflow;
  end
  always @(posedge clk or negedge rst_n)
  begin
  if(~rst_n) fifo_underflow <=0;
  else if((underflow_set==1)&&(fifo_we==0))
   fifo_underflow <=1;
   else if(fifo_we)
    fifo_underflow <=0;
    else
     fifo_underflow <= fifo_underflow;
  end
 endmodule

 module write_pointer(wptr,fifo_we,wr,fifo_full,clk,rst_n);
  input wr,fifo_full,clk,rst_n;
  output[4:0] wptr;
  output fifo_we;
  reg[4:0] wptr;
  assign fifo_we = (~fifo_full)&wr;
  always @(posedge clk or negedge rst_n)
  begin
   if(~rst_n) wptr <= 5'b000000;
   else if(fifo_we)
    wptr <= wptr + 5'b000001;
   else
    wptr <= wptr;
  end
 endmodule





`timescale     10 ps/ 10 ps

`define          DELAY 10

module tb_fifo_32;

 parameter ENDTIME = 40000;

 reg     clk;
 reg     rst_n;
 reg     wr;
 reg     rd;
 reg     [7:0] data_in;

 wire     [7:0] data_out;
 wire     fifo_empty;
 wire     fifo_full;
 wire     fifo_threshold;
 wire     fifo_overflow;
 wire     fifo_underflow;
 integer i;

 fifo_mem tb(data_out, fifo_full, fifo_empty, fifo_threshold, fifo_overflow,fifo_underflow, clk, rst_n, wr, rd, data_in);

 initial
      begin
           clk     = 1'b0;
           rst_n     = 1'b0;
           wr     = 1'b0;
           rd     = 1'b0;
           data_in     = 8'd0;
      end

 initial
      begin
           main;
      end
 task main;
      fork
           clock_generator;
           reset_generator;
           operation_process;
           debug_fifo;
           endsimulation;
      join
 endtask
 task clock_generator;
      begin
           forever #`DELAY clk = !clk;
      end
 endtask
 task reset_generator;
      begin
           #(`DELAY*2)
           rst_n = 1'b1;
           # 7.9
           rst_n = 1'b0;
           # 7.09
           rst_n = 1'b1;
      end
 endtask
 task operation_process;
      begin
           for (i = 0; i < 17; i = i + 1) begin: WRE
                #(`DELAY*5)
                wr = 1'b1;
                data_in = data_in + 8'd1;
                #(`DELAY*2)
                wr = 1'b0;
           end
           #(`DELAY)
           for (i = 0; i < 17; i = i + 1) begin: RDE
                #(`DELAY*2)
                rd = 1'b1;
                #(`DELAY*2)
                rd = 1'b0;
           end
      end
 endtask
 // 10. Debug fifo
 task debug_fifo;
      begin
           $display("----------------------------------------------");
           $display("------------------   -----------------------");
           $display("----------- SIMULATION RESULT ----------------");
           $display("--------------       -------------------");
           $display("----------------     ---------------------");
           $display("----------------------------------------------");
           $monitor("TIME = %d, wr = %b, rd = %b, data_in = %h",$time, wr, rd, data_in);
      end
 endtask
 // 11. Self-Checking
 reg [5:0] waddr, raddr;
 reg [7:0] mem[64:0];
 always @ (posedge clk) begin
      if (~rst_n) begin
           waddr     <= 6'd0;
      end
      else if (wr) begin
           mem[waddr] <= data_in;
           waddr <= waddr + 1;
      end
      $display("TIME = %d, data_out = %d, mem = %d",$time, data_out,mem[raddr]);
      if (~rst_n) raddr     <= 6'd0;
      else if (rd & (~fifo_empty)) raddr <= raddr + 1;
      if (rd & (~fifo_empty)) begin
           if (mem[raddr]
            == data_out) begin
                $display("=== PASS ===== PASS ==== PASS ==== PASS ===");
                if (raddr == 16) $finish;
           end
           else begin
                $display ("=== FAIL ==== FAIL ==== FAIL ==== FAIL ===");
                $display("-------------- THE SIMUALTION FINISHED ------------");
                $finish;
           end
      end
 end
 //12. Determines the simulation limit
 task endsimulation;
      begin
           #ENDTIME
           $display("-------------- THE SIMUALTION FINISHED ------------");
           $finish;
      end
 endtask
 endmodule

