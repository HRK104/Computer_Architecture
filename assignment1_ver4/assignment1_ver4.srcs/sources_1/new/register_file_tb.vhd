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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file_tb is
end;

architecture bench of register_file_tb is

  component register_file
      Port ( src_s0 : in std_logic;
             src_s1 : in std_logic;
             src_s2 : in std_logic;
             des_A0 : in std_logic;
             des_A1 : in std_logic;
             des_A2 : in std_logic;
             Clk : in std_logic;
             data_src : in std_logic;
             data : in std_logic_vector(15 downto 0);
             reg0 : out std_logic_vector(15 downto 0);
             reg1 : out std_logic_vector(15 downto 0);
             reg2 : out std_logic_vector(15 downto 0);
             reg3 : out std_logic_vector(15 downto 0);
             reg4 : out std_logic_vector(15 downto 0);
             reg5 : out std_logic_vector(15 downto 0);
             reg6 : out std_logic_vector(15 downto 0);
             reg7 : out std_logic_vector(15 downto 0));
  end component;

  signal src_s0: std_logic;
  signal src_s1: std_logic;
  signal src_s2: std_logic;
  signal des_A0: std_logic;
  signal des_A1: std_logic;
  signal des_A2: std_logic;
  signal Clk: std_logic;
  signal data_src: std_logic;
  signal data: std_logic_vector(15 downto 0);
  signal reg0: std_logic_vector(15 downto 0);
  signal reg1: std_logic_vector(15 downto 0);
  signal reg2: std_logic_vector(15 downto 0);
  signal reg3: std_logic_vector(15 downto 0);
  signal reg4: std_logic_vector(15 downto 0);
  signal reg5: std_logic_vector(15 downto 0);
  signal reg6: std_logic_vector(15 downto 0);
  signal reg7: std_logic_vector(15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: register_file port map ( src_s0   => src_s0,
                                src_s1   => src_s1,
                                src_s2   => src_s2,
                                des_A0   => des_A0,
                                des_A1   => des_A1,
                                des_A2   => des_A2,
                                Clk      => Clk,
                                data_src => data_src,
                                data     => data,
                                reg0     => reg0,
                                reg1     => reg1,
                                reg2     => reg2,
                                reg3     => reg3,
                                reg4     => reg4,
                                reg5     => reg5,
                                reg6     => reg6,
                                reg7     => reg7 );

  stimulus: process
  begin
  
    -- Put initialisation code here
        
        src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '0';
        data_src <= '0';
        data <= "0000000000000001";
        

    -- Put test bench stimulus code here
        wait for 10ns;
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '0';
        data <= "0000000000000010";
        
        wait for 10ns;
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '0';
        data <= "0000000000000100";
        
        wait for 10ns;
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '0';
        data <= "0000000000001000";
        
        wait for 10ns;
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '1';
        data <= "0000000000010000";
        
        wait for 10ns;
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '1';
        data <= "0000000000100000";
        
        wait for 10ns;
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '1';
        data <= "0000000001000000";
        
        wait for 10ns;
        --data_src <= '1';
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '1';
        data <= "0000000010000000";
         wait for 10ns;
        --transfer the value of Reg0 to Reg7
        data_src <= '1';
        src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '1';
        
        --wait for 10ns;
        --data_src <= '0';
        --src_s0 <= '0';
        --src_s1 <= '0';
        --src_s2 <= '0';
        --des_A0 <= '1';
        --des_A1 <= '1';
        --des_A2 <= '1';
        --data <= "0000000010000000";
        
        
        wait for 30ns;
        --transfer the value of reg1 into reg6
        data_src <= '1';
        src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '1';
        wait for 10ns;
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '1';
        
        
       
        

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;