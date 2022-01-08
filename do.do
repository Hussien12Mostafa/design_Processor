vsim -gui work.main
# vsim -gui work.main 
# Start time: 18:08:26 on Jan 06,2022
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading ieee.math_real(body)
# Loading ieee.numeric_std_unsigned(body)
# Loading work.main(s1)
# Loading work.fetch2(s1)
# Loading work.ram(sync_ram_a)
# Loading work.finaldesign(a_finaldesign)
# Loading work.decoder(a_decoder)
# Loading work.my_ndff(a_my_ndff)
# Loading work.tri_buff(dataflow)
add wave -position insertpoint sim:/main/*
mem load -filltype inc -filldata 0 -fillradix symbolic -skip 0 /main/stageFetch/stageMem1/ram
force -freeze sim:/main/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/main/RES 1 0

force -freeze sim:/main/CLK 1 0, 0 {50 ps} -r 100
mem load -filltype value -filldata {0000000100000001 } -fillradix symbolic /main/stageFetch/stageMem1/ram(3)
mem load -filltype value -filldata 0000000000010000 -fillradix symbolic /main/stageFetch/stageMem1/ram(1)
mem load -filltype value -filldata {0000000100000101 } -fillradix symbolic /main/stageFetch/stageMem1/ram(6)
mem load -filltype value -filldata {0000000000000010 } -fillradix symbolic /main/stageFetch/stageMem1/ram(4)
mem load -filltype value -filldata {0000100011010001 } -fillradix symbolic /main/stageFetch/stageMem1/ram(9)
mem load -filltype value -filldata {0000100011001001 } -fillradix symbolic /main/stageFetch/stageMem1/ram(9)
mem load -filltype value -filldata 0000100001101001 -fillradix symbolic /main/stageFetch/stageMem1/ram(11)
mem load -filltype value -filldata 0000000000010001 -fillradix symbolic /main/stageFetch/stageMem1/ram(14)
mem load -filltype value -filldata 0000000000010010 -fillradix symbolic /main/stageFetch/stageMem1/ram(1)
add wave -position insertpoint sim:/main/stageDecode/*
mem load -filltype value -filldata 0000000000000110 -fillradix symbolic /main/stageFetch/stageMem1/ram(3)
mem load -filltype value -filldata {0000000000010000 } -fillradix symbolic /main/stageFetch/stageMem1/ram(0)
