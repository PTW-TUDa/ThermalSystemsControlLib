within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record Belimo_R2032_S2
  extends ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties(
  dp_nominal = 10000,
  m_flow_nominal = 0.89,
  riseTime = 60);
  //kvs 32 -> R2032-S2
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Belimo_R2032_S2;
