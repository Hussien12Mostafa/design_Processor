LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity tri_buff is
	port(
		
		a:in std_logic_vector(15 downto 0);
		
		y:out std_logic_vector(15 downto 0);
		
		e:in std_logic);
	end tri_buff;

	
	architecture dataflow of tri_buff is
	
	signal h:std_logic_vector(15 downto 0):=(OTHERS=>'Z');

	begin
	
	with e select
	y<=a when '1',
	h when others;
	end dataflow;
