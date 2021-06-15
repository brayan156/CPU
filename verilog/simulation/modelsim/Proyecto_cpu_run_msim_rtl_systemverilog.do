transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/text-module {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/text-module/Pixels.sv}
vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/sincronizadorV.sv}
vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/sincronizadorH.sv}
vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/controlador_color.sv}
vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/clk_mitad_MHz.sv}
vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/RAM.sv}
vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA_ROM_Test.sv}
vlog -sv -work work +incdir+C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/VGA.sv}
vcom -93 -work work {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/text-module/commonPak.vhd}
vcom -93 -work work {C:/Users/josea/Desktop/TEC/JS/Final/CPU/verilog/VGA/text-module/Font_Rom.vhd}

