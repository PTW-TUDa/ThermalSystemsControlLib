within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record SV
  extends ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.ThreeWayValveProperties(
  dp_nominal = 10000,
  m_flow_nominal = 0.89,
  riseTime = 60,
  V_int = 0.01);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SV;
