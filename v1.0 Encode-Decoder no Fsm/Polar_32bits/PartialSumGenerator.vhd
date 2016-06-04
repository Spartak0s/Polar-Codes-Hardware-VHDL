----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:10:49 02/17/2016 
-- Design Name: 
-- Module Name:    PartialSumGenerator - Behavioral 
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
library work;
use work.MyPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PartialSumGenerator is
	Port (estimated : in std_logic_vector(N/2-1 downto 0):= (others=>'1');
			partial_sums : out s_2d);
end PartialSumGenerator;

architecture Behavioral of PartialSumGenerator is
begin

partial_sums(1)(0) <= '0';
partial_sums(1)(1) <= '0';
partial_sums(1)(2) <= '0';
partial_sums(1)(3) <= estimated(8);
partial_sums(1)(4) <= '0';
partial_sums(1)(5) <= '0';
partial_sums(1)(6) <= '0';
partial_sums(1)(7) <= estimated(12);
partial_sums(1)(8) <= '0';
partial_sums(1)(9) <= '0';
partial_sums(1)(10) <= '0';
partial_sums(1)(11) <= estimated(10);
partial_sums(1)(12) <= '0';
partial_sums(1)(13) <= estimated(6);
partial_sums(1)(14) <= estimated(2);
partial_sums(1)(15) <= estimated(14);
partial_sums(2)(0) <= '0';
partial_sums(2)(1) <= '0';
partial_sums(2)(2) <= '0';
partial_sums(2)(3) <= estimated(8) xor estimated(9);
partial_sums(2)(4) <= '0';
partial_sums(2)(5) <= estimated(5);
partial_sums(2)(6) <= estimated(1);
partial_sums(2)(7) <= estimated(12) xor estimated(13);
partial_sums(2)(8) <= '0';
partial_sums(2)(9) <= '0';
partial_sums(2)(10) <= '0';
partial_sums(2)(11) <= estimated(9);
partial_sums(2)(12) <= '0';
partial_sums(2)(13) <= estimated(5);
partial_sums(2)(14) <= estimated(1);
partial_sums(2)(15) <= estimated(13);
partial_sums(3)(0) <= '0';
partial_sums(3)(1) <= estimated(4);
partial_sums(3)(2) <= estimated(0);
partial_sums(3)(3) <= estimated(8) xor estimated(9) xor estimated(10) xor estimated(11);
partial_sums(3)(4) <= '0';
partial_sums(3)(5) <= estimated(4);
partial_sums(3)(6) <= estimated(0);
partial_sums(3)(7) <= estimated(10) xor estimated(11);
partial_sums(3)(8) <= '0';
partial_sums(3)(9) <= estimated(4);
partial_sums(3)(10) <= estimated(0);
partial_sums(3)(11) <= estimated(9) xor estimated(11);
partial_sums(3)(12) <= '0';
partial_sums(3)(13) <= estimated(4);
partial_sums(3)(14) <= estimated(0);
partial_sums(3)(15) <= estimated(11);
partial_sums(4)(0) <= '0';
partial_sums(4)(1) <= estimated(4) xor estimated(5) xor estimated(6) xor estimated(7);
partial_sums(4)(2) <= '0';
partial_sums(4)(3) <= estimated(5) xor estimated(6) xor estimated(7);
partial_sums(4)(4) <= '0';
partial_sums(4)(5) <= estimated(4) xor estimated(6) xor estimated(7);
partial_sums(4)(6) <= '0';
partial_sums(4)(7) <= estimated(6) xor estimated(7);
partial_sums(4)(8) <= '0';
partial_sums(4)(9) <= estimated(4) xor estimated(5) xor estimated(7);
partial_sums(4)(10) <= '0';
partial_sums(4)(11) <= estimated(5) xor estimated(7);
partial_sums(4)(12) <= '0';
partial_sums(4)(13) <= estimated(4) xor estimated(7);
partial_sums(4)(14) <= '0';
partial_sums(4)(15) <= estimated(7);
partial_sums(5)(0) <= estimated(0) xor estimated(1) xor estimated(2) xor estimated(3);
partial_sums(5)(1) <= estimated(0) xor estimated(1) xor estimated(2) xor estimated(3);
partial_sums(5)(2) <= estimated(1) xor estimated(2) xor estimated(3);
partial_sums(5)(3) <= estimated(1) xor estimated(2) xor estimated(3);
partial_sums(5)(4) <= estimated(0) xor estimated(2) xor estimated(3);
partial_sums(5)(5) <= estimated(0) xor estimated(2) xor estimated(3);
partial_sums(5)(6) <= estimated(2) xor estimated(3);
partial_sums(5)(7) <= estimated(2) xor estimated(3);
partial_sums(5)(8) <= estimated(0) xor estimated(1) xor estimated(3);
partial_sums(5)(9) <= estimated(0) xor estimated(1) xor estimated(3);
partial_sums(5)(10) <= estimated(1) xor estimated(3);
partial_sums(5)(11) <= estimated(1) xor estimated(3);
partial_sums(5)(12) <= estimated(0) xor estimated(3);
partial_sums(5)(13) <= estimated(0) xor estimated(3);
partial_sums(5)(14) <= estimated(3);
partial_sums(5)(15) <= estimated(3);

end Behavioral;

