module jkff(input clk, input j, input k, input clearb, output q);
	
	reg q; 

	always @(posedge clk) begin

	if(!clearb)
		q<= 1'b0 ;

	else begin
		case( {j, k})					// notice the concatenation ka use
			2'b0_0 : q <= q;   // "_" increases the readability
//!!!!         					j = 1'b1, k=1'b0 : q <= q; // this means if j==0 or k=0 case
			2'b0_1 : q <= 0;
			2'b10 : q <= 1;
			2'b11 : q <= ~q;
		endcase
	end

	end
endmodule