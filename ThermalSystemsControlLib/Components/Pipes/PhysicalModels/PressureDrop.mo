within ThermalSystemsControlLib.Components.Pipes.PhysicalModels;
model PressureDrop
  extends ThermalSystemsControlLib.BaseClasses.Icons.PressureDrop_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  outer Modelica.Fluid.System system;

  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.PressureDifference dp_nominal=1000 "Nominal pressure difference";
  parameter SI.MassFlowRate m_flow_nominal=1 "Nominal mass flow rate";

  //Initialization
protected
  parameter SI.PressureDifference dp_start = 0 "Start value for pressure difference dp = port_a.p -port_b.p";
  parameter SI.MassFlowRate m_flow_start = system.m_flow_start "Start value for mass flow rate";
  final parameter Real k = m_flow_nominal/sqrt(dp_nominal);

  //Port variables
  SI.MassFlowRate m_flow(start=system.m_flow_start) = port_a.m_flow "Mass flow rate from port a to port b (m_flow > 0: a->b)";
  SI.PressureDifference dp(start=dp_start) = port_a.p-port_b.p "Pressure difference between port a and port b";
equation
  //Pressure balance
  dp = ThermalSystemsControlLib.Components.Pipes.PhysicalModels.BaseClasses.PressureLossFunction_PressureDrop(m_flow=m_flow,k=k);

  //Mass balance
  0 = port_a.m_flow + port_b.m_flow;

  // Isenthalpic state transformation (no storage and no loss of energy)
  port_a.h_outflow = if system.allowFlowReversal then inStream(port_b.h_outflow) else Medium.h_default;
  port_b.h_outflow = inStream(port_a.h_outflow);

  //Transport of Substances (other port variables)
  port_a.Xi_outflow = inStream(port_b.Xi_outflow);
  port_b.Xi_outflow = inStream(port_a.Xi_outflow);

  port_a.C_outflow = inStream(port_b.C_outflow);
  port_b.C_outflow = inStream(port_a.C_outflow);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Hydraulic resistance which is parameterized by nominal pressure difference and mass flow rate.</p>
</html>"));
end PressureDrop;
