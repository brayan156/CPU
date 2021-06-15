module VGA (input logic clk, reset,
				input logic[7:0] char_data[255:0],
				output logic [7:0] R, G, B,
				output logic hsync, vsync, blank, sync);

	assign sync=1'b0;

	logic pasarlinea, res;
	logic [9:0] contadorh, contadorv;

	sincronizadorV sv(pasarlinea, reset, contadorv, vsync);
   sincronizadorH sh(clk, reset, contadorh, pasarlinea, hsync); 
	
	Pixels p(char_data, clk, 0, 0, contadorh, contadorv, res);
	
	controlador_color cc(contadorh, contadorv, res, blank, R, G, B);

endmodule 