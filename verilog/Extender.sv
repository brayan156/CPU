module Extender(input logic [23:0] intstruction,
					input logic [1:0] immediatetype,
					output logic [31:0] extendeddata);
	always_comb
	case(immediatetype)
	// 8-bit
	2'b00: extendeddata = {24'b0, intstruction[7:0]};
	// 12-bit
	2'b01: extendeddata = {20'b0, intstruction[11:0]};
	// 24-bit two's complement shifted branch
	2'b10: extendeddata = {{6{intstruction[23]}}, intstruction[23:0], 2'b00};
	default: extendeddata = 32'bx; // undefined
	endcase
endmodule 