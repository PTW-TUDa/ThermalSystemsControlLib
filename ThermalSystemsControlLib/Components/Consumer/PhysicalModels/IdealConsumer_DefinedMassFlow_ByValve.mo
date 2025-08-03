within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model IdealConsumer_DefinedMassFlow_ByValve
    extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);

  parameter SI.Volume V_int = 0.1 "Internal volume";
  parameter SI.Time riseTime = 60 "Rise time of the filter (time to reach 99.6 % of the nominal operating point)";

  Modelica.Blocks.Interfaces.RealInput Q_flow(quantity="Power", unit="W") annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium,
    use_portsData=false,
    use_HeatTransfer=true,
    V=V_int,
    nPorts=2) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-18})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-82})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Interfaces.RealOutput T_Consumer "Absolute temperature as output signal" annotation (Placement(transformation(extent={{100,60},{120,80}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_in "Prescribed mass flow rate" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-100,-120})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,-46})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0) annotation (Placement(transformation(extent={{-78,-74},{-58,-54}})));
  Modelica.Blocks.Sources.RealExpression ZeroQFlow(y=0) annotation (Placement(transformation(extent={{-42,-68},{-22,-48}})));
  Modelica.Blocks.Continuous.LimPID PID_MassFlowRate(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=1,
    yMax=1,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState,
    strict=true)                                      annotation (Placement(transformation(extent={{-86,-34},{-66,-14}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-28,0})));
  replaceable parameter ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties deviceData constrainedby ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties annotation (choicesAllMatching=true);
  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Medium,
    dp_nominal=deviceData.dp_nominal,
    m_flow_nominal=deviceData.m_flow_nominal) annotation (Placement(transformation(extent={{-66,10},{-46,-10}})));
equation
  connect(volume.ports[1], port_b) annotation (Line(points={{-1,0},{100,0}},color={0,127,255}));
  connect(prescribedHeatFlow.port, volume.heatPort) annotation (Line(points={{0,-8},{0,-4},{-14,-4},{-14,10},{-10,10}},
                                                                                                                    color={191,0,0}));
  connect(Q_flow, firstOrder.u) annotation (Line(points={{0,-120},{0,-94}},                                         color={0,0,127}));
  connect(temperatureSensor.port, volume.heatPort) annotation (Line(points={{20,70},{-10,70},{-10,10}}, color={191,0,0}));
  connect(temperatureSensor.T, T_Consumer) annotation (Line(points={{41,70},{110,70}}, color={0,0,127}));
  connect(greaterThreshold.u, m_flow_in) annotation (Line(points={{-80,-64},{-100,-64},{-100,-120}}, color={0,0,127}));
  connect(greaterThreshold.y, switch1.u2) annotation (Line(points={{-57,-64},{0,-64},{0,-58}}, color={255,0,255}));
  connect(switch1.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{0,-35},{0,-28}}, color={0,0,127}));
  connect(switch1.u1, firstOrder.y) annotation (Line(points={{8,-58},{8,-71},{0,-71}}, color={0,0,127}));
  connect(ZeroQFlow.y, switch1.u3) annotation (Line(points={{-21,-58},{-8,-58}}, color={0,0,127}));
  connect(m_flow_in, PID_MassFlowRate.u_s) annotation (Line(points={{-100,-120},{-100,-24},{-88,-24}}, color={0,0,127}));
  connect(massFlowRate.port_b, volume.ports[2]) annotation (Line(points={{-18,0},{1,0}}, color={0,127,255}));
  connect(massFlowRate.m_flow, PID_MassFlowRate.u_m) annotation (Line(points={{-28,-11},{-28,-40},{-76,-40},{-76,-36}}, color={0,0,127}));
  connect(valveLinear.port_b, massFlowRate.port_a) annotation (Line(points={{-46,0},{-38,0}}, color={0,127,255}));
  connect(valveLinear.port_a, port_a) annotation (Line(points={{-66,0},{-100,0}}, color={0,127,255}));
  connect(valveLinear.opening, PID_MassFlowRate.y) annotation (Line(points={{-56,-8},{-56,-24},{-65,-24}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Thermal consumer including a PT1-element.</p>
</html>"));
end IdealConsumer_DefinedMassFlow_ByValve;
