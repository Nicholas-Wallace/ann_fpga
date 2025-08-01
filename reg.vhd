library ieee;
use ieee.std_logic_1164.all;

-- registrador

entity reg is
port( A_REG : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		en : in std_logic;
		S_REG : out std_logic_vector(7 downto 0)
);
end reg;

architecture behav of reg is
begin 
	process(clk) is
		begin 
			IF(clk ' event AND clk = '1' AND en = '1') THEN
				S_REG <= A_REG;
			END IF;
	end process;
end behav;