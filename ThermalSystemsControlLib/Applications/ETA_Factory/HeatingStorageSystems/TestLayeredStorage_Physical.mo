within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage_Physical "Testing isolated layered storage"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{80,-62},{60,-42}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    m_flow=1.44,
    nPorts=1) annotation (Placement(transformation(extent={{-78,-70},{-58,-50}})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=328.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=320.15
                                                                      "Start value of lower temperature";
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanConstant mode(k=false) "true for charge" annotation (Placement(transformation(extent={{104,-8},{84,12}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort feed_temp(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-16})));
  Modelica.Fluid.Sensors.VolumeFlowRate Q_feed(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-42})));
  Components.LayeredStorage.PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    T_start_upper=T_start_upper,
    T_start_mid=T_start_mid,
    T_start_lower=T_start_lower) annotation (Placement(transformation(extent={{-22,-22},{26,24}})));
  Modelica.Blocks.Sources.Ramp m_flow_input(
    height=1.44,
    duration(displayUnit="min") = 900,
    offset=0) annotation (Placement(transformation(extent={{-152,-26},{-132,-6}})));
  Modelica.Blocks.Sources.Constant temperature_input(k=328) annotation (Placement(transformation(extent={{-154,-66},{-134,-46}})));
equation
  connect(boundary1.ports[1], Q_feed.port_a) annotation (Line(points={{-58,-60},{-48,-60},{-48,-52}},           color={0,127,255}));
  connect(Q_feed.port_b, feed_temp.port_a) annotation (Line(points={{-48,-32},{-48,-26}}, color={0,127,255}));
  connect(layeredStorage_Physical.port_discharge, boundary.ports[1]) annotation (Line(points={{26,23.54},{26,24},{46,24},{46,-53},{60,-53}}, color={0,127,255}));
  connect(layeredStorage_Physical.port_charge, boundary.ports[2]) annotation (Line(points={{26,-21.08},{26,-51},{60,-51}}, color={0,127,255}));
  connect(layeredStorage_Physical.mode, mode.y) annotation (Line(points={{30.32,1},{32,2},{83,2}}, color={255,0,255}));
  connect(feed_temp.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{-48,-6},{-48,1},{-23.44,1}}, color={0,127,255}));
  connect(temperature_input.y, boundary1.T_in) annotation (Line(points={{-133,-56},{-80,-56}}, color={0,0,127}));
  connect(m_flow_input.y, boundary1.m_flow_in) annotation (Line(points={{-131,-16},{-78,-16},{-78,-52}}, color={0,0,127}));
  connect(feed_temp.T, layeredStorage_Physical.feedTemperature) annotation (Line(points={{-59,-16},{-64,-16},{-64,19.86},{-26.8,19.86}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    __Dymola_Commands(file="plotsetup_simple.mos" "plotsetup", file="plotsetup7layers.mos" "plotsetup7layers"));
end TestLayeredStorage_Physical;
