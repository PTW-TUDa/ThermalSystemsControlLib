within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model IdealConsumer_DefinedMassFlow
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
    T_start=T_start,
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
  BaseClasses.FluidBaseClasses.IdealSource idealSource_simple(redeclare package Medium = Medium, control_m_flow=true) annotation (Placement(transformation(extent={{-64,10},{-44,-10}})));
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
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=if volume.use_T_start then volume.system.T_start else Medium.temperature_phX(
      volume.p_start,
      volume.h_start,
      volume.X_start) "Start value of volume temperature";
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-42})));
equation
  connect(volume.ports[1], port_b) annotation (Line(points={{-1,0},{100,0}},color={0,127,255}));
  connect(prescribedHeatFlow.port, volume.heatPort) annotation (Line(points={{0,-8},{0,-4},{-14,-4},{-14,10},{-10,10}},
                                                                                                                    color={191,0,0}));
  connect(Q_flow, firstOrder.u) annotation (Line(points={{0,-120},{0,-94}},                                         color={0,0,127}));
  connect(temperatureSensor.port, volume.heatPort) annotation (Line(points={{20,70},{-10,70},{-10,10}}, color={191,0,0}));
  connect(temperatureSensor.T, T_Consumer) annotation (Line(points={{41,70},{110,70}}, color={0,0,127}));
  connect(idealSource_simple.port_a, port_a) annotation (Line(points={{-64,0},{-100,0}}, color={0,127,255}));
  connect(idealSource_simple.port_b, volume.ports[2]) annotation (Line(points={{-44,0},{1,0}}, color={0,127,255}));
  connect(greaterThreshold.y, switch1.u2) annotation (Line(points={{-57,-64},{0,-64},{0,-58}}, color={255,0,255}));
  connect(switch1.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{0,-35},{0,-28}}, color={0,0,127}));
  connect(switch1.u1, firstOrder.y) annotation (Line(points={{8,-58},{8,-71},{0,-71}}, color={0,0,127}));
  connect(ZeroQFlow.y, switch1.u3) annotation (Line(points={{-21,-58},{-8,-58}}, color={0,0,127}));
  connect(idealSource_simple.m_flow_in, firstOrder1.y) annotation (Line(points={{-60,-12},{-60,-26},{-100,-26},{-100,-31}}, color={0,0,127}));
  connect(firstOrder1.u, m_flow_in) annotation (Line(points={{-100,-54},{-100,-120}}, color={0,0,127}));
  connect(greaterThreshold.u, m_flow_in) annotation (Line(points={{-80,-64},{-100,-64},{-100,-120}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Thermal consumer including a PT1-element.</p>
</html>"));
end IdealConsumer_DefinedMassFlow;
