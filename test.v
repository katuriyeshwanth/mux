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
