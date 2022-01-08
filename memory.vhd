LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Ram is
PORT (clk, we, rst :  IN STD_LOGIC ;
      address : IN std_logic_vector(19 downto 0);
      datain : in std_logic_vector (15 downto 0);
      dataout : out std_logic_vector (15 downto 0));
end ENTITY;



architecture a_ram of Ram is
TYPE ram_type is ARRAY(0 to (2**20) - 1) of std_logic_vector(15 downto 0);
SIGNAL ram : ram_type;
begin

process(clk)
begin
	if(rst = '1') then
		loop1: for i in 0 to ((2**20) - 1) loop
			ram(i) <= (OTHERS => '0');
		end loop loop1;
	elsif(clk'event and clk = '0') then
		if(we = '1') then
			ram(to_integer(unsigned(address))) <= datain;

		end if;
	end if;
end process;

dataout<= (others => '0') when rst = '1'
else ram(to_integer(unsigned(address)));

end a_ram;
