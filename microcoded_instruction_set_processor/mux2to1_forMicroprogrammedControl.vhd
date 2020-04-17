----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/04/15 16:54:56
-- Design Name: 
-- Module Name: mux2to1_forMicroprogrammedControl - Behavioral
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

entity mux2to1_forMicroprogrammedControl is
 Port (
   MC: in std_logic;
   input_0, input_1: in std_logic_vector(7 downto 0);
   result: out std_logic_vector(7 downto 0)
  );
end mux2to1_forMicroprogrammedControl;

architecture Behavioral of mux2to1_forMicroprogrammedControl is

begin
 result <= input_0 after 1ns when MC='0' else
           input_1 after 1ns when MC='1';

end Behavioral;
