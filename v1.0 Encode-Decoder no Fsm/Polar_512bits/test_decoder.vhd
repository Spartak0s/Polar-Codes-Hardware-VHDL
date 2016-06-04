--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:46:36 05/13/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/v1.0 Encode-Decode no Fsm/Polar_512bits/test_decoder.vhd
-- Project Name:  Polar_512bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder512
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_decoder IS
END test_decoder;
 
ARCHITECTURE behavior OF test_decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder512
    PORT(
         inputs : IN  data;
         clk : IN  std_logic;
         rst : IN  std_logic;
         outputs : OUT  std_logic_vector(255 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inputs : std_logic_vector(0 to 511) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal outputs : std_logic_vector(255 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder512 PORT MAP (
          inputs => inputs,
          clk => clk,
          rst => rst,
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
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		inputs <= (others =>'0');
      wait for 50ns;
		inputs(0) <= '1';
		wait for 50ns;
		inputs(0) <= '0';
		inputs(1) <= '1';
		wait for 50ns;
		inputs(0) <= '1';
		inputs(1) <= '1';
		wait for 50ns;
		inputs(0) <= '0';
		inputs(1) <= '0';
		inputs(2) <= '1';
		wait for 50ns;
		inputs(0) <= '1';
		inputs(1) <= '0';
		inputs(2) <= '1';
		wait for 50ns;
		inputs(0) <= '1';
		inputs(1) <= '1';
		inputs(2) <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
