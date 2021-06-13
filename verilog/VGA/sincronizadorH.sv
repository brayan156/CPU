module sincronizadorH (input logic clk, reset,
							  output logic [9:0] contadorh,
							  output logic pasarlinea, hsynco);
		
		logic [9:0] visible=10'd640;
		logic [5:0] back=6'd48;
		logic [4:0] front=5'd16;
		logic [6:0] sincpulsos=7'd96;
		logic [9:0] total=10'd800;
		logic [9:0] contador;
		logic hsync=1'b1;
		
		assign hsynco=hsync;
		always_ff @(posedge clk, posedge reset) begin
		if (reset) begin
			contador=10'd0;
			hsync=1'b1; 
		end
		else begin
			if (contador>=(visible+front) & contador<(total-back)) begin 
				contador+=10'd1;
				hsync=1'b0;
				pasarlinea=1'b0;
			end
			else if (contador==total-1'b1) begin
				contador=10'd0;
				pasarlinea=1'b1;
				hsync=1'b1;
			end
			else begin
				contador+=10'd1;
				hsync=1'b1;
				pasarlinea=0;
			end
		end
		contadorh=contador;
	end
	
endmodule 