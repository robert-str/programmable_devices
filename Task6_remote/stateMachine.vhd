library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------
entity stateMachine is port( 
 i_clk:     in  std_logic;
 i_drv:     in  std_logic;
 o_flag:   out std_logic;
 timeCnt:   inout std_logic_vector (7 downto 0));
end;
-----------------------------------------------------
-----------------------------------------------------
architecture sequential of stateMachine is
type state is (Sidle, Sstage1, Sflag);
signal currState, nextState: state;
--signal timeCnt: std_logic_vector (7 downto 0) := X"FF";
signal timerFlag: std_logic_vector (7 downto 0) := "00000000";
begin
-----------------------------------------------------
stateMemory: process (i_clk)

begin
-- if( rising_edge(i_clk) ) then
--	if(nextState /= currState) then
--	  if(timeCnt = timerFlag) then
--	   currState <= nextState;
--	   timeCnt <= "00000000";
--	  else
--           timeCnt <= timeCnt+1;
--	  end if;
--	end if;
-- end if;
 if( rising_edge(i_clk) ) then
	--if(nextState /= currState) then
	if(timerFlag=X"FF") then
           timeCnt <= "00000000";
	else	   
	   timeCnt <= timeCnt+1;
	end if;

	currState <= nextState;
 end if;
end process stateMemory;
---------------------------------------------------
stateDecode:process(i_drv,currState,timeCnt)
begin
 case currState is
  when	Sidle =>
	o_flag <= '0';
	timerFlag <= X"FF";
	if(i_drv='0') then
		nextState <= Sstage1;
	else
		nextState <= Sidle;
	end if;
  when	Sstage1 =>
	o_flag <= '0';
	timerFlag <= X"03";
	if(i_drv='0') then
		 if(timerFlag=timeCnt) then
			nextState <= Sflag;
		else
			nextState <= Sstage1;
		end if;
	else
		nextState <= Sidle;
	end if;
 when	Sflag =>
	o_flag <= '1';	
	timerFlag <= X"FF";	
	if(i_drv='0') then
		nextState <= Sidle;
	else
		nextState <= Sflag;
	end if;
 when	others =>
	nextState <= Sidle;
	o_flag <= '0';
	timerFlag <= X"FF";
end case;
end process stateDecode;
-----------------------------------------------------
end sequential;
