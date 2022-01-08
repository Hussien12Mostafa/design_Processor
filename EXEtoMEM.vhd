LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY EXEtoMEM IS
PORT( 
CLK : IN std_logic;
addressFromDecodeE :in std_logic_vector(15 downto 0);
memControlE:in std_logic_vector(2 downto 0);
src1E:in std_logic_vector(15 downto 0);
outALUE:in std_logic_vector(15 downto 0);
MemDataE:in std_logic_vector(15 downto 0);
CFE:in std_logic;
wbControlE :in std_logic_vector(1 downto 0);
PC:in std_logic_vector(31 downto 0);

addressFromDecodeM :out std_logic_vector(15 downto 0);
memControlM:out std_logic_vector(2 downto 0);
src1M:out std_logic_vector(15 downto 0);
outALUM:out std_logic_vector(15 downto 0);
MemDataM:out std_logic_vector(15 downto 0);
CFM:out std_logic;
wbControlM :out std_logic_vector(1 downto 0);
PCM:out std_logic_vector(31 downto 0));
END EXEtoMEM;

ARCHITECTURE a OF EXEtoMEM IS
BEGIN
process(CLK)
begin

if (CLK'event and CLK = '1')then
addressFromDecodeM <= addressFromDecodeE;
memControlM<= memControlE;
src1M<=src1E;
outALUM<=outALUE;
MemDataM<=MemDataE;
PCM<=PC;
wbControlM<=wbControlE;
CFM<=CFE;
end if;

end process;

END a;
