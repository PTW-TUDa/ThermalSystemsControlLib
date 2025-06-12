within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical_test
  //extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=3   "Number of volume segments (min. 5)";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of lower temperature";
  parameter Real delta_T = (T_start_upper-T_start_lower)/n_Seg;

  //Real relative_height[:] = linspace(1, 0, n_Seg); // relative height used for temperature initalization
  parameter Real T_start_values[n_Seg] = linspace(T_start_lower, T_start_upper, n_Seg);

  Modelica.Fluid.Vessels.ClosedVolume vol_upper(
    redeclare package Medium = Medium,
    use_portsData = false,
    use_HeatTransfer=false,
    V=V/n_Seg,
    nPorts=4,
    T_start = T_start_upper)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,50})));
    //each T_start=T_start,
  Modelica.Fluid.Sensors.Temperature vol_temperature_upper(redeclare package Medium = Medium)
                                                                           annotation (Placement(transformation(extent={{-60,64},{-80,84}})));

  Modelica.Fluid.Interfaces.FluidPort_a port_feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-106},{110,-86}})));

  //Interfaces.LayeredStorageState localState annotation (Placement(transformation(extent={{-8,100},{12,120}})));
  Modelica.Fluid.Valves.ValveLinear valveLayers_upper(
    redeclare package Medium = Medium,
    dp_nominal=1,
    m_flow_nominal=1,
    allowFlowReversal=true) annotation (Placement(transformation(extent={{-48,40},{-28,60}})));

  Modelica.Blocks.Interfaces.RealInput feedTemperature annotation (Placement(transformation(extent={{138,40},{98,80}})));

