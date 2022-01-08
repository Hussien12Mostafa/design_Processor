LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY CU IS
PORT( 

operandAndOperation :in std_logic_vector(4 downto 0);

aluOperation :out std_logic_vector(2 downto 0);
memOperation :out std_logic_vector(2 downto 0);
wbm ,renableDecode:out std_logic_vector(1 downto 0);
fetchControl,cZF,cNF,cCF,useImmad :out std_logic);
END CU;

ARCHITECTURE a OF CU IS
BEGIN
aluOperation <= "100"  when operandAndOperation="10000"
else "101"  when operandAndOperation="01100"
else "110"  when operandAndOperation="01000"
else "111"  when operandAndOperation="00000"
else "111"  when operandAndOperation="00100"
else "011"  when operandAndOperation="00001"--mov
else "011"  when operandAndOperation="10100"--out(same mov)
else "011"  when operandAndOperation="11000"--in(same mov)
else "011"  when operandAndOperation="01010"--loadimm
else "000"  when operandAndOperation="00101"--add
else "001"  when operandAndOperation="01001"--sub
else "010"  when operandAndOperation="01101"--and
else "000"  when operandAndOperation="10001"--immadAdd
else "000"  when operandAndOperation="10010"--addStore
else "000"  when operandAndOperation="01110"--addLoad
else "111"; 
renableDecode <="10" when operandAndOperation="11000" 
else "01";

memOperation <= "011"  when operandAndOperation="00010"--push
else "010"  when operandAndOperation="00110"--pop
else "000"  when operandAndOperation="01110"--load
else "001"  when operandAndOperation="10010"--store
else "111"; 

wbm <= "10"  when operandAndOperation="01100" or operandAndOperation="10000" or operandAndOperation="10100" or operandAndOperation="11000" or operandAndOperation="00001" or operandAndOperation="00101" or operandAndOperation="01001" or operandAndOperation="01101" or operandAndOperation="10001" or operandAndOperation="01110" or operandAndOperation="10100" or  operandAndOperation="11000" 
else "11"  when operandAndOperation="01010"  or operandAndOperation="01110"
else "00";

fetchControl<='1' when operandAndOperation="00100"
else '0';

cCF<= '1' when operandAndOperation="10000"or operandAndOperation="01000" or operandAndOperation="00101" or operandAndOperation="01001"
else '0';
cNF<= '1' when operandAndOperation="10000" or operandAndOperation="01100" or operandAndOperation="00101" or operandAndOperation="01001" or operandAndOperation="01101"
else '0';
cZF<= '1' when operandAndOperation="10000" or operandAndOperation="01100" or operandAndOperation="00101" or operandAndOperation="01001" or operandAndOperation="01101"
else '0';
useImmad<='1' when operandAndOperation="10001"
else '0';
END a;
