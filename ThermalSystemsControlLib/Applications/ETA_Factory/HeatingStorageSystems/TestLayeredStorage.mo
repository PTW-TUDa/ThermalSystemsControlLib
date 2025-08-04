within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage "Testing ready-to-integrate layered storage"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-60,-60}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{74,-88},{54,-68}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    m_flow=1.44,
    nPorts=1) annotation (Placement(transformation(extent={{66,66},{46,86}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=328.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=320.15
                                                                      "Start value of lower temperature";
  Modelica.Blocks.Sources.BooleanConstant mode(k=false)
                                                       annotation (Placement(transformation(extent={{100,-8},{80,12}})));
  Modelica.Blocks.Sources.Constant const(k=273 + 55)
                                                annotation (Placement(transformation(extent={{124,70},{104,90}})));
  Components.LayeredHeatingStorage.LayeredHeatingStorage layeredHeatingStorage(
    n_Seg=7,
    T_start_upper=T_start_upper,
    T_start_mid=T_start_mid,
    T_start_lower=T_start_lower) annotation (Placement(transformation(extent={{-34,-26},{20,30}})));
  Modelica.Blocks.Sources.Ramp ramp(height=1.44, duration(displayUnit="min") = 900) annotation (Placement(transformation(extent={{120,104},{100,124}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_feed(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,56})));
equation
  connect(const.y, boundary1.T_in) annotation (Line(points={{103,80},{68,80}},                color={0,0,127}));
  connect(layeredHeatingStorage.mode, mode.y) annotation (Line(points={{24.86,2},{79,2}},                 color={255,0,255}));
  connect(layeredHeatingStorage.port_b, boundary.ports[1]) annotation (Line(points={{20,30},{44,30},{44,-78},{54,-78}}, color={0,127,255}));
  connect(ramp.y, boundary1.m_flow_in) annotation (Line(points={{99,114},{66,114},{66,84}}, color={0,0,127}));
  connect(boundary1.ports[1], temp_feed.port_b) annotation (Line(points={{46,76},{30,76},{30,66}}, color={0,127,255}));
  connect(temp_feed.port_a, layeredHeatingStorage.port_a) annotation (Line(points={{30,46},{30,10},{32,10},{32,-26},{20,-26}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage;
