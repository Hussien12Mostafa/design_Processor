library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity MAIN is
port(
CLK ,RES: in std_logic;
f1 : out std_logic_vector(15 downto 0)
);
END ENTITY MAIN;
ARCHITECTURE s1 OF MAIN IS

--memStage
COMPONENT memUnit IS
PORT (clk, rst : in STD_LOGIC;
      consig : in STD_LOGIC_VECTOR (2 downto 0);           -- 0th bit store or load, 1th bit push or pop, 2th bit to indicate do nothing
      address : in STD_LOGIC_VECTOR (15 downto 0);     -- 20 bit address (ends at FF00), also for SP (ends at FFFF) 
      carry : in std_logic;
      SP : inout STD_LOGIC_VECTOR (19 downto 0);
      datain : in STD_LOGIC_VECTOR (15 downto 0);          -- data taken from exec stage
                         -- Write enable and Read enable, read enable is useless till now
      dataout : out STD_LOGIC_VECTOR (15 downto 0));       -- dataout to the buffer or to forwarding unit
END COMPONENT;

--ExeToMem
COMPONENT EXEtoMEM IS 

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
END COMPONENT;
---aluiMuxes
COMPONENT alu_muxs IS 

port(   reg,mem,ex,im : in std_logic_vector(15 downto 0); --input operands
        slc : in std_logic_vector(1 downto 0); --select of muxs
        R : out std_logic_vector(15 downto 0)  --output of muxs
	);
END COMPONENT;
--regZeroFlag
COMPONENT zeroFlagReg IS 
PORT( Rst,regwrite1,regwrite2,regwrite3 : IN std_logic;
d1,d2,d3 : IN std_logic;
q1,q2,q3 : OUT std_logic);
END COMPONENT;
--muxForINC PC
COMPONENT mux IS 
port(   a,b : in std_logic; --input operands
        slc : in std_logic; --select of muxs
        R : out std_logic  --output of muxs
	);
END COMPONENT;
--aluStage
COMPONENT simple_alu IS 
port(   --Clk : in std_logic; --clock signal
        A,B : in std_logic_vector(15 DOWNTO 0);--input operands
        Op : in std_logic_vector(2 downto 0); --Operation to be performed
        R : out std_logic_vector(15 downto 0);  --output of ALU
        zf,nf,cf: out std_logic --flags
	);
END COMPONENT;



--controlUnit
COMPONENT CU IS 
PORT( 

operandAndOperation :in std_logic_vector(4 downto 0);

aluOperation :out std_logic_vector(2 downto 0);
memOperation :out std_logic_vector(2 downto 0);
wbm ,renableDecode:out std_logic_vector(1 downto 0);
fetchControl,cZF,cNF,cCF,useImmad :out std_logic);
END COMPONENT;

--FetchToDecode
COMPONENT FetchToDecode IS 
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
END COMPONENT;

--Decode
COMPONENT finaldesign IS 
PORT( wenable,clk,rst : IN std_logic; 
renable,controlINREG : IN std_logic_vector(1 downto  0);
regWrite : in std_logic; 
wadd,radd1,radd2,dstADD,radd : IN std_logic_vector(2 DOWNTO 0);
readdata1,readdata2 ,dst: out std_logic_vector(15 DOWNTO 0);
writedata : in std_logic_vector(15 DOWNTO 0);
bibus : INOUT std_logic_vector(15 DOWNTO 0));
END COMPONENT;

--FETCH
COMPONENT FETCH IS 
port(
CLK ,RES,counterPC,takeImmad: in std_logic;
P : out std_logic_vector(31 downto 0);
f1 ,immad: out std_logic_vector(15 downto 0)
);
END COMPONENT;


--DecodeToExecute
COMPONENT DecodeToExecute IS 
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
END COMPONENT;
--memToWB
COMPONENT MEMToWBWB IS

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
END COMPONENT;

SIGNAL  addressFromFetch,resultAlu ,dstData,dstDataE,dstDataM,addressFromDecodeM,dataOUTMEM,addressFromDecodeW,outALUW,dataOUTMEMWB: std_logic_vector(15 downto 0);

