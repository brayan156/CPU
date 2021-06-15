module VGA (input logic clk, reset,
				input logic[7:0] char_data[255:0],
				input logic[7:0] char_data_coded[255:0],
				output logic [7:0] R, G, B,
				output logic hsync, vsync, blank, sync);

	assign sync=1'b0;

	logic pasarlinea, res;
	logic [9:0] contadorh, contadorv;
	
	logic [7:0] data[703:0];
	assign data[63:0]='{8'h54,8'h65,8'h78,8'h74,8'h6f,8'h20,8'h63,8'h6f,8'h64,8'h69,8'h66,8'h69,8'h63,8'h61,8'h64,8'h6f,8'h3a,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20};
	assign data[319:64]=char_data_coded;
	assign data[383:320]='{8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20};
	assign data[447:384]='{8'h54,8'h65,8'h78,8'h74,8'h6f,8'h20,8'h64,8'h65,8'h63,8'h6f,8'h64,8'h69,8'h66,8'h69,8'h63,8'h61,8'h64,8'h6f,8'h20,8'h63,8'h6f,8'h6e,8'h3a,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20,8'h20};
	assign data[703:448]=char_data;
	
	sincronizadorV sv(pasarlinea, reset, contadorv, vsync);
   sincronizadorH sh(clk, reset, contadorh, pasarlinea, hsync); 
	
	Pixels p(data, clk, 0, 0, contadorh, contadorv, res);
	
	controlador_color cc(contadorh, contadorv, res, blank, R, G, B);

endmodule 