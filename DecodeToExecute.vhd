LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY DecodeToExecute IS
PORT( 
CLK : IN std_logic;
addressFromDecode :in std_logic_vector(15 downto 0);
aluControl:in std_logic_vector(2 downto 0);
memControl:in std_logic_vector(2 downto 0);
src1:in std_logic_vector(15 downto 0);
src2:in std_logic_vector(15 downto 0);
MemDataD:in std_logic_vector(15 downto 0);
cZFD,cNFD,cCFD:in std_logic;
takeimD: in std_logic;
immedD: in std_logic_vector(15 downto 0);
wbControlD :in std_logic_vector(1 downto 0);
PC:in std_logic_vector(31 downto 0);

addressFromDecodeE :out std_logic_vector(15 downto 0);
aluControlE:out std_logic_vector(2 downto 0);
memControlE:out std_logic_vector(2 downto 0);
src1E:out std_logic_vector(15 downto 0);
src2E:out std_logic_vector(15 downto 0);
MemDataE:out std_logic_vector(15 downto 0);
cZFE,cNFE,cCFE:out std_logic;
takeimE: out std_logic;
immedE: out std_logic_vector(15 downto 0);
wbControlE :out std_logic_vector(1 downto 0);
PCE:out std_logic_vector(31 downto 0));
END DecodeToExecute;

ARCHITECTURE a OF DecodeToExecute IS
BEGIN
process(CLK)
begin

if (CLK'event and CLK = '1')then
addressFromDecodeE<=addressFromDecode;
PCE<=PC;
aluControlE<=aluControl;
src1E<=src1;
src2E<=src2;
cZFE<=cZFD;
cNFE<=cNFD;
cCFE<=cCFD;
takeimE<=takeimD;
immedE<=immedD;
MemDataE<=MemDataD;
memControlE<=memControl;
wbControlE<=wbControlD;
end if;

end process;

END a;
