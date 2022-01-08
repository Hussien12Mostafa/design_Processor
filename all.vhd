LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY finaldesign IS

PORT( wenable,clk,rst : IN std_logic; 
renable,controlINREG : IN std_logic_vector(1 downto  0);
regWrite : in std_logic; 
wadd,radd1,radd2,dstADD,radd : IN std_logic_vector(2 DOWNTO 0);
readdata1,readdata2 ,dst: out std_logic_vector(15 DOWNTO 0);
writedata : in std_logic_vector(15 DOWNTO 0);
bibus : INOUT std_logic_vector(15 DOWNTO 0));
END finaldesign;

ARCHITECTURE a_finaldesign OF finaldesign IS

Component decoder IS
PORT( 
enable : IN std_logic;
inp : IN std_logic_vector(2 DOWNTO 0);
en : OUT std_logic_vector(7 DOWNTO 0));
END Component;


COMPONENT tri_buff IS 
port(
		
		a:in std_logic_vector(15 downto 0);
		
		y:out std_logic_vector(15 downto 0);
		
		e:in std_logic);


END COMPONENT ;


COMPONENT my_nDFF IS 
    
PORT( Clk,Rst,enable,regwrite : IN std_logic;

d : IN std_logic_vector(15 DOWNTO 0);
wbdata : IN std_logic_vector(15 DOWNTO 0);
q : OUT std_logic_vector(15 DOWNTO 0));

 END COMPONENT ;

signal tri_en,reg_en : std_logic_vector (7 DOWNTO 0);
signal q0,q1,q2,q3,q5,q4,q6,q7,q8,q9 : std_logic_vector (15 DOWNTO 0);
SIGNAL regWrit,wenabl :  std_logic; 
BEGIN


srcdec :  decoder PORT MAP (renable(0),radd,tri_en);

disdec :  decoder PORT MAP (wenable,wadd,reg_en);
r0 :  my_nDFF PORT MAP (clk,rst,reg_en(0),regWrite,bibus,writedata,q0);
r1 :  my_nDFF PORT MAP (clk,rst,reg_en(1),regWrite,bibus,writedata,q1);
r2 :  my_nDFF PORT MAP (clk,rst,reg_en(2),regWrite,bibus,writedata,q2);
r3 :  my_nDFF PORT MAP (clk,rst,reg_en(3),regWrite,bibus,writedata,q3);

r4 :  my_nDFF PORT MAP (clk,rst,reg_en(4),regWrite,bibus,writedata,q4);
r5 :  my_nDFF PORT MAP (clk,rst,reg_en(5),regWrite,bibus,writedata,q5);
r6 :  my_nDFF PORT MAP (clk,rst,reg_en(6),regWrite,bibus,writedata,q6);
r7 :  my_nDFF PORT MAP (clk,rst,reg_en(7),regWrite,bibus,writedata,q7);
r8 :  my_nDFF PORT MAP (clk,rst,controlINREG(0),regWrite,bibus,writedata,q8);  --in
r9 :  my_nDFF PORT MAP (clk,rst,controlINREG(1),regWrite,bibus,writedata,q9);  --out



tri0 : tri_buff PORT MAP (q0,bibus,tri_en(0));
tri1 : tri_buff PORT MAP (q1,bibus,tri_en(1));
tri2 : tri_buff PORT MAP (q2,bibus,tri_en(2));
tri3 : tri_buff PORT MAP (q3,bibus,tri_en(3));

tri4 : tri_buff PORT MAP (q4,bibus,tri_en(4));
tri5 : tri_buff PORT MAP (q5,bibus,tri_en(5));
tri6 : tri_buff PORT MAP (q6,bibus,tri_en(6));
tri7 : tri_buff PORT MAP (q7,bibus,tri_en(7));
tri8 : tri_buff PORT MAP (q8,bibus,controlINREG(0));
tri9 : tri_buff PORT MAP (q9,bibus,'0');
readdata1 <= q8 when controlINREG="01"
else q1 WHEN radd1="001"
 else q2 WHEN radd1="010"
 else q3 WHEN radd1="011"
else q4 WHEN radd1="100"

else q5 WHEN radd1="101"

else q6 WHEN radd1="110"

else q7 WHEN radd1="111"

else q0 WHEN radd1="000" ;


readdata2 <= q1 WHEN radd2="001"
 else q2 WHEN radd2="010"
 else q3 WHEN radd2="011"
else q4 WHEN radd2="100"

else q5 WHEN radd2="101"

else q6 WHEN radd2="110"

else q7 WHEN radd2="111"

else q0 WHEN radd2="000" ;

dst <= q1 WHEN dstADD="001"
 else q2 WHEN dstADD="010"
 else q3 WHEN dstADD="011"
else q4 WHEN dstADD="100"

else q5 WHEN dstADD="101"

else q6 WHEN dstADD="110"

else q7 WHEN dstADD="111"

else q0 WHEN dstADD="000" ;



END architecture;
