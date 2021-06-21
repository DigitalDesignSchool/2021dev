vlib work 
vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  
echo "" > global.txt
vsim -f questa.tops  -batch -do "vsim -voptargs=+acc=npr ; run -all; exit" -voptargs=+acc=npr -g test_id=1
vsim -f questa.tops  -batch -do "vsim -voptargs=+acc=npr ; run -all; exit" -voptargs=+acc=npr -g test_id=2
vsim -f questa.tops  -batch -do "vsim -voptargs=+acc=npr ; run -all; exit" -voptargs=+acc=npr -g test_id=3
cat global.txt