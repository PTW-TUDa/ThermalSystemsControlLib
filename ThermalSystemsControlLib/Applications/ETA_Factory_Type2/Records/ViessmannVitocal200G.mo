within ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Records;
record ViessmannVitocal200G
  extends ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChiller_Type2_Properties(
    riseTime=120,
    min_dT=5,
    u_min=0.01,
    P_th_cool_nom=15990,
    P_el_nom=5170,
    f_PthMax=[0,35,45,55,65,72; -5,0.52,0.46,0.40,0.34,0.29; 0,0.63,0.57,0.57,0.43,0.37; 5,0.78,0.71,0.71,0.55,0.49; 10,0.92,0.85,0.77,0.67,0.6; 15,0.97,1,0.9,0.8,0.71],
    f_PelMax=[0,35,45,55,65,72; -5,0.46,0.55,0.65,0.77,0.86; 0,0.50,0.57,0.68,0.8,0.9; 5,0.48,0.58,0.70,0.83,0.93; 10,0.49,0.59,0.71,0.85,0.96; 15,0.5,0.61,0.74,0.88,1]);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end ViessmannVitocal200G;
