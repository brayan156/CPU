module Decoder(input logic [1:0] Intr_Mode,
					input logic [5:0] I_Function_S,
					input logic [3:0] Rdestiny,
					output logic [1:0] wFlag_bools,
					output logic PCS, wregister_boolean, wmemory_boolean,
					output logic MemtoReg, B_ALU_selec,
					output logic [1:0] Imm_selec, registers_selec_mux,
					output logic [3:0] ALU_selec,
					output logic mov_selec);
					
					
	logic [9:0] controls;
	logic Branch, ALUOp;
	always_comb
	casex(Intr_Mode)
	// operation immediate
	2'b00: if (I_Function_S[5]) controls = 10'b0000101001;
	// opertation register
	else controls = 10'b0000001001;
	// LDR
	2'b01: if (I_Function_S[0]) controls = 10'b0001111000;
	// STR
	else controls = 10'b1001110100;
	// B
	2'b10: controls = 10'b0110100010;
	// Unimplemented
	default: controls = 10'bx;
	endcase

	// ALU Decoder
	always_comb begin 
		{registers_selec_mux, Imm_selec, B_ALU_selec, MemtoReg,
		wregister_boolean, wmemory_boolean, Branch, ALUOp} = controls;
		mov_selec=0;
		if (ALUOp) begin // which non-operation Instr?
			case(I_Function_S[4:1])
				4'b0100: ALU_selec = 4'b0000; // ADD
				4'b0010: ALU_selec = 4'b0001; // SUB
				4'b0000: ALU_selec = 4'b0101; // AND
				4'b1100: ALU_selec = 4'b0110; // ORR
				4'b0001: ALU_selec = 4'b0111; // XOR
				4'b1010:begin ALU_selec = 4'b0001; wregister_boolean=0; end //CMP
				4'b1101:begin mov_selec=1;	ALU_selec = (I_Function_S[5]) ? 4'b0000: 4'b1000; end // MOV/Lshift
				default: ALU_selec = 4'bx; // unimplemented
			endcase
		// update flags if S bit is set (C & V only for arith)
			wFlag_bools[1] = I_Function_S[0];
			wFlag_bools[0] = I_Function_S[0] &
			(ALU_selec == 4'b0000 | ALU_selec == 4'b0001);
		end
		else begin
			ALU_selec = 4'b0000; // add for non-operation instructions
			wFlag_bools = 2'b00; // don't update Flags
		end
	end
	// PC Logic
	assign PCS = ((Rdestiny == 4'b1111) & wregister_boolean) | Branch;
endmodule 