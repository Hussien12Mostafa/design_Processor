vsim -gui work.finaldesign
# vsim -gui work.finaldesign 
# Start time: 20:22:11 on Dec 09,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.finaldesign(a_finaldesign)
# Loading work.decoder(a_decoder)
# Loading work.my_ndff(a_my_ndff)
# Loading work.tri_buff(dataflow)
add wave -position insertpoint  \
sim:/finaldesign/wenable \
sim:/finaldesign/renable \
sim:/finaldesign/clk \
sim:/finaldesign/rst \
sim:/finaldesign/wadd \
sim:/finaldesign/radd1 \
sim:/finaldesign/radd2 \
sim:/finaldesign/readdata1 \
sim:/finaldesign/readdata2 \
sim:/finaldesign/bibus
force -freeze sim:/finaldesign/wenable 1 0
force -freeze sim:/finaldesign/rst 0 0
force -freeze sim:/finaldesign/wadd 000 0
force -freeze sim:/finaldesign/bibus 1010101010101010 0
noforce sim:/finaldesign/clk
force -freeze sim:/finaldesign/clk 1 0, 0 {50 ps} -r 100
run
add wave -position insertpoint  \
sim:/finaldesign/q0
run
add wave -position insertpoint  \
sim:/finaldesign/q1 \
sim:/finaldesign/q2 \
sim:/finaldesign/q3 \
sim:/finaldesign/q5 \
sim:/finaldesign/q4 \
sim:/finaldesign/q6 \
sim:/finaldesign/q7
force -freeze sim:/finaldesign/radd1 000 0
run
force -freeze sim:/finaldesign/bibus 0000000010111011 0
force -freeze sim:/finaldesign/wadd 001 0
run
run
force -freeze sim:/finaldesign/radd2 001 0
run
force -freeze sim:/finaldesign/bibus 0000000011001100 0
force -freeze sim:/finaldesign/wadd 010 0
run
run
force -freeze sim:/finaldesign/radd1 010 0
run
force -freeze sim:/finaldesign/wadd 111 0
run
run
force -freeze sim:/finaldesign/bibus 0000000011011101 0
force -freeze sim:/finaldesign/wadd 011 0
run
run
force -freeze sim:/finaldesign/renable 1 0
force -freeze sim:/finaldesign/wadd 001 0
force -freeze sim:/finaldesign/radd1 000 0
noforce sim:/finaldesign/bibus





















vsim -gui work.finaldesign
# vsim -gui work.finaldesign 
# Start time: 21:13:48 on Dec 09,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.finaldesign(a_finaldesign)
# Loading work.decoder(a_decoder)
# Loading work.my_ndff(a_my_ndff)
# Loading work.tri_buff(dataflow)
# vsim -gui work.finaldesign 
# Start time: 20:22:11 on Dec 09,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.finaldesign(a_finaldesign)
# Loading work.decoder(a_decoder)
# Loading work.my_ndff(a_my_ndff)
# Loading work.tri_buff(dataflow)
add wave -position insertpoint  \
sim:/finaldesign/wenable \
sim:/finaldesign/renable \
sim:/finaldesign/clk \
sim:/finaldesign/rst \
sim:/finaldesign/wadd \
sim:/finaldesign/radd1 \
sim:/finaldesign/radd2 \
sim:/finaldesign/readdata1 \
sim:/finaldesign/readdata2 \
sim:/finaldesign/bibus
force -freeze sim:/finaldesign/wenable 1 0
force -freeze sim:/finaldesign/rst 0 0
force -freeze sim:/finaldesign/wadd 000 0
force -freeze sim:/finaldesign/bibus 1010101010101010 0
noforce sim:/finaldesign/clk
force -freeze sim:/finaldesign/clk 1 0, 0 {50 ps} -r 100
run
add wave -position insertpoint  \
sim:/finaldesign/q0
run
add wave -position insertpoint  \
sim:/finaldesign/q1 \
sim:/finaldesign/q2 \
sim:/finaldesign/q3 \
sim:/finaldesign/q5 \
sim:/finaldesign/q4 \
sim:/finaldesign/q6 \
sim:/finaldesign/q7
force -freeze sim:/finaldesign/radd1 000 0
run
force -freeze sim:/finaldesign/bibus 0000000010111011 0
force -freeze sim:/finaldesign/wadd 001 0
run
run
force -freeze sim:/finaldesign/radd2 001 0
run
force -freeze sim:/finaldesign/bibus 0000000011001100 0
force -freeze sim:/finaldesign/wadd 010 0
run
run
force -freeze sim:/finaldesign/radd1 010 0
run
force -freeze sim:/finaldesign/wadd 111 0
run
run
force -freeze sim:/finaldesign/bibus 0000000011011101 0
force -freeze sim:/finaldesign/wadd 011 0
run
run
force -freeze sim:/finaldesign/renable 1 0
force -freeze sim:/finaldesign/wadd 001 0
force -freeze sim:/finaldesign/radd1 000 0
noforce sim:/finaldesign/bibus
add wave -position insertpoint  \
sim:/finaldesign/radd
force -freeze sim:/finaldesign/radd 000 0
run
run
force -freeze sim:/finaldesign/wadd 000 0
force -freeze sim:/finaldesign/radd 010 0
run
run
force -freeze sim:/finaldesign/radd1 111 0
run
force -freeze sim:/finaldesign/q7 0100100011001101 0
run
force -freeze sim:/finaldesign/radd 011 0
run
run
force -freeze sim:/finaldesign/radd 111 0
force -freeze sim:/finaldesign/wadd 100 0
run
run
force -freeze sim:/finaldesign/radd2 100 0
run