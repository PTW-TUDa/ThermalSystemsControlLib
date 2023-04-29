within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record EfficientEnergyEChiller_45_II
  extends ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerSimplifiedProperties(
    f_EER=[0,14,17,23,29,35,41; 16,100,16,7,4,3.5,3; 18,150,130,10,5,3.8,3.5; 20,170,140,12,6,4,3.8],
    riseTime=60,
    V_int_cool=0.05,
    T_Recooling_max=318.15,
    T_Recooling_min=278.15,
    u_min=0,
    P_el_nom=40e3);


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end EfficientEnergyEChiller_45_II;
