----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2020 11:43:59 AM
-- Design Name: 
-- Module Name: datapath_tb - Behavioral
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

entity datapath_tb is
end;

architecture bench of datapath_tb is

  component datapath
    Port (
          FS: in std_logic_vector(4 downto 0);
          Load_enable,MDselect,MBselect: in std_logic;
          data_in, constant_in: in std_logic_vector(15 downto 0);
          destinationSelect,Aselect,Bselect: in std_logic_vector(2 downto 0);
          Address_Out, Data_Out: out std_logic_vector(15 downto 0);
          v,c,n,z: out std_logic
     );
  end component;

  signal FS: std_logic_vector(4 downto 0);
  signal Load_enable,MDselect,MBselect: std_logic;
  signal data_in, constant_in: std_logic_vector(15 downto 0);
  signal destinationSelect,Aselect,Bselect: std_logic_vector(2 downto 0);
  signal Address_Out, Data_Out: std_logic_vector(15 downto 0);
  signal v,c,n,z: std_logic ;

begin

  uut: datapath port map ( FS                => FS,
                           Load_enable       => Load_enable,
                           MDselect          => MDselect,
                           MBselect          => MBselect,
                           data_in           => data_in,
                           constant_in       => constant_in,
                           destinationSelect => destinationSelect,
                           Aselect           => Aselect,
                           Bselect           => Bselect,
                           Address_Out       => Address_Out,
                           Data_Out          => Data_Out,
                           v                 => v,
                           c                 => c,
                           n                 => n,
                           z                 => z );

  stimulus: process
  
  
   
  
  begin
    wait for 10ns;
    FS <= "00000";
    Load_enable <='1';
    MDselect <='0';
    MBselect <='0';
    data_in <= "0000000000000001";
    constant_in <= "0000000000000010";
    destinationSelect <="000";
    Aselect <= "000";
    Bselect <="000";
    
    wait for 10ns;
    FS <= "00001";
    MDselect <='1';
    MBselect <='1';
    destinationSelect <="001";
    Aselect <= "000";
    Bselect <="000";
    wait for 10ns;
    FS <= "00010";
    MDselect <='1';
    MBselect <='1';
    destinationSelect <="010";
    Aselect <= "000";
    Bselect <="000";
    wait for 10ns;
    FS <= "00011";
    MDselect <='1';
    MBselect <='1';
    destinationSelect <="011";
    Aselect <= "000";
    Bselect <="000";
    wait for 10ns;
    FS <= "00100";
    MDselect <='1';
    MBselect <='1';
    destinationSelect <="100";
    Aselect <= "000";
    Bselect <="000";
    wait for 10ns;
    FS <= "00101";
    MDselect <='1';
    MBselect <='1';
    destinationSelect <="101";
    Aselect <= "000";
    Bselect <="000";
    wait for 10ns;
    FS <= "00110";
    MDselect <='1';
    MBselect <='1';
    destinationSelect <="110";
    Aselect <= "000";
    Bselect <="000";
    wait for 10ns;
    FS <= "00111";
    MDselect <='1';
    MBselect <='1';
    destinationSelect <="111";
    Aselect <= "000";
    Bselect <="000";
    
    
    
    
    
    wait for 10ns;
    MDselect <='0';
    MBselect <='0';
    destinationSelect <="010";
    Aselect <= "010";
    Bselect <="001";
    wait for 10ns;
    MDselect <='0';
    MBselect <='1';
    destinationSelect <="100";
    Aselect <= "000";
    Bselect <="010";
    wait for 10ns;
    MDselect <='1';
    MBselect <='0';
    destinationSelect <="110";
    Aselect <= "101";
    Bselect <="010";
  end process;


end;