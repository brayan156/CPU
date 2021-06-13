module RAM (input logic	clk,wboolean,
				input logic [31:0] address,
				input logic [7:0] wdata,
				output logic [7:0]rdata,
				output logic [7:0] chardata [255:0]);
				
	logic [7:0] RAM[255:0];
		
	
	always_ff @(negedge clk) begin
		if (wboolean) RAM[address]=wdata;
		rdata=RAM[address];
		chardata=RAM;
	end 
	
endmodule 