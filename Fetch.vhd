
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY ram IS
PORT (clk : IN std_logic;
 re,we: IN std_logic;
address : IN std_logic_vector(31 DOWNTO 0);
datain : IN std_logic_vector(15 DOWNTO 0);
dataout : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY ram;

ARCHITECTURE sync_ram_a OF ram IS 
 TYPE ram_type IS ARRAY(0 TO 2**20) of std_logic_vector(15 DOWNTO 0);
 SIGNAL ram : ram_type ;
BEGIN
PROCESS(clk,re,we,address) IS 
BEGIN
if(address /= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" and address /= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")then
 IF falling_edge(clk) THEN 
 IF we = '1' and re='0' THEN 
ram(to_integer(unsigned((address)))) <= datain; 
 END IF;
if re='1' and we='0' then
dataout <= ram(to_integer(unsigned((address))));
end if;
 END IF;
 END IF;
END PROCESS;
 



END sync_ram_a;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std_unsigned.all;
entity FETCH is
port(
CLK ,RES: in std_logic;
f1 : out std_logic_vector(15 downto 0)
);
END ENTITY FETCH;
ARCHITECTURE s1 OF FETCH IS
COMPONENT ram IS 
PORT (clk : IN std_logic;
re,we: IN std_logic;
address : IN std_logic_vector(31 DOWNTO 0);
datain : IN std_logic_vector(15 DOWNTO 0);
dataout : OUT std_logic_vector(15 DOWNTO 0) );
END COMPONENT;
SIGNAL in1:  std_logic_vector(15 downto 0);
Signal PC : std_logic_vector(31 downto 0);
begin
stageMem1: ram  PORT MAP (CLK,'1','0',PC,in1,f1);
process(CLK)
begin
if(RES='1')then
PC<=(OTHERS=>'0');
elsif rising_edge(CLK)then
PC<=PC+"00000000000000000000000000000001";
end if;

end process;
END s1;







