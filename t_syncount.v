`include "syncounter.v"

module tb_syncounter ;
	
	reg clk ;
	reg in = 1 ;
	reg clearb ;
	wire [0:3]q;

	scounter ob1 (clk,in,clearb, q);

	initial 
		clk =0 ;
	always 
		#2 clk= ~clk;

	initial
		$monitor($time, " clk= %b, clearb= %b , q= %b", clk, clearb, q); 

	initial begin
		clearb = 0;
		#2 in = 1;
		#2 clearb = 1;
		#60 $finish ;
	end 

endmodule							
