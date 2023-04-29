within ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records;
record IdealPumpProperties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Time riseTime "Rise time of the filter (time to reach 99.6 % of the nominal opening)";
  parameter Real u_max "Maximum opening";
  parameter Real u_min "Minimum opneing";
  parameter SI.MassFlowRate m_flow_nom "Nominal mass flow rate";
  parameter SI.Power P_el_nom "Nominal electrical power";
  parameter Real f_el=0.7 "Electrical power correction factor - e.g. 0.7 for ASM / 0.9 for PMSM";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end IdealPumpProperties;
