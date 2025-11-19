----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2025 02:25:27 PM
-- Design Name: 
-- Module Name: Six_Bit_Adder - Behavioral
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

-- Declaring ports for our 6 bit adder
entity Six_Bit_Adder is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
end Six_Bit_Adder;

architecture Behavioral of Six_Bit_Adder is

-- Component declaration for full adder
component Full_Adder_Struct is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

-- Signals to be wires for my internal nodes
signal wC0: std_logic;
signal wC1: std_logic;
signal wC2: std_logic;
signal wC3: std_logic;
signal wC4: std_logic;
signal Ci: std_logic;
signal Co: std_logic;

begin

-- 6 Bit Adder implementation using full adders chained together.
-- We ripple carry.
-- A and B are vectors of binary numbers, Ws are carries
-- And Y is our output. Each carry out is used as a carry in for the next adder.
fullAd1: Full_Adder_Struct port map(A(0), B(0), Cin, Y(0), wC0);
fullAd2: Full_Adder_Struct port map(A(1), B(1), wc0, Y(1), wC1);
fullAd3: Full_Adder_Struct port map(A(2), B(2), wc1, Y(2), wC2);
fullAd4: Full_Adder_Struct port map(A(3), B(3), wc2, Y(3), wC3);
fullAd5: Full_Adder_Struct port map(A(4), B(4), wc3, Y(4), wC4);
fullAd6: Full_Adder_Struct port map(A(5), B(5), wc4, Y(5), Cout);

end Behavioral;
