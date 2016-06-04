----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:11 02/06/2016 
-- Design Name: 
-- Module Name:    Encoder16 - Behavioral 
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

entity Encoder is
	Port (inputs : in std_logic_vector(N/2-1 downto 0);
			outputs : out std_logic_vector(N-1 downto 0));
end Encoder;

architecture Behavioral of Encoder is

begin
	outputs(0) <= inputs(0) xor inputs(1) xor inputs(2) xor inputs(3) xor inputs(4) xor inputs(5) xor inputs(6) xor inputs(7) xor inputs(8) xor inputs(9) xor inputs(10) xor inputs(11) xor inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(1) <= inputs(4) xor inputs(5) xor inputs(6) xor inputs(7) xor inputs(8) xor inputs(9) xor inputs(10) xor inputs(11) xor inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(2) <= inputs(0) xor inputs(1) xor inputs(2) xor inputs(3) xor inputs(8) xor inputs(9) xor inputs(10) xor inputs(11) xor inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(3) <= inputs(8) xor inputs(9) xor inputs(10) xor inputs(11) xor inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(4) <= inputs(1) xor inputs(2) xor inputs(3) xor inputs(5) xor inputs(6) xor inputs(7) xor inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(5) <= inputs(5) xor inputs(6) xor inputs(7) xor inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(6) <= inputs(1) xor inputs(2) xor inputs(3) xor inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(7) <= inputs(12) xor inputs(13) xor inputs(14) xor inputs(15) ;
	outputs(8) <= inputs(0) xor inputs(2) xor inputs(3) xor inputs(4) xor inputs(6) xor inputs(7) xor inputs(10) xor inputs(11) xor inputs(14) xor inputs(15) ;
	outputs(9) <= inputs(4) xor inputs(6) xor inputs(7) xor inputs(10) xor inputs(11) xor inputs(14) xor inputs(15) ;
	outputs(10) <= inputs(0) xor inputs(2) xor inputs(3) xor inputs(10) xor inputs(11) xor inputs(14) xor inputs(15) ;
	outputs(11) <= inputs(10) xor inputs(11) xor inputs(14) xor inputs(15) ;
	outputs(12) <= inputs(2) xor inputs(3) xor inputs(6) xor inputs(7) xor inputs(14) xor inputs(15) ;
	outputs(13) <= inputs(6) xor inputs(7) xor inputs(14) xor inputs(15) ;
	outputs(14) <= inputs(2) xor inputs(3) xor inputs(14) xor inputs(15) ;
	outputs(15) <= inputs(14) xor inputs(15) ;
	outputs(16) <= inputs(0) xor inputs(1) xor inputs(3) xor inputs(4) xor inputs(5) xor inputs(7) xor inputs(9) xor inputs(11) xor inputs(13) xor inputs(15) ;
	outputs(17) <= inputs(4) xor inputs(5) xor inputs(7) xor inputs(9) xor inputs(11) xor inputs(13) xor inputs(15) ;
	outputs(18) <= inputs(0) xor inputs(1) xor inputs(3) xor inputs(9) xor inputs(11) xor inputs(13) xor inputs(15) ;
	outputs(19) <= inputs(9) xor inputs(11) xor inputs(13) xor inputs(15) ;
	outputs(20) <= inputs(1) xor inputs(3) xor inputs(5) xor inputs(7) xor inputs(13) xor inputs(15) ;
	outputs(21) <= inputs(5) xor inputs(7) xor inputs(13) xor inputs(15) ;
	outputs(22) <= inputs(1) xor inputs(3) xor inputs(13) xor inputs(15) ;
	outputs(23) <= inputs(13) xor inputs(15) ;
	outputs(24) <= inputs(0) xor inputs(3) xor inputs(4) xor inputs(7) xor inputs(11) xor inputs(15) ;
	outputs(25) <= inputs(4) xor inputs(7) xor inputs(11) xor inputs(15) ;
	outputs(26) <= inputs(0) xor inputs(3) xor inputs(11) xor inputs(15) ;
	outputs(27) <= inputs(11) xor inputs(15) ;
	outputs(28) <= inputs(3) xor inputs(7) xor inputs(15) ;
	outputs(29) <= inputs(7) xor inputs(15) ;
	outputs(30) <= inputs(3) xor inputs(15) ;
	outputs(31) <= inputs(15);
	
end Behavioral;

