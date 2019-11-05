library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity calculator is port(
	clk: in std_logic;				-- zegar
	keypad_rows: in std_logic_vector(3 downto 0);	-- keypad: rzedy
	keypad_cols: out std_logic_vector(3 downto 0);	-- keypad: kolumny
	bcd_out: out std_logic_vector(7 downto 0)	-- fsm: wyjscie bcd
);
end;

architecture abacus of calculator is
	component keypad is port(
		clk: in STD_LOGIC;				-- zegar dla iteracji po kolejnych klawiszach
		interrupt_out: out std_logic;			-- sygnal przerwania dla procesu lizcacego (pseudo-procesora)
		key_out: out STD_LOGIC_VECTOR(3 downto 0);	-- wyjscie zdekodowanego klawisza
		keypad_rows: in STD_LOGIC_VECTOR(3 downto 0);	-- wyjscie z wierszy
		keypad_cols: out STD_LOGIC_VECTOR(3 downto 0)	-- wejście do kolumn
	);
	end component;

	component not_a_cpu is port(
		clk: in std_logic;				-- zegar
		key_int: in std_logic;				-- stan odczytu z keypada
		key_input: in std_logic_vector(3 downto 0);	-- przemapowany numer klawiatury
		number_out: out std_logic_vector(3 downto 0)	-- numer wyswietlany na wyswietlaczu (zalezy od wcisnietego klawisza)
	);
	end component;

	signal key_catch: std_logic;			-- sygnal stanu skanowania (keypad -> proc)
	signal key_code: std_logic_vector(3 downto 0);	-- odczytany klawisz (keymap -> processor)
begin
	-- mapowanie komponentow
	input_keypad: keypad port map(clk, key_catch, key_code, keypad_rows, keypad_cols);
	calc_proc: not_a_cpu port map(clk, key_catch, key_code, bcd_out);
end abacus;
