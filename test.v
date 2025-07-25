module test;
reg [16:0]in;
reg [3:0]sel;
wire out;
mux16to1 tb(in,sel,out);
initial 
begin
$monitor($time,"in=h,sel=%h,out=%b",in,sel,out);
in=16'h3f0a;sel=4'h0;
#5 sel=4'h2;
#5 sel=4'h8;
#5 sel=4'hf;
#5 $finish;
end
endmodule 

second test bench

module test;
reg [3:0]in1,in0;
reg s;
wire [3:0]f;
mux21 dut(in1,in0,s,f);
initial
begin
$monitor($time,"s=%b,in1=%b,in0=%b,f=%b",s,in1,in0,f);
in1=4'b0101;in0=4'b1010;
s=0;
#5 s=1;
#5 $stop;
end
endmodule

blocking and non blocking

module mux8to1(in,sel,out);
input [7:0]in;
input [2:0]sel;
output reg out;
always @(*)
begin
case (sel)
3'b000 : out=in[0];
3'b001 : out=in[1];
3'b010 : out=in[2];
3'b011 : out=in[3];
3'b100 : out=in[4];
3'b101 : out=in[5];
3'b110 : out=in[6];
3'b111 : out=in[7];
default  : out=1'bx;
endcase
end
endmodule
