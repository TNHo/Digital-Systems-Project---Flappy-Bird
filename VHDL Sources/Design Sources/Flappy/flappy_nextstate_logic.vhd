

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
-- and
component two_input_and_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
-- or
component two_input_or_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;



-- Hard coded signals
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';

-- Internal signals;
signal Bnot: std_logic;
signal S1NotN: std_logic;
signal S0NotN: std_logic;
signal BGndNot: std_logic;
signal WOrO1: std_logic;
signal WOrO2: std_logic;
signal WOrO3: std_logic;
signal WAndOut1: std_logic;
signal WAndOut2: std_logic;
signal WAndOut3: std_logic;

begin

-- Instances of components
-- Inverters
Bnot <= not B;
BGndNot <= not below_gnd;
S1NotN <= not S1;
S0NotN <= not S0;
-- Logic of the next state
Or1: two_input_or_gate port map(below_gnd, S1, WOrO1);
Or2: two_input_or_gate port map(S1NotN, S0NotN, WOrO3);
Or4: two_input_or_gate port map(Bnot, WOrO3, WOrO2);
And1: two_input_and_gate port map(S1NotN, S0, WAndOut1);
And2: two_input_and_gate port map(WOrO1, WOrO2, N0);
And4: two_input_and_gate port map(Bnot, S1, WAndOut2);
And3: two_input_and_gate port map(BGndNot, WAndOut2, WAndOut3);
Or3: two_input_or_gate port map(WAndOut1, WAndOut3, N1);

-- Single bit test port
testport <= gnd;

end Structural;
