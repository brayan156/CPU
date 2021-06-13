module Decoder(input logic [1:0] Op,
					input logic [5:0] Funct,
					input logic [3:0] Rd,
					output logic [1:0] FlagW,
					output logic PCS, RegW, MemW,
					output logic MemtoReg, ALUSrc,
					output logic [1:0] ImmSrc, RegSrc,
					output logic [3:0] ALUControl,
					output logic mov_selec);
					
					
	logic [9:0] controls;
	logic Branch, ALUOp;
	// Main Decoder
	always_comb
	casex(Op)
	// Data-processing immediate
	2'b00: if (Funct[5]) controls = 10'b0000101001;
	// Data-processing register
	else controls = 10'b0000001001;
	// LDR
	2'b01: if (Funct[0]) controls = 10'b0001111000;
	// STR
	else controls = 10'b1001110100;
	// B
	2'b10: controls = 10'b0110100010;
	// Unimplemented
	default: controls = 10'bx;
	endcase

	// ALU Decoder
	always_comb begin 
		{RegSrc, ImmSrc, ALUSrc, MemtoReg,
		RegW, MemW, Branch, ALUOp} = controls;
		mov_selec=0;
		if (ALUOp) begin // which non-operation Instr?
			case(Funct[4:1])
				4'b0100: ALUControl = 4'b0000; // ADD
				4'b0010: ALUControl = 4'b0001; // SUB
				4'b0000: ALUControl = 4'b0101; // AND
				4'b1100: ALUControl = 4'b0110; // ORR
				4'b0001: ALUControl = 4'b0111; // XOR
				4'b1010:begin ALUControl = 4'b0001; RegW=0; end //CMP
				4'b1101:begin mov_selec=1;	ALUControl = (Funct[5]) ? 4'b0000: 4'b1000; end // MOV/shift
				default: ALUControl = 4'bx; // unimplemented
			endcase
		// update flags if S bit is set (C & V only for arith)
			FlagW[1] = Funct[0];
			FlagW[0] = Funct[0] &
			(ALUControl == 4'b0000 | ALUControl == 4'b0001);
		end
		else begin
			ALUControl = 4'b0000; // add for non-operation instructions
			FlagW = 2'b00; // don't update Flags
		end
	end
	// PC Logic
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule 