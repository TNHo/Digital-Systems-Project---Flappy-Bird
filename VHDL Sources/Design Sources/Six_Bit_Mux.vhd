----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2025 02:25:27 PM
-- Design Name: 
-- Module Name: Six_Bit_Mux - Behavioral
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

entity Six_Bit_Mux is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
           S : in STD_LOGIC);
end Six_Bit_Mux;

architecture Behavioral of Six_Bit_Mux is

begin
    -- implement the 2:1 mux
    with S select Y <=
        A when '0',
        B when others;
-- if not 0, it HAS to be 1, so b
end Behavioral;
