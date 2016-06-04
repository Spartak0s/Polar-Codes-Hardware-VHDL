----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:52 02/06/2016 
-- Design Name: 
-- Module Name:    G - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use work.MyPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity G is
    Port ( lamdaA : in  llr;
           lamdaB : in  llr;
			  s : in STD_LOGIC;
           lamdaOut : out  llr);
end G;

architecture Behavioral of G is
begin
	lamdaOut <= std_logic_vector(signed(lamdaA) + signed(lamdaB)) when s = '0'
		else std_logic_vector((signed(not(lamdaA)) + one) + signed(lamdaB));

end Behavioral;