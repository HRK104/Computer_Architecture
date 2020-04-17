----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/04/15 15:52:06
-- Design Name: 
-- Module Name: mux8to1 - Behavioral
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

entity mux8to1 is
--  Port ( );
Port (
        MS: in std_logic_vector(2 downto 0);
        C,V,Z,N: in std_logic;
        result: out std_logic
   );
end mux8to1;


architecture Behavioral of mux8to1 is



begin
  result <= '0' when MS = "000" else
            '1' when MS = "001" else 
             C  when MS = "010" else
             V  when MS = "011" else
             Z  when MS = "100" else
             N  when MS = "101" else
             not C  when MS = "110" else
             not Z  when MS = "111" ;

end Behavioral;
