module asciiwriter(input clk,
						 input [0:9] x, 
						 input [0:9] y,
						 input [0:7] character [0:40],
						 output logic [7:0] red,
						 output logic [7:0] green,
						 output logic [7:0] blue,
						 output logic blank);
						
	parameter img_bytes = 20'd15049;	
	parameter img_cols = 10'd14;	
	parameter img_rows = 10'd25;
	parameter character_bytes = 350;
	logic x0 = 10'd12;
	parameter y0 = (10'd480 - img_rows)/2;
	
	
	reg [7:0] fonts [0:img_bytes];
	
	logic [31:0] pixel_num;
	logic [10:0] i;
	
	initial begin
		$readmemh ("FontRom.txt", fonts);
	end
	
	
	always@(clk) begin
		pixel_num = 0;
		blank = 0;
		for(i = 0; i < 40; i++) begin
			if(img_cols + x0 + img_cols*i > x && img_rows + y0 > y && x>x0 + img_cols*i && y>y0 &&
				character[{i}]>8'd0) begin 
				blank = 1;
				pixel_num = character_bytes*(character[{i}]-8'd48) + (y-i-y0)*img_cols + (x-x0);
			end
		end
		red <= fonts[{pixel_num}];
		green <= fonts[{pixel_num}];
		blue <= fonts[{pixel_num}];
	end
endmodule 

