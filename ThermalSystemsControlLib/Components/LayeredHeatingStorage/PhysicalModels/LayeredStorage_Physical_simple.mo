within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical_simple
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper(displayUnit="K")=353.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower(displayUnit="K")=313.15
                                                                      "Start value of lower temperature";
  Modelica.Blocks.Interfaces.RealInput feedTemperature annotation (Placement(transformation(extent={{-134,42},{-100,76}}), iconTransformation(extent={{-134,42},{-100,76}})));
  Modelica.Fluid.Vessels.ClosedVolume volume_mid(
    redeclare package Medium = Medium,
    use_T_start=true,
    T_start=333.15,
    use_portsData=false,
    V=1,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={34,-32})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
  Modelica.Fluid.Interfaces.FluidPort_a feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{88,-108},{108,-88}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{24,18},{44,38}})));
  Modelica.Blocks.Sources.Constant openValve(k=1) annotation (Placement(transformation(extent={{-12,44},{8,64}})));
  Modelica.Blocks.Sources.Constant closeValve(k=0) annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(extent={{-46,22},{-26,42}})));
  Modelica.Fluid.Vessels.ClosedVolume volume_lower(
    redeclare package Medium = Medium,
    use_T_start=true,
    T_start=T_start_lower,
    use_portsData=false,
    V=1,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={54,-70})));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{-8,-62},{12,-42}}, rotation=0)));
  Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(extent={{-46,-58},{-26,-38}})));
  Modelica.Fluid.Interfaces.FluidPort_b discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Blocks.Logical.Switch switch3 annotation (Placement(transformation(extent={{-22,74},{-2,94}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{24,74},{44,94}}, rotation=0)));
  Modelica.Fluid.Vessels.ClosedVolume volume_upper(
    redeclare package Medium = Medium,
    use_T_start=true,
    T_start=T_start_upper,
    use_portsData=false,
    V=1,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={66,64})));
  Modelica.Fluid.Pipes.StaticPipe pipe_discharge(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,-8})));
  Modelica.Fluid.Pipes.StaticPipe pipe_charge(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={86,-78})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_upper(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{58,92},{78,112}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_mid(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-4,-22},{12,-8}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_lower(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{68,-58},{84,-44}})));
  Modelica.Blocks.Logical.Less less_lower annotation (Placement(transformation(extent={{-80,-58},{-60,-38}})));
  Modelica.Blocks.Logical.Less less_mid annotation (Placement(transformation(extent={{-72,24},{-58,40}})));
  Modelica.Blocks.Sources.RealExpression realExp_mid2(y=vol_temperature_upper.T) annotation (Placement(transformation(extent={{-130,18},{-116,34}})));
  Modelica.Blocks.Sources.RealExpression realExp_lower(y=vol_temperature_mid.T) annotation (Placement(transformation(extent={{-122,-64},{-108,-48}})));
  Modelica.Blocks.MathBoolean.Not not1 annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-56,-18})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation (Placement(transformation(extent={{-62,72},{-42,92}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual1 annotation (Placement(transformation(extent={{-82,-8},{-68,4}})));
  Modelica.Blocks.Logical.And and2 annotation (Placement(transformation(extent={{-7,-7},{7,7}},
        rotation=90,
        origin={-55,11})));
  Modelica.Blocks.Sources.RealExpression realExp_mid1(y=vol_temperature_lower.T) annotation (Placement(transformation(extent={{-136,-14},{-122,2}})));
equation
  connect(valveLinear.port_b, volume_mid.ports[1]) annotation (Line(points={{60,0},{64,0},{64,-32},{56,-32},{56,-33.5},{44,-33.5}}, color={0,127,255}));
  connect(feed, valveLinear.port_a) annotation (Line(points={{-106,0},{40,0}}, color={0,127,255}));
  connect(switch1.y, valveLinear.opening) annotation (Line(points={{45,28},{50,28},{50,8}}, color={0,0,127}));
  connect(openValve.y, switch1.u1) annotation (Line(points={{9,54},{22,54},{22,36}}, color={0,0,127}));
  connect(closeValve.y, switch1.u3) annotation (Line(points={{11,16},{14,16},{14,20},{22,20}}, color={0,0,127}));
  connect(and1.y, switch1.u2) annotation (Line(points={{-25,32},{12,32},{12,28},{22,28}}, color={255,0,255}));
  connect(valveLinear1.port_b, volume_lower.ports[1]) annotation (Line(points={{12,-52},{68,-52},{68,-66},{64,-66},{64,-71.5}}, color={0,127,255}));
  connect(feed, valveLinear1.port_a) annotation (Line(points={{-106,0},{-14,0},{-14,-52},{-8,-52}}, color={0,127,255}));
  connect(switch2.y, valveLinear1.opening) annotation (Line(points={{-25,-48},{-12,-48},{-12,-34},{2,-34},{2,-44}}, color={0,0,127}));
  connect(openValve.y, switch2.u1) annotation (Line(points={{9,54},{-22,54},{-22,-38},{-48,-38},{-48,-40}}, color={0,0,127}));
  connect(closeValve.y, switch2.u3) annotation (Line(points={{11,16},{14,16},{14,-2},{-54,-2},{-54,-56},{-48,-56}}, color={0,0,127}));
  connect(switch3.y, valveLinear2.opening) annotation (Line(points={{-1,84},{18,84},{18,102},{34,102},{34,92}}, color={0,0,127}));
  connect(feed, valveLinear2.port_a) annotation (Line(points={{-106,0},{-14,0},{-14,40},{14,40},{14,82},{20,82},{20,84},{24,84}}, color={0,127,255}));
  connect(valveLinear2.port_b, volume_upper.ports[1]) annotation (Line(points={{44,84},{86,84},{86,62.5},{76,62.5}}, color={0,127,255}));
  connect(openValve.y, switch3.u1) annotation (Line(points={{9,54},{12,54},{12,100},{-24,100},{-24,92}}, color={0,0,127}));
  connect(closeValve.y, switch3.u3) annotation (Line(points={{11,16},{14,16},{14,34},{-16,34},{-16,68},{-24,68},{-24,76}}, color={0,0,127}));
  connect(volume_upper.ports[2], pipe_discharge.port_a) annotation (Line(points={{76,63.5},{78,63.5},{78,62},{100,62},{100,2}}, color={0,127,255}));
  connect(pipe_discharge.port_b, discharge) annotation (Line(points={{100,-18},{100,-40}}, color={0,127,255}));
  connect(volume_upper.ports[3], volume_mid.ports[2]) annotation (Line(points={{76,64.5},{78,64.5},{78,62},{76,62},{76,-32.5},{44,-32.5}}, color={0,127,255}));
  connect(pipe_charge.port_b, charge) annotation (Line(points={{96,-78},{98,-78},{98,-98}}, color={0,127,255}));
  connect(volume_lower.ports[2], pipe_charge.port_a) annotation (Line(points={{64,-70.5},{70,-70.5},{70,-78},{76,-78}}, color={0,127,255}));
  connect(volume_mid.ports[3], volume_lower.ports[3]) annotation (Line(points={{44,-31.5},{68,-31.5},{68,-66},{64,-66},{64,-69.5}}, color={0,127,255}));
  connect(vol_temperature_upper.port, volume_upper.ports[4]) annotation (Line(points={{68,92},{68,84},{86,84},{86,65.5},{76,65.5}}, color={0,127,255}));
  connect(vol_temperature_mid.port, volume_mid.ports[4]) annotation (Line(points={{4,-22},{4,-34},{20,-34},{20,-46},{48,-46},{48,-30.5},{44,-30.5}},
                                                                                                                            color={0,127,255}));
  connect(vol_temperature_lower.port, volume_lower.ports[4]) annotation (Line(points={{76,-58},{76,-64},{72,-64},{72,-68.5},{64,-68.5}}, color={0,127,255}));
  connect(less_lower.y, switch2.u2) annotation (Line(points={{-59,-48},{-48,-48}}, color={255,0,255}));
  connect(feedTemperature, less_mid.u1) annotation (Line(points={{-117,59},{-90,59},{-90,32},{-73.4,32}}, color={0,0,127}));
  connect(realExp_mid2.y, less_mid.u2) annotation (Line(points={{-115.3,26},{-108,25.6},{-73.4,25.6}}, color={0,0,127}));
  connect(realExp_lower.y, less_lower.u2) annotation (Line(points={{-107.3,-56},{-82,-56}}, color={0,0,127}));
  connect(less_lower.y, not1.u) annotation (Line(points={{-59,-48},{-56,-48},{-56,-23.6}}, color={255,0,255}));
  connect(less_mid.y, and1.u1) annotation (Line(points={{-57.3,32},{-48,32}}, color={255,0,255}));
  connect(greaterEqual.y, switch3.u2) annotation (Line(points={{-41,82},{-32,82},{-32,84},{-24,84}}, color={255,0,255}));
  connect(feedTemperature, greaterEqual.u1) annotation (Line(points={{-117,59},{-74,59},{-74,82},{-64,82}}, color={0,0,127}));
  connect(realExp_mid2.y, greaterEqual.u2) annotation (Line(points={{-115.3,26},{-94,26},{-94,74},{-64,74}}, color={0,0,127}));
  connect(and2.y, and1.u2) annotation (Line(points={{-55,18.7},{-55,24},{-48,24}}, color={255,0,255}));
  connect(not1.y, and2.u2) annotation (Line(points={{-56,-13.2},{-56,-4},{-49.4,-4},{-49.4,2.6}}, color={255,0,255}));
  connect(feedTemperature, greaterEqual1.u1) annotation (Line(points={{-117,59},{-90,59},{-90,-2},{-83.4,-2}}, color={0,0,127}));
  connect(greaterEqual1.y, and2.u1) annotation (Line(points={{-67.3,-2},{-55,-2},{-55,2.6}}, color={255,0,255}));
  connect(feedTemperature, less_lower.u1) annotation (Line(points={{-117,59},{-90,59},{-90,-48},{-82,-48}}, color={0,0,127}));
  connect(realExp_mid1.y, greaterEqual1.u2) annotation (Line(points={{-121.3,-6},{-88,-6},{-88,-6.8},{-83.4,-6.8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LayeredStorage_Physical_simple;
