within ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records;
record ThreeWayValveProperties
 extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
 parameter SI.PressureDifference dp_nominal "Nominal pressure difference";
 parameter SI.MassFlowRate m_flow_nominal "Nominal mass flow rate";
 parameter SI.Time riseTime "Rise time to reach nominal opening (= 99.6 %)";
 parameter Real leakageOpening(min=0,max=1)=0.001 "The opening signal is limited by leakageOpening (to improve the numerics)";
 parameter SI.Volume V_int "Internal valve volume";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ThreeWayValveProperties;
