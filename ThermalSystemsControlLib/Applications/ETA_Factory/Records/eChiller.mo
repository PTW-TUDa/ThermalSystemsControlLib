within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record eChiller
  extends ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerSimplifiedProperties(
    V=0.05,
    f_EER=[0,14,17,23,29,35,41; 16,18,16,7,4,3.5,3; 18,16,13,10,5,3.8,3.5; 20,16,14,12,6,4,3.8],
    riseTime=180,
    T_cooling_max=313.15,
    T_cooling_min=283.15,
    u_min=0.025,
    P_el_nominal=12.3e3,
    dp_nominal=15000,
    m_flow_nominal=1.38);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end eChiller;
