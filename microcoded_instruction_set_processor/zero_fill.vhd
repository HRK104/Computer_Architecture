----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/04/14 17:08:59
-- Design Name: 
-- Module Name: zero_fill - Behavioral
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

entity zero_fill is
 Port ( 
    SB: in std_logic_vector(2 downto 0);
    result: out std_logic_vector(15 downto 0)
 );
end zero_fill;

architecture Behavioral of zero_fill is

begin
  result(0) <= SB(0) after 1ns;
  result(1) <= SB(1) after 1ns;
  result(2) <= SB(2) after 1ns;
  result(3) <= '0' after 1ns;
  result(4) <= '0' after 1ns ;
  result(5) <= '0' after 1ns;
  result(6) <= '0' after 1ns;
  result(7) <='0' after 1ns;
  result(8) <= '0' after 1ns;
  result(9) <= '0' after 1ns;
  result(10) <= '0' after 1ns;
  result(11) <= '0' after 1ns;
  result(12) <= '0' after 1ns;
  result(13) <= '0' after 1ns;
  result(14) <= '0' after 1ns;
  result(15) <= '0' after 1ns;

end Behavioral;
