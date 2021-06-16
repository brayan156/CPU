transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/VGA/text-module {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/VGA/text-module/Pixels.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/VGA {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/VGA/VGA.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/VGA {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/VGA/sincronizadorV.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/VGA {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/VGA/sincronizadorH.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/VGA {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/VGA/controlador_color.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/VGA {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/VGA/clk_mitad_MHz.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Decoder.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Register_File.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Control_Unit.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Condition_Logic.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/sumador_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/sumador_1b.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/shiftR.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/shiftL.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/restador_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/negador_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/negador_1b.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/Mux.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/multiplicador.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/modulo_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/flag_overflow.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/flag_negativo.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/flag_cero.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/flag_carry.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/divisor_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/c_xor.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/c_or.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/c_and.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog/ALU {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ALU/ALU.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Memory_Management.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/RAM.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Mux2_1.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/PC.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Extender.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ff_enable.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/CPU.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/condition_check.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/CPU_VGA.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/MuxMOV.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Imm_Rotation.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Character_manager.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/final_test.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/Instruction_Memory.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/taller\ de\ diseno/proyecto/Git_proyecto/CPU/verilog {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/ROM.sv}
vcom -93 -work work {C:/Users/braya/Desktop/taller de diseno/proyecto/Git_proyecto/CPU/verilog/VGA/text-module/Font_Rom.vhd}

