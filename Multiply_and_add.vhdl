library IEEE;
use IEEE.std_logic_1164.all;
entity mac is
	port(A, B: in std_logic_vector(7 downto 0);
		 ACC : in std_logic_vector(15 downto 0);
		 Sum : out std_logic_vector(15 downto 0);
		 Cout: out std_logic);
end entity mac;	

architecture arch of mac is

component a_and_b is
	port (data_in_0, data_in_1: in std_ulogic;
	data_out: out std_ulogic);
end component;

component full_adder is
	port (A, B, Cin: in std_logic;
		   S, C: out std_logic);
	end component;
	
component half_adder is
	port (A, B: in std_logic;
		   S, C: out std_logic);
	end component;

component brent_kung_adder is
   port (A, B : in std_logic_vector(15 downto 0); 
			C0: in std_logic ; 
			Sum : out std_logic_vector(15 downto 0); 
			Carry : out std_logic );
	end component;	

type partial_array is array(0 to 7, 7 downto 0) of std_logic ;
signal and_array : partial_array ;
signal stage_9_sum, stage_9_carry   : std_logic_vector(11 downto 0);
signal stage_6_sum, stage_6_carry   : std_logic_vector(17 downto 0);
signal stage_4_sum, stage_4_carry  : std_logic_vector(11 downto 0);
signal stage_3_sum, stage_3_carry   : std_logic_vector(13 downto 0);
signal final_sums, final_carries : std_logic_vector(15 downto 0);


begin

	AND_generate_ii : for ii in 0 to 7 generate
		AND_generate_jj : for jj in 0 to 7 generate
			
				and_insta: a_and_b port map(A(jj),B(ii),and_array(ii,jj));
				
		
		end generate AND_generate_jj;
	end generate AND_generate_ii;

-- Stage with Capacity = 9 bits

Nine_HA5   : half_adder port map(ACC(5), and_array(0,5), stage_9_sum(0), stage_9_carry(0));
Nine_FA6   : full_adder port map(ACC(6), and_array(0,6), and_array(1,5), stage_9_sum(1), stage_9_carry(1));
Nine_HA6   : half_adder port map(and_array(2,4), and_array(3,3), stage_9_sum(2), stage_9_carry(2));
Nine_FA7_0 : full_adder port map(ACC(7), and_array(0,7), and_array(1,6), stage_9_sum(3), stage_9_carry(3));
Nine_FA7_1 : full_adder port map(and_array(2,5), and_array(3,4), and_array(4,3), stage_9_sum(4), stage_9_carry(4));
Nine_HA7   : half_adder port map(and_array(5,2), and_array(6,1), stage_9_sum(5), stage_9_carry(5));
Nine_FA8_0 : full_adder port map(ACC(8), and_array(1,7), and_array(2,6), stage_9_sum(6), stage_9_carry(6));
Nine_FA8_1 : full_adder port map(and_array(3,5), and_array(4,4), and_array(5,3), stage_9_sum(7), stage_9_carry(7));
Nine_HA8   : half_adder port map(and_array(6,2), and_array(7,1), stage_9_sum(8), stage_9_carry(8));
Nine_FA9_0 : full_adder port map(ACC(9), and_array(2,7), and_array(3,6), stage_9_sum(9), stage_9_carry(9));
Nine_FA9_1 : full_adder port map(and_array(4,5), and_array(5,4), and_array(6,3), stage_9_sum(10), stage_9_carry(10));
Nine_FA10  : full_adder port map(ACC(10), and_array(3,7), and_array(4,6), stage_9_sum(11), stage_9_carry(11));


-- Stage with Capacity = 6 bits

Six_HA3   : half_adder port map(ACC(3), and_array(0,3), stage_6_sum(0), stage_6_carry(0));
Six_FA4   : full_adder port map(ACC(4), and_array(0,4), and_array(1,3), stage_6_sum(1), stage_6_carry(1));
Six_HA4   : half_adder port map(and_array(2,2), and_array(3,1), stage_6_sum(2), stage_6_carry(2));
Six_FA5_0 : full_adder port map(stage_9_sum(0), and_array(1,4), and_array(2,3), stage_6_sum(3), stage_6_carry(3));
Six_FA5_1 : full_adder port map(and_array(3,2), and_array(4,1), and_array(5,0), stage_6_sum(4), stage_6_carry(4));
Six_FA6_0 : full_adder port map(stage_9_sum(1), stage_9_carry(0), stage_9_sum(2), stage_6_sum(5), stage_6_carry(5));
Six_FA6_1 : full_adder port map(and_array(4,2), and_array(5,1), and_array(6,0), stage_6_sum(6), stage_6_carry(6));
Six_FA7_0 : full_adder port map(stage_9_sum(3), stage_9_carry(1), stage_9_sum(4), stage_6_sum(7), stage_6_carry(7));
Six_FA7_1 : full_adder port map(stage_9_carry(2), stage_9_sum(5), and_array(7,0), stage_6_sum(8), stage_6_carry(8));
Six_FA8_0 : full_adder port map(stage_9_sum(6), stage_9_carry(3), stage_9_sum(7), stage_6_sum(9), stage_6_carry(9));
Six_FA8_1 : full_adder port map(stage_9_carry(4), stage_9_sum(8), stage_9_carry(5), stage_6_sum(10), stage_6_carry(10));
Six_FA9_0 : full_adder port map(stage_9_sum(9), stage_9_carry(6), stage_9_sum(10), stage_6_sum(11), stage_6_carry(11));
Six_FA9_1 : full_adder port map(stage_9_carry(7), and_array(7,2), stage_9_carry(8), stage_6_sum(12), stage_6_carry(12));
Six_FA10_0: full_adder port map(stage_9_sum(11), stage_9_carry(9), and_array(5,5), stage_6_sum(13), stage_6_carry(13));
Six_FA10_1: full_adder port map(stage_9_carry(10), and_array(6,4), and_array(7,3), stage_6_sum(14), stage_6_carry(14));
Six_FA11_0: full_adder port map(ACC(11), stage_9_carry(11), and_array(4,7), stage_6_sum(15), stage_6_carry(15));
Six_FA11_1: full_adder port map(and_array(5,6), and_array(6,5), and_array(7,4), stage_6_sum(16), stage_6_carry(16));
Six_FA12  : full_adder port map(ACC(12), and_array(5,7), and_array(6,6), stage_6_sum(17), stage_6_carry(17));


