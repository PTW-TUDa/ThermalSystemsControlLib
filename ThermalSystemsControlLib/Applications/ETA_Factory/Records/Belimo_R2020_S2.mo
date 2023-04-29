within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record Belimo_R2020_S2
  extends ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties(
  dp_nominal = 390,
  m_flow_nominal = 0.6,
  riseTime = 30);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Belimo_R2020_S2;
