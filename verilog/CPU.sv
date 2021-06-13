module CPU(input logic clk, reset,
				input logic [31:0] Instr,memRdata,
				output logic memWboolean,
				output logic [31:0] ALUResult, Rr2_or_W_data,PC
 );
				
	
	
	logic flagN,flagZ,flagC,flagV;
	logic rwboolean,B_selec_ALU, FinalResult_selec, PC_selec,Mov_selec;
	logic [1:0] registers_selec_mux, immediatetype;
	logic [31:0] PCNext, PCPlus4, PCPlus8;
	logic [31:0] A, B,Rr1data,extendedresult, FinalResult,rotate_result;
	logic [3:0] rselector1, rselector2,selec_alu;
	

	Control_Unit c(clk, reset, Instr[31:12], {flagN,flagZ,flagC,flagV},registers_selec_mux, rwboolean, immediatetype,B_selec_ALU, selec_alu,memWboolean, FinalResult_selec, PC_selec,Mov_selec);


	// next PC logic
	
	Mux2_1 #(32) pcmux(PCPlus4, FinalResult, PC_selec, PCNext);
	PC #(32) pc(clk, reset, PCNext, PC);

	logic coadd1,coadd2;
	sumador_nb #(32) sump4(PC, 32'b100, 1'b0, PCPlus4, coadd1);
	sumador_nb #(32) sump8(PCPlus4, 32'b100, 1'b0, PCPlus8, coadd2);
	
	
	// register file logic
	Mux2_1 #(4) rselector1mux(Instr[19:16], 4'b1111, registers_selec_mux[0], rselector1);
	Mux2_1 #(4) rselector2mux(Instr[3:0], Instr[15:12], registers_selec_mux[1], rselector2);
	Register_File rf(clk, rwboolean, rselector1, rselector2,Instr[15:12], FinalResult, PCPlus8, Rr1data,  Rr2_or_W_data);
	MuxMOV movmox ( Rr1data,'b0,{27'b0,Instr[11:7]},{Mov_selec,Instr[25]},A);
	
	Extender ext(Instr[23:0], immediatetype, extendedresult);
	Imm_Rotation ir (extendedresult,{28'b0,Instr[11:8]},immediatetype,rotate_result);
	// ALU logic

	Mux2_1 #(32) Bmux(Rr2_or_W_data, rotate_result, B_selec_ALU, B);
	ALU #(32) uut (A, B, 1'b0,selec_alu, ALUResult,flagN,flagZ,flagC,flagV);
	
	
	Mux2_1 #(32) resmux(ALUResult, memRdata, FinalResult_selec, FinalResult);


endmodule





