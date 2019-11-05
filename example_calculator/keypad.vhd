library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity keypad is port(
	clk: in STD_LOGIC;								-- zegar dla iteracji po kolejnych klawiszach
	interrupt_out: out std_logic;						-- sygnal przerwania dla procesu lizcacego (pseudo-procesora)
	key_out: out STD_LOGIC_VECTOR(3 downto 0);		-- wyjscie zdekodowanego klawisza
	keypad_rows: in STD_LOGIC_VECTOR(3 downto 0);	-- wyjscie z wierszy
	keypad_cols: out STD_LOGIC_VECTOR(3 downto 0)	-- wejście do kolumn
);	
end;

architecture behavioral of keypad is
	signal interrupt: std_logic;
	signal interrupt_shift: unsigned(5 downto 0) := "111111";
	signal counter: std_logic_vector(3 downto 0);	-- licznik, przechowuje obecnie sprawdzany klawisz
	signal key_state: std_logic; 					-- bufor trzymający stan aktualnie skanowanego klawisza
	signal key_found: std_logic_vector(3 downto 0);	-- bufor zdekodowanego klawisza
begin
	process(clk)
	begin 
		if rising_edge(clk) then -- inkrementuje licznik
			if (key_state = '1') then -- inkrementuj licznik tylko gdy nie ma wcisniętego klawisza
				interrupt <= '1';
				if interrupt = '1' then
					counter <= counter+'1';
				end if;
			elsif (key_state = '0') then
				if interrupt = '1' then
					key_out <= key_found;
					interrupt <= '0';
				end if;
			end if;
			interrupt_out <= interrupt;
		end if;
	end process;
	
	process(keypad_rows, counter) -- wyzwalane zmianą licznika albo wejścia
	begin
		-- ustawienie kolumny w zaleznosci od stanu bardziej znaczacych bitow licznika
		case counter(3 downto 2) is
			when "00" =>
				keypad_cols <= "0111";
			when "01" =>
				keypad_cols <= "1011";
			when "10" =>
				keypad_cols <= "1101";
			when "11" =>
				keypad_cols <= "1110";
		end case;

		-- w zaleznosci od stanu mniej znaczacych bitow licznika przypisuje stan danego rzedu do sygnalu stanu
		-- normalnie wejscia są podciągnięte do '1', ale jesli trafi na wcisniety przycisk 
		-- (zwarcie do '0'), to stan tez sie zmieni
		case counter(1 downto 0) is
			when "00" =>
				key_state <= keypad_rows(0);
			when "01" =>
				key_state <= keypad_rows(1);
			when "10" =>
				key_state <= keypad_rows(2);
			when "11" =>
				key_state <= keypad_rows(3);
		end case;
	end process;
	
	-- konwertuje odczytany klawisz na odpowiednia wartosc
	key_found <=
		"0001" when counter = "0000" else -- 1
		"0010" when counter = "0001" else -- 2
		"0011" when counter = "0010" else -- 3
		"1010" when counter = "0011" else -- A
		"0100" when counter = "0100" else -- 4
		"0101" when counter = "0101" else -- 5
		"0110" when counter = "0110" else -- 6
		"1011" when counter = "0111" else -- B
		"0111" when counter = "1000" else -- 7
		"1000" when counter = "1001" else -- 8
		"1001" when counter = "1010" else -- 9
		"1100" when counter = "1011" else -- C
		"1111" when counter = "1100" else -- */F
		"0000" when counter = "1101" else -- 0
		"1110" when counter = "1110" else -- #/E(qual)
		"1101" when counter = "1111";     -- D
end behavioral;
