within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record HP2
  extends ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChiller_Properties(
    riseTime=120,
    V_heat=0.05,
    V_cool=0.05,
    T_in_heat_max=353.15,
    T_in_heat_min=273.15,
    T_in_cool_max=293.15,
    T_in_cool_min=273.15,
    u_min=0.01,
    P_th_cool_nominal=9150,
    P_el_nominal=3340,
    f_PthMax=[0,35,45,55,65,72; -5,0.52,0.46,0.40,0.34,0.29; 0,0.63,0.57,0.57,0.43,0.37; 5,0.78,0.71,0.71,0.55,0.49; 10,0.92,0.85,0.77,0.67,0.6; 15,0.97,1,0.9,0.8,0.71],
    f_PelMax=[0,35,45,55,65,72; -5,0.46,0.55,0.65,0.77,0.86; 0,0.50,0.57,0.68,0.8,0.9; 5,0.48,0.58,0.70,0.83,0.93; 10,0.49,0.59,0.71,0.85,0.96; 15,0.5,0.61,0.74,0.88,1],
    f_Pel_partLoad = [0.0,0.0;0.5,0.61;0.75,0.79;1,1],
    dp_nominal_cool=64000,
    m_flow_nominal_cool=0.3,
    dp_nominal_heat=60000,
    m_flow_nominal_heat=0.2);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end HP2;
