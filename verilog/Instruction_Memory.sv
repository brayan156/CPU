module Instruction_Memory(input logic [31:0] pc,
								  output logic [31:0] rdata);
	logic [31:0] Instructiondata[63:0];
	
	
	initial begin
	$readmemh("binfile.txt",Instructiondata);
	end
	
	
	assign rdata = Instructiondata[pc[31:2]];
	
	
	
endmodule 