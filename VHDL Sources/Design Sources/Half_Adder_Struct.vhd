----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2025 01:58:39 PM
-- Design Name: 
-- Module Name: Half_Adder_Struct - Behavioral
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

entity Half_Adder_Struct is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC);
end Half_Adder_Struct;

architecture Behavioral of Half_Adder_Struct is

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

begin

-- The logic implementing the half adder.
carryAnd: two_input_and_gate port map (A, B, C);
sBit: xor_struct port map(A, B, S);
end Behavioral;
