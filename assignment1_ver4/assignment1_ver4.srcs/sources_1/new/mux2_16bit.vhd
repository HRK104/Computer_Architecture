----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2020 07:54:03 PM
-- Design Name: 
-- Module Name: mux2_16bit - Behavioral
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

entity mux2_16bit is
  Port (in0, in1: in std_logic_vector(15 downto 0);
        s : in std_logic;
        z: out std_logic_vector(15 downto 0) );
end mux2_16bit;

architecture Behavioral of mux2_16bit is

begin
   z <=
       in0 after 5ns when s = '0' else
       in1 after 5ns;
end Behavioral;