SIGNAL bibus ,aluin1,aluin2: std_logic_vector(15 DOWNTO 0);
SIGNAL addressFromFetchD,addressFromDecodeE,readdata1,readdata2,src1E,src2E,immaditValue,immaditValueD,immaditValueE ,src1M,resultAluM,wbout: std_logic_vector(15 DOWNTO 0);
SIGNAL radd ,r1,r2,memOperaton,memOperatonD,memOperatonE,memOperatonM:  std_logic_vector(2 DOWNTO 0);
SIGNAL PC,PCD,PCE,PCM,PCW : std_logic_vector(31 DOWNTO 0);
SIGNAL aluControl,aluControlD,aluControlE: std_logic_vector(2 DOWNTO 0);
SIGNAL PCCounter,resPCCounter,zf,nf,cf,cZF,cNF,cCF ,q1,q2,q3,cZFD,cNFD,cCFD,cZFE,cNFE,cCFE,takeImmad,takeImmadD,takeImmadE,cfM:  std_logic;
SIGNAL      SP :  STD_LOGIC_VECTOR (19 downto 0);
SIGNAL wbControlF,wbControlD,wbControlE,wbControlM,wbControlW,renableDecode,renableDecodeD : std_logic_vector(1 downto 0);

begin
--fetch
stageINCpc: mux PORT MAP ('0','1',PCCounter,resPCCounter);
stageFetch: FETCH  PORT MAP (CLK,RES,resPCCounter,takeImmad,PC,addressFromFetch,immaditValue);
stageCU: CU PORT MAP (addressFromFetch(4 downto 0),aluControl,memOperaton,wbControlF,renableDecode,PCCounter,cZF,cNF,cCF,takeImmad);
stageFetchToDecode: FetchToDecode  PORT MAP (CLK,addressFromFetch,cZF,cNF,cCF,aluControl,memOperaton,takeImmad,immaditValue,wbControlF,renableDecode,PC,addressFromFetchD,cZFD,cNFD,cCFD,aluControlD,memOperatonD,takeImmadD,immaditValueD,wbControlD,renableDecodeD,PCD);
--decode

stageDecode: finaldesign  PORT MAP (wbControlW(1),CLK,RES,renableDecodeD,addressFromFetchD(15 downto 14),wbControlW(1),addressFromDecodeW(13 downto 11),addressFromFetchD(7 downto 5),addressFromFetchD(10 downto 8),addressFromFetchD(13 downto 11),radd,readdata1,readdata2,dstData,wbout,bibus);


stageDecodeToExecute: DecodeToExecute PORT MAP (CLK,addressFromFetchD,aluControlD,memOperatonD,readdata1,readdata2,dstData,cZFD,cNFD,cCFD,takeImmadD,immaditValueD,wbControlD,PCD,addressFromDecodeE,aluControlE,memOperatonE,src1E,src2E,dstDataE,cZFE,cNFE,cCFE,takeImmadE,immaditValueE,wbControlE,PCE);
--ALU
stagealumxs1: alu_muxs PORT MAP (src1E,"0000000000000000","0000000000000000",immaditValueE,"00",aluin1);
stagealumxs2: alu_muxs PORT MAP (src2E,"0000000000000000","0000000000000000",immaditValueE,"00",aluin2);
stageAlu: simple_alu PORT MAP (aluin1,aluin2,aluControlE,resultAlu,zf,nf,cf);
stageZeroFlag: zeroFlagReg PORT MAP (RES,cZFE,cNFE,cCFE,zf,nf,cf,q1,q2,q3);

stageExecuteToMem: EXEtoMEM PORT MAP (CLK,addressFromDecodeE,memOperatonE,src1E,resultAlu,dstDataE,cf,wbControlE,PCE,addressFromDecodeM,memOperatonM,src1M,resultAluM,dstDataM,cfM,wbControlM,PCM);  
--Mem
stageMEM: memUnit PORT MAP (CLK,RES,memOperatonM,resultAluM,cfM,SP,dstDataM,dataOUTMEM);
stageMemToWB: MEMToWBWB PORT MAP(CLK,addressFromDecodeM,wbControlM,resultAluM,dataOUTMEM,PCM,addressFromDecodeW,outALUW,dataOUTMEMWB,wbControlW,PCW);
--WB
stagemuxWB: alu_muxs PORT MAP ("0000000000000000","ZZZZZZZZZZZZZZZZ",outALUW,dataOUTMEMWB,wbControlW,wbout);
END s1;




