within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage_complex
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{-76,-58},{-56,-38}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    m_flow=1,
    nPorts=1) annotation (Placement(transformation(extent={{-82,56},{-62,76}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.Ramp ramp(
    height=50,
    duration=50,
    offset=330,
    startTime=50) annotation (Placement(transformation(extent={{-94,8},{-74,28}})));
  Components.LayeredHeatingStorage.PhysicalModels.LayeredStorage_Physical_test layeredStorage_Physical_test annotation (Placement(transformation(extent={{38,-22},{-8,28}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant annotation (Placement(transformation(extent={{-94,-24},{-74,-4}})));
equation
  connect(boundary1.ports[1], layeredStorage_Physical_test.port_feed) annotation (Line(points={{-62,66},{-8,66},{-8,28}}, color={0,127,255}));
  connect(ramp.y, layeredStorage_Physical_test.feedTemperature) annotation (Line(points={{-73,18},{-12.14,18}}, color={0,0,127}));
  connect(layeredStorage_Physical_test.port_discharge, boundary.ports[1]) annotation (Line(points={{-7.54,-9.5},{-46,-9.5},{-46,-49},{-56,-49}}, color={0,127,255}));
  connect(layeredStorage_Physical_test.port_charge, boundary.ports[2]) annotation (Line(points={{-8,-21},{-8,-47},{-56,-47}}, color={0,127,255}));
  connect(booleanConstant.y, layeredStorage_Physical_test.mode) annotation (Line(points={{-73,-14},{-48,-14},{-48,3},{-12.14,3}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage_complex;
