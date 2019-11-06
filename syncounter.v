/* 
module jkff(input clk, input j, input k, input clearb, output q);
	
	reg q; 

	always @(posedge clk) begin

	if(!clearb)
		q<= 1'b0 ;

	else begin
		case( {j, k})
			2'b0_0 : q <= q;   // "_" increases the readability
			2'b0_1 : q <= 0;
			2'b10 : q <= 1;
			2'b11 : q <= ~q;
		endcase
	end
	end
endmodule

*/

`include "jkff.v" 
module scounter(clk,in,clearb, q);
	
	input clk,in, clearb;
	output [0:3]q ;
	//reg [0:3]q ; sub-module ke output ko wire rakh 
	
	// in = 1'b1;   assign is used for wire 
	// reg b= 1'b1;  reg ke kiye assign nahi 
	// wire ko directly in = 1'b1 nahi likhna!  !! ! !!
	
	assign in = 1'b1;

	jkff obj1 (clk, in,in, clearb, q[3]);
  jkff obj2 (clk, q[3] ,q[3] , clearb, q[2]);
	jkff obj3 (clk, q[3]&q[2] ,q[3]&q[2] , clearb, q[1]);
	jkff obj4 (clk, q[3]&q[2]&q[1], q[3]&q[2]&q[1] ,clearb , q[0]);

endmodule



