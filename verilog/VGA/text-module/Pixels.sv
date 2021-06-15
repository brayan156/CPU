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
	
	always_ff @(posedge clk) begin
		// Reset
		pixel = 0;
		// FONT_WIDTH-bitPosition: we are reverting the charactor
		if (charBitInRow[fontWidth - bitPos] == 1 && charPos < 256) begin
			pixel = 1;
		end
	end
					
endmodule