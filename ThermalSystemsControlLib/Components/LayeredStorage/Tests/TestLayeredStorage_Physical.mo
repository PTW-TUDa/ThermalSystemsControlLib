within ThermalSystemsControlLib.Components.LayeredStorage.Tests;
model TestLayeredStorage_Physical "Testing isolated layered storage"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{94,-40},{74,-20}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    m_flow=1.44,
    nPorts=1) annotation (Placement(transformation(extent={{-66,0},{-46,20}})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=328.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=320.15
                                                                      "Start value of lower temperature";
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanConstant mode(k=false) "true for charge" annotation (Placement(transformation(extent={{96,2},{76,22}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort feed_temp(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={4,12})));
  Modelica.Fluid.Sensors.VolumeFlowRate Q_feed(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-26,12})));
  Components.LayeredStorage.PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    T_start_upper=T_start_upper,
    T_start_mid=T_start_mid,
    T_start_lower=T_start_lower) annotation (Placement(transformation(extent={{24,2},{44,22}})));
  Modelica.Blocks.Sources.Ramp m_flow_input(
    height=1.44,
    duration(displayUnit="min") = 900,
    offset=0) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Sources.Constant temperature_input(k=328) annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
equation
  connect(boundary1.ports[1], Q_feed.port_a) annotation (Line(points={{-46,10},{-46,12},{-36,12}},              color={0,127,255}));
  connect(Q_feed.port_b, feed_temp.port_a) annotation (Line(points={{-16,12},{-6,12}},    color={0,127,255}));
  connect(layeredStorage_Physical.port_discharge, boundary.ports[1]) annotation (Line(points={{44,21.8},{44,26},{54,26},{54,-31},{74,-31}},  color={0,127,255}));
  connect(layeredStorage_Physical.port_charge, boundary.ports[2]) annotation (Line(points={{44,2.4},{44,-29},{74,-29}},    color={0,127,255}));
  connect(layeredStorage_Physical.mode, mode.y) annotation (Line(points={{45.8,12},{75,12}},       color={255,0,255}));
  connect(feed_temp.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{14,12},{24,12}},             color={0,127,255}));
  connect(temperature_input.y, boundary1.T_in) annotation (Line(points={{-79,-10},{-74,-10},{-74,6},{-76,6},{-76,14},{-68,14}},
                                                                                               color={0,0,127}));
  connect(m_flow_input.y, boundary1.m_flow_in) annotation (Line(points={{-79,50},{-66,50},{-66,18}},     color={0,0,127}));
  connect(feed_temp.T, layeredStorage_Physical.feedTemperature) annotation (Line(points={{4,23},{4,32},{22,32},{22,22}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    __Dymola_Commands);
end TestLayeredStorage_Physical;
