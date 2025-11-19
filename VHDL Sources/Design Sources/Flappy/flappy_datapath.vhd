
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


-- hardcoded signals we need (add others as needed):
signal gnd: std_logic := '0'; -- to hardcode inputs to 0
signal tmp: std_logic; -- to be tied to unused outputs.

-- Additional signals for internal nets
signal YVel: std_logic_vector (5 downto 0); -- signal to use as output of velocity register
-- Add other signals for interal nets as needed
            
           
begin

-- Add instances of components here




-- The testport can be used for evaluating internal nets.
--    Test a bus
testport <= YVel; -- default . . . output velocity value.

--   Test individual bits 
--   testport(0) <= gnd;



end structural;
