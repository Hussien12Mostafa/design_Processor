LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY zeroFlagReg IS
PORT( Rst,regwrite1,regwrite2,regwrite3 : IN std_logic;
d1,d2,d3 : IN std_logic;
q1,q2,q3 : OUT std_logic);
END zeroFlagReg;

ARCHITECTURE a_my_nDFF OF zeroFlagReg IS
BEGIN
PROCESS (Rst,regwrite1,regwrite2,regwrite3,d1,d2,d3)
BEGIN
IF Rst = '1' THEN
q1 <= '0';
q2 <= '0';
q3 <= '0';
else 
if regwrite1 = '1' THEN
q1 <= d1;
end if;
if regwrite2 = '1' THEN
q2 <= d2;
end if;
if regwrite3 = '1' THEN
q3 <= d3;
end if;


END IF;

END PROCESS;
END a_my_nDFF;