// Layering sistem control
  Modelica.Blocks.Logical.Switch switch_upper annotation (Placement(transformation(extent={{-4,60},{-18,74}})));
  Modelica.Blocks.Sources.Constant const_close(k=0) annotation (Placement(transformation(extent={{-48,108},{-32,124}})));
  Modelica.Blocks.Sources.Constant const_open(k=1) annotation (Placement(transformation(extent={{-44,82},{-28,98}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual_upper annotation (Placement(transformation(extent={{22,58},{6,74}})));
  Modelica.Blocks.Sources.Constant T_lim_upper(k=353.15)
                                               annotation (Placement(transformation(extent={{52,40},{40,52}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold_lower(threshold=333.15)
                                                            annotation (Placement(transformation(extent={{24,-26},{12,-14}})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(extent={{24,14},{10,28}})));

// Mode control (charge or discharge)
  Modelica.Fluid.Interfaces.FluidPort_b port_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{88,-60},{108,-40}})));
  Modelica.Blocks.Interfaces.BooleanInput mode "Value true for charge" annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  Modelica.Fluid.Valves.ValveLinear valveCharge(
    redeclare package Medium = Medium,
    dp_nominal=1,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={58,-96})));
  Modelica.Fluid.Valves.ValveLinear valveDischarge(
    redeclare package Medium = Medium,
    dp_nominal=1,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{46,-60},{66,-40}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_charge annotation (Placement(transformation(extent={{94,-130},{82,-118}})));
  Modelica.Blocks.MathBoolean.Not notMode annotation (Placement(transformation(extent={{70,-4},{62,4}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_discharge annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={55,-21})));

  Modelica.Fluid.Vessels.ClosedVolume volume_lower(
    redeclare package Medium = Medium,
    use_portsData=false,
    portsData={4},
    V=V/n_Seg,
    nPorts=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-30})));
  Modelica.Fluid.Vessels.ClosedVolume volume_mid(
    redeclare package Medium = Medium,
    use_portsData=false,
    portsData={4},
    V=V/n_Seg,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,4})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_mid(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-46,14},{-66,34}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature_lower(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-42,-26},{-62,-6}})));
  Modelica.Blocks.Logical.Switch switch_mid annotation (Placement(transformation(extent={{-2,14},{-16,28}})));
  Modelica.Blocks.Logical.Switch switch_lower annotation (Placement(transformation(extent={{0,-26},{-12,-14}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold_mid(threshold=353.15)
                                                          annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={24,4})));
  Modelica.Fluid.Valves.ValveLinear valveLayers_mid(
    redeclare package Medium = Medium,
    dp_nominal=1,
    m_flow_nominal=1,
    allowFlowReversal=true) annotation (Placement(transformation(extent={{-44,-4},{-24,16}})));
  Modelica.Fluid.Valves.ValveLinear valveLayers_lower(
    redeclare package Medium = Medium,
    dp_nominal=1,
    m_flow_nominal=1,
    allowFlowReversal=true) annotation (Placement(transformation(extent={{-38,-42},{-18,-22}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual_mid annotation (Placement(transformation(extent={{50,12},{34,28}})));
  Modelica.Blocks.Sources.Constant T_lim_mid(k=333.15)
                                             annotation (Placement(transformation(extent={{72,8},{60,20}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium = Medium,
    allowFlowReversal=false,
    length=0.2,
    diameter=0.1) annotation (Placement(transformation(extent={{-4,-102},{16,-82}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(
    redeclare package Medium = Medium,
    allowFlowReversal=false,
    length=0.2,
    diameter=0.1) annotation (Placement(transformation(extent={{4,-60},{24,-40}})));
equation
  //localState.fLowerTemperature = vol_temperature_lower.T;
  //localState.fMidTemperature = vol_temperature_mid.T;
  //localState.fUpperTemperature = vol_temperature_upper.T;

// connections controlling charge/discharge modes
  connect(valveDischarge.port_b, port_discharge) annotation (Line(points={{66,-50},{98,-50}}, color={0,127,255}));
  connect(valveCharge.port_b, port_charge) annotation (Line(points={{68,-96},{80,-96},{80,-96},{100,-96}},
                                                                                         color={0,127,255}));
  connect(booleanToReal_charge.u, mode) annotation (Line(points={{95.2,-124},{118,-124},{118,0}}, color={255,0,255}));
  connect(booleanToReal_charge.y, valveCharge.opening) annotation (Line(points={{81.4,-124},{58,-124},{58,-104}},            color={0,0,127}));
  connect(mode, notMode.u) annotation (Line(points={{118,0},{71.6,0}}, color={255,0,255}));
  connect(booleanToReal_discharge.y, valveDischarge.opening) annotation (Line(points={{55,-28.7},{56,-28.7},{56,-42}}, color={0,0,127}));
  connect(notMode.y, booleanToReal_discharge.u) annotation (Line(points={{61.2,0},{56,0},{56,-12.6},{55,-12.6}}, color={255,0,255}));
  connect(vol_upper.ports[1], vol_temperature_upper.port) annotation (Line(points={{-70,48.5},{-70,64}},          color={0,127,255}));
  connect(volume_mid.ports[1], vol_temperature_mid.port) annotation (Line(points={{-70,2.5},{-70,14},{-56,14}}, color={0,127,255}));
  connect(volume_lower.ports[1], vol_temperature_lower.port) annotation (Line(points={{-70,-31.6},{-52,-31.6},{-52,-26}}, color={0,127,255}));
  connect(volume_mid.ports[2], vol_upper.ports[2]) annotation (Line(points={{-70,3.5},{-70,49.5}},            color={0,127,255}));
  connect(volume_lower.ports[2], volume_mid.ports[3]) annotation (Line(points={{-70,-30.8},{-64,-30.8},{-64,4.5},{-70,4.5}}, color={0,127,255}));
  connect(valveLayers_upper.port_b, port_feed) annotation (Line(points={{-28,50},{-24,50},{-24,96},{84,96},{84,100},{100,100}}, color={0,127,255}));
  connect(valveLayers_upper.port_a, vol_upper.ports[3]) annotation (Line(points={{-48,50},{-58,50},{-58,50.5},{-70,50.5}}, color={0,127,255}));
  connect(and1.y, switch_mid.u2) annotation (Line(points={{9.3,21},{-0.6,21}}, color={255,0,255}));
  connect(switch_upper.u2, greaterEqual_upper.y) annotation (Line(points={{-2.6,67},{-2.6,66},{5.2,66}}, color={255,0,255}));
  connect(switch_lower.u2, lessThreshold_lower.y) annotation (Line(points={{1.2,-20},{11.4,-20}}, color={255,0,255}));
  connect(const_open.y, switch_upper.u1) annotation (Line(points={{-27.2,90},{2,90},{2,82},{4,82},{4,78},{2,78},{2,72.6},{-2.6,72.6}}, color={0,0,127}));
  connect(const_close.y, switch_upper.u3) annotation (Line(points={{-31.2,116},{-10,116},{-10,82},{0,82},{0,62},{-2,62},{-2,61.4},{-2.6,61.4}}, color={0,0,127}));
  connect(const_open.y, switch_lower.u1);
  connect(const_open.y, switch_mid.u1);
  connect(const_close.y, switch_lower.u3);
  connect(const_close.y, switch_mid.u3);
  connect(lessThreshold_mid.y, and1.u2) annotation (Line(points={{24,10.6},{26,10.6},{26,12},{28,12},{28,15.4},{25.4,15.4}}, color={255,0,255}));
  connect(feedTemperature, greaterEqual_upper.u1) annotation (Line(points={{118,60},{42,60},{42,66},{23.6,66}}, color={0,0,127}));
  connect(T_lim_upper.y, greaterEqual_upper.u2) annotation (Line(points={{39.4,46},{30,46},{30,59.6},{23.6,59.6}}, color={0,0,127}));
  connect(switch_upper.y, valveLayers_upper.opening) annotation (Line(points={{-18.7,67},{-38,67},{-38,58}}, color={0,0,127}));
  connect(valveLayers_mid.port_a, volume_mid.ports[4]) annotation (Line(points={{-44,6},{-62,6},{-62,5.5},{-70,5.5}}, color={0,127,255}));
  connect(valveLayers_mid.port_b, port_feed) annotation (Line(points={{-24,6},{-18,6},{-18,56},{-24,56},{-24,96},{84,96},{84,100},{100,100}}, color={0,127,255}));
  connect(valveLayers_lower.port_a, volume_lower.ports[3]) annotation (Line(points={{-38,-32},{-38,-38},{-64,-38},{-64,-32},{-70,-32},{-70,-30}},   color={0,127,255}));
  connect(valveLayers_lower.port_b, port_feed) annotation (Line(points={{-18,-32},{-8,-32},{-8,6},{-18,6},{-18,56},{-24,56},{-24,96},{84,96},{84,100},{100,100}}, color={0,127,255}));
  connect(volume_lower.ports[4], valveLayers_lower.port_a) annotation (Line(points={{-70,-29.2},{-70,-32},{-38,-32}}, color={0,127,255}));
  connect(switch_lower.y, valveLayers_lower.opening) annotation (Line(points={{-12.6,-20},{-28,-20},{-28,-24}}, color={0,0,127}));
  connect(feedTemperature, lessThreshold_lower.u) annotation (Line(points={{118,60},{64,60},{64,2},{34,2},{34,-20},{25.2,-20}}, color={0,0,127}));
  connect(greaterEqual_mid.y, and1.u1) annotation (Line(points={{33.2,20},{34,21},{25.4,21}}, color={255,0,255}));
  connect(valveLayers_mid.opening, switch_mid.y) annotation (Line(points={{-34,14},{-34,21},{-16.7,21}}, color={0,0,127}));
  connect(greaterEqual_mid.u1, feedTemperature) annotation (Line(points={{51.6,20},{86,20},{86,60},{118,60}}, color={0,0,127}));
  connect(feedTemperature, lessThreshold_mid.u) annotation (Line(points={{118,60},{64,60},{64,2},{34,2},{34,-3.2},{24,-3.2}}, color={0,0,127}));
  connect(greaterEqual_mid.u2, T_lim_mid.y) annotation (Line(points={{51.6,13.6},{51.6,14},{59.4,14}}, color={0,0,127}));
  connect(pipe.port_b, valveCharge.port_a) annotation (Line(points={{16,-92},{42,-92},{42,-96},{48,-96}}, color={0,127,255}));
  connect(volume_lower.ports[5], pipe.port_a) annotation (Line(points={{-70,-28.4},{-70,-32},{-64,-32},{-64,-38},{-42,-38},{-42,-92},{-4,-92}}, color={0,127,255}));
  connect(pipe1.port_b, valveDischarge.port_a) annotation (Line(points={{24,-50},{46,-50}}, color={0,127,255}));
  connect(vol_upper.ports[4], pipe1.port_a) annotation (Line(points={{-70,51.5},{-112,51.5},{-112,-50},{4,-50}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredStorage_Physical_test;
