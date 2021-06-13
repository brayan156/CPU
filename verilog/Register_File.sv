module Register_File(input logic clk, rwboolean,
							input logic [3:0] regirselector1, regirselector2, rwselector,
							input logic [31:0] rwdata, r15,
							output logic [31:0] rdata1, rdata2);


	logic [31:0] register[14:0];

	always_ff @(posedge clk)
		if (rwboolean) register[rwselector] <= rwdata;
		assign rdata1 = (regirselector1 == 4'b1111) ? r15 : register[regirselector1];
		assign rdata2 = (regirselector2 == 4'b1111) ? r15 : register[regirselector2];
		
		
endmodule 