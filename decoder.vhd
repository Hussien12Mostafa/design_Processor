LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY decoder IS
PORT( 
enable : IN std_logic;
inp : IN std_logic_vector(2 DOWNTO 0);
en : OUT std_logic_vector(7 DOWNTO 0));
END decoder;

ARCHITECTURE a_decoder OF decoder IS
BEGIN

 en <= "00000000"  when enable='0'
else "00000010" WHEN inp="001"
 else "00000100" WHEN inp="010"
 else "00001000" WHEN inp="011"
else "00010000" WHEN inp="100"

else "00100000" WHEN inp="101"

else "01000000" WHEN inp="110"

else "10000000" WHEN inp="111"

else "00000001" WHEN inp="000" ;
END a_decoder;