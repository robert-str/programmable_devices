LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT stateMachine1
	PORT(
		i_clk : IN std_logic;
		i_btn : IN std_logic_vector(1 downto 0);          
		o_clkSlow : OUT std_logic;
		o_diodes : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL i_clk :  std_logic;
	SIGNAL i_btn :  std_logic_vector(1 downto 0);
	SIGNAL o_clkSlow :  std_logic;
	SIGNAL o_diodes :  std_logic_vector(7 downto 0);

BEGIN

	uut: stateMachine1 PORT MAP(
		i_clk => i_clk,
		i_btn => i_btn,
		o_clkSlow => o_clkSlow,
		o_diodes => o_diodes
	);


-- *** Test Bench - User Defined Section ***
  clk: PROCESS
	constant period: time := 10 ns; 
   BEGIN
      i_clk <='0';
      loop
	wait for period/2;
      	i_clk <= not i_clk; 
      end loop;
      wait for (period*2000); -- will wait forever
   wait;
   END PROCESS;

   btns: PROCESS
   constant period: time := 10 ns; 
   BEGIN
      i_btn <= "00";
      wait for 200 ns;
      i_btn(1) <= '1';
      wait for (period*200);
      i_btn(1) <= '0';
      wait for (period*200);
      i_btn(0) <= '1';
      wait for (period*200);
      i_btn(0) <= '0';
      wait for (period*200);
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

