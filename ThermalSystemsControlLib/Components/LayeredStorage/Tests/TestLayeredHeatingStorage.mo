within ThermalSystemsControlLib.Components.LayeredStorage.Tests;
model TestLayeredHeatingStorage "Testing ready-to-integrate layered storage"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{0,32},{-20,52}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    m_flow=1.44,
    nPorts=1) annotation (Placement(transformation(extent={{32,-70},{12,-50}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=328.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=320.15
                                                                      "Start value of lower temperature";
  Modelica.Blocks.Sources.BooleanConstant mode(k=false)
                                                       annotation (Placement(transformation(extent={{24,0},{4,20}})));
  Modelica.Blocks.Sources.Constant const(k=273 + 55)
                                                annotation (Placement(transformation(extent={{80,-78},{60,-58}})));
  Components.LayeredStorage.LayeredHeatingStorage layeredHeatingStorage(
    n_Seg=7,
    T_start_upper=T_start_upper,
    T_start_mid=T_start_mid,
    T_start_lower=T_start_lower) annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Sources.Ramp ramp(height=1.44, duration(displayUnit="min") = 900) annotation (Placement(transformation(extent={{80,-40},{60,-20}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_feed(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,-60})));
equation
  connect(const.y, boundary1.T_in) annotation (Line(points={{59,-68},{42,-68},{42,-56},{34,-56}},
                                                                                              color={0,0,127}));
  connect(layeredHeatingStorage.mode, mode.y) annotation (Line(points={{-38.2,10},{3,10}},                color={255,0,255}));
  connect(layeredHeatingStorage.port_b, boundary.ports[1]) annotation (Line(points={{-40,20},{-40,42},{-20,42}},        color={0,127,255}));
  connect(ramp.y, boundary1.m_flow_in) annotation (Line(points={{59,-30},{32,-30},{32,-52}},color={0,0,127}));
  connect(temp_feed.port_b, layeredHeatingStorage.port_a) annotation (Line(points={{-40,-60},{-44,-60},{-44,-4},{-40,-4},{-40,0}}, color={0,127,255}));
  connect(temp_feed.port_a, boundary1.ports[1]) annotation (Line(points={{-20,-60},{12,-60}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredHeatingStorage;
