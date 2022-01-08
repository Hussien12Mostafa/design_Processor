LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY FetchToDecode IS
PORT( 
CLK : IN std_logic;
addressFromFetch :in std_logic_vector(15 downto 0);
d1,d2,d3 : IN std_logic;
aluControl:in std_logic_vector(2 DOWNTO 0);
memControl:in std_logic_vector(2 DOWNTO 0);
takeimF: in std_logic;
immedF: in std_logic_vector(15 downto 0);
wbControlF :in std_logic_vector(1 downto 0);
renableDecode:in std_logic_vector(1 downto 0);
PC:in std_logic_vector(31 downto 0);

addressFromFetchD :out std_logic_vector(15 downto 0);
q1,q2,q3 : out std_logic;
aluControlD:out std_logic_vector(2 DOWNTO 0);
memControlD:out std_logic_vector(2 DOWNTO 0);
takeimD: out std_logic;
immedD: out std_logic_vector(15 downto 0);
wbControlD :out std_logic_vector(1 downto 0);
renableDecodeD:out std_logic_vector(1 downto 0);
PCD:out std_logic_vector(31 downto 0));
END FetchToDecode;

ARCHITECTURE a OF FetchToDecode IS
BEGIN
process(CLK)
begin

if (CLK'event and CLK = '1')then
addressFromFetchD<=addressFromFetch;
PCD<=PC;
q1<=d1;
q2<=d2;
q3<=d3;
takeimD <=takeimF;
immedD <=immedF;
aluControlD<=aluControl;
memControlD<=memControl;
wbControlD<=wbControlF;
renableDecodeD<=renableDecode;
end if;

end process;

END a;
