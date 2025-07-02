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
			O(0) <= not E(7);
			O(1) <= '0';
			O(2) <= '0';
			O(3) <= '0';
			O(4) <= '0';
			O(5) <= '0';
			O(6) <= '0';
			O(7) <= '0';
			
		end process;
end architecture main;