-- Stage with Capacity = 4 bits

Four_HA2  : half_adder port map(ACC(2), and_array(0,2), stage_4_sum(0), stage_4_carry(0));
Four_FA3  : full_adder port map(stage_6_sum(0), and_array(1,2), and_array(2,1), stage_4_sum(1), stage_4_carry(1));
Four_FA4  : full_adder port map(stage_6_sum(1), stage_6_carry(0), stage_6_sum(2), stage_4_sum(2), stage_4_carry(2));
Four_FA5  : full_adder port map(stage_6_sum(3), stage_6_carry(1), stage_6_sum(4), stage_4_sum(3), stage_4_carry(3));
Four_FA6  : full_adder port map(stage_6_sum(5), stage_6_carry(3), stage_6_sum(6), stage_4_sum(4), stage_4_carry(4));
Four_FA7  : full_adder port map(stage_6_sum(7), stage_6_carry(5), stage_6_sum(8), stage_4_sum(5), stage_4_carry(5));
Four_FA8  : full_adder port map(stage_6_sum(9), stage_6_carry(7), stage_6_sum(10), stage_4_sum(6), stage_4_carry(6));
Four_FA9  : full_adder port map(stage_6_sum(11), stage_6_carry(9), stage_6_sum(12), stage_4_sum(7), stage_4_carry(7));
Four_FA10 : full_adder port map(stage_6_sum(13), stage_6_carry(11), stage_6_sum(14), stage_4_sum(8), stage_4_carry(8));
Four_FA11 : full_adder port map(stage_6_sum(15), stage_6_carry(13), stage_6_sum(16), stage_4_sum(9), stage_4_carry(9));
Four_FA12 : full_adder port map(stage_6_sum(17), stage_6_carry(15), and_array(7,5), stage_4_sum(10), stage_4_carry(10));
Four_FA13 : full_adder port map(ACC(13), stage_6_carry(17), and_array(6,7), stage_4_sum(11), stage_4_carry(11));


-- Stage with Capacity = 3 bits

Three_HA1  : half_adder port map(ACC(1), and_array(0,1), stage_3_sum(0), stage_3_carry(0));
Three_FA2  : full_adder port map(stage_4_sum(0), and_array(1,1), and_array(2,0), stage_3_sum(1), stage_3_carry(1));
Three_FA3  : full_adder port map(stage_4_sum(1), stage_4_carry(0), and_array(3,0), stage_3_sum(2), stage_3_carry(2));
Three_FA4  : full_adder port map(stage_4_sum(2), stage_4_carry(1), and_array(4,0), stage_3_sum(3), stage_3_carry(3));
Three_FA5  : full_adder port map(stage_4_sum(3), stage_4_carry(2), stage_6_carry(2), stage_3_sum(4), stage_3_carry(4));
Three_FA6  : full_adder port map(stage_4_sum(4), stage_4_carry(3), stage_6_carry(4), stage_3_sum(5), stage_3_carry(5));
Three_FA7  : full_adder port map(stage_4_sum(5), stage_4_carry(4), stage_6_carry(6), stage_3_sum(6), stage_3_carry(6));
Three_FA8  : full_adder port map(stage_4_sum(6), stage_4_carry(5), stage_6_carry(8), stage_3_sum(7), stage_3_carry(7));
Three_FA9  : full_adder port map(stage_4_sum(7), stage_4_carry(6), stage_6_carry(10), stage_3_sum(8), stage_3_carry(8));
Three_FA10 : full_adder port map(stage_4_sum(8), stage_4_carry(7), stage_6_carry(12), stage_3_sum(9), stage_3_carry(9));
Three_FA11 : full_adder port map(stage_4_sum(9), stage_4_carry(8), stage_6_carry(14), stage_3_sum(10), stage_3_carry(10));
Three_FA12 : full_adder port map(stage_4_sum(10), stage_4_carry(9), stage_6_carry(16), stage_3_sum(11), stage_3_carry(11));
Three_FA13 : full_adder port map(stage_4_sum(11), stage_4_carry(10), and_array(7,6), stage_3_sum(12), stage_3_carry(12));
Three_FA14 : full_adder port map(ACC(14), stage_4_carry(11), and_array(7,7), stage_3_sum(13), stage_3_carry(13));


-- Final sums and carries are used by Brent Kung Adder

final_sums <= ACC(15) & stage_3_sum & ACC(0) ;
final_carries <= stage_3_carry & and_array(1,0) & and_array(0,0);

final_instance : brent_kung_adder port map(final_sums, final_carries, '0', Sum, Cout);

end architecture;