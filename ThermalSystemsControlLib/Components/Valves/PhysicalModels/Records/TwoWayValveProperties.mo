within ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records;
record TwoWayValveProperties
 extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
 parameter SI.PressureDifference dp_nominal "Nominal pressure difference";
 parameter SI.MassFlowRate m_flow_nominal "Nominal mass flow rate";
 parameter SI.Time riseTime "Rise time to reach nominal opening (= 99.6 %)";
 parameter Real leakageOpening(min=0,max=1)=0.0001 "The opening signal is limited by leakageOpening (to improve the numerics)";
 parameter Real u_min = 0.5 "Minimum opening for setting bStatusOn to true";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TwoWayValveProperties;
