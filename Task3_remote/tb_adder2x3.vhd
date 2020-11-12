-- VHDL Test Bench Created from source file adder2x3.vhd -- 10/29/20  21:37:01
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

	COMPONENT adder2x3
	PORT(
		a : IN std_logic_vector(2 downto 0);
		b : IN std_logic_vector(2 downto 0);          
		w : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	SIGNAL a :  std_logic_vector(2 downto 0);
	SIGNAL b :  std_logic_vector(2 downto 0);
	SIGNAL w :  std_logic_vector(3 downto 0);

BEGIN

	uut: adder2x3 PORT MAP(
		a => a,
		b => b,
		w => w
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	a<="000";b<="000";wait for 5ns;
	a<="000";b<="001";wait for 5ns;
	a<="001";b<="000";wait for 5ns;
	a<="001";b<="001";wait for 5ns;
	a<="010";b<="100";wait for 5ns;
	a<="001";b<="010";wait for 5ns;
	a<="100";b<="110";wait for 5ns;
	a<="111";b<="100";wait for 5ns;
	a<="100";b<="001";wait for 5ns;
	a<="111";b<="001";wait for 5ns;

      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

