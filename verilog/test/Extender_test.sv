module Extender_test();

	logic [23:0] intstruction;
	logic [1:0] inmediatetype;
	logic [31:0] extendeddata;
	
	Extender ext (intstruction,inmediatetype,extendeddata);
	
	initial begin
	intstruction='h0fffff;inmediatetype=0;extendeddata=0; #10;
	
	inmediatetype='b10; #10;
	intstruction='hf0ffff;#10;
	intstruction='hff0fff;#10;
	intstruction='hfff0ff;#10;
	intstruction='hffff0f;#10;
	intstruction='hfffff0;#10;
	end 
	
endmodule 