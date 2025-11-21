

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_6bit is
    Port ( D : in STD_LOGIC_VECTOR (5 downto 0);
           Q : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           LD : in STD_LOGIC;
           CLR : in STD_LOGIC;
           CLK : in STD_LOGIC);
end reg_6bit;

architecture Behavioral of reg_6bit is

begin
process(CLK) begin
    -- Process for each rising edge
    if rising_edge(CLK) then
        -- load - do nothing when 0
        if LD  = '1' then
            Q <= D;
        end if;
        -- clear 
        if CLR = '1' then 
            Q <= "000000";
        end if;
        --
    end if;
end process;

end Behavioral;
