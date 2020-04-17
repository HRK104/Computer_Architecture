----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2020 03:10:13 PM
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity shifter_tb is
end;

architecture bench of shifter_tb is

  component shifter
    Port (
          IR, IL: in std_logic;
          S: in std_logic_vector(1 downto 0);
          B: in std_logic_vector(15 downto 0);
          SerialOutputL,SerialOutputR: out std_logic;
          H: out std_logic_vector(15 downto 0)
     );
  end component;

  signal IR, IL,SerialOutputL,SerialOutputR: std_logic;
  signal S: std_logic_vector(1 downto 0);
  signal B: std_logic_vector(15 downto 0);
  signal H: std_logic_vector(15 downto 0) ;

begin

  uut: shifter port map ( IR            => IR,
                          IL            => IL,
                          SerialOutputL => SerialOutputL,
                          SerialOutputR => SerialOutputR,
                          S             => S,
                          B             => B,
                          H             => H );

  stimulus: process
  begin
    wait for 10ns;
    B <= "0101010101010101";
    IR <= '0'; IL <= '0';  S <= "00";
    wait for 10ns;
    IR <= '1'; IL <= '0';  S <= "00";
    wait for 10ns;
    IR <= '0'; IL <= '1';  S <= "00";
    wait for 10ns;
    IR <= '1'; IL <= '1';  S <= "00";
    wait for 10ns;
    IR <= '0'; IL <= '0'; S <= "01";
    wait for 10ns;
    IR <= '1'; IL <= '0';  S <= "01";
    wait for 10ns;
    IR <= '0'; IL <= '1';  S <= "01";
    wait for 10ns;
    IR <= '1'; IL <= '1';  S <= "01";
    wait for 10ns;
    IR <= '0'; IL <= '0';  S <= "10";
    wait for 10ns;
    IR <= '1'; IL <= '0'; S <= "10";
    wait for 10ns;
    IR <= '0'; IL <= '1';  S <= "10";
    wait for 10ns;
    IR <= '1'; IL <= '1';  S <= "10";
    
    
  end process;


end;
