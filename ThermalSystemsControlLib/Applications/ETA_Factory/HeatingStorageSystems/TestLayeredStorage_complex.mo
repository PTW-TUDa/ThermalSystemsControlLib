within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage_complex
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-60,-60}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{74,-88},{54,-68}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    m_flow=1,
    nPorts=1) annotation (Placement(transformation(extent={{66,66},{46,86}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanConstant mode(k=true) annotation (Placement(transformation(extent={{96,-8},{76,12}})));
  Components.LayeredHeatingStorage.LayeredHeatingStorage layeredHeatingStorage annotation (Placement(transformation(extent={{-34,-34},{34,36}})));
  Modelica.Blocks.Sources.Constant input_Temp(k=350) annotation (Placement(transformation(extent={{138,70},{118,90}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=1.44,
    width=30,
    period=3600) annotation (Placement(transformation(extent={{126,28},{106,48}})));
equation
  connect(layeredHeatingStorage.port_b, boundary1.ports[1]) annotation (Line(points={{34,36},{34,76},{46,76}}, color={0,127,255}));
  connect(layeredHeatingStorage.port_a, boundary.ports[1]) annotation (Line(points={{34,-34},{34,-78},{54,-78}}, color={0,127,255}));
  connect(layeredHeatingStorage.mode, mode.y) annotation (Line(points={{40.12,1},{66,1},{66,2},{75,2}}, color={255,0,255}));
  connect(input_Temp.y, boundary1.T_in) annotation (Line(points={{117,80},{68,80}},color={0,0,127}));
  connect(input_Temp.y, layeredHeatingStorage.feed_temp) annotation (Line(points={{117,80},{76,80},{76,92},{-54,92},{-54,1},{-40.8,1}}, color={0,0,127}));
  connect(pulse.y, boundary1.m_flow_in) annotation (Line(points={{105,38},{102,38},{102,94},{66,94},{66,84}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage_complex;
