#compile file
iverilog -o sim.vvp decade_counter.sv tb_decade_counter.sv

#open wave for viewing
vvp sim.vvp


#open gtkwave
gtkwave tb_decade_counter.vcd
