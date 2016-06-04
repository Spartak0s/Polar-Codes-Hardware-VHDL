----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:44 04/06/2016 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyPackage.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is

    Port ( clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           count : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(N/2-1 downto 0));
end counter;

architecture behv of counter is		 	  
    signal Pre_Q: std_logic_vector(N/2-1 downto 0):= (others=>'0');
begin

    -- behavior describe the counter

process(clk, count, clear)
begin
		if clear = '1' then
			Pre_Q <= (others =>'0');
		elsif (clk='1' and clk'event) then
			if count = '1' then
				Pre_Q <= Pre_Q + 1;
			end if;
		end if;
end process;	
	
-- concurrent assignment statement
Q <= Pre_Q;

end behv;

