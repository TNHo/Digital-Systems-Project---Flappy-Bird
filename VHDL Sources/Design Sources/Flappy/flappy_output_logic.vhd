
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


-- Hard coded signals
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';

-- Internal signals;


begin

-- Instances of components / output assignments

-- Single bit test port
testport <= gnd;

end Structural;