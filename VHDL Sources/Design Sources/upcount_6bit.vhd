

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity upcount_6bit is
    Port ( CLK : in std_logic;
           L : in STD_LOGIC_VECTOR (5 downto 0);
           ld : in STD_LOGIC;
           CNT : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (5 downto 0);
           tc : out STD_LOGIC
           );
end upcount_6bit;

architecture Behavioral of upcount_6bit is

-- declare our 6 bit adder
component Six_Bit_Adder
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Cin : in STD_LOGIC;
           Y: out STD_LOGIC_VECTOR (5 downto 0);
           Cout : out STD_LOGIC);
end component;

-- declare our mux
component Six_Bit_Mux
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : out STD_LOGIC_VECTOR (5 downto 0);
           S : in STD_LOGIC);
end component;

-- declare or gate
component two_input_or_gate
    port (  A : in std_logic;
            B : in std_logic;
            Q   : out std_logic);
end component; 

-- declare equality
component equality_6bit_struct 
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0) := "111111";
           Y : out STD_LOGIC);
end component;

-- declare register
component reg_6bit
    Port ( D : in STD_LOGIC_VECTOR (5 downto 0);
           Q : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           LD : in STD_LOGIC;
           CLR : in STD_LOGIC;
           CLK : in STD_LOGIC);
end component;
-- declare signals (wire names)
signal wld: std_logic;
signal wl: std_logic_vector (5 downto 0);
signal wCn: std_logic;
signal wClr: std_logic;
signal wE: std_logic;
signal wMux: std_logic_vector (5 downto 0);
signal wAdder: std_logic_vector (5 downto 0);
signal wQ: std_logic_vector (5 downto 0);
signal wOr: std_logic;
signal cout: std_logic; -- useless carry out

begin

mux1: Six_Bit_Mux port map(wAdder, L, wMux, Ld);
or1: two_input_or_gate port map(Ld, CNT, wOr); 
resister: reg_6bit port map(wMux, Q, wOr, CLR, CLK);  
add6: Six_Bit_Adder port map(Q, "000001", '0', wAdder, cout);
equali: equality_6bit_struct port map(Q, "111111", tc);

end Behavioral;
