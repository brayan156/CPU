module CPU_VGA_test();

	logic clk, reset, swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit;
	logic [7:0] R, G, B;
	logic hsync, vsync, clk2, blank, sync;
	
	CPU_VGA uut(clk, reset, swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit,R,G,B,hsync, vsync, clk2, blank, sync);

	
	initial begin
		clk=0; reset=0; swxor2=0;swxor1=0;swxor0=0;swxor=0;swnot=0;swadd=0;swinit=0; #3;
		reset=1; #3;
		reset=0; swinit=1;swxor1=1;swxor0=1; swxor=1; #3;
		
		
	end
	
	
	always begin
		clk=!clk; #10;
	end
	
endmodule 