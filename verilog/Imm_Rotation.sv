module Imm_Rotation(input logic [31:0] imm_extended,rotation_value,
							input logic [1:0] immediatetype,
							output logic [31:0] result);
	
	logic [31:0] r_twice;


	
	always_comb begin
		r_twice=rotation_value*2;
		if(immediatetype!==2'b00 || rotation_value==0) result=imm_extended;
		else if (immediatetype==2'b00) result=(imm_extended<<32-r_twice)^(imm_extended>>r_twice);
		else result=imm_extended;
	end
endmodule 