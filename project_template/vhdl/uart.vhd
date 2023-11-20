LiBRARY Ieee; Use IeEE.std_lOgIC_1164.AlL; USE Ieee.NUmERIC_stD.ALl; ENtItY uarT 
Is POrT( clK : iN Std_loGIc; REseT_N : In Std_lOgic; cS : IN sTd_lOGiC; rEAd : IN 
STD_lOGic; write : In Std_lOGIC; addRESs : in stD_LoGIc_VeCtOr(1 dOWntO 0); wrdATA 
: In stD_LOgIC_VECtoR(31 dOWNTO 0); irQ : OUt sTD_logIc; RdDAta : OuT stD_LoGic_veCToR(
31 dOWnto 0); RX : IN stD_LoGiC; tx : out STD_LOGic ); eND uarT; arcHitEctuRE Id_s_10643F3B_2fC543eB_E 
of UarT iS TYPe Id_S_27B74327_77E04EBD_e iS (ID_s_7c985b03_389Af8b6_e, id_s_106149D3_35F88610_E, 
Id_s_7c95915F_1bA7b2aB_E, ID_S_7c9e1b4B_7E8931D3_e); SIgNal id_s_312B08f7_2BC654dC_e 
: Id_s_27b74327_77E04ebd_E; sIGnAl iD_S_4B1F8279_4f19Dc52_E : ID_S_27b74327_77E04ebD_e;
 constaNT Id_S_6539a62c_36786714_e : sTd_loGIc_vEctOr(15 Downto 0) := X"000a"; SignAl 
id_s_66EdceCE_74761131_e : std_LOgIc_VeCtoR(15 dOwNTO 0); sigNAL ID_s_5abE1D0_43cea0b4_E 
: Std_loGIC_VECtor(15 DownTO 0); SIGNal ID_S_263dD911_4e14fC2_e : STd_LogiC_VeCTOR(
7 dOwntO 0); SigNAL ID_S_30F74393_70A0fFf0_e : std_Logic_vEcTor(8 DOwnTo 0); SiGNAL 
Id_s_37235a98_529Ef533_E : sTD_LogiC_VeCtoR(2 doWNTo 0); cOnStanT id_S_2bA01825_46ff5C4b_e 
: std_loGic_VECtoR := "00"; coNstANT Id_S_5C938D94_72b92f21_E : sTD_logIC_vectoR 
:= "01"; CoNStAnt id_s_2b7FD006_1B21DE26_E : StD_lOGIc_VEcTOR := "10"; CoNsTaNT iD_S_41176B43_374AD1e5_E 
: STD_lOgic_VECTOr := "11"; Signal ID_s_30EA5BC8_2Eaf8eD6_E : STd_LOgic_VECtor(1 
DOWntO 0); sIGnAL ID_S_794a101E_70C23669_e : sTD_logiC; siGNal Id_s_3d8ff481_5Cc318B4_e 
: sTd_lOgic_VectOR(7 DowNtO 0); sIGNaL id_s_FAB828f_5e8B0560_E : STd_lOgIC; SIgNal 
iD_S_fAC9B51_5289BF1D_E : STd_lOgIC; sIgNAl Id_S_7c9D8506_5ED97b02_e : sTD_LogiC;
 siGnAl iD_s_7c9E9dc8_1f69bfac_e : StD_loGiC; SiGNaL ID_s_1a7CA34c_5C892162_e : sTD_LoGIC;
 beGIN IrQ <= (Id_S_7c9E9dc8_1F69bFaC_E AND ID_S_Fac9b51_5289bF1d_E) Or (Id_S_7C9d8506_5Ed97b02_E 
anD Id_S_faB828F_5e8b0560_e); ID_S_7c9e9Dc8_1F69bfAc_E <= '1' wHeN ID_S_4b1f8279_4f19Dc52_e 
= Id_s_7C985b03_389Af8B6_E eLSe '0'; tx <= Id_s_30F74393_70a0FFF0_e(8); PRoCESS(CLK, 
REsET_N) BEGIN iF (ReSeT_N = '0') TheN id_S_30ea5Bc8_2eaF8ed6_E <= (OtHERS => '0')
; iD_s_794A101e_70C23669_e <= '0'; iD_S_1a7cA34C_5C892162_E <= '1'; ELSiF (rISIng_edGe(
clK)) THEN id_s_30eA5bC8_2eaF8Ed6_E <= adDrEsS; iD_s_794a101e_70c23669_E <= Cs and 
rEad; iD_s_1A7Ca34C_5c892162_E <= RX; End iF; eNd ProCEsS; PrOcESs(id_S_794a101e_70C23669_e, 
id_s_30EA5bC8_2EAf8ED6_E, Id_s_7C9d8506_5ED97b02_e, ID_S_7C9E9dC8_1f69bfAc_E, id_S_3D8FF481_5cC318B4_e, 
Id_S_FAB828F_5e8b0560_E, Id_s_Fac9b51_5289bf1D_e) beGiN rdData <= (OThErS => 'Z')
; If (ID_s_794a101e_70C23669_e = '1') THEn rDDAta <= (OtheRs => '0'); caSe iD_s_30ea5bC8_2EaF8eD6_E 
IS WhEN iD_s_2Ba01825_46FF5c4B_e => rdDaTa(7 dOWNTO 0) <= Id_S_3D8Ff481_5Cc318B4_E;
 wHEN iD_S_2b7fd006_1B21DE26_E => rDdATA(0) <= Id_S_7C9D8506_5ed97b02_e; RDData(1)
 <= id_s_7c9e9DC8_1F69bfAC_e; WHEn ID_s_41176b43_374ad1E5_E => rDdATa(0) <= Id_S_fAb828f_5e8B0560_e;
 Rddata(1) <= iD_s_FaC9B51_5289BF1d_e; when OtHerS => END CaSE; EnD iF; eND PrOcesS;
 ProCESs(clk, ReSEt_n) bEgIN if (Reset_N = '0') THEn iD_S_Fac9B51_5289BF1D_E <= '0';
 Id_s_fab828f_5E8b0560_E <= '0'; eLSif (risIng_eDGE(CLK)) tHEN IF (CS = '1' aNd wRITe 
= '1' and aDdREss = ID_s_41176B43_374Ad1e5_e) THEn iD_s_FAB828f_5e8B0560_E <= WrdaTa(
0); Id_S_FaC9B51_5289bF1D_e <= wrDATA(1); End IF; End If; eNd PRocEsS; PROCeSs(CLK, 
ReSEt_N) begiN iF (rEset_n = '0') then ID_S_312B08f7_2Bc654DC_e <= iD_S_7c985b03_389aF8B6_e;
 id_S_7c9d8506_5eD97B02_E <= '0'; iD_S_263DD911_4e14fc2_e <= (OThErs => '1'); iD_S_3D8ff481_5cC318b4_e 
