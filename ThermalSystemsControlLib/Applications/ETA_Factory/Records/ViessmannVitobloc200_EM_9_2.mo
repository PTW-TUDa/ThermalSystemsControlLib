within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record ViessmannVitobloc200_EM_9_2
  extends Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPowerProperties(
    P_el_nom=8.5e3,
    P_gs_nom=20.1e3,
    f_effPth=[0,273.15 + 30,273.15 + 40,273.15 + 50,273.15 + 60,273.15 + 65; 0,0,0,0,0,0; 0.5,0.4,0.33,0.29,0.24,0.2; 0.75,0.54,0.47,0.43,0.38,0.34; 1,0.68,0.61,0.57,0.52,0.48],
    u_min=0.5,
    T_inMin=273.15,
    T_inMax=348.15,
    V_int=0.05,
    riseTime=120);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end ViessmannVitobloc200_EM_9_2;
