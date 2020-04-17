----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2020 04:25:00 PM
-- Design Name: 
-- Module Name: reg - Behavioral
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




entity instruction_reg is
   port (input: in std_logic_vector(15 downto 0);
         IL : in std_logic;
         opcode: out std_logic_vector(7 downto 0);
         DR,SA,SB : out std_logic_vector(2 downto 0));
end instruction_reg;

architecture Behavioral of instruction_reg is
  
begin
  
  
  opcode(7) <= '0' after 1ns when IL = '1';
  opcode(6) <= input(15) after 1ns when IL ='1';
  opcode(5) <= input(14) after 1ns when IL ='1';
  opcode(4) <= input(13) after 1ns when IL ='1';
  opcode(3) <= input(12) after 1ns when IL ='1';
  opcode(2) <= input(11) after 1ns when IL ='1';
  opcode(1) <= input(10) after 1ns when IL ='1';
  opcode(0) <= input(9) after 1ns when IL ='1';
  DR(2) <= input(8) after 1ns when IL = '1';
  DR(1) <= input(7) after 1ns when IL = '1';
  DR(0) <= input(6) after 1ns when IL = '1';
  SA(2) <= input(5) after 1ns when IL = '1';
  SA(1) <= input(4) after 1ns when IL = '1';
  SA(0) <= input(3) after 1ns when IL = '1';
  SB(2) <= input(2) after 1ns when IL = '1';
  SB(1) <= input(1) after 1ns when IL = '1';
  SB(0) <= input(0) after 1ns when IL = '1';
end Behavioral;
