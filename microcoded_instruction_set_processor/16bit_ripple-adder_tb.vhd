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

entity ripple_adder_16bit_tb is
--  Port ( );
end ripple_adder_16bit_tb;

architecture Behavioral of ripple_adder_16bit_tb is


   COMPONENT ripple_adder_16bit
     Port (--S0, S1, c_in:in std_logic;
          c_in:in std_logic;
          A: in std_logic_vector(15 downto 0);
          B: in std_logic_vector(15 downto 0);
          G: out std_logic_vector(15 downto 0);
          c_out:out std_ulogic );   
   END COMPONENT;

    --input
    signal c_in: std_logic;
    signal A: std_logic_vector(15 downto 0);
    signal B: std_logic_vector(15 downto 0);
    --output
    signal G: std_logic_vector(15 downto 0);
    signal c_out: std_ulogic ;

begin
   
   uut: ripple_adder_16bit port map (-- S0    => S0,
                      --S1    => S1,
                      c_in  => c_in,
                      A     => A,
                      B     => B,
                      G     => G,
                      c_out => c_out );
        
    stim_proc: process
    begin
       wait for 1ns;
       --S0 <= '0';
       --S1 <= '0';
       c_in   <= '0';
       A <= "0000000000000001";
       B <= "0000000000000010";
       wait for 30ns;
       --S0 <= '0';
       --S1 <= '0';
       c_in   <= '1';
       --wait for 30ns;
       --S0 <= '1';
       --S1 <= '0';
       --c_in   <= '0';
       --A <= "1100001001000001";
       --B <= "1000010000000000";
       -- wait for 30ns;
       -- c_in   <= '1';
       
    end process; 
end Behavioral;