--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:41:46 05/09/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/Simple after Athens/Polar_512bits/system_testbench.vhd
-- Project Name:  Polar_512bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: system
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY system_testbench IS
END system_testbench;
 
ARCHITECTURE behavior OF system_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT system
    PORT(
         clk : IN  std_logic;
         boot : IN  std_logic;
			correct: OUT std_logic;
			inputs: OUT std_logic_vector(255 downto 0);
         outputs : OUT  std_logic_vector(255 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal boot : std_logic := '0';
	
 	--Outputs
	signal correct: std_logic;
	signal inputs: std_logic_vector(255 downto 0);
   signal outputs : std_logic_vector(255 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: system PORT MAP (
          clk => clk,
          boot => boot,
			 correct => correct,
			 inputs => inputs,
          outputs => outputs
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
		variable I : integer range 0 to (2**16)+1 := 0;
   begin		
      -- hold reset state for 100 ns.
		boot <='1';
      wait for 10*clk_period;
		while( I /= (2**16)) loop
			inputs <= std_logic_vector(to_unsigned(I,inputs'length));
			I := I + 1;
			wait for clk_period;
		end loop;
      -- insert stimulus here 
      wait;
   end process;

END;
