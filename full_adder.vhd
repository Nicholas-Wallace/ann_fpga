library ieee;
use ieee.std_logic_1164.all;

-- Entidade
entity full_adder is
	port(
	a, b, cin : in bit;
	cout, s   : out bit
	);
end entity full_adder;

-- Arquitetura
architecture main of full_adder is 
	begin 
	s <= a xor b xor cin;
	cout <= (a and b) or (a and cin) or (b and cin);
end architecture main;