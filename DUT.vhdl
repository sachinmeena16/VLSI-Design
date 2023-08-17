-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(32 downto 0);
       	output_vector: out std_logic_vector(16 downto 0));
end entity;

architecture DutWrap of DUT is

component main is
  port (a: in std_logic_vector(15 downto 0); b: in std_logic_vector(15 downto 0);cin: in std_logic; S: out std_logic_vector(15 downto 0); cfinal: out std_logic);
end component main;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: main
			port map (
					-- order of inputs  A B CIN
					a(15) => input_vector(32),
					a(14) => input_vector(31),
					a(13) => input_vector(30),
					a(12) => input_vector(29),
               a(11) => input_vector(28),
					a(10) => input_vector(27),
					a(9) => input_vector(26),
					a(8) => input_vector(25),
					a(7) => input_vector(24),
					a(6) => input_vector(23),
					a(5) => input_vector(22),
					a(4) => input_vector(21),
					a(3) => input_vector(20),
					a(2) => input_vector(19),
					a(1) => input_vector(18),
					a(0) => input_vector(17),
	
					b(15) => input_vector(16),
					b(14) => input_vector(15),
					b(13) => input_vector(14),
					b(12) => input_vector(13),
               b(11) => input_vector(12),
					b(10) => input_vector(11),
					b(9) => input_vector(10),
					b(8) => input_vector(9),
					b(7) => input_vector(8),
					b(6) => input_vector(7),
					b(5) => input_vector(6),
					b(4) => input_vector(5),
					b(3) => input_vector(4),
					b(2) => input_vector(3),
					b(1) => input_vector(2),
					b(0) => input_vector(1),
					
					cin => input_vector(0),
				
					
                                       
					cfinal => output_vector(16),
					
					
					S(15) => output_vector(15),
					S(14) => output_vector(14),
					S(13) => output_vector(13),
					S(12) => output_vector(12),
					S(11) => output_vector(11),
					S(10) => output_vector(10),
					S(9) => output_vector(9),
					S(8) => output_vector(8),
					S(7) => output_vector(7),
					S(6) => output_vector(6),
					S(5) => output_vector(5),
					S(4) => output_vector(4),
					S(3) => output_vector(3),
					S(2) => output_vector(2),
					S(1) => output_vector(1),
					S(0) => output_vector(0)
					);
					
					
					
					
end DutWrap;

