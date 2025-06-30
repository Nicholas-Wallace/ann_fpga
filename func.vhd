library ieee;
use ieee.std_logic_1164.all;

-- testar com vector

-- Entidade
entity func is
	port(
	E0, E1, E2, E3, E4, E5, E6, E7 : in bit;
	O0, O1, O2, O3, O4, O5, O6, O7 : out bit
	);
end func;

-- Arquitetura
architecture main of func is 
	begin 
		process (E7)
		begin 
			O0 <= not E7;
			O1 <= '0';
			O2 <= '0';
			O3 <= '0';
			O4 <= '0';
			O5 <= '0';
			O6 <= '0';
			O7 <= '0';
			
		end process;
end architecture main;