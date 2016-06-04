----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:30 02/06/2016 
-- Design Name: 
-- Module Name:    F - Behavioral 
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


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity F is
    Port ( lamdaA : in  llr;
           lamdaB : in  llr;
           lamdaOut : out  llr);
end F;

architecture Behavioral of F is
	signal positive_lamdaA, positive_lamdaB: signed(integer_part+fractional_part-1 downto 0);
	signal min: llr;
	signal sign: STD_LOGIC;
begin
	sign <= lamdaA(sign_bit) xor lamdaB(sign_bit);
	positive_lamdaA <= signed(not(lamdaA)) + one when lamdaA(sign_bit) = '1'
		else signed(lamdaA);
	positive_lamdaB <= signed(not(lamdaB)) + one when lamdaB(sign_bit) = '1'
		else signed(lamdaB);
	min <= std_logic_vector(positive_lamdaA(integer_part+fractional_part-1 downto 0)) when positive_lamdaA < positive_lamdaB
		else std_logic_vector(positive_lamdaB(integer_part+fractional_part-1 downto 0));
	lamdaOut <= min when sign = '0'
		else std_logic_vector(signed(not(min)) + one);

end Behavioral;

