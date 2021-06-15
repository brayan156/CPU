module Pixels (input logic [7:0] text[255:0],
					input logic clk,
					input int posX,
					input int posY,
					input int horzCoord,
					input int vertCoord,
					output logic pixel);
		
	// Constants for font
	parameter fontWidth = 8;
	parameter fontHeight = 16;

	int fontAddress, charPos, bitPos, charCode;
	logic [fontWidth-1:0] charBitInRow;
	
	assign charPos = (horzCoord - posX) / fontWidth;
	assign bitPos = ((horzCoord - posX) % fontWidth);
	assign charCode = text[charPos];
	assign fontAddress = charCode*16 + (vertCoord - posY);
	
	
	// Initialize ROM with ASCII data
	Font_Rom rom (
					clk,
					fontAddress,
					charBitInRow
					);
					
	logic inXRange, inYRange;
	
	always_ff @(posedge clk) begin
		// Reset
		inXRange = 0;
		inYRange = 0;
		pixel = 0;
		
		if (vertCoord % 16 == 0) begin
			
		end
	
		// If current pixel is in the horizontal range of text
		if (horzCoord >= posX && horzCoord < posX + (fontWidth * 256)) begin
			inXRange = 1;
		end
		
		// If current pixel is in the vertical range of text
		if (vertCoord >= posY && vertCoord < posY + fontHeight) begin
			inYRange = 1;
		end
		
		// Need to check if the pixel is on for text
		if (inXRange && inYRange) begin
			// FONT_WIDTH-bitPosition: we are reverting the charactor
			if (charBitInRow[fontWidth - bitPos] == 1) begin
				pixel = 1;
			end
		end
	end
					
endmodule