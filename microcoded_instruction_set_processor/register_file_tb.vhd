----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2020 05:58:51 PM
-- Design Name: 
-- Module Name: register_file_tb - Behavioral
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

entity register_file_tb is
end;

architecture bench of register_file_tb is

  component register_file
      Port ( 
             destination_select: in std_logic_vector(3 downto 0);
             data: in std_logic_vector(15 downto 0);
             write: in std_logic;
             selectA: in std_logic_vector(3 downto 0);
             selectB: in std_logic_vector(3 downto 0);
             A_data: out std_logic_vector(15 downto 0);
             B_data: out std_logic_vector(15 downto 0));
  end component;

  signal destination_select: std_logic_vector(3 downto 0);
  signal data: std_logic_vector(15 downto 0);
  signal write: std_logic;
  signal selectA: std_logic_vector(3 downto 0);
  signal selectB: std_logic_vector(3 downto 0);
  signal A_data: std_logic_vector(15 downto 0);
  signal B_data: std_logic_vector(15 downto 0);

begin

  uut: register_file port map ( destination_select => destination_select,
                                data               => data,
                                write              => write,
                                selectA            => selectA,
                                selectB            => selectB,
                                A_data             => A_data,
                                B_data             => B_data );

  stimulus: process
  begin
  
    
    --wait for 10ns;
    --data<="0101010101010101";
    --destination_select <= "0000";write<='1';selectA<="000";selectB<="000";
    --wait for 10ns;
    --destination_select <= "0001";write<='1';selectA<="000";selectB<="000";
    --wait for 10ns;
    --destination_select <= "0010";write<='1';selectA<="000";selectB<="000";
    --wait for 10ns;
    --destination_select <= "0011";write<='1';selectA<="001";selectB<="010";
    --wait for 10ns;
    --destination_select <= "0100";write<='1';selectA<="000";selectB<="001";
    --wait for 10ns;
    --destination_select <= "0101";write<='1';selectA<="010";selectB<="010";
    --wait for 10ns;
    --destination_select <= "0110";write<='1';selectA<="001";selectB<="111";
    --wait for 10ns;
    --destination_select <= "0111";write<='1';selectA<="100";selectB<="110";
    
    --wait for 10ns;
    ---destination_select <= "1000";write<='1';selectA<="101";selectB<="000";
    --wait for 10ns;
    --destination_select <= "1001";write<='1';selectA<="011";selectB<="111";
    --wait for 10ns;
    --destination_select <= "1010";write<='1';selectA<="011";selectB<="001";
    --wait for 10ns;
    --destination_select <= "1011";write<='1';selectA<="011";selectB<="100";
    --wait for 10ns;
    --destination_select <= "1100";write<='1';selectA<="010";selectB<="101";
    --wait for 10ns;
    --destination_select <= "1101";write<='1';selectA<="011";selectB<="110";
    --wait for 10ns;
    --destination_select <= "1110";write<='1';selectA<="100";selectB<="111";
    --wait for 10ns;
    --destination_select <= "1111";write<='0';selectA<="101";selectB<="000";
    
   
    wait for 10ns;
    data<="0000000000000000";
    destination_select <= "0000";write<='1';selectA<="0000";selectB<="0000";
    wait for 10ns;
    data<="0000000000000001";
    destination_select <= "0001";write<='1';selectA<="0000";selectB<="0000";
    wait for 10ns;
    data<="0000000000000010";
    destination_select <= "0010";write<='1';selectA<="0000";selectB<="0000";
    wait for 10ns;
    data<="0000000000000100";
    destination_select <= "0011";write<='1';selectA<="0001";selectB<="0010";
    wait for 10ns;
    data<="0000000000001000";
    destination_select <= "0100";write<='1';selectA<="0000";selectB<="1001";
    wait for 10ns;
    data<="0000000000010000";
    destination_select <= "0101";write<='1';selectA<="0010";selectB<="1010";
    wait for 10ns;
    data<="0000000000100000";
    destination_select <= "0110";write<='1';selectA<="0001";selectB<="1011";
    wait for 10ns;
    data<="0000000001000000";
    destination_select <= "0111";write<='1';selectA<="1100";selectB<="0110";
     wait for 10ns;
     data<="0000000010000000";
    destination_select <= "1000";write<='1';selectA<="1100";selectB<="0110";
    
    wait for 10ns;
    data<="0000000100000000";
    destination_select <= "0000";write<='1';selectA<="0101";selectB<="1000";
    wait for 10ns;
    data<="0000001000000000";
    destination_select <= "0001";write<='1';selectA<="0011";selectB<="0111";
    wait for 10ns;
    data<="0000010000000000";
    destination_select <= "0010";write<='1';selectA<="0111";selectB<="0001";
    wait for 10ns;
    data<="0000100000000000";
    destination_select <= "0011";write<='1';selectA<="0011";selectB<="0100";
    wait for 10ns;
    data<="0001000000000000";
    destination_select <= "0100";write<='1';selectA<="0010";selectB<="0101";
    wait for 10ns;
    data<="0100000000000000";
    destination_select <= "0101";write<='1';selectA<="0011";selectB<="0110";
    wait for 10ns;
    data<="1000000000000000";
    destination_select <= "0110";write<='1';selectA<="0100";selectB<="0111";
    wait for 10ns;
    data<="0000000000000000";
    destination_select <= "0111";write<='0';selectA<="0101";selectB<="0000";
    wait for 10ns;
    data<="0000000000000001";
    destination_select <= "1000";write<='0';selectA<="0101";selectB<="0000";
  end process;


end;