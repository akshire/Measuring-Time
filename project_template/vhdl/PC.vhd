library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
    port(
        clk          : in  std_logic;
        reset_n      : in  std_logic;
        en           : in  std_logic;
        sel_a        : in  std_logic;
        sel_imm      : in  std_logic;
        sel_ihandler : in  std_logic;
        add_imm      : in  std_logic;
        imm          : in  std_logic_vector(15 downto 0);
        a            : in  std_logic_vector(15 downto 0);
        addr         : out std_logic_vector(31 downto 0)
    );
end PC;

architecture synth of PC is
    CONSTANT I_HANDLER_ADDRESS : std_logic_vector(15 downto 0) := X"0004";
    signal counter : std_logic_vector(15 downto 0);
    signal add_op : std_logic_vector(15 downto 0);
begin
    addr <= (15 downto 0 => '0') & counter;
    add_op <= imm when add_imm = '1' else X"0004";
    process(reset_n, clk)
    begin
        if (reset_n = '0') then
            counter <= (others => '0');
        elsif (rising_edge(clk)) then
            if (en = '1') then
                if ((sel_a or sel_imm or sel_ihandler) = '1') then
                    if (sel_imm = '1') then
                        counter <= imm(13 downto 0) & "00";
                    elsif (sel_ihandler = '1') then
                        counter <= I_HANDLER_ADDRESS;
                    else
                        counter <= a;
                    end if;
                else
                    counter <= std_logic_vector(unsigned(counter) + unsigned(add_op));
                end if;
            end if;
        end if;
    end process;
end synth;
