
-- VHDL Test Bench Created from source file sum.vhd -- 11/13/18  08:49:17
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

	COMPONENT sum
	PORT(
		wejscie : IN std_logic_vector(1 downto 0);          
		wyjscie : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	SIGNAL wejscie :  std_logic_vector(1 downto 0);
	SIGNAL wyjscie :  std_logic_vector(1 downto 0);

BEGIN

	uut: sum PORT MAP(
		wejscie => wejscie,
		wyjscie => wyjscie
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
