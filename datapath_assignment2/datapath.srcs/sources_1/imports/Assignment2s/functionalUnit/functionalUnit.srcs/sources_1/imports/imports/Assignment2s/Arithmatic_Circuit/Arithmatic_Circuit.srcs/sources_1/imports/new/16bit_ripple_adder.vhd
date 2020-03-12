----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2020 09:55:40 AM
-- Design Name: 
-- Module Name: full_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder_16bit is
    Port (--S0, S1, c_in:in std_logic;
          c_in:in std_logic;
          A: in std_logic_vector(15 downto 0);
          B: in std_logic_vector(15 downto 0);
          G: out std_logic_vector(15 downto 0);
          c_out:out std_ulogic );
end ripple_adder_16bit;

architecture dataflow of ripple_adder_16bit is

   component full_adder
     Port (in1, in2, c_in:in std_logic;
          sum, c_out:out std_logic );
   end component;       
       

   signal c0, c1, c2, c3, c4, c5, c6,c7,c8,c9, c10, c11, c12, c13, c14, c15: std_logic;
   --constant gate_delay: Time := 5 ns;
   --signal p0, p1, p2, p3, p4, p5, p6,p7,p8,p9, p10, p11, p12, p13, p14, p15: std_logic;
   
   begin
     --p0 <= ((B(0) and s0) or ((not B(0)) and s1));
     --p1 <= ((B(1) and s0) or ((not B(1)) and s1));
     --p2 <= ((B(2) and s0) or ((not B(2)) and s1));
     --p3 <= ((B(3) and s0) or ((not B(3)) and s1));
     --p4 <= ((B(4) and s0) or ((not B(4)) and s1));
     --p5 <= ((B(5) and s0) or ((not B(5)) and s1));
     --p6 <= ((B(6) and s0) or ((not B(6)) and s1));
     --p7 <= ((B(7) and s0) or ((not B(7)) and s1));
     --p8 <= ((B(8) and s0) or ((not B(8)) and s1));
     --p9 <= ((B(9) and s0) or ((not B(9)) and s1));
     --p10 <= ((B(10) and s0) or ((not B(10)) and s1));
     --p11 <= ((B(11) and s0) or ((not B(11)) and s1));
     --p12 <= ((B(12) and s0) or ((not B(12)) and s1));
     --p13 <= ((B(13) and s0) or ((not B(13)) and s1));
     --p14 <= ((B(14) and s0) or ((not B(14)) and s1));
     --p15 <= ((B(15) and s0) or ((not B(15)) and s1));
     FA00: full_adder PORT MAP(
        in1 => A(0),
        in2 => B(0),--p0,
        c_in => c_in,
        sum => G(0),
        c_out =>c1
    );
    FA01: full_adder PORT MAP(
        in1 => A(1),
        in2 => B(1),--p1,
        c_in => c1,
        sum => G(1),
        c_out =>c2
    );
    FA02: full_adder PORT MAP(
        in1 => A(2),
        in2 => B(2),--p2,
        c_in => c2,
        sum => G(2),
        c_out =>c3
    );
    FA03: full_adder PORT MAP(
        in1 => A(3),
        in2 => B(3),--p3,
        c_in => c3,
        sum => G(3),
        c_out =>c4
    );
    FA04: full_adder PORT MAP(
        in1 => A(4),
        in2 => B(3),--p4,
        c_in => c4,
        sum => G(4),
        c_out =>c5
    );
    FA05: full_adder PORT MAP(
        in1 => A(5),
        in2 => B(5),--p5,
        c_in => c5,
        sum => G(5),
        c_out =>c6
    );
    FA06: full_adder PORT MAP(
        in1 => A(6),
        in2 => B(6),--p6,
        c_in => c6,
        sum => G(6),
        c_out =>c7
    );
    FA07: full_adder PORT MAP(
        in1 => A(7),
        in2 => B(7),--p7,
        c_in => c7,
        sum => G(7),
        c_out =>c8
    );
    FA08: full_adder PORT MAP(
        in1 => A(8),
        in2 => B(8),--p8,
        c_in => c8,
        sum => G(8),
        c_out =>c9
    );
    FA09: full_adder PORT MAP(
        in1 => A(9),
        in2 => B(9),--p9,
        c_in => c9,
        sum => G(9),
        c_out =>c10
    );
    FA10: full_adder PORT MAP(
        in1 => A(10),
        in2 => B(10),--p10,
        c_in => c10,
        sum => G(10),
        c_out =>c11
    );
    FA11: full_adder PORT MAP(
        in1 => A(11),
        in2 => B(11),--p11,
        c_in => c11,
        sum => G(11),
        c_out =>c12
    );
    FA12: full_adder PORT MAP(
        in1 => A(12),
        in2 => B(12),--p12,
        c_in => c12,
        sum => G(12),
        c_out =>c13
    );
    FA13: full_adder PORT MAP(
        in1 => A(13),
        in2 => B(13),--p13,
        c_in => c13,
        sum => G(13),
        c_out =>c14
    );
    FA14: full_adder PORT MAP(
        in1 => A(14),
        in2 => B(14),--p14,
        c_in => c14,
        sum => G(14),
        c_out =>c15
    );
    FA15: full_adder PORT MAP(
        in1 => A(15),
        in2 => B(15),--p15,
        c_in => c15,
        sum => G(15),
        c_out =>c_out
    );
    
    
  end dataflow;