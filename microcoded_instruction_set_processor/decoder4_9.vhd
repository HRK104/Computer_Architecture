----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2020 03:22:17 PM
-- Design Name: 
-- Module Name: decoder3to8 - Behavioral
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


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;




entity decoder4to9 is
Port ( A0,A1,A2,A3 : in std_logic;
       Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8: out std_logic);
end decoder4to9;
architecture Behavioral of decoder4to9 is
begin
--process(A0,A1,A2)
--begin
Q0 <= '1' after 1ns when A0='0' and A1 ='0' and A2 = '0' and A3= '0' else '0';
Q1 <= '1' after 1ns when A0='1' and A1 ='0' and A2 = '0' and A3= '0'else '0';
Q2 <= '1' after 1ns when A0='0' and A1 ='1' and A2 = '0' and A3= '0'else '0';
Q3 <= '1' after 1ns when A0='1' and A1 ='1' and A2 = '0' and A3= '0'else '0';
Q4 <= '1' after 1ns when A0='0' and A1 ='0' and A2 = '1' and A3= '0'else '0';
Q5 <= '1' after 1ns when A0='1' and A1 ='0' and A2 = '1' and A3= '0'else '0';
Q6 <= '1' after 1ns when A0='0' and A1 ='1' and A2 = '1' and A3= '0'else '0';
Q7 <= '1' after 1ns when A0='1' and A1 ='1' and A2 = '1' and A3= '0'else '0';
Q8 <= '1' after 1ns when A0='0' and A1 ='0' and A2 = '0' and A3= '1'else '0';


--Q0<= ((not A0) and ((not A1) and (not A2))) ;
--Q1<= ((not A0) and (A1 and (not A2))) ;
--Q2<= ((not A0) and ((not A1) and A2)) ;
--Q3<= ((not A0) and (A1 and A2)) ;
--Q4<= (( A0) and ((not A1) and (not A2))) ;
--Q5<= (( A0) and (A1 and (not A2))) ;
--Q6<= (( A0) and ((not A1) and A2)) ;
--Q7<= (( A0) and (A1 and A2)) ;
--end process;
end Behavioral;
