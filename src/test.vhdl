library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
    port(
        clk     : in std_logic;
        rst_n   : in std_logic;
        ena     : in std_logic;

        ui_in   : in std_logic_vector(7 downto 0);
        uo_out  : out std_logic_vector(7 downto 0);
        uio_in  : in std_logic_vector(7 downto 0);
        uio_out : out std_logic_vector(7 downto 0);
        uio_oe  : out std_logic_vector(7 downto 0)
    );
end entity;


architecture behaviour of top_module is
begin

    process(clk) begin

        if rising_edge(clk) then
            uo_out <= ui_in;
        end if;
    end process;

end architecture;
