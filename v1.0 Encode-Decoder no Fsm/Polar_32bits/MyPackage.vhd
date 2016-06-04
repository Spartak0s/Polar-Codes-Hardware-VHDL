--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.MATH_REAL.all;

package MyPackage is
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

-- Declare constants
--
constant K : integer := 16;
constant N : integer := 32;
constant stages : integer := 5;
constant num_of_partials : integer := stages * N;
constant integer_part : integer := 5;
constant fractional_part : integer := 2;
constant sign_bit : integer := integer_part + fractional_part -1;
constant one : signed(integer_part + fractional_part-1 downto 0) := (0=>'1',others=>'0');
--
subtype s_1d is std_logic_vector(0 to N/2-1);
type s_2d is array (1 to stages) of s_1d;
subtype llr is std_logic_vector(integer_part+fractional_part-1 downto 0);
type data is array (0 to N-1) of llr;
type llr_2d is array (0 to stages) of data;
type llr2bit is array (1 downto 0) of llr;
type llr2bit_int is array (1 downto 0) of signed(integer_part+fractional_part -1 downto 0);
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--


end MyPackage;

package body MyPackage is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end MyPackage;
