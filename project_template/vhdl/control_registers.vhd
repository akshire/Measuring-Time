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
    constant REG_STATUS : std_logic_vector := "000";
    constant REG_ESTATUS : std_logic_vector := "001";
    -- constant REG_BSTATUS : std_logic_vector := "010";
    constant REG_IENABLE : std_logic_vector := "011";
    constant REG_IPENDING : std_logic_vector := "100";
    -- constant REG_CPUID : std_logic_vector := "101";
    signal pie : std_logic; -- RW
    signal epie : std_logic; -- RW
    -- signal bpie : std_logic;
    signal ienable_reg : std_logic_vector(31 downto 0);
    signal ipending_reg : std_logic_vector(31 downto 0);
-- signal cpuid : std_logic_vector(31 downto 0);
begin
    ipending <= '1' when (unsigned(ipending_reg) /= 0 and pie = '1') else '0';
    ipending_reg <= ienable_reg and irq;
    -- read
    process(address, pie, epie, ipending_reg, ienable_reg)
    begin
        rddata <= (others => '0');
        case address is
            when REG_STATUS =>
                rddata(0) <= pie;
            when REG_ESTATUS =>
                rddata(0) <= epie;
            when REG_IENABLE =>
                rddata <= ienable_reg;
            when REG_IPENDING =>
                rddata <= ipending_reg;
            when others =>
        end case;
    end process;
    -- write
    process(clk, reset_n)
    begin
        if (reset_n = '0') then
            pie <= '0';
            epie <= '0';
            ienable_reg <= (others => '0');
        elsif (rising_edge(clk)) then
            if (backup_n = '0') then
                pie <= '0';
                epie <= pie;
            end if;
            if (restore_n = '0') then
                pie <= epie;
            end if;
            if (write_n = '0') then
                case address is
                    when REG_STATUS =>
                        pie <= wrdata(0);
                    when REG_ESTATUS =>
                        epie <= wrdata(0);
                    when REG_IENABLE =>
                        ienable_reg <= wrdata;
                    when others =>
                end case;
            end if;
        end if;
    end process;

end synth;
