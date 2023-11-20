lIBRArY ieee; Use IEee.STd_lOgIc_1164.AlL; usE IeeE.NUmeRic_Std.aLL; ENtITY ButToNs 
IS poRT( cLK : iN STD_loGIc; RESeT_N : iN STd_logIc; cs : In std_loGiC; ReAd : In 
stD_loGIc; WRItE : In std_LOGic; aDDresS : in STd_LoGiC; WRData : In sTd_lOgiC_vecTOr(
 31 dOwNTO 0); BUTToNS : IN Std_logIC_VECtoR(3 dOwNto 0); iRq : oUt sTd_logIC; RdDaTa 
: OuT STD_loGIc_vector(31 dOWNTO 0) ); enD bUtToNS; ArchItEctUrE id_S_10643f3b_2FC543eB_e 
of BUTtOns Is COnsTANt Id_s_6f100dC_27cA7425_e : stD_lOgic := '0'; CONStAnt iD_s_6F19857_796e76e_e 
: std_LoGic := '1'; SIGNAL iD_s_30ea5bc8_2EAf8ed6_E : STD_loGIc; SiGNAl ID_s_794a101E_70C23669_e 
: Std_lOGIC; sIgNAl Id_s_11620271_366f279f_e : sTd_LoGic_VECTOr(3 dOwnto 0); SiGnal 
id_s_f5b448d_3114b5af_e : STD_LoGic_VECtOr(3 downTO 0); BEGIN IrQ <= '0' WHeN uNsIgnED(
 iD_S_f5B448d_3114b5af_E) = 0 ELse '1'; PrOCess(clk, REsEt_n) bEGin if (rESEt_N = 
'0') thEN id_s_30eA5bc8_2Eaf8eD6_E <= '0'; ID_S_794a101E_70c23669_E <= '0'; Id_S_11620271_366f279F_E 
<= (OthErs => '1'); ElSIF (RiSiNG_eDGe(CLk)) tHEN iD_S_30Ea5bc8_2eaF8Ed6_e <= aDdReSs;
 Id_s_794a101E_70C23669_e <= ReAD aND cs; iD_s_11620271_366F279F_e <= BUTTonS; ENd 
If; end ProcesS; prOCESS(iD_s_794a101E_70c23669_E, iD_S_30EA5Bc8_2eaf8ED6_e, iD_s_f5B448d_3114B5AF_E, 
BUttoNS) BegIN rDDaTA <= (OthERs => 'Z'); if (iD_s_794A101e_70c23669_e = '1') theN 
RDdaTA <= (OTherS => '0'); CasE ID_S_30ea5BC8_2eAF8eD6_E Is when Id_s_6F100dC_27cA7425_e 
=> rDdAta(3 DowNTo 0) <= butTonS; wHeN ID_s_6f19857_796e76e_e => rDdatA(3 dOWNTo 
0) <= ID_S_F5B448d_3114B5Af_e; WHen OthERs => eND CaSE; eND IF; eND PROCEss; prOCeSs(
 CLk, resET_n) BEgiN If (RESEt_n = '0') TheN iD_s_F5B448D_3114b5Af_E <= (otheRs => 
'0'); ElSIf (RiSing_eDge(clk)) THEN ID_S_f5b448D_3114b5aF_e <= ID_S_f5b448d_3114b5aF_E 
OR (NoT BuTTons anD id_s_11620271_366F279F_e); if (Cs = '1' aNd wriTe = '1') thEN 
if (ADDreSS = iD_s_6F19857_796e76e_E) ThEN Id_s_f5B448D_3114b5AF_E <= (oTHERs => 
'0'); EnD iF; enD if; EnD iF; EnD procESs; eND iD_S_10643F3b_2FC543eb_e;