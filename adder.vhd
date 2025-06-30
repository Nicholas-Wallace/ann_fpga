library ieee;
use ieee.std_logic_1164.all;

entity adder is
	port (A0, A1, A2, A3, A4, A5, A6, A7,
			B0, B1, B2, B3, B4, B5, B6, B7 : in bit;
			S0, S1, S2, S3, S4, S5, S6, S7, COUT : out bit
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
	
	FA0: full_adder port map(a => A0, b => B0, cin => '0', s => S0, cout => C1);
	FA1: full_adder port map(a => A1, b => B1, cin => C1 , s => S1, cout => C2);
	FA2: full_adder port map(a => A2, b => B2, cin => C2 , s => S2, cout => C3);
	FA3: full_adder port map(a => A3, b => B3, cin => C3 , s => S3, cout => C4);
	FA4: full_adder port map(a => A4, b => B4, cin => C4 , s => S4, cout => C5);
	FA5: full_adder port map(a => A5, b => B5, cin => C5 , s => S5, cout => C6);
	FA6: full_adder port map(a => A6, b => B6, cin => C6 , s => S6, cout => C7);
	FA7: full_adder port map(a => A7, b => B7, cin => C7 , s => S7, cout => C8);
	
	COUT <= C8;
end architecture main;
	
	
