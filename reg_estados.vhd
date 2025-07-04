library ieee;
use ieee.std_logic_1164.all;

-- registrador

entity reg_estados is
port( A_REG : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		en_REG : in std_logic;
		S_REG : out std_logic_vector(3 downto 0)
);
end reg_estados;

architecture behav of reg_estados is
begin 
	process(clk) is
		begin 
			IF(clk ' event AND clk = '1' AND en_REG = '1') THEN
				S_REG <= A_REG;
			END IF;
	end process;
end behav;