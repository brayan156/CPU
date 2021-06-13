module controlador_color (input logic [9:0] x, y,
								  input logic paintPixel,
								  output logic blank,
								  output logic [7:0] R, G, B); 
	
	logic [2:0] i, j, n, m;
	
	always_comb begin
		
		if (x<640 & y<480) begin  
			blank=1;
			if (paintPixel) begin  
				R=8'hff; 
				G=8'hff; 
				B=8'hff; 
			end
			else begin
				R=8'h0; 
				G=8'h0; 
				B=8'h0; 
			end
		end 
		else begin 
			blank=0;
			R=8'h0; 
			G=8'h0; 
			B=8'h0; 
		end
	end
	
endmodule 