module VGA_ROM_Test();

	logic clk, reset;
	logic [7:0] R, G, B;
	logic hsync, vsync, clk2, blank, sync;
	
	VGA uut(clk, reset, R, G, B, hsync, vsync, clk2, blank, sync);
	
	initial begin
		clk=0; reset=0; #3;
		reset=1; #3;
		reset=0; #3;
	end
	
	always begin
		clk=!clk; #10;
	end

endmodule