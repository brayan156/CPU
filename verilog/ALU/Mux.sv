 module Mux	#(parameter N = 4)	(input logic[N-1:0] r1, r2, r3, r4, r5, r6, r7, r8,r9,r10,
											input logic[3:0] selec_alu,
											output logic[N-1:0] result);
	
	always_comb
		case(selec_alu)
			4'b0000 : result = r1;
			4'b0001 : result = r2;
			4'b0010 : result = r3;
			4'b0011 : result = r4;
			4'b0100 : result = r5;
			4'b0101 : result = r6;
			4'b0110 : result = r7;
			4'b0111 : result = r8;
			4'b1000 : result = r9;
			4'b1001 : result = r10;
			default : result = 'z;
		endcase
		
endmodule 