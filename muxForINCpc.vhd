library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
port(   a,b : in std_logic; --input operands
        slc : in std_logic; --select of muxs
        R : out std_logic  --output of muxs
	);
end mux;

architecture muxarch of mux is


begin


R <=  a WHEN slc= '0'
else  b WHEN slc='1';

end muxarch;
