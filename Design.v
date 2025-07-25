behavioral modelling

module mux16to1(in,sel,out);
input [16:0]in;
input [3:0]sel;
output out;
assign out=in[sel];
endmodule

structural modelling

module mux4to1(in,sel,out);
input [3:0]in;
input [1:0]sel;
output out;
assign out=in[sel];
endmodule

module mux16to1(in,sel,out);
input [16:0]in;
input [3:0]sel;
output out;
wire [3:0]t;
mux4to1 mo(in[3:0],sel[1:0],t[0]);
mux4to1 m1(in[7:4],sel[1:0],t[1]);
mux4to1 m2(in[11:8],sel[1:0],t[2]);
mux4to1 m3(in[15:12],sel[1:0],t[3]);
mux4to1 m4(t,sel[3:2],out);
endmodule

Using if statement
module mux21(in1,in0,s,f);
input [3:0]in1,in0;
input s;
output reg [3:0]f;
always @(*)
if (s)
f=in1;
else
f=in0;
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
