LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY my_nDFF IS
PORT( Clk,Rst,enable,regwrite : IN std_logic;
d : IN std_logic_vector(15 DOWNTO 0);
wbdata : IN std_logic_vector(15 DOWNTO 0);
q : OUT std_logic_vector(15 DOWNTO 0));
END my_nDFF;

ARCHITECTURE a_my_nDFF OF my_nDFF IS
BEGIN
PROCESS (Clk,Rst,enable)
BEGIN
IF Rst = '1' THEN
q <= (OTHERS=>'0');
elsif(enable='1')
then
if (Clk'event and Clk = '0') THEN
IF regwrite = '1' THEN
q <= wbdata;
else
q <= d;
END IF;

END IF;
END IF;

END PROCESS;
END a_my_nDFF;
