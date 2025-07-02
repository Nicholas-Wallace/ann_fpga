library ieee;
use ieee.std_logic_1164.all;

entity adder is
	port(
		A, B : in std_logic_vector(7 downto 0);
		S : out std_logic_vector(8 downto 0)
	);
end entity adder;

architecture main of adder is

	component full_adder is
		port(
		a, b, cin : in bit;
		cout, s   : out bit
		);
	end component full_adder;

	signal C1, C2, C3, C4, C5, C6, C7, C8 : bit;
begin 
	
	FA0: full_adder port map(a => A(0), b => B(0), cin => '0', s => S(0), cout => C1);
	FA1: full_adder port map(a => A(1), b => B(1), cin => C1 , s => S(1), cout => C2);
	FA2: full_adder port map(a => A(2), b => B(2), cin => C2 , s => S(2), cout => C3);
	FA3: full_adder port map(a => A(3), b => B(3), cin => C3 , s => S(3), cout => C4);
	FA4: full_adder port map(a => A(4), b => B(4), cin => C4 , s => S(4), cout => C5);
	FA5: full_adder port map(a => A(5), b => B(5), cin => C5 , s => S(5), cout => C6);
	FA6: full_adder port map(a => A(6), b => B(6), cin => C6 , s => S(6), cout => C7);
	FA7: full_adder port map(a => A(7), b => B(7), cin => C7 , s => S(7), cout => C8);
	
	S(8) <= C8;
end architecture main;
	