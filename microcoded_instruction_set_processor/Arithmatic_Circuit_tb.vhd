----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2020 12:00:55 PM
-- Design Name: 
-- Module Name: Arithmatic_Circuit_tb - Behavioral
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

entity Arithmatic_Circuit_tb is
--  Port ( );
end Arithmatic_Circuit_tb;

architecture Behavioral of Arithmatic_Circuit_tb is

  component Arithmatic_Circuit
      Port (S0, S1, c_in:in std_logic;
            A: in std_logic_vector(15 downto 0);
            B: in std_logic_vector(15 downto 0);
            --P: out std_logic_vector(15 downto 0);
            G: out std_logic_vector(15 downto 0);
            c_out:out std_ulogic );
  end component;

  signal S0, S1, c_in: std_logic;
  signal A: std_logic_vector(15 downto 0);
  signal B: std_logic_vector(15 downto 0);
  --signal P: std_logic_vector(15 downto 0);
  signal G: std_logic_vector(15 downto 0);
  signal c_out: std_ulogic ;

begin

  uut: Arithmatic_Circuit port map ( S0    => S0,
                                     S1    => S1,
                                     c_in  => c_in,
                                     A     => A,
                                     B     => B,
                                     --P     => P,
                                     G     => G,
                                     c_out => c_out );

  stimulus: process
  begin
       wait for 1ns;
       S0 <= '0';
       S1 <= '0';
       c_in   <= '0';
       A <= "0000000000000001";
       B <= "0000000000000010";
       wait for 30ns;
       S0 <= '0';
       S1 <= '0';
       c_in   <= '0';
       --A <= "1100001001000001";
       --B <= "1000010000000000";
       wait for 30ns;
       S0 <= '1';
       S1 <= '0';
       c_in   <= '0';
        wait for 30ns;
       S0 <= '0';
       S1 <= '1';
       c_in   <= '0';
        wait for 30ns;
       S0 <= '1';
       S1 <= '1';
       c_in   <= '0';
        wait for 30ns;
       S0 <= '0';
       S1 <= '0';
       c_in   <= '1';
        wait for 30ns;
       S0 <= '1';
       S1 <= '0';
       c_in   <= '1';
        wait for 30ns;
       S0 <= '0';
       S1 <= '1';
       c_in   <= '1';
        wait for 30ns;
       S0 <= '1';
       S1 <= '1';
       c_in   <= '1';

    wait;
  end process;

end Behavioral;
