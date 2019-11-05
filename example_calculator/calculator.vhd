library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity not_a_cpu is port(
	clk: in std_logic;
	key_int: in std_logic;
	key_input: in std_logic_vector(3 downto 0);
	number_out: out std_logic_vector(7 downto 0)
);
end;

architecture fsm of not_a_cpu is
	type stage_state is (INIT, LOAD, DECODE, CALC, BCDOUT, HOLD);
	type oper_state is (ADD, SUB);
	type disp_state is (BUF, ACC);
	signal num_acc: unsigned(3 downto 0) := "0000";		-- rejestr akumulatora (4 dolne bity)
	signal num_acc_buf: unsigned(3 downto 0) := "0000";		-- rejestr akumulatora (4 dolne bity)
	signal num_buf: unsigned(3 downto 0) := x"0";		-- rejestr bufora
	signal key_catched: std_logic_vector(3 downto 0);	-- przechwycony klawisz
	signal state_curr, state_next: stage_state := INIT;	-- stan glownego procesu
	signal state_oper: oper_state;				-- wybrana operacja (dla klawisza =)
	signal state_disp: disp_state;				-- stan dla wyjscia na wyswietlacz
begin

-- przejscie do kolejnego stanu
process(clk)
begin
	if rising_edge(clk) then
		state_curr <= state_next;
	end if;
end process;

-- wyzwolony zmianą stanu
process(state_curr, key_int, key_input)
begin
	case state_curr is
	when INIT =>
		num_acc <= x"0";
		num_acc_buf <= x"0";
		num_buf <= x"0";
		key_catched <= x"D";
		state_oper <= ADD;
		state_next <= BCDOUT;
		number_out <= "11111111";
	when LOAD =>
		state_next <= LOAD;
		if key_int = '0' then
			key_catched <= key_input;
			state_next <= DECODE;
		end if;
	when DECODE =>
		state_next <= BCDOUT;
		if key_catched <= x"9" then
			num_buf <= key_catched;
			state_disp <= BUF;
		elsif key_catched = x"A" then
			state_oper <= ADD;
			state_next <= CALC;
		elsif key_catched = x"B" then
			state_oper <= SUB;
			state_next <= CALC;
		elsif key_catched = x"E" then
			state_next <= CALC;
		elsif key_catched = x"F" then
			state_next <= INIT;
		end if;
	when CALC =>
		state_next <= BCDOUT;
		case state_oper is
		when ADD =>
			num_acc_buf <= num_acc + num_buf;
		when SUB =>
			if (num_acc > x"0") then
				num_acc_buf <= num_acc - num_buf;
			end if;
		end case;
		state_disp <= ACC;
	when BCDOUT =>
		state_next <= HOLD;
		num_acc <= num_acc_buf;
		case state_disp is
		when ACC =>
			if (num_acc > x"9") then
				number_out <= x"1" & std_logic_vector(num_acc-x"a");
			else
				number_out <= x"0" & std_logic_vector(num_acc);
			end if;
		when BUF =>
			number_out <= x"F" & std_logic_vector(num_buf);
		end case;
	when HOLD =>
		state_next <= HOLD;
		if key_int = '1' then
			state_next <= LOAD;
		end if;
	end case;
end process;

end fsm;
