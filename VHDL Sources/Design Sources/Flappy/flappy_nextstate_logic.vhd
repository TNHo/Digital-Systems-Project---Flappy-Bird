

-- This is a combinational logic circuit mapping all inputs and current state
-- to the next state.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_nextstate_logic is
    Port ( B : in STD_LOGIC;
           below_gnd : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           N0 : out STD_LOGIC;
           N1 : out STD_LOGIC;
           testport : out std_logic); 
end flappy_nextstate_logic;

architecture Structural of flappy_nextstate_logic is

-- Componenents needed:




-- Hard coded signals
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';

-- Internal signals;


begin

-- Instances of components


-- Single bit test port
testport <= gnd;

end Structural;
