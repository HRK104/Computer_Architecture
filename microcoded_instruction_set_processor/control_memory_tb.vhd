library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity control_memory_tb is
end;

architecture bench of control_memory_tb is

  component control_memory 
   Port( 
    MW : out std_logic; 
    MM : out std_logic; 
    RW : out std_logic; 
    MD : out std_logic; 
    FS : out std_logic_vector(4 downto 0); 
    MB : out std_logic; 
    TB : out std_logic; 
    TA : out std_logic; 
    TD : out std_logic;
    PL : out std_logic; 
    PI : out std_logic; 
    IL : out std_logic; 
    MC : out std_logic; 
    MS : out std_logic_vector(2 downto 0); 
    NA : out std_logic_vector(7 downto 0); 
    IN_CAR : in std_logic_vector(7 downto 0)); 
  end component;

  signal MW: std_logic;
  signal MM: std_logic;
  signal RW: std_logic;
  signal MD: std_logic;
  signal FS: std_logic_vector(4 downto 0);
  signal MB: std_logic;
  signal TB: std_logic;
  signal TA: std_logic;
  signal TD: std_logic;
  signal PL: std_logic;
  signal PI: std_logic;
  signal IL: std_logic;
  signal MC: std_logic;
  signal MS: std_logic_vector(2 downto 0);
  signal NA: std_logic_vector(7 downto 0);
  signal IN_CAR: std_logic_vector(7 downto 0);

begin

  uut: control_memory port map ( MW     => MW,
                                 MM     => MM,
                                 RW     => RW,
                                 MD     => MD,
                                 FS     => FS,
                                 MB     => MB,
                                 TB     => TB,
                                 TA     => TA,
                                 TD     => TD,
                                 PL     => PL,
                                 PI     => PI,
                                 IL     => IL,
                                 MC     => MC,
                                 MS     => MS,
                                 NA     => NA,
                                 IN_CAR => IN_CAR );

  stimulus: process
  begin
  
    wait for 10ns;
    IN_CAR <= "00000000";
    wait for 10ns;
    IN_CAR <= "00000001";
    wait for 10ns;
    IN_CAR <= "00000010";
    wait for 10ns;
    IN_CAR <= "00000100";
    wait for 10ns;
    IN_CAR <= "00001000";
    wait for 10ns;
    IN_CAR <= "00010000";
    wait for 10ns;
    IN_CAR <= "00100000";
    wait for 10ns;
    IN_CAR <= "01000000";
    wait for 10ns;
    IN_CAR <= "10000000";
    
    



   
  end process;


end;
  