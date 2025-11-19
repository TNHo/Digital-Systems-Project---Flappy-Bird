----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2025 01:58:39 PM
-- Design Name: 
-- Module Name: Full_Adder_Struct - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_Struct is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
end Full_Adder_Struct;

architecture Behavioral of Full_Adder_Struct is

-- Component declaration for my and gate
component two_input_and_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

-- Component declaration for my or gate
component two_input_or_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

-- Component declaration for my xor gate
component xor_struct is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

-- Signals to be wires for my internal nodes (nets)
signal wO1: std_logic;
signal wA1: std_logic;
signal wA2: std_logic;
signal wA3: std_logic;
signal wA4: std_logic;
signal wXo1: std_logic;
signal n9: std_logic;

begin

-- The logic implementing the full adder.
-- Logic for output S
xOr1: xor_struct port map(A, B, wO1);
xOr2: xor_struct port map(wO1, Cin, S);

-- Logic for first set of AND gates
and1: two_input_and_gate port map(A, Cin, wA1);
and2: two_input_and_gate port map(B, Cin, wA2);
and3: two_input_and_gate port map(A, B, wA3);

-- Logic for Cout involving OR chained...
or1: two_input_or_gate port map(wA1, wA2, wA4);
or2: two_input_or_gate port map(wA4, wA3, Cout);

end Behavioral;
