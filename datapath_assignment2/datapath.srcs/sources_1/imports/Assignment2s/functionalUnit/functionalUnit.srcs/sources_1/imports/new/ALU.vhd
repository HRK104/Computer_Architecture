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

entity ALU is
    Port (S0, S1,S2, c_in:in std_logic;
          A: in std_logic_vector(15 downto 0);
          B: in std_logic_vector(15 downto 0);
          G: out std_logic_vector(15 downto 0);
          v: out std_logic;
          c_out:out std_ulogic );
end ALU;

architecture dataflow of ALU is

   --arithmatic circuit
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
   
   component Arithmatic_Circuit is
    Port (S0, S1, c_in:in std_logic;
          A: in std_logic_vector(15 downto 0);
          B: in std_logic_vector(15 downto 0);
          G: out std_logic_vector(15 downto 0);
          c_out:out std_ulogic );
   end component;  
   --end arithmatic circuit
   
   --Logical circuit
   component Logical_Circuit is
     Port ( 
           S0: in std_logic;
           S1: in std_logic;
           A: in std_logic_vector(15 downto 0);
           B: in std_logic_vector(15 downto 0);
           output_B: out std_logic_vector(15 downto 0)
     );
   end component;
   
   component mux_4to1 is
     Port (
          S0,S1:in std_logic;
          A: in std_logic;
          B: in std_logic;
          G:out std_ulogic );
   end component;  
   --end logical circuit
   
   component mux_2to1 is
      Port ( 
        S2: in std_logic;
        from_arithmatic_circuit: in std_logic_vector(15 downto 0);
        from_logical_circuit: in std_logic_vector(15 downto 0);
        G_out: out std_logic_vector(15 downto 0)
     );
   end component;
         
   signal tmp_c_out, current_c_out: std_logic;
   signal output, g_out_fromArithmatic, g_out_fromLogical : std_logic_vector(15 downto 0);
   --signal c0, c1, c2, c3, c4, c5, c6,c7,c8,c9, c10, c11, c12, c13, c14, c15: std_logic;
   --constant gate_delay: Time := 5 ns;
   --signal p0, p1, p2, p3, p4, p5, p6,p7,p8,p9, p10, p11, p12, p13, p14, p15: std_logic;
   constant gate_delay: Time := 1 ns;
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
     
     arithmatic: Arithmatic_Circuit PORT MAP(
          S0 => S0,
          S1 => S1,
          c_in => c_in,
          A => A,
          B => B,
          G => g_out_fromArithmatic,
          c_out =>tmp_c_out 
     );
     
     logical: Logical_Circuit PORT MAP(
        S0 => S0,
        S1 => S1,
        A => A,
        B => B,
        output_B => g_out_fromLogical
     );
    
    mux: mux_2to1 PORT MAP(
       S2 => S2,
       from_arithmatic_circuit => g_out_fromArithmatic,
       from_logical_circuit => g_out_fromLogical,
       G_out => output
    );
    
    G <= output after gate_delay;
    c_out <= tmp_c_out after gate_delay when S2 = '0' else
             c_in after gate_delay;
    
    v <= '1' after gate_delay when S2 ='0' and S1 = '0' and S0 = '1' and c_in ='0'
                  and A(15) = B(15) and output(15) /= A(15) else
          '1' after gate_delay  when S2 ='0' and S1 = '0' and S0 = '1' and c_in ='1'
                  and A(15) = B(15) and output(15) /= A(15) else
          '1' after gate_delay  when S2 ='0' and S1 = '1' and S0 = '0' and c_in ='1'
                  and A(15) /= B(15) and output(15)/= A(15) else
          '0' after gate_delay;                       
  end dataflow;