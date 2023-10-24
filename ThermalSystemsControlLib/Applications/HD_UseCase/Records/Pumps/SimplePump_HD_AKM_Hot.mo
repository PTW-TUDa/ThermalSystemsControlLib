within ThermalSystemsControlLib.Applications.HD_UseCase.Records.Pumps;
record SimplePump_HD_AKM_Hot
  extends ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties(
    riseTime=10,
    u_max=1,
    u_min=0.25,
    m_flow_nom=30,
    P_el_nom=3000,
    f_el=3);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SimplePump_HD_AKM_Hot;
