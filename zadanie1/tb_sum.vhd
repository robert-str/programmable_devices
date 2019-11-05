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
	wejscie <= "11"; wait for 10 ns;
	wejscie <= "01"; wait for 10 ns;
	wejscie <= "10"; wait for 10 ns;
	wejscie <= "11"; wait for 10 ns;	
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

