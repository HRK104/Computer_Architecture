----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2020 03:12:21 PM
-- Design Name: 
-- Module Name: mux_shifter - Behavioral
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

entity shifter is
  Port (
        IR, IL: in std_logic;
        S: in std_logic_vector(1 downto 0);
        B: in std_logic_vector(15 downto 0);
        SerialOutputL,SerialOutputR: out std_logic;
        H: out std_logic_vector(15 downto 0)
   );
end shifter;

architecture Behavioral of shifter is


   component mux_shifter is
     Port (
        in0, in1,in2: in std_logic;
        S: in std_logic_vector(1 downto 0);
        H: out std_logic
     );
    end component; 
    constant gate_delay: Time := 1 ns;
    --signal signal0_2, signal1_3, signal2_4, signal3_5, signal4_6, signal5_7, signal6_8, signal7_9, signal8_10, signal9_11, signal10_12, signal11_13, signal12_14, signal13_15 : std_logic;
begin
 
       
  mux00: mux_shifter PORT MAP(
        in0 => B(0),
        in1 =>B(1),
        in2 =>IL,
        S => S,  
        H => H(0)
  );     
  mux01: mux_shifter PORT MAP(
        in0 => B(1),
        in1 =>B(2),
        in2 =>B(0),
        S => S,  
        H => H(1)
  );    
  mux02: mux_shifter PORT MAP(
        in0 => B(2),
        in1 =>B(3),
        in2 =>B(1),
        S => S,  
        H => H(2)
  );    
  mux03: mux_shifter PORT MAP(
        in0 => B(3),
        in1 =>B(4),
        in2 =>B(5),
        S => S,  
        H => H(3)
  );    
  mux04: mux_shifter PORT MAP(
        in0 => B(4),
        in1 =>B(5),
        in2 =>B(3),
        S => S,  
        H => H(4)
  );    
  mux05: mux_shifter PORT MAP(
        in0 => B(5),
        in1 =>B(6),
        in2 =>B(4),
        S => S,  
        H => H(5)
  );    
  mux06: mux_shifter PORT MAP(
        in0 => B(6),
        in1 =>B(7),
        in2 =>B(5),
        S => S,  
        H => H(6)
  );    
  mux07: mux_shifter PORT MAP(
        in0 => B(7),
        in1 =>B(8),
        in2 =>B(6),
        S => S,  
        H => H(7)
  );    
  mux08: mux_shifter PORT MAP(
        in0 => B(8),
        in1 =>B(9),
        in2 =>B(7),
        S => S,  
        H => H(8)
  );    
  mux09: mux_shifter PORT MAP(
        in0 => B(9),
        in1 =>B(10),
        in2 =>B(8),
        S => S,  
        H => H(9)
  );    
  mux10: mux_shifter PORT MAP(
        in0 => B(10),
        in1 =>B(11),
        in2 =>B(9),
        S => S,  
        H => H(10)
  );    
  mux11: mux_shifter PORT MAP(
        in0 => B(11),
        in1 =>B(12),
        in2 =>B(10),
        S => S,  
        H => H(11)
  );    
  mux12: mux_shifter PORT MAP(
        in0 => B(12),
        in1 =>B(13),
        in2 =>B(11),
        S => S,  
        H => H(12)
  );    
  mux13: mux_shifter PORT MAP(
        in0 => B(13),
        in1 =>B(14),
        in2 =>B(12),
        S => S,  
        H => H(13)
  );    
  mux14: mux_shifter PORT MAP(
        in0 => B(14),
        in1 =>B(15),
        in2 =>B(13),
        S => S,  
        H => H(14)
  );    
  mux15: mux_shifter PORT MAP(
        in0 => B(15),
        in1 =>IR,
        in2 =>B(14),
        S => S,  
        H => H(15)
  );    
  SerialOutputL <= B(15) after gate_delay;
  SerialOutputR <= B(0) after gate_delay;
end Behavioral;