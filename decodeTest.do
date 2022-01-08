vsim -gui work.finaldesign
# vsim -gui work.finaldesign 
# Start time: 00:16:39 on Jan 09,2022
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.finaldesign(a_finaldesign)
# Loading work.decoder(a_decoder)
# Loading work.my_ndff(a_my_ndff)
# Loading work.tri_buff(dataflow)
add wave -position insertpoint sim:/finaldesign/*
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
#           File in use by: hussien  Hostname: DESKTOP-HJTE5H7  ProcessID: 7808
#           Attempting to use alternate WLF file "./wlftrbi1zy".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
#           Using alternate file: ./wlftrbi1zy
force -freeze sim:/finaldesign/wenable 0 0
force -freeze sim:/finaldesign/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/finaldesign/rst 1 0
force -freeze sim:/finaldesign/renable 10 0
force -freeze sim:/finaldesign/controlINREG 01 0
force -freeze sim:/finaldesign/regWrite 0 0
force -freeze sim:/finaldesign/wadd 000 0