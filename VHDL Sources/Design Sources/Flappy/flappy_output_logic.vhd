
-- This is a combinational logic circuit mapping current state to
-- to all outputs of the controller

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_output_logic is
    Port ( S0: in std_logic;
           S1: in std_logic;
           J : out STD_LOGIC;
           F : out STD_LOGIC;
           D : out STD_LOGIC;
           ld_YPos : out STD_LOGIC;
           ld_YVel : out STD_LOGIC;
           sel_PosReset: out std_logic;
           sel_VelJump: out std_logic;  
           testport : out std_logic);
end flappy_output_logic;


architecture Structural of flappy_output_logic is

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
--NOR
component two_input_nor_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

-- Hard coded signals
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';

-- Internal signals;
signal S0NotO: std_logic;
signal S1NotO: std_logic;
signal WOrO4: std_logic;
signal WOrO5: std_logic;
signal WNorO1: std_logic;
signal WAndOut4: std_logic;

begin

-- Instances of components / output assignments
S0NotO <= not S0;
S1NotO <= not S1;

-- Immediate output assign
D <= S0NotO; 
ld_YVel <= S0;
sel_PosReset <= S1;

And5: two_input_and_gate port map(S0, S1NotO, J);
Or5: two_input_or_gate port map(S0NotO, S1NotO, WOrO4);
And6: two_input_and_gate port map(S1, S0, WAndOut4);
F <= WAndOut4; -- immediate set F to And6's output
Or6: two_input_or_gate port map(S0, S1, WOrO5);
And7: two_input_and_gate port map(WOrO4, WOrO5, sel_VelJump);
Nor1: two_input_nor_gate port map(S0NotO, S1NotO, WNorO1);
Or7: two_input_or_gate port map(WNorO1, WAndOut4, ld_YPos);

-- Single bit test port
testport <= gnd;

end Structural;