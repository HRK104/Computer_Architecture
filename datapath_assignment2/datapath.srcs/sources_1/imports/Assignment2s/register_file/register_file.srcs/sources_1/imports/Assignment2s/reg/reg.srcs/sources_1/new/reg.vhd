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




entity reg is
   port (D: in std_logic_vector(15 downto 0);
         write, fromDecoder : in std_logic;
         Q : out std_logic_vector(15 downto 0));
end reg;

architecture Behavioral of reg is
  signal load: std_logic;
begin
  load <= (write and fromDecoder)after 1ns;
  Q<=D after 1 ns when load ='1';
  
end Behavioral;
