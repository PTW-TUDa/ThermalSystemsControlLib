within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical_3layers
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
  Modelica.Fluid.Interfaces.FluidPort_b discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,90},{110,110}})));
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
  Modelica.Fluid.Sensors.Temperature vol_temperature_upper(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_mid(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{62,2},{80,20}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_lower(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{62,-56},{80,-38}})));
  Modelica.Blocks.Sources.RealExpression realExp_mid2(y=vol_temperature_upper.T) annotation (Placement(transformation(extent={{-118,24},{-104,40}})));
  Modelica.Blocks.Sources.RealExpression realExp_lower(y=vol_temperature_mid.T) annotation (Placement(transformation(extent={{-114,-26},{-100,-10}})));
  Modelica.Blocks.Sources.RealExpression realExp_mid1(y=vol_temperature_lower.T) annotation (Placement(transformation(extent={{-118,14},{-104,30}})));
  Modelica.Blocks.Sources.RealExpression realExp_mid3(y=vol_temperature_mid.T)   annotation (Placement(transformation(extent={{-118,80},{-104,96}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_charge annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={80,-74})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_discharge(realTrue=0, realFalse=1) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={86,68})));
  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));

  //local state
  Interfaces.LayeredStorageState localState annotation (Placement(transformation(extent={{-8,100},{12,120}})));

  ValveControls.UpperControl upperControl annotation (Placement(transformation(extent={{-58,74},{-38,94}})));
  ValveControls.MidControl midControl annotation (Placement(transformation(extent={{-56,18},{-36,38}})));
  ValveControls.LowerControl lowerControl annotation (Placement(transformation(extent={{-58,-32},{-38,-12}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_upper(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(extent={{-14,60},{6,80}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_mid(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(extent={{-12,4},{8,24}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_low(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(extent={{-10,-54},{10,-34}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_charge(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,-100})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_discharge(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={68,100})));
equation
  localState.fLowerTemperature = vol_temperature_lower.T;
  localState.fMidTemperature = vol_temperature_mid.T;
  localState.fUpperTemperature = vol_temperature_upper.T;
  connect(volume_upper.ports[1], volume_mid.ports[1]) annotation (Line(points={{48,56.5},{52,56.5},{52,-1.5},{48,-1.5}},                   color={0,127,255}));
  connect(volume_mid.ports[2], volume_lower.ports[1]) annotation (Line(points={{48,-0.5},{54,-0.5},{54,-59.5},{50,-59.5}},          color={0,127,255}));
  connect(vol_temperature_upper.port, volume_upper.ports[2]) annotation (Line(points={{70,40},{52,40},{52,57.5},{48,57.5}},         color={0,127,255}));
  connect(vol_temperature_mid.port, volume_mid.ports[3]) annotation (Line(points={{71,2},{71,0.5},{48,0.5}},                color={0,127,255}));
  connect(vol_temperature_lower.port, volume_lower.ports[2]) annotation (Line(points={{71,-56},{71,-58},{56,-58},{56,-58.5},{50,-58.5}}, color={0,127,255}));
  connect(mode, booleanToReal_discharge.u) annotation (Line(points={{118,0},{94,0},{94,68},{93.2,68}},
                                                                                                     color={255,0,255}));
  connect(mode, booleanToReal_charge.u) annotation (Line(points={{118,0},{94,0},{94,-74},{87.2,-74}},     color={255,0,255}));
  connect(feedTemperature, upperControl.feed_temp) annotation (Line(points={{-117,59},{-78,59},{-78,92},{-60,92}}, color={0,0,127}));
  connect(realExp_mid3.y, upperControl.threshold) annotation (Line(points={{-103.3,88},{-60,88}}, color={0,0,127}));
  connect(feedTemperature, midControl.feed_temp) annotation (Line(points={{-117,59},{-78,59},{-78,36},{-58,36}}, color={0,0,127}));
  connect(realExp_mid2.y, midControl.threshold_upper) annotation (Line(points={{-103.3,32},{-58,32}}, color={0,0,127}));
  connect(realExp_mid1.y, midControl.threshold_lower) annotation (Line(points={{-103.3,22},{-68,22},{-68,28},{-58,28}}, color={0,0,127}));
  connect(midControl.opening, upperControl.lower_opening) annotation (Line(points={{-35,28},{-32,28},{-32,62},{-60,62},{-60,78}}, color={0,0,127}));
  connect(lowerControl.opening, midControl.lower_opening) annotation (Line(points={{-37,-22},{-34,-22},{-34,10},{-58,10},{-58,20}}, color={0,0,127}));
  connect(realExp_lower.y, lowerControl.threshold) annotation (Line(points={{-99.3,-18},{-60,-18}},  color={0,0,127}));
  connect(feedTemperature, lowerControl.feed_temp) annotation (Line(points={{-117,59},{-78,59},{-78,-14},{-60,-14}}, color={0,0,127}));
  connect(feed, valve_upper.port_a1) annotation (Line(points={{-106,0},{-24,0},{-24,70},{-14,70}}, color={0,127,255}));
  connect(valve_upper.port_b, volume_upper.ports[3]) annotation (Line(points={{6,70},{48,70},{48,58.5}}, color={0,127,255}));
  connect(upperControl.opening, valve_upper.fSetPoint) annotation (Line(points={{-37,84},{-4,84},{-4,82}}, color={0,0,127}));
  connect(feed, valve_mid.port_a1) annotation (Line(points={{-106,0},{-24,0},{-24,14},{-12,14}}, color={0,127,255}));
  connect(valve_mid.port_b, volume_mid.ports[4]) annotation (Line(points={{8,14},{52,14},{52,-2},{48,-2},{48,1.5}}, color={0,127,255}));
  connect(midControl.opening, valve_mid.fSetPoint) annotation (Line(points={{-35,28},{-2,28},{-2,26}}, color={0,0,127}));
  connect(valve_low.port_b, volume_lower.ports[3]) annotation (Line(points={{10,-44},{54,-44},{54,-57.5},{50,-57.5}}, color={0,127,255}));
  connect(feed, valve_low.port_a1) annotation (Line(points={{-106,0},{-20,0},{-20,-44},{-10,-44}}, color={0,127,255}));
  connect(lowerControl.opening, valve_low.fSetPoint) annotation (Line(points={{-37,-22},{0,-22},{0,-32}}, color={0,0,127}));
  connect(valve_discharge.port_b, discharge) annotation (Line(points={{78,100},{84,100},{84,100},{100,100}}, color={0,127,255}));
  connect(booleanToReal_discharge.y, valve_discharge.fSetPoint) annotation (Line(points={{79.4,68},{68,68},{68,88}}, color={0,0,127}));
  connect(valve_charge.fSetPoint, booleanToReal_charge.y) annotation (Line(points={{60,-88},{60,-74},{73.4,-74}}, color={0,0,127}));
  connect(valve_charge.port_b, charge) annotation (Line(points={{70,-100},{98,-100},{98,-98}}, color={0,127,255}));
  connect(volume_upper.ports[4], valve_discharge.port_a1) annotation (Line(points={{48,59.5},{48,100},{58,100}}, color={0,127,255}));
  connect(volume_lower.ports[4], valve_charge.port_a1) annotation (Line(points={{50,-56.5},{52,-56.5},{52,-60},{56,-60},{56,-58},{50,-58},{50,-100}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LayeredStorage_Physical_3layers;
