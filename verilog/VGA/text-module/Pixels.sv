module Pixels (input logic [7:0] text[703:0],
					input logic clk,
					input int posX,
					input int posY,
					input int horzCoord,
					input int vertCoord,
					output logic pixel);
		
	// Constants for font
	parameter fontWidth = 8;
	parameter fontHeight = 16;
	parameter chCount = 64;

	int fontAddress, charPos, bitPos, charCode;
	logic [fontWidth-1:0] charBitInRow;
	
	assign charPos = (horzCoord - posX) / fontWidth + (vertCoord / 16) * chCount;
	assign bitPos = ((horzCoord - posX) % fontWidth);
	assign charCode = text[charPos];
	assign fontAddress = charCode*16 + (vertCoord - posY) % 16;
	
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
	
		// If current pixel is in the horizontal range of text
		if (horzCoord >= posX && horzCoord < posX + 640) begin
			inXRange = 1;
		end
		
		// If current pixel is in the vertical range of text
		if (vertCoord >= posY && vertCoord < posY + 480) begin
			inYRange = 1;
		end
		
		// Need to check if the pixel is on for text
		if (inXRange && inYRange) begin
			// FONT_WIDTH-bitPosition: we are reverting the charactor
			if (charBitInRow[fontWidth - bitPos] == 1 && charPos < 704) begin
				pixel = 1;
			end
		end
	end
					
endmodule