----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2025 05:10:34 PM
-- Design Name: 
-- Module Name: Six_Bit_Subtractor_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Six_Bit_Subtractor_tb is
--  Port ( );
end Six_Bit_Subtractor_tb;

architecture Behavioral of Six_Bit_Subtractor_tb is

-- Declare our 6 bit adder
component Six_Bit_Subtractor is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
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
uut_add1: Six_Bit_Subtractor port map( A_in, B_in, Y_out, C_out);
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
-- 
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
