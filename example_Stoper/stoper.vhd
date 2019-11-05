library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity stoper is
port(
start, stop, reset: in std_logic;
clk: in std_logic;
r: buffer std_logic_vector(3 downto 0);
disp: out std_logic_vector(3 downto 0));
end;

architecture simply of stoper is
signal t,s,d,j: integer range 0 to 9;
--signal temp: std_logic_vector(3 downto 0);
type state is(s0, s1, s2);
signal currState, nextState: state;
signal ZL: std_logic;
begin

digit: process(clk)
begin
if rising_edge(clk) then
	if reset='1' then t<=0; s<=0; d<=0; j<=0; else
		if (ZL='1') then
			if(j=9) then
			  if(d=9) then
				if(s=9) then
					if(t=9) then
					t<=0;
					else
					t<=t+1;
					end if;
				s<=0;
				else
				s<=s+1;
				end if;
			   d<=0;
			   else
			   d<=d+1;
			   end if;
			j<=0;
			else
			j<=j+1;
			end if;
		end if;
	end if;
end if;
end process digit;

rej: process(clk)
begin
if rising_edge(clk) then
	if reset='1' then r<="1110"; else
		r<=r(2 downto 0)&r(3);
	end if;
--r<=temp;
end if;
end process rej;

finally: process(clk)
begin
case r is
when "1110"	=>	disp(3 downto 0) <= std_logic_vector(to_unsigned(j, 4));
when "1101"	=>	disp(3 downto 0) <= std_logic_vector(to_unsigned(d, 4));
when "1011"	=>	disp(3 downto 0) <= std_logic_vector(to_unsigned(s, 4));
when others	=>	disp(3 downto 0) <= std_logic_vector(to_unsigned(t, 4));
end case;  
end process finally;

stateMemory: process (clk)
begin
 if rising_edge(clk) then
  if(currState /= nextState) then
   currState <= nextState;
 end if;
end if;
end process stateMemory;

finalfinally: process(start, stop, currState)
begin
	case currState is
	when	s0 =>
		--t<=0; s<=0; d<=0; j<=0; 
		ZL<='0';
		if(start='1') then 
			nextState <= s1;
		else
			nextState <= s0;
		end if;
	when 	s1 =>
		ZL<='1';
		if(stop='1') then
			nextState <= s2;
		else
			nextState <= s1;
		end if;
	when	s2 =>
		ZL<='0';
		if(start='1') then 
			nextState <= s1;
		else
			nextState <= s2;
		end if;
	end case;
end process finalfinally;
	
end simply;
