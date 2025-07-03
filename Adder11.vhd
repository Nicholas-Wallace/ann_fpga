library ieee;
use ieee.std_logic_1164.all;

entity Adder11 is
	port(
		A, B : in std_logic_vector(10 downto 0);
		S : out std_logic_vector(11 downto 0)
	);
end entity Adder11;

architecture behav of Adder11 is
	
	component full_adder is
	port(
		a, b, cin : in std_logic;
		s, cout : out std_logic
	);
	end component;

	-- Sinais auxiliares:
	signal carries :std_logic_vector(11 downto 0);
	signal provisorioSoma :std_logic_vector(11 downto 0);
	
	begin
	
	carries(0) <= '0';
	
	FA0 : full_adder port map(a => A(0), b => B(0), cin => carries(0), s => provisorioSoma(0), cout => carries(1));
	FA1 : full_adder port map(a => A(1), b => B(1), cin => carries(1), s => provisorioSoma(1), cout => carries(2));
	FA2 : full_adder port map(a => A(2), b => B(2), cin => carries(2), s => provisorioSoma(2), cout => carries(3));
	FA3 : full_adder port map(a => A(3), b => B(3), cin => carries(3), s => provisorioSoma(3), cout => carries(4));
	FA4 : full_adder port map(a => A(4), b => B(4), cin => carries(4), s => provisorioSoma(4), cout => carries(5));
	FA5 : full_adder port map(a => A(5), b => B(5), cin => carries(5), s => provisorioSoma(5), cout => carries(6));
	FA6 : full_adder port map(a => A(6), b => B(6), cin => carries(6), s => provisorioSoma(6), cout => carries(7));
	FA7 : full_adder port map(a => A(7), b => B(7), cin => carries(7), s => provisorioSoma(7), cout => carries(8));
	FA8 : full_adder port map(a => A(8), b => B(8), cin => carries(8), s => provisorioSoma(8), cout => carries(9));
	FA9 : full_adder port map(a => A(9), b => B(9), cin => carries(9), s => provisorioSoma(9), cout => carries(10));
	FA10: full_adder port map(a => A(10), b => B(10), cin => carries(10), s => provisorioSoma(10), cout => carries(11));

	provisorioSoma(11) <= carries(11);
	
	S <= provisorioSoma;
	
end architecture behav;