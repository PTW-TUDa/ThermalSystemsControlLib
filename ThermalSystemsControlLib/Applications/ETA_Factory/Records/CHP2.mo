within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record CHP2
  extends Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Properties(
    P_el_nominal=8.5e3,
    P_gas_nominal=30.1e3,
    f_effPth=[0,273.15 + 30,273.15 + 40,273.15 + 50,273.15 + 60,273.15 + 65; 0.5,0.68,0.62,0.44,0.53,0.5; 0.75,0.68,0.62,0.44,0.53,0.5; 1,0.67,0.61,0.56,0.52,0.49],
    u_min=0.5,
    T_return_min=273.15,
    T_return_max=338.15,
    V=0.05,
    riseTime=180,
    dp_nominal=5000,
    m_flow_nominal=0.24);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end CHP2;
