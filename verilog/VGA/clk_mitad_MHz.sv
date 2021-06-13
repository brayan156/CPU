module clk_mitad_MHz(input logic clk,
							output logic clk2);

	logic [1:0] tiempo=2'd0;
	
	always_ff @(posedge clk) begin
		if (tiempo==2'd1) begin
			tiempo=2'd0;
			clk2=1'b1;
			end
		else begin 
			tiempo+=2'd1;
			clk2=1'b0;
		end  
	end 
endmodule 