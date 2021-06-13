 module MuxMOV #(parameter N = 32)	(input logic[N-1:0] Avalue,zerovalue,shiftvalue,
											input logic[1:0] selector,
											output logic[N-1:0] result);
	
	always_comb
		case(selector)
			2'b00 : result = Avalue; 		//movselec=0,immboolean=0
			2'b01 : result = Avalue; 		//movselec=0,immboolean=1
			2'b10 : result = shiftvalue;	//movselec=1,immboolean=0
			2'b11 : result = zerovalue;	//movselec=1,immboolean=1 
			default : result = 'z;
		endcase
		
endmodule 