----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2020 09:36:40 AM
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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
entity ALU_tb is
end;

architecture bench of ALU_tb is

  component ALU
      Port (S0, S1,S2, c_in:in std_logic;
            A: in std_logic_vector(15 downto 0);
            B: in std_logic_vector(15 downto 0);
            G: out std_logic_vector(15 downto 0);
            c_out:out std_ulogic;
            v: out std_logic );
  end component;

  signal S0, S1,S2, c_in: std_logic;
  signal A: std_logic_vector(15 downto 0);
  signal B: std_logic_vector(15 downto 0);
  signal G: std_logic_vector(15 downto 0);
  signal c_out: std_ulogic ;
  signal v: std_ulogic ;
  
begin

  uut: ALU port map ( S0    => S0,
                      S1    => S1,
                      S2    => S2,
                      c_in  => c_in,
                      A     => A,
                      B     => B,
                      G     => G,
                      c_out => c_out,
                      v => v );

  stimulus: process
  begin
    wait for 10ns;
    A <= "0000000000000001";
    B <= "0000000000000010";
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    c_in <= '0';
    
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    c_in <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    c_in <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '0';
    c_in <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    S2 <= '1';
    c_in <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '1';
    c_in <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '1';
    c_in <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '1';
    c_in <= '0';
    
    
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    c_in <= '1';
    
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    c_in <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    c_in <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '0';
    c_in <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    S2 <= '1';
    c_in <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '1';
    c_in <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '1';
    c_in <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '1';
    c_in <= '1';
  end process;


end;