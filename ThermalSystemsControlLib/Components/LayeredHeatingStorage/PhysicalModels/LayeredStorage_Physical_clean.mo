within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical_clean
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
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
        origin={38,0})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Fluid.Valves.ValveLinear valveLinear_mid(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{-6,2},{14,22}},   rotation=0)));
  Modelica.Fluid.Interfaces.FluidPort_a feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{88,-108},{108,-88}})));
  Modelica.Fluid.Vessels.ClosedVolume volume_lower(
    redeclare package Medium = Medium,
    use_T_start=true,
    T_start=T_start_lower,
    use_portsData=false,
    use_HeatTransfer=false,
    V=1,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-58})));
  Modelica.Fluid.Valves.ValveLinear valveLinear_lower(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{-10,-58},{10,-38}},rotation=0)));
  Modelica.Fluid.Interfaces.FluidPort_b discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear_upper(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{-8,66},{12,86}}, rotation=0)));
  Modelica.Fluid.Vessels.ClosedVolume volume_upper(
    redeclare package Medium = Medium,
    use_T_start=true,
    T_start=T_start_upper,
    use_portsData=false,
    V=1,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={38,58})));
  Modelica.Fluid.Pipes.StaticPipe pipe_discharge(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,42})));
  Modelica.Fluid.Pipes.StaticPipe pipe_charge(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.2) annotation (Placement(transformation(
        extent={{8,-10},{-8,10}},
        rotation=180,
        origin={80,-58})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_upper(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{54,64},{74,84}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_mid(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{56,12},{74,30}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_lower(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{58,-42},{76,-24}})));
  Modelica.Blocks.Sources.RealExpression realExp_mid2(y=vol_temperature_upper.T) annotation (Placement(transformation(extent={{-118,24},{-104,40}})));
  Modelica.Blocks.Sources.RealExpression realExp_lower(y=vol_temperature_mid.T) annotation (Placement(transformation(extent={{-116,-36},{-102,-20}})));
  Modelica.Blocks.Sources.RealExpression realExp_mid1(y=vol_temperature_lower.T) annotation (Placement(transformation(extent={{-118,14},{-104,30}})));
  Modelica.Blocks.Sources.RealExpression realExp_mid3(y=vol_temperature_mid.T)   annotation (Placement(transformation(extent={{-118,80},{-104,96}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear_discharge(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,-6})));
  Modelica.Fluid.Valves.ValveLinear valveLinear_charge(
    redeclare package Medium = Medium,
    allowFlowReversal=true,
    dp_start=100000,
    dp_nominal=100000,
    m_flow_nominal=1) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={97,-79})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_charge annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={136,-64})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_discharge(realTrue=0, realFalse=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={118,8})));
  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{140,60},{100,100}})));

  //local state
  Interfaces.LayeredStorageState localState annotation (Placement(transformation(extent={{-8,100},{12,120}})));

  ValveControls.UpperControl upperControl annotation (Placement(transformation(extent={{-58,74},{-38,94}})));
  ValveControls.MidControl midControl annotation (Placement(transformation(extent={{-56,18},{-36,38}})));
  ValveControls.LowerControl lowerControl annotation (Placement(transformation(extent={{-60,-42},{-40,-22}})));
