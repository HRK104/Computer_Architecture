
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Arithmatic_Circuit is
    Port (S0, S1, c_in:in std_logic;
          A: in std_logic_vector(15 downto 0);
          B: in std_logic_vector(15 downto 0);
          P:  out std_logic_vector(15 downto 0);
          G: out std_logic_vector(15 downto 0);
          c_out:out std_ulogic );
end Arithmatic_Circuit;

architecture dataflow of Arithmatic_Circuit is

   component full_adder
     Port (in1, in2, c_in:in std_logic;
          sum, c_out:out std_logic );
   end component; 
   
   component ripple_adder_16bit is
    Port (--S0, S1, c_in:in std_logic;
          c_in:in std_logic;
          A: in std_logic_vector(15 downto 0);
          B: in std_logic_vector(15 downto 0);
          G: out std_logic_vector(15 downto 0);
          c_out:out std_ulogic );
   end component;      
       

   
   --constant gate_delay: Time := 5 ns;
   signal p0, p1, p2, p3, p4, p5, p6,p7,p8,p9, p10, p11, p12, p13, p14, p15: std_logic;
   constant gate_delay: Time := 1 ns;
   begin
     p0 <= ((B(0) and s0) or ((not B(0)) and s1))  after gate_delay;
     p1 <= ((B(1) and s0) or ((not B(1)) and s1)) after gate_delay;
     p2 <= ((B(2) and s0) or ((not B(2)) and s1)) after gate_delay;
     p3 <= ((B(3) and s0) or ((not B(3)) and s1)) after gate_delay;
     p4 <= ((B(4) and s0) or ((not B(4)) and s1)) after gate_delay;
     p5 <= ((B(5) and s0) or ((not B(5)) and s1)) after gate_delay;
     p6 <= ((B(6) and s0) or ((not B(6)) and s1)) after gate_delay;
     p7 <= ((B(7) and s0) or ((not B(7)) and s1)) after gate_delay;
     p8 <= ((B(8) and s0) or ((not B(8)) and s1)) after gate_delay;
     p9 <= ((B(9) and s0) or ((not B(9)) and s1)) after gate_delay;
     p10 <= ((B(10) and s0) or ((not B(10)) and s1)) after gate_delay;
     p11 <= ((B(11) and s0) or ((not B(11)) and s1)) after gate_delay;
     p12 <= ((B(12) and s0) or ((not B(12)) and s1)) after gate_delay;
     p13 <= ((B(13) and s0) or ((not B(13)) and s1)) after gate_delay;
     p14 <= ((B(14) and s0) or ((not B(14)) and s1)) after gate_delay;
     p15 <= ((B(15) and s0) or ((not B(15)) and s1)) after gate_delay;
     
     --p(0) <= p0;
     --p(1) <= p1;
     --p(2) <= p2;
     --p(3) <= p3;
     --p(4) <= p4;
     --p(5) <= p5;
     --p(6) <= p6;
     --p(7) <= p7;
     --p(8) <= p8;
     --p(9) <= p9;
     --p(10) <= p10;
     --p(11) <= p11;
     --p(12) <= p12;
     --p(13) <= p13;
     --p(14) <= p14;
     --p(15) <= p15;
     
     
     pararell_adder: ripple_adder_16bit PORT MAP(--S0, S1, c_in:in std_logic;
          c_in => c_in,
          A => A,
          B(0) => p0,
          B(1) => p1,
          B(2) => p2,
          B(3) => p3,
          B(4) => p4,
          B(5) => p5,
          B(6) => p6,
          B(7) => p7,
          B(8) => p8,
          B(9) => p9,
          B(10) => p10,
          B(11) => p11,
          B(12) => p12,
          B(13) => p13,
          B(14) => p14,
          B(15) => p15,
          G => G,
          c_out => c_out );
    
    
  end dataflow;