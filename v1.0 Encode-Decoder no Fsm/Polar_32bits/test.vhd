--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:10:37 03/25/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/Polar32/test.vhd
-- Project Name:  Polar32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder16
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
library std;
use std.textio.all;
library work;
use work.MyPackage.all;
use work.txt_util.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         inputs : IN  data;
         outputs : OUT  std_logic_vector(N/2-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk,endoffile : std_logic := '1';
   signal rst : std_logic := '0';
   signal inputs : data := (others=>(others => '0'));

 	--Outputs
   signal outputs : std_logic_vector(N/2-1 downto 0);
   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          clk => clk,
          rst => rst,
          inputs => inputs,
          outputs => outputs
        );

   -- Clock process definitions
	-- Clock process definitions
--   process
--	begin
--	loop
--	wait for clk_period/2;
--	clk <='1';
--	wait for clk_period/2;
--	clk <='0';
--	end loop;
--	end process;
   clk <= not clk after clk_period/2;
	
   stim_proc: process
		variable i:
			positive;
   begin
		rst <= '1';
      -- hold reset state for 100 ns.
		wait for 300ns;
		--Matlab array 0	0	1	0	0	1	1	0	0	0	1	1	1	1	0	0
		rst <='0';
		inputs(0) <= "111111111";
		inputs(1) <= "000000001";
		inputs(2) <= "111111111";
		inputs(3) <= "000000001";
		inputs(4) <= "111111111";
		inputs(5) <= "000000001";
		inputs(6) <= "111111111";
		inputs(7) <= "000000001";
		inputs(8) <= "000000001";
		inputs(9) <= "111111111";
		inputs(10) <= "111111111";
		inputs(11) <= "000000001";
		inputs(12) <= "000000001";
		inputs(13) <= "111111111";
		inputs(14) <= "111111111";
		inputs(15) <= "000000001";
		inputs(16) <= "111111111";
		inputs(17) <= "111111111";
		inputs(18) <= "000000001";
		inputs(19) <= "000000001";
		inputs(20) <= "000000001";
		inputs(21) <= "000000001";
		inputs(22) <= "111111111";
		inputs(23) <= "111111111";
		inputs(24) <= "111111111";
		inputs(25) <= "111111111";
		inputs(26) <= "111111111";
		inputs(27) <= "111111111";
		inputs(28) <= "000000001";
		inputs(29) <= "000000001";
		inputs(30) <= "000000001";
		inputs(31) <= "000000001";
--		L1:for i in 0 to 31 loop
--			inputs(i) <= "000000001";
--		end loop;
--		wait for 300ns;
--		inputs(1) <= "111111111";
--		
--		wait for 300 ns;
--		
--		L2:for i in 0 to 31 loop
--			inputs(i) <= "111111111";
--		end loop;
--		wait for 300ns;
--		
--		inputs(1) <= "000000001";
		wait for 500ns;
		wait;
   end process;
	
--	reading : process
--         file   infile    : text is in  "1.txt";   --declare input file
--         variable  inline    : line; --line number declaration
--         variable  dataread1    : string(1 to integer_part+fractional_part);
--   begin
--   wait until clk = '0' and clk'event;
--   if (not endfile(infile)) then
--			for i in 0 to N-1 loop
--         --checking the "END OF FILE" is not reached.
--			readline(infile, inline);       --reading a line from the file.
--			read(inline, dataread1);    --reading the data from the line and putting it in a real type variable.
--			inputs(i) <=to_std_logic_vector(dataread1);   --put the value available in variable in a signal.
--			end loop;
--			wait for 16*clk_period;
--	else
--        endoffile <= '1';         --set signal to tell end of file read file is reached.
--	end if;
--
--   end process reading;
	

END;
