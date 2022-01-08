vsim -gui work.fetch
# vsim -gui work.fetch 
# Start time: 18:47:35 on Jan 06,2022
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading ieee.math_real(body)
# Loading ieee.numeric_std_unsigned(body)
# Loading work.fetch(s1)
# Loading work.ram(sync_ram_a)
mem load -filltype inc -filldata 0 -fillradix symbolic -skip 0 /fetch/stageMem1/ram
add wave -position insertpoint sim:/fetch/*
force -freeze sim:/fetch/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/fetch/RES 1 0