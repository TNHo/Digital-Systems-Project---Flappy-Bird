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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Six_Bit_Mux_tb is
--  Port ( );
end Six_Bit_Mux_tb;

architecture Behavioral of Six_Bit_Mux_tb is

component Six_Bit_Mux 
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y: out STD_LOGIC_VECTOR (5 downto 0);
           S : in STD_LOGIC);
end component;
-- declare signals for our mux
signal A_in: STD_LOGIC_VECTOR (5 downto 0);
signal B_in: STD_LOGIC_VECTOR (5 downto 0);
signal Y_out: STD_LOGIC_VECTOR (5 downto 0);
signal S_in: STD_LOGIC;

begin
-- Declare a use of the mux
uut_mux: Six_Bit_Mux port map( A_in, B_in, Y_out, S_in);

-- Begin testing
stim_proc: process
begin
A_in <= "110101"; 
B_in <= "101001";
S_in <= '0';
wait for 50ns;

A_in <= "110101"; 
B_in <= "101001";
S_in <= '1';
wait for 50ns;

A_in <= "000101"; 
B_in <= "100001";
S_in <= '0';
wait for 50ns;

A_in <= "000101"; 
B_in <= "100001";
S_in <= '1';
wait for 50ns;
wait;
end process;

end Behavioral;


