module final_test();

	logic clk, reset, swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit;
	logic [7:0] R, G, B;
	logic hsync, vsync, clk2, blank, sync;
	
	CPU_VGA uut(clk, reset, swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit,R,G,B,hsync, vsync, clk2, blank, sync);

	//una vez obtenido el el txt utilizar en https://ericeastwood.com/lab/vga-simulator/ resolucion 640x480  clk=50MHz
	// back porch x= 48, back porch y= 31 y darle a submit
	
		// synthesis translate_off
	
	int r, g, b, i,vgatext,empieza;
	initial begin
		vgatext = $fopen("vga.txt", "w");

		i = 'd0;
		
		clk=0; reset=0; swxor2=0;swxor1=0;swxor0=0;swxor=0;swnot=0;swadd=0;swinit=0; #10;
		reset=1;#10;
		reset=0; swxor1=1;swxor0=1; swxor=1; #100;
		swinit=1; #13600;
		
		
		while (i < 'd1800000)
			begin
				@(posedge clk2);
					begin 
						$fwrite(vgatext, "%0d ns: ", i*'d10+'d10);
					  	$fwrite(vgatext, "%b ", hsync);
						$fwrite(vgatext, "%b ", vsync);
						$fwrite(vgatext, "%b ", R);
						$fwrite(vgatext, "%b ", G);
						$fwrite(vgatext, "%b \n", B);
						i = i + 2;
					end
			end
		$fclose(vgatext);
		$finish;
		
	end
		always begin
		clk=!clk; #10;
	end
	
	
		// synthesis translate_on
	

	
endmodule 