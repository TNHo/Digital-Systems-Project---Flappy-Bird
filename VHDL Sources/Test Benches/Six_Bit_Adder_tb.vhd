----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2023 01:10:50 PM
-- Design Name: 
-- Module Name: xor_struct_tb - Behavioral
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
entity Six_Bit_Adder_tb is
end Six_Bit_Adder_tb;
architecture Behavioral of Six_Bit_Adder_tb is
-- Declare our 6 bit adder
component Six_Bit_Adder
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Cin : in STD_LOGIC;
           Y: out STD_LOGIC_VECTOR (5 downto 0);
           Cout : out STD_LOGIC);
end component;
-- declare signals for our 6 bit adder
signal A_in: STD_LOGIC_VECTOR (5 downto 0);
signal B_in: STD_LOGIC_VECTOR (5 downto 0);
signal C_in: STD_LOGIC;
signal Y_out: STD_LOGIC_VECTOR (5 downto 0);
signal C_out: STD_LOGIC;
begin
-- Declare a use of the 6 bit adder
uut_add1: Six_Bit_Adder port map( A_in, B_in, C_in, Y_out, C_out);
-- Begin testing
stim_proc: process
begin
-- A set of inputs that DO result in an overflow
A_in <= "111010"; 
B_in <= "100101";
C_in <= '0';
wait for 50ns;
A_in <= "111010"; 
B_in <= "100101";
C_in <= '1';
wait for 50ns;
-- The inputs that DON'T result in a overflow
A_in <= "000101"; 
B_in <= "100001";
C_in <= '0';
wait for 50ns;
A_in <= "000101"; 
B_in <= "100001";
C_in <= '1';
wait for 50ns;
-- A third set of inputs to be sure
A_in <= "100101"; 
B_in <= "101001";
C_in <= '0';
wait for 50ns;
A_in <= "100101"; 
B_in <= "101001";
C_in <= '1';
wait for 50ns;
wait;
end process;

end Behavioral;


