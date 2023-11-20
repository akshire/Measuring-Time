library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_registers is
    port(
        clk       : in  std_logic;
        reset_n   : in  std_logic;
        write_n   : in  std_logic;
        backup_n  : in  std_logic;
        restore_n : in  std_logic;
        address   : in  std_logic_vector(2 downto 0);
        irq       : in  std_logic_vector(31 downto 0);
        wrdata    : in  std_logic_vector(31 downto 0);

        ipending  : out std_logic;
        rddata    : out std_logic_vector(31 downto 0)
    );
end control_registers;

architecture synth of control_registers is
begin
end synth;