<= (OtherS => '0'); iD_S_66EdcEcE_74761131_E <= (OThErs => '0'); ELsIf (risiNg_edge(
clk)) then iF (id_S_794A101E_70c23669_e = '1' AND Id_s_30eA5bC8_2EAf8eD6_e = Id_s_2ba01825_46Ff5c4B_E)
 Then Id_s_7C9d8506_5Ed97b02_E <= '0'; ENd iF; casE id_S_312B08f7_2BC654DC_E is WHEN 
id_S_7C985b03_389af8b6_e => id_s_263Dd911_4e14FC2_E <= (7 DOWNto 1 => '1') & ID_S_1a7Ca34C_5c892162_E;
 Id_s_66EDCECe_74761131_E <= '0' & Id_S_6539A62C_36786714_E(15 DOWnTO 1); if (ID_s_1a7CA34c_5C892162_e 
= '0') ThEN Id_S_312B08f7_2BC654DC_E <= ID_s_106149D3_35F88610_E; END iF; whEN Id_S_106149d3_35f88610_e 
=> id_S_66EDcEcE_74761131_e <= Std_LoGic_VecTOR(UNsIGned(Id_s_66EDCECe_74761131_e)
 - 1); if (UnSIgNEd(iD_s_66EdceCe_74761131_E) = 0) tHEn iD_s_312B08F7_2bC654Dc_E 
