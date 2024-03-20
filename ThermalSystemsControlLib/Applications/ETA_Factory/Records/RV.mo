within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record RV
  extends ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties(
  dp_nominal = 10000,
  m_flow_nominal = 0.89,
  riseTime = 60);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end RV;
