library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity myfsm3 is
port (  clk		: in std_logic;
		rst		: in std_logic;
		dready	: in std_logic;
		mtready : in std_logic;
		stop	: out std_logic;
		mnread	: out std_logic
);
end entity;

----------------------------------------------
-- Simata pou 8a xrisimopoii8oun os eksodoi --
-- stop: pagose tin awgn i oxi				--
-- wenmn1: write enable tis mnimis eisodou	--
-- wenmn2: write enable tis mnimis eksodou	--
-- mnread: diabase apo tin eksodo			--
-- addrmn1: i diey8isni tis mnimis 1		--
-- addrmn2: i diey8isni tis mnimis 2		--
----------------------------------------------

architecture struct of myfsm3 is

type state_type is (a0,s0,s1,s3,s4,s5);
signal state: state_type;

--------------------------------------------------------------
-- Counters gia tin ilopoisi ton panton						--
-- cnt1: gia tin dieu8unsi tis mnimis1 (11 bit)				--
-- cnt2: gia tin dieu8unsi tis mnimmis2 (11 bit)			--
-- cnt3: gia ta epipeda pipeline tis awgn (5 bit)			--
-- cnt4: gia ta epipeda pipeline tou kanaliou (4 bit)		--
--------------------------------------------------------------

signal cnt4: std_logic_vector (3 downto 0);
signal cnt3 : std_logic_vector (4 downto 0);

begin

	pr1:process(clk)
	begin
		if clk'event and clk='1' then
			if rst='0' then
				state<=a0;
				cnt3<="00000";
				cnt4<="0000";
			else
				case state is
				when a0=>
					state<=s0;
				when s0=>
					if (mtready='1' and cnt3="10001") then
						state<=s1;
					else
						if (mtready='1') then
							cnt3<=cnt3 +1;
						end if;
						state<=s0;
					end if;
				when s1=>
					if (dready='1') then
						state<=s3;
					else
						state<=s1;
					end if;
				cnt4<="0000";
				when s3=>
					if (dready='1' and cnt4 = "0111") then
						state<=s4;
					else
						cnt4<=cnt4+1;
						state<=s3;
					end if;
				when s4=>
					if (dready='0') then
						state<=s5;
					else
						state<=s4;
					end if;
					cnt4<="0000";
				when s5=>
					if (cnt4 = "0111") then
						state<=s1;
					else
						state<=s5;
						cnt4<=cnt4+1;
					end if;
				when others=>
					state<=a0;
				end case; 
			end if;   
		end if;
	end process;

	pr2:process(state)
	begin   
		case state is 
			when a0=>	stop	<='1'; -- reset
						mnread	<='0';
			when s0=>	stop	<='0'; -- arxikopoisi
						mnread	<='0';
			when s1=>	stop	<='1'; -- anamoni
						mnread	<='0';
			when s3=>	stop	<='0'; -- epeksergasia 6 proton dedomenon
						mnread	<='0';
			when s4=>	stop	<='0'; -- epeksergasia & apostoli dedomenon
						mnread	<='1';
			when s5=>	stop	<='1'; -- apostoli teleutaion dedomenon
						mnread	<='1';
			when others=> stop<='0';
						  mnread<='0';
		end case;
	end process;

end struct;