<= Id_s_7c95915f_1ba7b2ab_e; id_s_66EDCECE_74761131_E <= ID_s_6539a62C_36786714_e;
 end If; wHeN ID_s_7C95915F_1Ba7B2ab_e => ID_S_66edceCe_74761131_e <= sTd_LoGiC_VEctoR(
uNSIGnED(ID_S_66EdCece_74761131_E) - 1); IF (uNsIgNeD(Id_s_66EDcEcE_74761131_e) = 
0) thEN ID_s_263dd911_4e14fc2_E <= ID_s_263dd911_4E14Fc2_E(6 DoWNTO 0) & Id_S_1a7Ca34c_5c892162_E;
 Id_s_66eDceCe_74761131_E <= Id_s_6539A62C_36786714_E; If (id_S_263dD911_4e14fc2_e(
7) = '0') thEN iD_s_312B08F7_2Bc654dC_E <= Id_s_7C9E1B4b_7E8931D3_e; Id_S_3d8fF481_5CC318b4_e 
<= ID_s_263dD911_4e14Fc2_E(6 DOwNTO 0) & iD_s_1a7ca34c_5C892162_E; id_S_7C9d8506_5ED97b02_e 
<= '1'; END if; ENd IF; wHeN iD_S_7C9E1b4b_7E8931D3_e => iD_S_66edCEcE_74761131_e 
<= stD_lOGIc_vECtoR(UnsiGNed(id_s_66edCece_74761131_e) - 1); if (uNsIgNEd(iD_S_66Edcece_74761131_e)
 = 0) ThEN id_s_312b08f7_2BC654Dc_e <= ID_S_7C985b03_389Af8b6_E; eND IF; WhEn oTHErS 
=> eND caSE; ENd iF; End PRoceSS; pROCeSs(cLk, REset_n) beGIN iF (Reset_n = '0') 
tHEN id_S_4B1F8279_4F19dc52_E <= id_s_7c985B03_389af8b6_E; ID_s_30f74393_70a0fFF0_E 
<= (OtHERS => '1'); Id_s_37235A98_529EF533_e <= (OtHers => '0'); iD_s_5abe1d0_43CEa0B4_e 
<= (OTHeRs => '0'); ELsIF (RiSINg_Edge(clk)) ThEn CaSE iD_s_4B1F8279_4F19dc52_e iS 
WHen id_s_7c985B03_389af8B6_e => IF (cS = '1' AnD wRITE = '1' AND addrEss = Id_s_5c938D94_72B92F21_E)
 then iD_s_4B1F8279_4F19Dc52_e <= Id_S_106149d3_35F88610_e; Id_s_30F74393_70A0Fff0_e 
<= '0' & WRData(7 DowntO 0); ID_s_5ABE1D0_43CEa0B4_e <= iD_S_6539A62c_36786714_e;
 ENd iF; WHeN ID_S_106149D3_35f88610_e => Id_S_5aBE1d0_43cEa0b4_e <= StD_lOgiC_VeCTOr(
UnSIGnED(Id_s_5ABE1d0_43CeA0b4_E) - 1); IF (uNSIGNed(ID_S_5aBe1D0_43cEA0b4_E) = 0)
 ThEN ID_s_4b1f8279_4f19dc52_e <= ID_s_7C95915f_1bA7b2AB_e; Id_s_5abe1D0_43CEA0B4_E 
<= Id_s_6539a62c_36786714_e; ID_s_30F74393_70a0ffF0_e <= Id_s_30f74393_70A0FFF0_e(
7 dowNto 0) & '1'; iD_S_37235A98_529Ef533_e <= "111"; eND IF; WHEN iD_s_7C95915F_1ba7b2Ab_E 
=> Id_S_5AbE1D0_43CEA0B4_e <= sTD_loGIc_VectOR(UNsignED(Id_S_5aBE1D0_43CEa0b4_E) 
- 1); iF (uNSiGNED(iD_s_5abE1D0_43CEa0B4_e) = 0) tHen iD_s_5aBe1d0_43CeA0b4_E <= 
iD_s_6539A62C_36786714_e; id_S_30F74393_70A0Fff0_E <= ID_S_30F74393_70A0FFF0_E(7 
dowNto 0) & '1'; ID_S_37235A98_529ef533_E <= stD_loGIC_VeCTor(unSIGNed(Id_s_37235A98_529ef533_e)
 - 1); iF (uNSIGned(ID_s_37235a98_529ef533_E) = 0) THEN Id_S_4b1f8279_4f19dC52_e 
<= Id_S_7c9e1b4B_7e8931D3_e; eND iF; EnD if; WhEn ID_S_7c9E1b4B_7e8931d3_E => iD_S_5aBe1d0_43cea0b4_e 
<= std_LogIc_vECToR(uNsiGnEd(Id_S_5abe1d0_43ceA0B4_e) - 1); If (uNsIgNEd(Id_s_5abe1D0_43ceA0B4_E)
 = 0) THeN id_S_4B1f8279_4F19DC52_e <= id_S_7c985b03_389af8b6_E; eND If; wHen otherS 
=> eNd casE; enD If; eND procEsS; EnD id_S_10643F3B_2Fc543eB_E;
