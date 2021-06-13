module ALU #(parameter N = 4)(input logic [N-1:0] a, b,
										input logic ci,
										input logic [3:0] selec_alu,
										output logic [N-1:0] result,
										output logic Neg, Z, C, V);
	
	logic [N-1:0] result_suma, result_resta, result_multi, result_div, result_mod;			
	logic [N-1:0] result_and, result_or, result_xor;
	logic [N-1:0] result_shleft, result_shright;
	logic co_suma, co_resta;


	sumador_nb #(N) sum(a, b, ci, result_suma, co_suma);
	restador_nb #(N) rest(a, b,ci,result_resta, co_resta);
	multiplicador #(N) mult(a, b, result_multi);
	divisor_nb #(N) div(a, b, result_div);
	modulo_nb #(N) mod(a, b, result_mod);

	c_and #(N) cand(a, b, result_and); 
	c_or #(N) cor(a, b, result_or); 
	c_xor #(N) cxor(a, b, result_xor); 

	shiftL #(N) Lshift(a,b,result_shleft);
	shiftR #(N) Rshift(a, result_shright);
	


	Mux #(N) m (result_suma, result_resta, result_multi, result_div, result_mod,result_and, result_or, result_xor,result_shleft, result_shright,selec_alu,result);


	flag_negativo  fn(co_resta, selec_alu, Neg);
	flag_carry  fC (co_suma, co_resta, selec_alu, C);
	flag_cero #(N) fz (result, C, Z);
	flag_overflow #(N) fv (a, b, result, selec_alu, V);

					
endmodule 