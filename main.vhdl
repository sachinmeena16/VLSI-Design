library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;
entity main is
  port (
  a: in std_logic_vector(15 downto 0); b: in std_logic_vector(15 downto 0);cin: in std_logic; S: out std_logic_vector(15 downto 0); cfinal: out std_logic
  );
end entity main;
architecture Str of main is
  signal p: std_logic_vector(15 downto 0);
  signal M: std_logic_vector(15 downto 0);
  signal g: std_logic_vector(15 downto 0);
  signal p1514,p1312,p1110,p98,p76,p54,p32,p10: std_logic;
  signal g1514,g1312,g1110,g98,g76,g54,g32,g10:std_logic;
  signal  p1512,p118,p74,p30: std_logic;
  signal  g1512,g118,g74,g30: std_logic;
  signal  p158,p70: std_logic;
  signal  g158,g70: std_logic;
  signal  p150:std_logic;
  signal  g150:std_logic;
  signal  c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: std_logic;
  
  
begin
  -- component instances intial lavel 1 P values
    c0<=cin;
  p0:xorgate
       port map (A =>a(0), B => b(0), uneq =>p(0));
  -- propagate carry.
  p1:xorgate
       port map (A =>a(1), B => b(1), uneq =>p(1));
  p2:xorgate
       port map (A =>a(2), B => b(2), uneq =>p(2));
  p3:xorgate
       port map (A =>a(3), B => b(3), uneq =>p(3));	
  p4:xorgate
       port map (A =>a(4), B => b(4), uneq =>p(4));
  p5:xorgate
       port map (A =>a(5), B => b(5), uneq =>p(5));
	p6:xorgate
       port map (A =>a(6), B => b(6), uneq =>p(6));
	p7:xorgate
       port map (A =>a(7), B => b(7), uneq =>p(7));
	p8:xorgate
       port map (A =>a(8), B => b(8), uneq =>p(8));
	p9:xorgate
       port map (A =>a(9), B => b(9), uneq =>p(9));
	p100:xorgate
       port map (A =>a(10), B => b(10), uneq =>p(10));
	p11:xorgate
       port map (A =>a(11), B => b(11), uneq =>p(11));
	p12:xorgate
       port map (A =>a(12), B => b(12), uneq =>p(12));
	p13:xorgate
       port map (A =>a(13), B => b(13), uneq =>p(13));
	p14:xorgate
       port map (A =>a(14), B => b(14), uneq =>p(14));
	p15:xorgate
       port map (A =>a(15), B => b(15), uneq =>p(15));	 
		 
  --label 1 G values
  go:Cin_map_G
       port map (A =>a(0), B => b(0),Cin => c0, Bit0_G=>g(0));
  g1:andgate
       port map (A =>a(1), B => b(1), prod =>g(1));
		 
   g2:andgate
       port map (A =>a(2), B => b(2), prod =>g(2));
	g3:andgate
       port map (A =>a(3), B => b(3), prod =>g(3));
	g4:andgate
       port map (A =>a(4), B => b(4), prod =>g(4));
	g5:andgate
       port map (A =>a(5), B => b(5), prod =>g(5));
	g6:andgate
       port map (A =>a(6), B => b(6), prod =>g(6));
	g7:andgate
       port map (A =>a(7), B => b(7), prod =>g(7));
	g8:andgate
       port map (A =>a(8), B => b(8), prod =>g(8));
	g9:andgate
       port map (A =>a(9), B => b(9), prod =>g(9));
	g100:andgate
       port map (A =>a(10), B => b(10), prod =>g(10));
		 
	g11:andgate
       port map (A =>a(11), B => b(11), prod =>g(11));
		 	 	 
	 g12:andgate
       port map (A =>a(12), B => b(12), prod =>g(12));
		 	 
		 	 
	 g13:andgate
       port map (A =>a(13), B => b(13), prod =>g(13));
	 
	 g14:andgate
       port map (A =>a(14), B => b(14), prod =>g(14));
		 
	  g15:andgate
       port map (A =>a(15), B => b(15), prod =>g(15));
		 
		 
-- c0
    
--level 2 p and g
	  
pm10:andgate
       port map (A =>p(0), B => p(1), prod =>p10);	  
 -- g value
gm10:abcgate
       port map (A =>g(1), B => p(1),C => g(0), abc =>g10);			 
--2
pm32:andgate
       port map (A =>p(3), B => p(2), prod =>p32);	  
 -- g value
gm32:abcgate
       port map (A =>g(3), B => p(3),C => g(2), abc =>g32);			 
--3
pm54:andgate
       port map (A =>p(5), B => p(4), prod =>p54);	  
 -- g value
gm54:abcgate
       port map (A =>g(5), B => p(5),C => g(4), abc=>g54);			 
	
--4
pm76:andgate
       port map (A =>p(7), B => p(6), prod =>p76);	  
 -- g value
gm76:abcgate
       port map (A =>g(7), B => p(7),C => g(6), abc =>g76);			 
--5
pm98:andgate
       port map (A =>p(9), B => p(8), prod =>p98);	  
 -- g value
gm98:abcgate
       port map (A =>g(9), B => p(9),C => g(8), abc =>g98);			 
		 
--6
pm1110:andgate
       port map (A =>p(11), B => p(10), prod =>p1110);	  
 -- g value
gm1110:abcgate
       port map (A =>g(11), B => p(11),C => g(10), abc=>g1110);			 
