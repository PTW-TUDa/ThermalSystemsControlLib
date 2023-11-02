within ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Records;
record EfficientEnergy_eChiller_45_II
  extends ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerSimplifiedProperties(
    V_int_cool=0.05,
    f_EER=[0,14,17,23,29,35,41; 16,18,16,7,4,3.5,3; 18,16,13,10,5,3.8,3.5; 20,16,14,12,6,4,3.8],
    riseTime=180,
    T_Recooling_max=318.15,
    T_Recooling_min=278.15,
    u_min=0.01,
    P_el_nom=12.3e3);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end EfficientEnergy_eChiller_45_II;
