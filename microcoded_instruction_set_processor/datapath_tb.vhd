library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity datapath_tb is
end;

architecture bench of datapath_tb is

  component datapath
    Port (
          FS: in std_logic_vector(4 downto 0);
          TD, TA, TB, MB, MM, MD,RW: in std_logic;
          DR,SA,SB: in std_logic_vector(2 downto 0);
          output_from_PC:  in std_logic_vector(15 downto 0);
          data_in: in std_logic_vector(15 downto 0);
          --Address_Out, Data_Out,output_from_registerFile_A_ver2, output_from_muxD_ver2,output_from_functional_ver2: out std_logic_vector(15 downto 0);
          Address_Out, Data_Out: out std_logic_vector(15 downto 0);
          v,c,n,z: out std_logic
     );
  end component;

  signal FS: std_logic_vector(4 downto 0);
  signal TD, TA, TB, MB, MM, MD,RW: std_logic;
  signal DR,SA,SB: std_logic_vector(2 downto 0);
  signal output_from_PC: std_logic_vector(15 downto 0);
  signal data_in: std_logic_vector(15 downto 0);
  --signal Address_Out, Data_Out,output_from_registerFile_A_ver2, output_from_muxD_ver2,output_from_functional_ver2: std_logic_vector(15 downto 0);
  signal Address_Out, Data_Out: std_logic_vector(15 downto 0);  
  signal v,c,n,z: std_logic ;

begin

  uut: datapath port map ( FS             => FS,
                           TD             => TD,
                           TA             => TA,
                           TB             => TB,
                           MB             => MB,
                           MM             => MM,
                           MD             => MD,
                           RW             => RW,
                           DR             => DR,
                           SA             => SA,
                           SB             => SB,
                           output_from_PC => output_from_PC,
                           data_in        => data_in,
                           Address_Out    => Address_Out,
                           Data_Out       => Data_Out,
                           --muxD_output    => muxD_output,
--                           output_from_registerFile_A_ver2 => output_from_registerFile_A_ver2,
--                           output_from_muxD_ver2 => output_from_muxD_ver2,
--                           output_from_functional_ver2 => output_from_functional_ver2,
                           v              => v,
                           c              => c,
                           n              => n,
                           z              => z );

  stimulus: process
  begin
  
    
    wait for 30ns;
    output_from_PC <= "1111111111111111";
    FS <= "00000";
    MM <='0';
    RW <='1';
    MD <='0';
    MB <='0';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "000"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "000"; --BA=TB+SB
    
    wait for 30ns;
    FS <= "00001";
    MM <='0';
    MD <='0';
    MB <='0';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "001"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "000"; --BA=TB+SB
    wait for 30ns;
    FS <= "00010";
    MM <='0';
    MD <='1';
    MB <='1';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "010"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "000"; --BA=TB+SB
    wait for 30ns;
    FS <= "00011";
    MM <='0';
    MD <='1';
    MB <='1';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "011"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "000"; --BA=TB+SB
    wait for 30ns;
    FS <= "00100";
    MM <='0';
    MD <='1';
    MB <='1';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "100"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "000"; --BA=TB+SB
    wait for 30ns;
    FS <= "00101";
    FS <= "00100";
    MM <='0';
    MD <='1';
    MB <='1';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "101"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "000"; --BA=TB+SB
--    wait for 10ns;
--    FS <= "00110";
--    MM <='0';
--    MD <='1';
--    MB <='1';
--    data_in <= "0000000000000001";
--    TD <='0';
--    DR <= "110"; --DA=TD+DR
--    TA <= '0';
--    SA <= "000"; --AA=TA+SA
--    TB <= '0';
--    SB <= "000"; --BA=TB+SB
    wait for 30ns;
    FS <= "00111";
    MM <='0';
    MD <='1';
    MB <='1';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "111"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "000"; --BA=TB+SB
    
    
    
    
    
    wait for 30ns;
    FS <= "00100";
    MM <='0';
    MD <='1';
    MB <='1';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "010"; --DA=TD+DR
    TA <= '0';
    SA <= "010"; --AA=TA+SA
    TB <= '0';
    SB <= "001"; --BA=TB+SB
    wait for 30ns;
    FS <= "00100";
    MM <='0';
    MD <='0';
    MB <='1';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "100"; --DA=TD+DR
    TA <= '0';
    SA <= "000"; --AA=TA+SA
    TB <= '0';
    SB <= "010"; --BA=TB+SB
    wait for 30ns;
    FS <= "00100";
    MM <='0';
    MD <='1';
    MB <='0';
    data_in <= "0000000000000001";
    TD <='0';
    DR <= "110"; --DA=TD+DR
    TA <= '0';
    SA <= "101"; --AA=TA+SA
    TB <= '0';
    SB <= "010"; --BA=TB+SB
    
    
    
    
    

    
  end process;


end;