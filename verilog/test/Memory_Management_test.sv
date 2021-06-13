module Memory_Management_test();

	logic swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit,wboolean;
	logic [31:0] address,wdata;
	logic [31:0] rdata;
	
	Memory_Management mm(swxor2,swxor1,swxor0,swxor,swnot,swadd,swinit,wboolean,address,wdata, rdata);
	
	initial begin
		swxor2=0;swxor1=0;swxor0=0;swxor=0;swnot=0;swadd=0;swinit=0;wboolean=0;address=0;wdata=0;#10;
		
		wdata=rdata; #10
		
		address='h100; wboolean=1; #10; 
		
		wboolean=0; #10;
		
		address='h004; #10;
		
	
	end
	
	
endmodule 