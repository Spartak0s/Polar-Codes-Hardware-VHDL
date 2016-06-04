library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity uutfsm is
port (  clk		: in std_logic;
		rst		: in std_logic;
		feedbk:in std_logic;
		dec_fin:out std_logic;
		conti	: out std_logic
);
end entity;

architecture struct of uutfsm is

	type state_type is (r0,t0,t1,t2,t3);
	signal state: state_type;
	signal count1 : std_logic_vector (7 downto 0);
	signal count2 : std_logic_vector (9 downto 0);
	signal control1,control2: std_logic;

begin

  control2<=control1 xor feedbk;  
  
	pr1:process(clk)
	begin
		if clk'event and clk='1' then
			if rst='0' then
				state<=r0;
				count1<=(others=>'0');
				count2<=(others=>'0');
			else
				case state is
				when r0=>
						state<=t0;
				when t0=>
				  control1<='0';
					if (count1="11001000") then
						state<=t1;
					else
						state<=t0;
						count1<=count1 + '1';
					end if;
				when t1 =>
					if (count2="1011110011") then
						state<=t2;
					else
						state<=t1;
						count2<=count2 + '1';
					end if;
				when t2 =>
				  if (control2='1') then
				    state<=t3;
				  else
					state<=t2;
					end if;
				when t3 =>
				    control1<=feedbk;
				    state<=t2;
				when others=>
					state<=r0;
				end case; 
			end if;   
		end if;
	end process;

	pr2:process(state)
	begin   
		case state is 
			when r0=> 	conti<='0';
			           dec_fin<='0';
			when t0=> 	conti<='0';
			           dec_fin<='0';
			when t1=> 	conti<='1';
			           dec_fin<='0';
			when t2=>	conti<='0';
			           dec_fin<='0';
			when t3=> conti<='0';
			           dec_fin<='1';
			when others=> conti<='0';
			            dec_fin<='0';
		end case;
	end process;

end struct;
