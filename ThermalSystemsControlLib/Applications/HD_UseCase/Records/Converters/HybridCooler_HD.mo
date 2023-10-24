within ThermalSystemsControlLib.Applications.HD_UseCase.Records.Converters;
record HybridCooler_HD
  extends ThermalSystemsControlLib.Components.HybridCooler.PhysicalModels.Records.HybridCoolerProperties(
    T_water_in_min=278.15,
    T_water_in_max=368.15,
    m_flow_nom=10,
    U=4000,
    A=40,
    V1=1,
    V2=1,
    redeclare Pumps.SimplePump_HD_HybridCooler_Ventilation deviceData_Ventilation);
  annotation (Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HybridCooler_HD;
