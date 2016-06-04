----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:04 04/22/2016 
-- Design Name: 
-- Module Name:    llr_test - Behavioral 
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
use work.all;
use work.MyPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity llr2_to_channel is
	Port (inputs: in std_logic_vector(1 downto 0);
			outputs: out data);
end llr2_to_channel;

architecture Behavioral of llr2_to_channel is
constant pos_llr : std_logic_vector(integer_part + fractional_part -1 downto 0):= "00010100"; -- +7
constant neg_llr : std_logic_vector(integer_part + fractional_part -1 downto 0):= "11101100"; -- -7
begin
Decision:
	for i in 0 to N-1 generate
		Decision1:
		outputs(i) <= pos_llr when inputs(i)='0'
		else neg_llr;		
end generate Decision;
end Behavioral;

