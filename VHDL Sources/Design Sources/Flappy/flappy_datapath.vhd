
-- Component to implement all necessary mathematical and multi-bit operations 
-- for the flappy game simulator project. 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_datapath is
  Port (clk:  in std_logic; 
        ld_YPos: in std_logic; -- Updates YPosReg when 1 
        ld_YVel: in std_logic; -- Updates YVelReg when 1
        sel_PosReset: in std_logic; -- Select bit: 1 means reset YPos to 10
        sel_VelJump: in std_logic; -- Select bit: 1 means set YVel to 3       
        below_gnd: out std_logic; -- Character is below ground (YPos < ground_level)
        ground_level: in std_logic_vector (5 downto 0);
        YPos: inout std_logic_vector (5 downto 0);
        testport: out std_logic_vector (5 downto 0));    
end flappy_datapath;

architecture structural of flappy_datapath is

-- Components we need (add below):
-- Component declaration for full adder
component Six_Bit_Adder is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
end component;
-- mux
component Six_Bit_Mux is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
           S : in STD_LOGIC);
end component;
-- reg
component reg_6bit is
    Port ( D : in STD_LOGIC_VECTOR (5 downto 0);
           Q : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           LD : in STD_LOGIC;
           CLR : in STD_LOGIC;
           CLK : in STD_LOGIC);
end component;
-- comparator
component lessthan_6bit is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           E : out STD_LOGIC);
end component;

-- hardcoded signals we need (add others as needed):
signal gnd: std_logic := '0'; -- to hardcode inputs to 0
signal tmp: std_logic; -- to be tied to unused outputs.

-- Additional signals for internal nets
signal YVel: std_logic_vector (5 downto 0); -- signal to use as output of velocity register
-- Add other signals for interal nets as needed
signal wMuxV: std_logic_vector (5 downto 0);
signal wMuxP: std_logic_vector (5 downto 0);
signal wVRegO: std_logic_vector (5 downto 0);
signal wPRegO: std_logic_vector (5 downto 0);
signal wPosAd: std_logic_vector (5 downto 0);
signal wVDec: std_logic_vector (5 downto 0);
           
begin

-- Add instances of components here
-- fullAd1: Full_Adder_Struct port map(A(0), B(0), Cin, Y(0), wC0);
YVelReg: reg_6bit port map(wMuxV, wVRegO, ld_YVel, '0', clk);
YPosReg: reg_6bit port map(wMuxP, wPRegO, ld_YPos, '0', clk);
VelMux: Six_BitMux port map(wVDec, "000011", wMuxV, sel_VelJump);


-- The testport can be used for evaluating internal nets.
--    Test a bus
testport <= YVel; -- default . . . output velocity value.

--   Test individual bits 
--   testport(0) <= gnd;



end structural;
