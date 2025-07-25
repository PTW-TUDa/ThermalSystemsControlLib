within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{80,-62},{60,-42}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_m_flow_in=false,
    use_T_in=true,
    m_flow=1.44,
    nPorts=1) annotation (Placement(transformation(extent={{-78,-70},{-58,-50}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false) annotation (Placement(transformation(extent={{84,20},{64,40}})));
  Components.LayeredHeatingStorage.PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    n_Seg=5,
    T_start_upper=331.15,
    T_start_lower=320.15,
    T_start_mid=328.15)                                                                           annotation (Placement(transformation(extent={{-34,-34},{30,36}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort feed_temp(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-16})));
  Modelica.Fluid.Sensors.VolumeFlowRate Q_feed(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-42})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=28,
    duration(displayUnit="min") = 900,
    offset=273 + 27) annotation (Placement(transformation(extent={{-156,-14},{-136,6}})));
equation
  connect(layeredStorage_Physical.mode, booleanConstant.y) annotation (Line(points={{35.76,1},{58,1},{58,30},{63,30}}, color={255,0,255}));
  connect(layeredStorage_Physical.port_discharge, boundary.ports[1]) annotation (Line(points={{30,35.3},{60,35.3},{60,-53}},      color={0,127,255}));
  connect(layeredStorage_Physical.port_charge, boundary.ports[2]) annotation (Line(points={{30,-32.6},{60,-32.6},{60,-51}}, color={0,127,255}));
  connect(boundary1.ports[1], Q_feed.port_a) annotation (Line(points={{-58,-60},{-52,-60},{-52,-52},{-48,-52}}, color={0,127,255}));
  connect(Q_feed.port_b, feed_temp.port_a) annotation (Line(points={{-48,-32},{-48,-26}}, color={0,127,255}));
  connect(feed_temp.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{-48,-6},{-48,1},{-35.92,1}}, color={0,127,255}));
  connect(ramp.y, boundary1.T_in) annotation (Line(points={{-135,-4},{-102,-4},{-102,-62},{-80,-62},{-80,-56}}, color={0,0,127}));
  connect(ramp.y, layeredStorage_Physical.feedTemperature) annotation (Line(points={{-135,-4},{-62,-4},{-62,29.7},{-40.4,29.7}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    __Dymola_Commands(file="plotsetup_simple.mos" "plotsetup", file="plotsetup7layers.mos" "plotsetup7layers"));
end TestLayeredStorage;
