within ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Records;
record ViessmannVitobloc200_EM_6_15
  extends Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Type2_Properties(
    P_el_nom=6e3,
    P_gs_nom=22.2e3,
    f_effPth=[30 + 273.15,0.68; 40 + 273.15,0.66; 50 + 273.15,0.59; 60 + 273.15,0.55; 65 + 273.15,0.53],
    u_min=0.5,
    riseTime=180);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end ViessmannVitobloc200_EM_6_15;
