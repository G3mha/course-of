library ieee;
use ieee.std_logic_1164.all;

entity extendSignal is
    generic
    (
        data_width_in  : natural := 16;
        data_width_out : natural := 32
    );
    port
    (
        input  : in  std_logic_vector(data_width_in-1 downto 0);
        sel    : in  std_logic;
        output : out std_logic_vector(data_width_out-1 downto 0)
    );
end entity;

architecture comportamento of extendSignal is
    signal sign_ext_imm : std_logic_vector(data_width_out-1 downto 0) := (others => input(data_width_in-1)) & input;
    signal zero_ext_imm : std_logic_vector(data_width_out-1 downto 0) := (others => '0') & input;
begin
    output <= zero_ext_imm when sel = '1' else sign_ext_imm;
end architecture;
