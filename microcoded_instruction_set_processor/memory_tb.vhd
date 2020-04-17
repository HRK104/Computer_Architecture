--library IEEE;
--use IEEE.Std_logic_1164.all;
--use IEEE.Numeric_Std.all;

--entity memory_tb is
--end;

--architecture bench of memory_tb is

--  component memory
--   Port( 
--    address : in  std_logic_vector(unsigned (31 downto 0)); 
--    write_data : in std_logic_vector(31 downto 0); 
--    MemWrite, MemRead : in std_logic; 
--    read_data : out std_logic_vector(31 downto 0)
--    ); 
--   end component;

--  signal address: std_logic_vector(unsigned (31 downto 0));
--  signal write_data: std_logic_vector(31 downto 0);
--  signal MemWrite, MemRead: std_logic;
--  signal read_data: std_logic_vector(31 downto 0) ;

--begin

--  uut: memory port map ( address    => address,
--                         write_data => write_data,
--                         MemWrite   => MemWrite,
--                         MemRead    => MemRead,
--                         read_data  => read_data );

--  stimulus: process
--  begin
  
--    wait for 10ns;
--    address <=    "00000000000000000000000000000000";
--    write_data <= "00000000000000000000000000000001";
--    MemWrite <= '0';
--    MemRead <= '1';

--  end process;


--end;



----library IEEE;
----use IEEE.Std_logic_1164.all;
----use IEEE.Numeric_Std.all;

----entity memory_tb is
----end;

----architecture bench of memory_tb is

----  component memory
----   Port( 
----    address : in  std_logic_vector(unsigned (31 downto 0)); 
----    write_data : in std_logic_vector(31 downto 0); 
----    MemWrite, MemRead : in std_logic; 
----    read_data : out std_logic_vector(31 downto 0)
----    ); 
----   end component;

----  signal address: std_logic_vector(unsigned (31 downto 0));
----  signal write_data: std_logic_vector(31 downto 0);
----  signal MemWrite, MemRead: std_logic;
----  signal read_data: std_logic_vector(31 downto 0) ;

----begin

----  uut: memory port map ( address    => address,
----                         write_data => write_data,
----                         MemWrite   => MemWrite,
----                         MemRead    => MemRead,
----                         read_data  => read_data );

----  stimulus: process
----  begin
  
----    wait for 10ns;
----    address <= "00000000000000000000000000000000";
----    write_data <= "00000000000000000000000000000001";
----    MemWrite <= '1';
----    MemRead <= '1';

----  end process;


----end;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY memory_tb IS

END memory_tb;

ARCHITECTURE behavior OF memory_tb IS 

    COMPONENT memory
    PORT(
         address : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         MemWrite: IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

   signal address : std_logic_vector(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal MemWrite,MemRead : std_logic := '0';
   signal read_data : std_logic_vector(15 downto 0);

BEGIN

    uut: memory PORT MAP (
        address => address,
        write_data => write_data,
        MemWrite => MemWrite,
        read_data => read_data
    );

    stim_proc: process
    begin		
        wait for 10 ns;	
        address <= x"000a";
        MemRead <= '0';
        wait for 10 ns;
        MemWrite <= '1';
        MemRead <= '0';
        write_data <= x"1358";
        wait for 10 ns;
        MemWrite <= '0';
        MemRead <= '0';
        write_data <= x"9876";
        wait for 10 ns;	
        MemRead <= '1';
        address <= x"000a";
        wait for 10 ns;
        MemRead <= '1';
        MemWrite <= '1';
        write_data <= x"1358";
        wait for 10 ns;
        MemRead <= '1';
        MemWrite <= '0';
        write_data <= x"9876";
        wait;
        
   end process;
 end;       