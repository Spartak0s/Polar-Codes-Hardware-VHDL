    --------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:53:07 03/15/2016
-- Design Name:   
-- Module Name:   D:/Dropbox/Thesis Project/Hardware/Polar32/testbench.vhd
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
use ieee.std_logic_textio.all;
LIBRARY work;
USE work.MyPackage.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testold IS
END testold;
 
ARCHITECTURE behavior OF testold IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder16
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         inputs : IN  data;
         outputs : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk,endoffile : std_logic := '0';
   signal reset : std_logic := '0';
   signal inputs : data := (others =>(others => '0'));

   --Outputs
   signal outputs : std_logic_vector(15 downto 0);
   --linenumber
   signal linenumber : integer:=1;
   signal test :boolean := false;

   -- Clock period definitions
   constant ClockPeriod : time := 10 ns; 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Decoder16 PORT MAP (
          clk => clk,
          reset => reset,
          inputs => inputs,
          outputs => outputs
        );
    -- Stimulus process
   stim_proc: process
   begin
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for ClockPeriod/2;
		reset <='0';
      wait for ClockPeriod/2;
      -- insert stimulus here 
   end process;
 
   -- Clock process definitions
   process
	begin
	wait for ClockPeriod/2;
	clk <='1';
	wait for ClockPeriod/2;
	clk <='0';
	end process;
	
	
	reading : process
         file   infile    : text is in  "1.txt";   --declare input file
         variable  inline    : line; --line number declaration
         variable  dataread1    : std_logic_vector(N/2-1 downto 0);
    begin
    wait until clk = '1' and clk'event;
    for i in 0 to N loop
        if (not endfile(infile)) then   --checking the "END OF FILE" is not reached.
        readline(infile, inline);       --reading a line from the file.
        read(inline, dataread1);    --reading the data from the line and putting it in a real type variable.
        inputs(i) <=dataread1;   --put the value available in variable in a signal.
        else
        endoffile <= '1';         --set signal to tell end of file read file is reached.
        end if;
    end loop;

    end process reading;

    --write process
    writing : process
         file      outfile  : text is out "2.txt";  --declare output file
         variable  outline  : line;   --line number declaration
    begin
    wait until clk = '0' and clk'event;
    if(endoffile='0') then   --if the file end is not reached.
    --write(linenumber,value(real type),justified(side),field(width),digits(natural));
    write(outline, outputs, right, 16);
    -- write line to external file.
    writeline(outfile, outline);
    linenumber <= linenumber + 1;
    else
    null;
    end if;

    end process writing;
END;