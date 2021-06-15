module CPU_VGA(input logic clk, reset, swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit,
					output logic [7:0] R, G, B,
					output logic hsync, vsync, clk3, blank, sync);
					
	logic [31:0] wdata, address;
	logic wboolean;
	logic [7:0] char_data[255:0];


	logic [31:0] PC, Instr, rdata;
	
	clk_mitad_MHz cmh(clk, clk3);
	
	// Instantiate processor and memories
	CPU arm(clk3, reset, Instr,rdata, wboolean, address, wdata, PC);
	Instruction_Memory im(PC, Instr);
	
	Memory_Management mm(clk3, swxor2, swxor1, swxor0, swxor, swnot, swadd, swinit, wboolean, address, wdata, rdata, char_data);
		
	VGA vga(clk3, reset, char_data, R, G, B, hsync, vsync, blank, sync);
	
	
endmodule 