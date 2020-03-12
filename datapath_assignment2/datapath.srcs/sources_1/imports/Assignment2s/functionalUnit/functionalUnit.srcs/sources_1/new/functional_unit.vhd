----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 03:29:29 PM
-- Design Name: 
-- Module Name: functional_unit - Behavioral
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

entity functional_unit is
   Port (
         FS: in std_logic_vector(4 downto 0);
         A: in std_logic_vector(15 downto 0);
         B:in std_logic_vector(15 downto 0);
         output: out std_logic_vector(15 downto 0);
         v,c,n,z: out std_logic
    );
end functional_unit;




architecture Behavioral of functional_unit is
   component ALU
     Port (S0, S1,S2, c_in:in std_logic;
          A: in std_logic_vector(15 downto 0);
          B: in std_logic_vector(15 downto 0);
          G: out std_logic_vector(15 downto 0);
          c_out:out std_ulogic;
          v: out std_logic );
    end component;      
    
    
    component shifter
      Port (
        IR, IL: in std_logic;
        S: in std_logic_vector(1 downto 0);
        B: in std_logic_vector(15 downto 0);
        SerialOutputL,SerialOutputR: out std_logic;
        H: out std_logic_vector(15 downto 0));
    end component; 
    
    
    component mux_2to1 is
      Port (
        S2: in std_logic;
        from_arithmatic_circuit: in std_logic_vector(15 downto 0);
        from_logical_circuit: in std_logic_vector(15 downto 0);
        G_out: out std_logic_vector(15 downto 0)
    );
    end component;     
    
    signal signal0, signal1: std_logic_vector(15 downto 0);
    signal tmp_serealOutputL, tmp_serealOutputR: std_logic;
    signal Hselect: std_logic_vector(1 downto 0);
    
    constant gate_delay: Time := 1 ns;
begin
   Arithmatic_logic_unit: ALU port map(
     S0 => FS(3),
     S1 => FS(2),
     S2 => FS(1),
     c_in => FS(0),
     A => A,
     B => B,
     G =>signal0,
     c_out =>C,
     v => v
   );
   
   shifter_unit: shifter port map(
     IR => '0',
     IL => '0',
     S => Hselect,
     B => B,
     H =>signal1,
     SerialOutputL =>tmp_serealOutputL,
     SerialOutputR =>tmp_serealOutputR
   );
   
   mux_2to1_unit: mux_2to1 port map(
        S2 => FS(4),
        from_arithmatic_circuit => signal0,
        from_logical_circuit =>signal1,
        G_out =>output
   );
   
   n <= '1' after gate_delay when signal0(15) ='1' else
        '0' after gate_delay;
   z <= '1' after gate_delay when signal0="0000000000000000" else
        '0' after gate_delay;
   Hselect <=  "01" after gate_delay when FS="00100" or FS="00101" or FS="00110" or FS="00111" or FS="10100" else
               "10" after gate_delay when FS="01010" or FS="01100" or FS="01110" or FS="11000" else
               "00" after gate_delay ;   
end Behavioral;
