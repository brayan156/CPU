module VGA (input logic clk, reset,
				input logic [7:0] char_data[255:0],
				output logic [7:0] R, G, B,
				output logic hsync, vsync, clk2, blank, sync);


	assign sync=1'b0;

	logic pasarlinea, res;
	logic [9:0] contadorh, contadorv;
	
	clk_mitad_MHz cmh(clk, clk2);
	
	sincronizadorV sv(pasarlinea, reset, contadorv, vsync);
   sincronizadorH sh(clk2,reset, contadorh, pasarlinea, hsync); 
	
	// asciiwriter w (clk2, contadorh, contadorv, char_data[40:0], R, G, B, blank);
	
	Pixels p (	
                char_data,
					 clk,
                0,
                100,
                contadorh,
                contadorv,
                res
            );
	
	controlador_color cc(contadorh, contadorv, res, blank, R, G, B);

endmodule 