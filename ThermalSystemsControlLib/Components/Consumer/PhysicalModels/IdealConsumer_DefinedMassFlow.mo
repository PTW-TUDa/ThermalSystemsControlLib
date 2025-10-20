within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model IdealConsumer_DefinedMassFlow
    extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);

  parameter SI.Volume V_int = 0.1 "Internal volume";
  parameter SI.Time riseTime = 60 "Rise time of the filter (time to reach 99.6 % of the nominal operating point)";
  parameter Modelica.Media.Interfaces.Types.Temperature min_return_temp_m_flow_increaser=273.15 "minimal return temperature of consumer for increasing the mass flow";
    parameter Modelica.Media.Interfaces.Types.Temperature min_return_temp_Q_flow_increaser=283.15 "minimal return temperature of consumer for increasing the heat flow";

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
    nPorts=2) annotation (Placement(transformation(extent={{10,0},{-10,20}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-28})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-84})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Interfaces.RealOutput T_Consumer "Absolute temperature as output signal" annotation (Placement(transformation(extent={{100,60},{120,80}})));
  BaseClasses.FluidBaseClasses.IdealSource idealSource_simple(redeclare package Medium = Medium, control_m_flow=true) annotation (Placement(transformation(extent={{-84,10},{-64,-10}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_in "Prescribed mass flow rate" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-100,-120})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=if volume.use_T_start then volume.system.T_start else Medium.temperature_phX(
      volume.p_start,
      volume.h_start,
      volume.X_start) "Start value of volume temperature";
  Modelica.Blocks.Sources.RealExpression min_temp(y=min_return_temp_Q_flow_increaser)
                                                                 annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-30})));
  Modelica.Blocks.Continuous.LimPID PID_LimitTemperature(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10000,
    Ti=10,
    yMax=100000,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState,
    strict=true) annotation (Placement(transformation(extent={{10,-30},{30,-50}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
  Modelica.Blocks.Math.Add add1
                               annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-100,-68})));
  Modelica.Blocks.Continuous.LimPID PID_LimitTemperature1(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=2,
    Ti=60,
    yMax=1,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState,
    strict=true) annotation (Placement(transformation(extent={{-50,-70},{-70,-90}})));
  Modelica.Blocks.Sources.RealExpression u_s_signal(y=min_return_temp_m_flow_increaser)
                                                    annotation (Placement(transformation(extent={{-20,-90},{-40,-70}})));
equation
  connect(volume.ports[1], port_b) annotation (Line(points={{1,0},{100,0}}, color={0,127,255}));
  connect(prescribedHeatFlow.port, volume.heatPort) annotation (Line(points={{80,-18},{80,10},{10,10}},             color={191,0,0}));
  connect(temperatureSensor.port, volume.heatPort) annotation (Line(points={{20,70},{10,70},{10,10}},   color={191,0,0}));
  connect(temperatureSensor.T, T_Consumer) annotation (Line(points={{41,70},{110,70}}, color={0,0,127}));
  connect(idealSource_simple.port_a, port_a) annotation (Line(points={{-84,0},{-100,0}}, color={0,127,255}));
  connect(idealSource_simple.port_b, volume.ports[2]) annotation (Line(points={{-64,0},{-1,0}},color={0,127,255}));
  connect(Q_flow, firstOrder.u) annotation (Line(points={{0,-120},{0,-96}}, color={0,0,127}));
  connect(min_temp.y, PID_LimitTemperature.u_s) annotation (Line(points={{1,-40},{8,-40}},    color={0,0,127}));
  connect(add.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{61,-60},{80,-60},{80,-38}}, color={0,0,127}));
  connect(firstOrder.y, add.u2) annotation (Line(points={{0,-73},{0,-66},{38,-66}}, color={0,0,127}));
  connect(add.u1, PID_LimitTemperature.y) annotation (Line(points={{38,-54},{34,-54},{34,-40},{31,-40}}, color={0,0,127}));
  connect(temperatureSensor.T, PID_LimitTemperature.u_m) annotation (Line(points={{41,70},{60,70},{60,-8},{20,-8},{20,-28}}, color={0,0,127}));
  connect(PID_LimitTemperature1.y, add1.u1) annotation (Line(points={{-71,-80},{-94,-80}},           color={0,0,127}));
  connect(PID_LimitTemperature1.u_s, u_s_signal.y) annotation (Line(points={{-48,-80},{-41,-80}}, color={0,0,127}));
  connect(temperatureSensor.T, PID_LimitTemperature1.u_m) annotation (Line(points={{41,70},{60,70},{60,-8},{-60,-8},{-60,-68}}, color={0,0,127}));
  connect(firstOrder1.y, idealSource_simple.m_flow_in) annotation (Line(points={{-100,-19},{-100,-14},{-84,-14},{-84,-12},{-80,-12}}, color={0,0,127}));
  connect(add1.y, firstOrder1.u) annotation (Line(points={{-100,-57},{-100,-42}}, color={0,0,127}));
  connect(add1.u2, m_flow_in) annotation (Line(points={{-106,-80},{-106,-96},{-100,-96},{-100,-120}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Thermal consumer including a PT1-element for QFlow.</p>
<p><i><span style=\"font-family: Courier New;\">min_return_temp_Q_flow_increaser</i> can be used to increase the heat flow, if the minimial return temperature is reached. That can be useful, to prevent the volume from freezing.</span></p>
<p><i><span style=\"font-family: Courier New;\">min_return_temp_m_flow_increaser</i> can be used to increase the mass flow, if the minimal return temperature is reached. The defined heat flow will still be ensured. This is useful for applications like a heat exchanger, where a minimum return temperature can be defined.</span></p>
</html>"));
end IdealConsumer_DefinedMassFlow;
