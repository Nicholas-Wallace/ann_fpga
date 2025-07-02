library ieee;
use ieee.std_logic_1164.all;

-- registrador

entity reg is
port( A : in std_logic_vector(7 downto 0);
		clk : in bit;
		en : in bit;
		S : out std_logic_vector(7 downto 0)
);
end reg;

architecture behav of reg is
begin 
	process(clk) is
		begin 
			IF(clk ' event AND clk = '1' AND en = '1') THEN
				S <= A;
			END IF;
	end process;
end behav;