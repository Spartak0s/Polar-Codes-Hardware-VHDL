library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ldzcount is
port ( 	x: in signed (31 downto 0);
	k: out signed (5 downto 0);
	k2: out signed (5 downto 0));
end entity;

architecture struct of ldzcount is

constant miden1 : signed ( 1 downto 0):="01";
constant miden2 : signed ( 2 downto 0):="001";
constant miden3 : signed ( 3 downto 0):="0001";
constant miden4 : signed ( 4 downto 0):="00001";
constant miden5 : signed ( 5 downto 0):="000001";
constant miden6 : signed ( 6 downto 0):="0000001";
constant miden7 : signed ( 7 downto 0):="00000001";
constant miden8 : signed ( 8 downto 0):="000000001";
constant miden9 : signed ( 9 downto 0):="0000000001";
constant miden10 : signed (10 downto 0):="00000000001";
constant miden11 : signed (11 downto 0):="000000000001";
constant miden12 : signed (12 downto 0):="0000000000001";
constant miden13 : signed (13 downto 0):="00000000000001";
constant miden14 : signed (14 downto 0):="000000000000001";
constant miden15 : signed (15 downto 0):="0000000000000001";
constant miden16 : signed (16 downto 0):="00000000000000001";
constant miden17 : signed (17 downto 0):="000000000000000001";
constant miden18 : signed (18 downto 0):="0000000000000000001";
constant miden19 : signed (19 downto 0):="00000000000000000001";
constant miden20 : signed (20 downto 0):="000000000000000000001";
constant miden21 : signed (21 downto 0):="0000000000000000000001";
constant miden22 : signed (22 downto 0):="00000000000000000000001";
constant miden23 : signed (23 downto 0):="000000000000000000000001";
constant miden24 : signed (24 downto 0):="0000000000000000000000001";
constant miden25 : signed (25 downto 0):="00000000000000000000000001";
constant miden26 : signed (26 downto 0):="000000000000000000000000001";
constant miden27 : signed (27 downto 0):="0000000000000000000000000001";
constant miden28 : signed (28 downto 0):="00000000000000000000000000001";
constant miden29 : signed (29 downto 0):="000000000000000000000000000001";
constant miden30 : signed (30 downto 0):="0000000000000000000000000000001";
constant miden31 : signed (31 downto 0):="00000000000000000000000000000001";

begin
pr1:process (x)
begin
	if (x(31 downto 27)="11111") then
		k<="000001";
		k2<="000001";
	elsif (x(31 downto 28)="1111") then
		k<="000010";
		k2<="000001";
	elsif (x(31 downto 29)="111") then	
		k<="000011";
		k2<="000001";
	elsif (x(31 downto 30)="11") then
		k<="000100";
		k2<="000001";
	elsif (x(31)='1') then			
		k<="000101";
		k2<="000001";
	elsif (x(31 downto 30)=miden1 ) then
		k<="000110";
		k2<="000010";
	elsif (x(31 downto 29)= miden2) then
		k<="000111";
		k2<="000011";		
	elsif (x(31 downto 28)= miden3) then	
		k<="001000";
		k2<="000100";
	elsif (x(31 downto 27)= miden4) then	
		k<="001001";
		k2<="000101";
	elsif (x(31 downto 26)= miden5) then	
		k<="001010";
		k2<="000110";
	elsif (x(31 downto 25)= miden6) then	
		k<="001011";
		k2<="000111";
	elsif (x(31 downto 24)= miden7) then	
		k<="001100";
		k2<="001000";
	elsif (x(31 downto 23)= miden8) then	
		k<="001101";
		k2<="001001";
	elsif (x(31 downto 22)= miden9) then	
		k<="001110";
		k2<="001010";
	elsif (x(31 downto 21)= miden10) then	
		k<="001111";
		k2<="001011";
	elsif (x(31 downto 20)= miden11) then	
		k<="010000";
		k2<="001100";
	elsif (x(31 downto 19)= miden12) then	
		k<="010001";
		k2<="001101";
	elsif (x(31 downto 18)= miden13) then	
		k<="010010";
		k2<="001110";
	elsif (x(31 downto 17)= miden14) then	
		k<="010011";
		k2<="001111";
	elsif (x(31 downto 16)= miden15) then	
		k<="010100";
		k2<="010000";
	elsif (x(31 downto 15)= miden16) then	
		k<="010101";
		k2<="010001";
	elsif (x(31 downto 14)= miden17) then	
		k<="010110";
		k2<="010010";
	elsif (x(31 downto 13)= miden18) then	
		k<="010111";
		k2<="010011";
	elsif (x(31 downto 12)= miden19) then		
		k<="011000";
		k2<="010100";
	elsif (x(31 downto 11)= miden20) then	
		k<="011001";
		k2<="010101";
	elsif (x(31 downto 10)= miden21) then	
		k<="011010";
		k2<="010110";
	elsif (x(31 downto  9)= miden22) then	
		k<="011011";
		k2<="010111";
	elsif (x(31 downto  8)= miden23) then	
		k<="011100";
		k2<="011000";
	elsif (x(31 downto  7)= miden24) then	
		k<="011101";
		k2<="011001";
	elsif (x(31 downto  6)= miden25) then	
		k<="011110";
		k2<="011010";
	elsif (x(31 downto  5)= miden26) then	
		k<="011111";
		k2<="011011";
	elsif (x(31 downto  4)= miden27) then	
		k<="100000";
		k2<="011100";
	elsif (x(31 downto  3)= miden28) then	
		k<="100001";
		k2<="011101";
	elsif (x(31 downto  2)= miden29) then	
		k<="100010";
		k2<="011110";
	elsif (x(31 downto  1)= miden30) then	
		k<="100011";
		k2<="011111";
	elsif (x(31 downto  0)= miden31) then	
		k<="100100";
		k2<="100000";
	else	
		k<="100100";
		k2<="000001";
	end if;
	end process;

end struct;
