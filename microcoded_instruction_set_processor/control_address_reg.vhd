----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/04/16 10:47:06
-- Design Name: 
-- Module Name: control_address_reg - Behavioral
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

entity control_address_reg is
  Port ( 
    input_from_muxC: in std_logic_vector( 7 downto 0);
    input_from_muxS, reset: in std_logic;
    reset_input: in std_logic_vector( 7 downto 0);
    result: out std_logic_vector( 7 downto 0)
  );
end control_address_reg;

architecture Behavioral of control_address_reg is

begin
  result <= input_from_muxC after 1ns when input_from_muxS = '1' and reset ='0' else
            reset_input after 1ns when input_from_muxS = '0' and reset ='1' else
            "00000000" after 1ns; 

end Behavioral;
