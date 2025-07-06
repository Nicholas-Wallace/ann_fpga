library ieee;
use ieee.std_logic_1164.all;

-- testar com vector

-- Entidade
entity func is
	port(
	E : in std_logic_vector(7 downto 0);
	O : out std_logic_vector(7 downto 0)
	);
end func;

-- Arquitetura
architecture main of func is 
	begin 
		process (E(7))
		begin 
			O(0) <= '1';
			O(1) <= E(7);
			O(2) <= E(7);
			O(3) <= E(7);
			O(4) <= E(7);
			O(5) <= E(7);
			O(6) <= E(7);
			O(7) <= E(7);
			
		end process;
end architecture main;
