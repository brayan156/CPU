module Memory_Management(input logic clk, swxor2, swxor1, swxor0, swxor, swnot, swadd, swinit, wboolean,
								 input logic [31:0] address, wdata,
								 output logic [31:0] rdata,
								 output logic [7:0] char_data[255:0]);
						 
	logic [31:0] mapadress;
	logic [7:0] ROMdata, RAMdata;
						 
	RAM ram(clk, wboolean, mapadress, wdata[7:0], RAMdata, char_data);
	ROM rom(mapadress, ROMdata);
	
	always_comb
		begin
			if (address >= 'h000 && address < 'h100)
				begin
					mapadress = address;
					rdata = { 24'b0,ROMdata};
				end
			else if (address >= 'h100 && address < 'h200)
				begin
					mapadress = address - 'h100;
					rdata = { 24'b0,RAMdata};
				end
			else if (address == 'h204)
				begin
					mapadress = 32'b0;
					rdata = {31'b0, swxor2};
				end
			else if (address == 'h208)
				begin
					mapadress = 32'b0;
					rdata = {31'b0, swxor1};
				end
			else if (address == 'h20C)
				begin
					mapadress = 32'b0;
					rdata = {31'b0, swxor0};
				end
			else if (address == 'h210)
				begin
					mapadress = 32'b0;
					rdata = {31'b0, swxor};
				end
			else if (address == 'h214)
				begin
					mapadress = 32'b0;
					rdata = {31'b0, swnot};
				end
			else if (address == 'h218)
				begin
					mapadress = 32'b0;
					rdata = {31'b0, swadd};
				end
			else if (address == 'h21C)
				begin
					mapadress = 32'b0;
					rdata = {31'b0, swinit};
				end
			else
				begin
					mapadress = 32'b0;
					rdata = 32'b0;
				end
		end
						 
endmodule 