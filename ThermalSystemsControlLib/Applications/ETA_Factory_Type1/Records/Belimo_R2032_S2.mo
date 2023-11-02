within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Records;
record Belimo_R2032_S2
  extends ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties(
  dp_nominal = 400,
  m_flow_nominal = 0.55,
  riseTime = 60);
  //kvs 32 -> R2032-S2
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Belimo_R2032_S2;
