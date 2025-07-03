library ieee;
use ieee.std_logic_1164.all;

entity adder is
	port(
		A_ADDER, B_ADDER : in std_logic_vector(7 downto 0);
		S_ADDER : out std_logic_vector(7 downto 0)
	);
end entity adder;

architecture main of adder is

	component full_adder is
		port(
		a, b, cin : in std_logic;
		cout, s   : out std_logic
		);
	end component full_adder;

	signal C1, C2, C3, C4, C5, C6, C7, C8 : std_logic;
begin 
	
	FA0: full_adder port map(a => A_ADDER(0), b => B_ADDER(0), cin => '0', s => S_ADDER(0), cout => C1);
	FA1: full_adder port map(a => A_ADDER(1), b => B_ADDER(1), cin => C1 , s => S_ADDER(1), cout => C2);
	FA2: full_adder port map(a => A_ADDER(2), b => B_ADDER(2), cin => C2 , s => S_ADDER(2), cout => C3);
	FA3: full_adder port map(a => A_ADDER(3), b => B_ADDER(3), cin => C3 , s => S_ADDER(3), cout => C4);
	FA4: full_adder port map(a => A_ADDER(4), b => B_ADDER(4), cin => C4 , s => S_ADDER(4), cout => C5);
	FA5: full_adder port map(a => A_ADDER(5), b => B_ADDER(5), cin => C5 , s => S_ADDER(5), cout => C6);
	FA6: full_adder port map(a => A_ADDER(6), b => B_ADDER(6), cin => C6 , s => S_ADDER(6), cout => C7);
	FA7: full_adder port map(a => A_ADDER(7), b => B_ADDER(7), cin => C7 , s => S_ADDER(7), cout => C8);
	
	--S(8) <= C8;
end architecture main;
	