--7
pm1312:andgate
       port map (A =>p(13), B => p(12), prod =>p1312);	  
 -- g value
gm1312:abcgate
       port map (A =>g(13), B => p(13),C => g(12), abc =>g1312);			 			
--8
pm1514:andgate
       port map (A =>p(15), B => p(14), prod =>p1514);	  
 -- g value
gm1514:abcgate
       port map (A =>g(15), B => p(15),C => g(14), abc =>g1514);		


-----lavel 3 p and g values
pm30:andgate
       port map (A =>p32, B => p10, prod =>p30);
gm30:abcgate
       port map (A =>g32, B => p32,C => g10, abc =>g30);	
---2
		 
pm74:andgate
       port map (A =>p76, B => p54, prod =>p74);
gm74:abcgate
       port map (A =>g76, B => p76,C => g54, abc =>g74);	
---3
pm118:andgate
       port map (A =>p1110, B => p98, prod =>p118);
gm118:abcgate
       port map (A =>g1110, B => p1110,C => g98, abc =>g118);	
---4
pm1512:andgate
       port map (A =>P1514, B => p1312, prod =>p1512);
gm1512:abcgate
       port map (A =>g1514, B => p1514,C => g1312, abc =>g1512);	


---lavel 4	 
		 
pm70:andgate
       port map (A =>p74, B => p30, prod =>p70);
gm70:abcgate
       port map (A =>g74, B => p74,C => g30, abc =>g70);	

--2
pm158:andgate
       port map (A =>p1512, B => p118, prod =>p158);
gm158:abcgate
       port map (A =>g1512, B => p1512,C => g118, abc =>g158);

---lavel 5
pm150:andgate
       port map (A =>p158, B => p70, prod =>p150);
gm150:abcgate
       port map (A =>g158, B => p158,C => g70, abc=>g150);			 
		 	 
	 
--- values of c
  C_0 : abcgate 
		 port map (A =>g(0), B =>p(0), C => C0, abc =>C1);
		
    C_2 : abcgate 
	    port map (A => g10, B => p10, C => C0, abc =>C2);
	 
    C_4 : abcgate 
	    port map (A => g30, B => p30, C => C0, abc =>C4);
	 
    C_8 : abcgate 
	    port map (A => g70, B => p70, C => C0, abc =>C8); 
	 
    C_16 : abcgate 
	    port map (A=> g150, B => P150, C => C0, abc =>C16);	 

    C_12: abcgate 
	    port map (A => g118  , B => p118, C => C8, abc => C12);

    C_6 : abcgate 
	    port map (A => g54, B => p54, C => C4, abc =>C6);
	 
    C_10 : abcgate 
	    port map (A => g98, B => p98, C => C8, abc =>C10);
	 
    C_14 : abcgate 
	    port map (A => g1312, B => p1312, C => C12, abc =>C14);


    C_3 : abcgate 
	    port map (A => g(2), B => p(2), C => C2, abc =>C3);  
	 
    C_5 : abcgate 
	    port map (A => g(4), B => p(4), C => C4, abc =>C5);
	 
    C_7 : abcgate 
	    port map (A => g(6), B => p(6), C => C6, abc =>C7);
    
    C_9 : abcgate 
	    port map (A => g(8), B => p(8), C => C8, abc =>C9);
	 
	 C_11 : abcgate 
	    port map (A => g(10), B => p(10), C => C10, abc =>C11); 
	 
    C_13 : abcgate 
	    port map (A => g(12), B => p(12), C => C12, abc =>C13);
	 
	 C_15 : abcgate 
	    port map (A => g(14), B => p(14), C => C14, abc =>C15);
    
	 
--SUM
     SUM0 : xorgate 
          port map (A => p(0), B => C0, uneq =>M(0));
			 
	   SUM1 : xorgate 
	       port map (A => p(1), B => C1, uneq =>M(1));
			 
      SUM2 : xorgate 
		   port map (A => p(2), B => C2, uneq =>M(2));
			
      SUM3 : xorgate 
		   port map (A => p(3), B => C3, uneq =>M(3));
			
      SUM4 : xorgate 
		   port map (A => p(4), B => C4, uneq =>M(4));
			
      SUM5 : xorgate 
		   port map (A => p(5), B => C5, uneq =>M(5));
			
      SUM6 : xorgate 
		   port map (A => P(6), B => C6, uneq =>M(6));
			
      SUM7 : xorgate 
		   port map (A => p(7), B => C7, uneq =>M(7));
			
      SUM8 : xorgate 
		   port map (A => p(8), B => C8, uneq =>M(8));
			
      SUM9 : xorgate 
		   port map (A => p(9), B => C9, uneq =>M(9));
			
      SUM10 : xorgate 
		   port map (A => P(10), B => C10, uneq =>M(10));
			
      SUM11 : xorgate 
		   port map (A => P(11), B => C11, uneq =>M(11));
			
      SUM12 : xorgate 
	   	port map (A => p(12), B => C12, uneq =>M(12));
			
      SUM13 : xorgate 
		   port map (A => p(13), B => C13, uneq =>M(13));
			
      SUM14 : xorgate 
		   port map (A => p(14), B => C14, uneq =>M(14));
			
      SUM15 : xorgate 
		   port map (A => p(15), B => C15, uneq =>M(15));
			
				 
	  S<=M;
    cfinal<=C16;
		 	 
		 
		 	 
		 
		 
		 
		 --
		 
		 
		 
  
end Str;
