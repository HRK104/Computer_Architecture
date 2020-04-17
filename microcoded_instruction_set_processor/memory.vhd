
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity memory is
    Port ( address : in STD_LOGIC_VECTOR (15 downto 0);
           write_data : in  STD_LOGIC_VECTOR (15 downto 0);
           MemWrite : in  STD_LOGIC;
           read_data : out  STD_LOGIC_VECTOR (15 downto 0));
end memory;

architecture Behavioral of memory is

    type mem_array is array(0 to 7) of STD_LOGIC_VECTOR(15 downto 0);

begin

    mem_process: process(address, write_data, MemWrite)

        variable data_mem : mem_array := (
              x"0001",x"0008",x"0010",x"0080",x"0100",x"0800",x"1000",x"7000"
        );

        variable addr : integer;

    begin

        addr := conv_integer(unsigned(address(2 downto 0)));

        if MemWrite = '1' then
            data_mem(addr) := write_data ;          
--        elsif MemRead = '1' then
--            read_data <= data_mem(addr)    
        end if;

       read_data <= data_mem(addr) after 1 ns;

    end process;

end Behavioral;