within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record Belimo_R2020_S2_ThreeWay
  extends ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.ThreeWayValveProperties(
  dp_nominal = 390,
  m_flow_nominal = 0.6,
  riseTime = 30,
  V_int = 0.01);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Belimo_R2020_S2_ThreeWay;
