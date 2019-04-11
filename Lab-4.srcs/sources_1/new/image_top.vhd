----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2019 11:21:15 AM
-- Design Name: 
-- Module Name: image_top - Behavioral
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

entity image_top is
    port( signal clk : in std_logic;
          signal vga_r , vga_b : out std_logic_vector(4 downto 0);
          signal vga_g : out std_logic_vector(5 downto 0);
          signal vga_hs, vga_vs : out std_logic
         );
end image_top;

architecture Behavioral of image_top is

signal vga_vs_temp : std_logic;
signal enable : std_logic;
signal vid : std_logic;
signal douta : std_logic_vector(7 downto 0);
signal hcount : std_logic_vector(9 downto 0);
signal addr : std_logic_vector(17 downto 0);

component picture is
port(addra : in std_logic_vector(17 downto 0);
     clka : in std_logic;
     douta : out std_logic_vector(7 downto 0)
     );
end component;

component pixel_pusher is
port( clk, en, vid, vs : in std_logic;
      pixel : in std_logic_vector(7 downto 0);
      hcount : in std_logic_vector(9 downto 0);
      R, B : out std_logic_vector(4 downto 0);
      G : out std_logic_vector(5 downto 0);
      addr : out std_logic_vector(17 downto 0)
      );
end component;

component vga_ctrl is
port( clk, en : in std_logic;
      hcount : out std_logic_vector(9 downto 0);
      vid : out std_logic;
      hs : out std_logic;
      vs : out std_logic
      );
end component;

component clock_div is
port( clock_in : in std_logic;
      clock_out : out std_logic
      );
end component;
      
begin

clk_div: clock_div port map(
    clock_in => clk,
    clock_out => enable
);

pixel_push : pixel_pusher port map(
    clk => clk,
    en => enable,
    vs => vga_vs_temp,
    vid => vid,
    pixel => douta,
    hcount => hcount,
    addr => addr,
    R => vga_r,
    B => vga_b,
    G => vga_g
);

pic : picture port map(
    clka => clk,
    addra => addr,
    douta => douta
);

vga_control : vga_ctrl port map(
    en => enable,
    clk => clk,
    hcount => hcount,
    vid => vid,
    hs => vga_hs,
    vs => vga_vs_temp
);

vga_vs <= vga_vs_temp;



end Behavioral;
