within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record CHP1
  extends Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Properties(
    P_el_nominal=6e3,
    P_gas_nominal=22.2e3,
    f_effPth=[0,273.15 + 30,273.15 + 40,273.15 + 50,273.15 + 60,273.15 + 65; 0.5,0.65,0.45,0.57,0.52,0.51; 0.75,0.65,0.45,0.57,0.52,0.51; 1,0.68,0.66,0.59,0.55,0.53],
    u_min=0.5,
    T_return_min=273.15,
    T_return_max=338.15,
    V=0.05,
    riseTime=180,
    dp_nominal=5000,
    m_flow_nominal=0.2);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end CHP1;
