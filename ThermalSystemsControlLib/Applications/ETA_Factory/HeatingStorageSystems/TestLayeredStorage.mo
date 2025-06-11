within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Components.LayeredHeatingStorage.PhysicalModels.LayeredStorage_Physical_simple layeredStorage_Physical_simple(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-38,-30},{32,36}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{80,-62},{60,-42}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    m_flow=1,
    nPorts=1) annotation (Placement(transformation(extent={{-98,-12},{-78,8}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.Ramp ramp(
    height=50,
    duration=50,
    offset=330,
    startTime=50) annotation (Placement(transformation(extent={{-96,44},{-76,64}})));
equation
  connect(layeredStorage_Physical_simple.charge, boundary.ports[1]) annotation (Line(points={{31.3,-29.34},{31.3,-53},{60,-53}},     color={0,127,255}));
  connect(ramp.y, layeredStorage_Physical_simple.feedTemperature) annotation (Line(points={{-75,54},{-60,54},{-60,25.44},{-45.7,25.44}}, color={0,0,127}));
  connect(layeredStorage_Physical_simple.discharge, boundary.ports[2]) annotation (Line(points={{32,-10.2},{54,-10.2},{54,-51},{60,-51}},     color={0,127,255}));
  connect(boundary1.ports[1], layeredStorage_Physical_simple.feed) annotation (Line(points={{-78,-2},{-50,-2},{-50,3},{-40.1,3}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage;