equation
  localState.fLowerTemperature = vol_temperature_lower.T;
  localState.fMidTemperature = vol_temperature_mid.T;
  localState.fUpperTemperature = vol_temperature_upper.T;
  connect(valveLinear_mid.port_b, volume_mid.ports[1]) annotation (Line(points={{14,12},{52,12},{52,-1.5},{48,-1.5}},                   color={0,127,255}));
  connect(feed, valveLinear_mid.port_a) annotation (Line(points={{-106,0},{-24,0},{-24,12},{-6,12}},
                                                                                   color={0,127,255}));
  connect(valveLinear_lower.port_b, volume_lower.ports[1]) annotation (Line(points={{10,-48},{26,-48},{26,-44},{54,-44},{54,-59.5},{50,-59.5}},
                                                                                                                                     color={0,127,255}));
  connect(feed, valveLinear_lower.port_a) annotation (Line(points={{-106,0},{-24,0},{-24,-48},{-10,-48}},color={0,127,255}));
  connect(feed, valveLinear_upper.port_a) annotation (Line(points={{-106,0},{-24,0},{-24,76},{-8,76}},                                 color={0,127,255}));
  connect(valveLinear_upper.port_b, volume_upper.ports[1]) annotation (Line(points={{12,76},{54,76},{54,56.5},{48,56.5}}, color={0,127,255}));
  connect(volume_upper.ports[2], pipe_discharge.port_a) annotation (Line(points={{48,57.5},{100,57.5},{100,52}},                color={0,127,255}));
  connect(volume_upper.ports[3], volume_mid.ports[2]) annotation (Line(points={{48,58.5},{52,58.5},{52,-0.5},{48,-0.5}},                   color={0,127,255}));
  connect(volume_lower.ports[2], pipe_charge.port_a) annotation (Line(points={{50,-58.5},{62,-58.5},{62,-58},{72,-58}}, color={0,127,255}));
  connect(volume_mid.ports[3], volume_lower.ports[3]) annotation (Line(points={{48,0.5},{54,0.5},{54,-57.5},{50,-57.5}},            color={0,127,255}));
  connect(vol_temperature_upper.port, volume_upper.ports[4]) annotation (Line(points={{64,64},{64,59.5},{48,59.5}},                 color={0,127,255}));
  connect(vol_temperature_mid.port, volume_mid.ports[4]) annotation (Line(points={{65,12},{65,-2},{54,-2},{54,0},{48,0},{48,1.5}},
                                                                                                                            color={0,127,255}));
  connect(vol_temperature_lower.port, volume_lower.ports[4]) annotation (Line(points={{67,-42},{67,-56.5},{50,-56.5}},                   color={0,127,255}));
  connect(valveLinear_discharge.port_a, pipe_discharge.port_b) annotation (Line(points={{100,4},{100,32}}, color={0,127,255}));
  connect(valveLinear_discharge.port_b, discharge) annotation (Line(points={{100,-16},{100,-40}}, color={0,127,255}));
  connect(pipe_charge.port_b, valveLinear_charge.port_a) annotation (Line(points={{88,-58},{97,-58},{97,-72}},          color={0,127,255}));
  connect(valveLinear_charge.port_b, charge) annotation (Line(points={{97,-86},{102,-86},{102,-92},{98,-92},{98,-98}}, color={0,127,255}));
  connect(booleanToReal_charge.y, valveLinear_charge.opening) annotation (Line(points={{136,-70.6},{136,-79},{102.6,-79}}, color={0,0,127}));
  connect(booleanToReal_discharge.y, valveLinear_discharge.opening) annotation (Line(points={{118,1.4},{118,-6},{108,-6}}, color={0,0,127}));
  connect(mode, booleanToReal_discharge.u) annotation (Line(points={{120,80},{120,15.2},{118,15.2}}, color={255,0,255}));
  connect(mode, booleanToReal_charge.u) annotation (Line(points={{120,80},{120,46},{136,46},{136,-56.8}}, color={255,0,255}));
  connect(upperControl.opening, valveLinear_upper.opening) annotation (Line(points={{-37,84},{2,84}}, color={0,0,127}));
  connect(feedTemperature, upperControl.feed_temp) annotation (Line(points={{-117,59},{-78,59},{-78,92},{-60,92}}, color={0,0,127}));
  connect(realExp_mid3.y, upperControl.threshold) annotation (Line(points={{-103.3,88},{-60,88}}, color={0,0,127}));
  connect(feedTemperature, midControl.feed_temp) annotation (Line(points={{-117,59},{-78,59},{-78,36},{-58,36}}, color={0,0,127}));
  connect(realExp_mid2.y, midControl.threshold_upper) annotation (Line(points={{-103.3,32},{-58,32}}, color={0,0,127}));
  connect(realExp_mid1.y, midControl.threshold_lower) annotation (Line(points={{-103.3,22},{-68,22},{-68,28},{-58,28}}, color={0,0,127}));
  connect(midControl.opening, valveLinear_mid.opening) annotation (Line(points={{-35,28},{4,28},{4,20}}, color={0,0,127}));
  connect(midControl.opening, upperControl.lower_opening) annotation (Line(points={{-35,28},{-32,28},{-32,62},{-60,62},{-60,78}}, color={0,0,127}));
  connect(lowerControl.opening, valveLinear_lower.opening) annotation (Line(points={{-39,-32},{0,-32},{0,-40}}, color={0,0,127}));
  connect(lowerControl.opening, midControl.lower_opening) annotation (Line(points={{-39,-32},{-28,-32},{-28,12},{-58,12},{-58,20}}, color={0,0,127}));
  connect(realExp_lower.y, lowerControl.threshold) annotation (Line(points={{-101.3,-28},{-62,-28}}, color={0,0,127}));
  connect(feedTemperature, lowerControl.feed_temp) annotation (Line(points={{-117,59},{-78,59},{-78,-24},{-62,-24}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LayeredStorage_Physical_clean;
