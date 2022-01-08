LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY MEMToWBWB IS
PORT( 
CLK : IN std_logic;
addressFromDecodeM :in std_logic_vector(15 downto 0);
WBControlM:in std_logic_vector(1 downto 0);

outALUM:in std_logic_vector(15 downto 0);
MemDataOutM:in std_logic_vector(15 downto 0);

PCM:in std_logic_vector(31 downto 0);

addressFromDecodeW :out std_logic_vector(15 downto 0);


outALUW:out std_logic_vector(15 downto 0);
MemDataOutW:out std_logic_vector(15 downto 0);
WBControlW:out std_logic_vector(1 downto 0);
PCW:out std_logic_vector(31 downto 0));
END MEMToWBWB;

ARCHITECTURE a OF MEMToWBWB IS
BEGIN
process(CLK)
begin

if (CLK'event and CLK = '1')then
addressFromDecodeW<=addressFromDecodeM;
outALUW<=outALUM;
PCW<=PCM;
WBControlW<=WBControlM;
MemDataOutW<=MemDataOutM;
end if;

end process;

END a;
