within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical_simple
  Modelica.Blocks.Interfaces.RealInput feedTemperature annotation (Placement(transformation(extent={{-142,48},{-102,88}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium,
    use_portsData=false,
    V=1,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={42,-32})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
  Modelica.Fluid.Interfaces.FluidPort_a feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{88,-108},{108,-88}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=343) annotation (Placement(transformation(extent={{-78,22},{-58,42}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{24,18},{44,38}})));
  Modelica.Blocks.Sources.Constant openValve(k=1) annotation (Placement(transformation(extent={{-12,44},{8,64}})));
  Modelica.Blocks.Sources.Constant closeValve(k=0) annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(extent={{-40,22},{-20,42}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=353) annotation (Placement(transformation(extent={{-80,-22},{-60,-2}})));
  Modelica.Fluid.Vessels.ClosedVolume volume1(
    redeclare package Medium = Medium,
    use_portsData=false,
    V=1,
    nPorts=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={56,-70})));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{-8,-62},{12,-42}}, rotation=0)));
  Modelica.Blocks.Logical.LessThreshold lessThreshold1(threshold=343) annotation (Placement(transformation(extent={{-80,-58},{-60,-38}})));
  Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(extent={{-46,-58},{-26,-38}})));
  Modelica.Fluid.Interfaces.FluidPort_b discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(threshold=353) annotation (Placement(transformation(extent={{-60,74},{-40,94}})));
  Modelica.Blocks.Logical.Switch switch3 annotation (Placement(transformation(extent={{-22,74},{-2,94}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{24,74},{44,94}}, rotation=0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(
    redeclare package Medium = Medium,
    use_portsData=false,
    V=1,
    nPorts=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={66,64})));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={96,36})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={78,-38})));
  Modelica.Fluid.Pipes.StaticPipe pipe2(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={74,-92})));
equation
  connect(valveLinear.port_b, volume.ports[1]) annotation (Line(points={{60,0},{64,0},{64,-33.5},{52,-33.5}}, color={0,127,255}));
  connect(feed, valveLinear.port_a) annotation (Line(points={{-106,0},{40,0}}, color={0,127,255}));
  connect(feedTemperature, greaterEqualThreshold.u) annotation (Line(points={{-122,68},{-90,68},{-90,32},{-80,32}}, color={0,0,127}));
  connect(switch1.y, valveLinear.opening) annotation (Line(points={{45,28},{50,28},{50,8}}, color={0,0,127}));
  connect(openValve.y, switch1.u1) annotation (Line(points={{9,54},{22,54},{22,36}}, color={0,0,127}));
  connect(closeValve.y, switch1.u3) annotation (Line(points={{11,16},{14,16},{14,20},{22,20}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, and1.u1) annotation (Line(points={{-57,32},{-42,32}}, color={255,0,255}));
  connect(and1.y, switch1.u2) annotation (Line(points={{-19,32},{12,32},{12,28},{22,28}}, color={255,0,255}));
  connect(lessThreshold.y, and1.u2) annotation (Line(points={{-59,-12},{-46,-12},{-46,16},{-50,16},{-50,24},{-42,24}}, color={255,0,255}));
  connect(feedTemperature, lessThreshold.u) annotation (Line(points={{-122,68},{-90,68},{-90,-12},{-82,-12}}, color={0,0,127}));
  connect(valveLinear1.port_b, volume1.ports[1]) annotation (Line(points={{12,-52},{68,-52},{68,-66},{66,-66},{66,-71.3333}}, color={0,127,255}));
  connect(feed, valveLinear1.port_a) annotation (Line(points={{-106,0},{-14,0},{-14,-52},{-8,-52}}, color={0,127,255}));
  connect(lessThreshold1.y, switch2.u2) annotation (Line(points={{-59,-48},{-48,-48}}, color={255,0,255}));
  connect(switch2.y, valveLinear1.opening) annotation (Line(points={{-25,-48},{-12,-48},{-12,-34},{2,-34},{2,-44}}, color={0,0,127}));
  connect(feedTemperature, lessThreshold1.u) annotation (Line(points={{-122,68},{-90,68},{-90,-48},{-82,-48}}, color={0,0,127}));
  connect(openValve.y, switch2.u1) annotation (Line(points={{9,54},{-22,54},{-22,-38},{-48,-38},{-48,-40}}, color={0,0,127}));
  connect(closeValve.y, switch2.u3) annotation (Line(points={{11,16},{14,16},{14,-2},{-54,-2},{-54,-56},{-48,-56}}, color={0,0,127}));
  connect(greaterEqualThreshold1.y, switch3.u2) annotation (Line(points={{-39,84},{-24,84}}, color={255,0,255}));
  connect(feedTemperature, greaterEqualThreshold1.u) annotation (Line(points={{-122,68},{-72,68},{-72,84},{-62,84}}, color={0,0,127}));
  connect(switch3.y, valveLinear2.opening) annotation (Line(points={{-1,84},{18,84},{18,102},{34,102},{34,92}}, color={0,0,127}));
  connect(feed, valveLinear2.port_a) annotation (Line(points={{-106,0},{-14,0},{-14,40},{14,40},{14,82},{20,82},{20,84},{24,84}}, color={0,127,255}));
  connect(valveLinear2.port_b, volume2.ports[1]) annotation (Line(points={{44,84},{86,84},{86,62.6667},{76,62.6667}}, color={0,127,255}));
  connect(openValve.y, switch3.u1) annotation (Line(points={{9,54},{12,54},{12,100},{-24,100},{-24,92}}, color={0,0,127}));
  connect(closeValve.y, switch3.u3) annotation (Line(points={{11,16},{14,16},{14,34},{-16,34},{-16,68},{-24,68},{-24,76}}, color={0,0,127}));
  connect(volume2.ports[2], pipe.port_a) annotation (Line(points={{76,64},{78,64},{78,62},{96,62},{96,46}}, color={0,127,255}));
  connect(pipe.port_b, discharge) annotation (Line(points={{96,26},{96,-26},{100,-26},{100,-40}}, color={0,127,255}));
  connect(volume2.ports[3], volume.ports[2]) annotation (Line(points={{76,65.3333},{78,65.3333},{78,62},{80,62},{80,-22},{64,-22},{64,-32.5},{52,-32.5}}, color={0,127,255}));
  connect(volume.ports[3], pipe1.port_a) annotation (Line(points={{52,-31.5},{66,-31.5},{66,-38},{68,-38}}, color={0,127,255}));
  connect(pipe1.port_b, discharge) annotation (Line(points={{88,-38},{94,-38},{94,-40},{100,-40}}, color={0,127,255}));
  connect(pipe2.port_b, charge) annotation (Line(points={{84,-92},{84,-78},{98,-78},{98,-98}}, color={0,127,255}));
  connect(volume1.ports[2], pipe2.port_a) annotation (Line(points={{66,-70},{66,-66},{68,-66},{68,-52},{42,-52},{42,-92},{64,-92}}, color={0,127,255}));
  connect(volume.ports[4], volume1.ports[3]) annotation (Line(points={{52,-32},{54,-32},{54,-34},{60,-34},{60,-52},{68,-52},{68,-66},{66,-66},{66,-70}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LayeredStorage_Physical_simple;
