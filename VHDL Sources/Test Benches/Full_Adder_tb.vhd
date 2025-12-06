----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2025 02:01:01 PM
-- Design Name: 
-- Module Name: Full_Adder_tb - Behavioral
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
use ieee.numeric_std.all;

entity Full_Adder_tb is
--  Port ( );
end Full_Adder_tb;

architecture Behavioral of Full_Adder_tb is

component Full_Adder_Struct 
Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin: in STD_LOGIC;
           Cout: out STD_LOGIC;
           S : out STD_LOGIC);
end component;

-- Signal declarations for my adder
signal A_in: std_logic;
signal B_in: std_logic;
signal C_in: std_logic;
signal C_out: std_logic;
signal S_out: std_logic;
signal kk: integer;

begin

uut_FA: Full_Adder_Struct port map( A_in, B_in, C_in, C_out, S_out); -- Tell the test bench we'll USE a full adder.

-- Begin loop to test various possible outputs for my full adder
process is
begin
    for kk in 0 to 7 loop
       -- convert integer to bits
       (A_in, B_in, C_in) <= std_logic_vector(to_unsigned(kk, 3)); 
    
        wait for 50ns;
    end loop;
end process;

end Behavioral;
 