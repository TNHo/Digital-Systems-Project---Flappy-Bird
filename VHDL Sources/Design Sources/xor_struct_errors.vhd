----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2023 01:05:16 PM
-- Design Name: 
-- Module Name: xor_struct - Behavioral
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

entity xor_struct is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end xor_struct;

architecture Structural of xor_struct is

-- Component declaration for my nand gate
component my_nand2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

-- Signals to be wires for my internal nodes (nets)
signal net1: std_logic;
signal net2: std_logic;
signal net3: std_logic;



begin

nand1: my_nand2 port map ( A, B, net1);
nand2: my_nand2 port map ( A, net1, net2);
nand3: my_nand2 port map ( B, net1, net3);
nand4: my_nand2 port map ( net2, net3, Q);

end Structural;
