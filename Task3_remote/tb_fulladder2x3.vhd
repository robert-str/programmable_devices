-- VHDL Test Bench Created from source file fullAdder2x3.vhd -- 11/12/20  07:18:45
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Lattice recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "source->import"
-- menu in the ispLEVER Project Navigator to import the testbench.
-- Then edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT fullAdder2x3
	PORT(
		ai : IN std_logic_vector(2 downto 0);
		bi : IN std_logic_vector(2 downto 0);          
		res : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	SIGNAL ai :  std_logic_vector(2 downto 0);
	SIGNAL bi :  std_logic_vector(2 downto 0);
	SIGNAL res :  std_logic_vector(3 downto 0);

BEGIN

	uut: fullAdder2x3 PORT MAP(
		ai => ai,
		bi => bi,
		res => res
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	ai <= "000"; bi <= "000";wait for 5ns;
	ai <= "101"; bi <= "101";wait for 5ns;
	ai <= "011"; bi <= "010";wait for 5ns;
	ai <= "100"; bi <= "100";wait for 5ns;
	ai <= "001"; bi <= "011";wait for 5ns;
	ai <= "011"; bi <= "100";wait for 5ns;
	ai <= "111"; bi <= "111";wait for 5ns;
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

