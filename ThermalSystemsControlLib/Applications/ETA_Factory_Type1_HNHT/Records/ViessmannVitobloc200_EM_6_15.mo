within ThermalSystemsControlLib.Applications.ETA_Factory_Type1_HNHT.Records;
record ViessmannVitobloc200_EM_6_15
  extends Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Type1_Properties(
    P_el_nom=6e3,
    P_gs_nom=22.2e3,
    f_effPth=[0,273.15 + 30,273.15 + 40,273.15 + 50,273.15 + 60,273.15 + 65; 0.5,0.65,0.45,0.57,0.52,0.51; 0.75,0.65,0.45,0.57,0.52,0.51; 1,0.68,0.66,0.59,0.55,0.53],
    u_min=0.5,
    T_inMin=273.15,
    T_inMax=348.15,
    V_int=0.05,
    riseTime=180);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end ViessmannVitobloc200_EM_6_15;
