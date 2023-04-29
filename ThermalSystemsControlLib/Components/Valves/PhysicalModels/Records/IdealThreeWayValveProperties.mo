within ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records;
record IdealThreeWayValveProperties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Volume V_int = 0.001 "Internal valve volume";
  parameter Real u_min = 1e-4 "Minimal valve position (allow small leakage instead of 0 to improve numerical stability)";
  parameter Real u_max = 1-1e-4 "Maximal valve position (allow small leakage instead of 1 to improve numerical stability)";
  parameter SI.Time riseTime=50 "Rise time of the filter (time to reach 99.6 % of the nominal opening)";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end IdealThreeWayValveProperties;
