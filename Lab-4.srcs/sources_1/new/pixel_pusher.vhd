library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pixel_pusher is
    port(
          signal clk, en, vs, vid : in std_logic;
          signal pixel : in std_logic_vector(7 downto 0);
          signal hcount : in std_logic_vector(9 downto 0);
          signal R :  out std_logic_vector(4 downto 0);
          signal B : out std_logic_vector(4 downto 0);
          signal G : out std_logic_vector(5 downto 0);
          signal addr : out std_logic_vector(17 downto 0)
         );
end pixel_pusher;

architecture Behavioral of pixel_pusher is

signal addrIn : std_logic_vector(17 downto 0) := (others => '0');


begin

adder : process(clk)
begin
if (rising_edge(clk)) then
    
    if en = '1' and vid = '1'and unsigned(hcount) < 480 then
        R <= pixel(7 downto 5) & "00";
        G <= pixel(4 downto 2) & "000";
        B <= pixel(1 downto 0) & "000";
        addrIn <= std_logic_vector(unsigned(addrIn)+1);
    else
        R <= (others => '0');
        G <= (others => '0');
        B <= (others => '0');
    end if;
    
    if vs = '0' then
        addrIn <= (others => '0');
    end if;
end if;
end process;

addr <= addrIn;

end Behavioral;
