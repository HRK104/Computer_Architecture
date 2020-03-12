----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2020 12:41:38 PM
-- Design Name: 
-- Module Name: Logical_Circuit - Behavioral
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

entity Logical_Circuit is
  Port ( 
    S0: in std_logic;
    S1: in std_logic;
    A: in std_logic_vector(15 downto 0);
    B: in std_logic_vector(15 downto 0);
    output_B: out std_logic_vector(15 downto 0)
  );
end Logical_Circuit;

architecture Behavioral of Logical_Circuit is

  component mux_4to1
     Port (
          S0,S1:in std_logic;
          A: in std_logic;
          B: in std_logic;
          G:out std_ulogic );
   end component;    

begin
  mux00: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(0),
    B => B(0),
    G => output_B(0)
  );
  
  mux01: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(1),
    B => B(1),
    G => output_B(1)
  );
  
  mux02: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(2),
    B => B(2),
    G => output_B(2)
  );
  
  mux03: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(3),
    B => B(3),
    G => output_B(3)
  );
  
  mux04: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(4),
    B => B(4),
    G => output_B(4)
  );
  
  mux05: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(5),
    B => B(5),
    G => output_B(5)
  );
  
  mux06: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(6),
    B => B(6),
    G => output_B(6)
  );
  
  mux07: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(7),
    B => B(7),
    G => output_B(7)
  );
  
  mux08: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(8),
    B => B(8),
    G => output_B(8)
  );
  
  mux09: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(9),
    B => B(9),
    G => output_B(9)
  );
  
  mux10: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(10),
    B => B(10),
    G => output_B(10)
  );
  
  mux11: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(11),
    B => B(11),
    G => output_B(11)
  );
  
  mux12: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(12),
    B => B(12),
    G => output_B(12)
  );
  
  mux13: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(13),
    B => B(13),
    G => output_B(13)
  );
  
  mux14: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(14),
    B => B(14),
    G => output_B(14)
  );
  
  mux15: mux_4to1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A => A(15),
    B => B(15),
    G => output_B(15)
  );
  
 
  
  
end Behavioral;
