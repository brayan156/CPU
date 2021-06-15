module ROM (input logic [31:0] address,
				output logic [7:0] rdata,
				output logic [7:0] ROM_data[255:0]);
				
	logic [7:0] ROM[255:0];
	
	initial begin
		$readmemh("ROM.txt",ROM);
	end
	
	assign rdata=ROM[address]; 
	assign ROM_data=ROM;
	
endmodule 