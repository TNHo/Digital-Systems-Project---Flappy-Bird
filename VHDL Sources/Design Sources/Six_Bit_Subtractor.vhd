----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2025 12:48:29 PM
-- Design Name: 
-- Module Name: Six_Bit_Subtractor - Behavioral
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

entity Six_Bit_Subtractor is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
           Cout : out STD_LOGIC);
end Six_Bit_Subtractor;

architecture Behavioral of Six_Bit_Subtractor is

-- Component declaration for full adder
component Six_Bit_Adder is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal BNOT: STD_LOGIC_VECTOR (5 downto 0);

begin

--BNOT <= not B;
Sub: Six_Bit_Adder port map(A, (not B), Y, '1', Cout);

end Behavioral;
