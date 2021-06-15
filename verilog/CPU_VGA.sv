module CPU_VGA(input logic clk, reset, swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit,
					output logic [7:0] R, G, B,
					output logic hsync, vsync, clk3, blank, sync);
					
	logic [31:0] wdata, address;
	logic wboolean;
	logic [7:0] char_data[255:0];
	logic [7:0] char_data_coded[255:0];
	logic [7:0] text[703:0];
	logic [31:0] PC, Instr, rdata;
	
	clk_mitad_MHz cmh(clk, clk3);
	
	// Instantiate processor and memories
	CPU cpu(clk3, reset, Instr,rdata, wboolean, address, wdata, PC);
	Instruction_Memory im(PC, Instr);
	
	Memory_Management mm(clk3, swxor2, swxor1, swxor0, swxor, swnot, swadd, swinit, wboolean, address, wdata, rdata, char_data,char_data_coded);
	
	Character_manager cm(clk3,reset, swxor2, swxor1, swxor0, swxor, swnot, swadd, swinit,char_data,char_data_coded,text);
	VGA vga(clk3, reset, text , R, G, B, hsync, vsync, blank, sync);
	
endmodule 