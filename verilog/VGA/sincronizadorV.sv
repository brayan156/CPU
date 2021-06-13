module sincronizadorV (input logic pasarlinea, reset,
							  output logic [9:0] contadorv,
							  output logic vsynco);
		
		logic [9:0] visible=10'd480;
		logic [5:0] back=6'd31;
		logic [3:0] front=4'd11;
		logic [1:0] sincpulsos=2'd2;
		logic [9:0] total=10'd524;
		logic [9:0] contador=10'b0;
		logic vsync=1'b1;
		
		assign vsynco=vsync;
		always_ff @(posedge pasarlinea, posedge reset) begin
			if (reset) begin
				contador=10'b0;
				vsync=1'b1;
			end
			else begin
				if (contador>=(visible+front) & contador<(total-back)) begin 
					contador+=10'd1;
					vsync=1'b0;
				end
			else if (contador==total-1'b1) begin 
				contador=10'd0;
				vsync=1'b1;
			end
			else begin 
				contador+=10'd1;
				vsync=1'b1;
			end
		end
		contadorv=contador;
		end 
	
endmodule 