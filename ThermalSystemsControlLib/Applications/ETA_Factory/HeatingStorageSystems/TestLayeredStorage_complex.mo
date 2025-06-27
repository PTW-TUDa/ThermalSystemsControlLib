within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage_complex
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-60,-60}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{74,-88},{54,-68}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_T_in=true,
    m_flow=1,
    nPorts=1) annotation (Placement(transformation(extent={{66,66},{46,86}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanConstant mode(k=true) annotation (Placement(transformation(extent={{94,-6},{74,14}})));
  Components.LayeredHeatingStorage.LayeredHeatingStorage layeredHeatingStorage annotation (Placement(transformation(extent={{-34,-34},{34,36}})));
  Modelica.Blocks.Sources.Constant input_Temp(k=345) annotation (Placement(transformation(extent={{100,70},{80,90}})));
equation
  connect(layeredHeatingStorage.port_b, boundary1.ports[1]) annotation (Line(points={{34,36},{34,76},{46,76}}, color={0,127,255}));
  connect(layeredHeatingStorage.port_a, boundary.ports[1]) annotation (Line(points={{34,-34},{34,-78},{54,-78}}, color={0,127,255}));
  connect(layeredHeatingStorage.mode, mode.y) annotation (Line(points={{40.12,1},{66,1},{66,4},{73,4}}, color={255,0,255}));
  connect(input_Temp.y, boundary1.T_in) annotation (Line(points={{79,80},{68,80}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage_complex;
