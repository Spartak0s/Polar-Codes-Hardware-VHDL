--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:33:32 05/09/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/Simple after Athens/Polar_512bits/test_encoder512.vhd
-- Project Name:  Polar_512bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Encoder512
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
use ieee.math_real.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_encoder512 IS
END test_encoder512;
 
ARCHITECTURE behavior OF test_encoder512 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoder512
    PORT(
         inputs : IN  std_logic_vector(255 downto 0);
         outputs : OUT  std_logic_vector(511 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inputs : std_logic_vector(255 downto 0) := (others => '0');

 	--Outputs
   signal outputs : std_logic_vector(511 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder512 PORT MAP (
          inputs => inputs,
          outputs => outputs
        );

 

   -- Stimulus process
   stim_proc: process
		variable I : integer range 0 to (2**256)+1 := 0;
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
		while( I /= (2**20)) loop
			inputs <= std_logic_vector(to_unsigned(I,inputs'length));
			I := I + 1;
			wait for 1ns;
		end loop;
      -- insert stimulus here 
      wait;
   end process;

END;
