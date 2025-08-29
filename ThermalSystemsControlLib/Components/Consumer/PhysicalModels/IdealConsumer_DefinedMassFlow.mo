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
  BaseClasses.FluidBaseClasses.IdealSource idealSource_simple(redeclare package Medium = Medium, control_m_flow=true) annotation (Placement(transformation(extent={{-64,10},{-44,-10}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_in "Prescribed mass flow rate" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-100,-120})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=if volume.use_T_start then volume.system.T_start else Medium.temperature_phX(
      volume.p_start,
      volume.h_start,
      volume.X_start) "Start value of volume temperature";
  Modelica.Blocks.Sources.RealExpression volume_Temperature(y=volume.medium.T) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Sources.RealExpression min_temp(y=273.15 + 10) annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-76,-28})));
  Modelica.Blocks.Continuous.LimPID PID_LimitTemperature(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10000,
    Ti=10,
    yMax=100000,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState,
    strict=true) annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
equation
  connect(volume.ports[1], port_b) annotation (Line(points={{1,0},{100,0}}, color={0,127,255}));
  connect(prescribedHeatFlow.port, volume.heatPort) annotation (Line(points={{80,-18},{80,10},{10,10}},             color={191,0,0}));
  connect(temperatureSensor.port, volume.heatPort) annotation (Line(points={{20,70},{10,70},{10,10}},   color={191,0,0}));
  connect(temperatureSensor.T, T_Consumer) annotation (Line(points={{41,70},{110,70}}, color={0,0,127}));
  connect(idealSource_simple.port_a, port_a) annotation (Line(points={{-64,0},{-100,0}}, color={0,127,255}));
  connect(idealSource_simple.port_b, volume.ports[2]) annotation (Line(points={{-44,0},{-1,0}},color={0,127,255}));
  connect(Q_flow, firstOrder.u) annotation (Line(points={{0,-120},{0,-96}}, color={0,0,127}));
  connect(m_flow_in, firstOrder1.u) annotation (Line(points={{-100,-120},{-100,-28},{-88,-28}}, color={0,0,127}));
  connect(firstOrder1.y, idealSource_simple.m_flow_in) annotation (Line(points={{-65,-28},{-60,-28},{-60,-12}}, color={0,0,127}));
  connect(volume_Temperature.y, PID_LimitTemperature.u_m) annotation (Line(points={{-19,-50},{10,-50},{10,-42}}, color={0,0,127}));
  connect(min_temp.y, PID_LimitTemperature.u_s) annotation (Line(points={{-19,-30},{-2,-30}}, color={0,0,127}));
  connect(add.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{61,-60},{80,-60},{80,-38}}, color={0,0,127}));
  connect(firstOrder.y, add.u2) annotation (Line(points={{0,-73},{0,-66},{38,-66}}, color={0,0,127}));
  connect(add.u1, PID_LimitTemperature.y) annotation (Line(points={{38,-54},{28,-54},{28,-30},{21,-30}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Thermal consumer including a PT1-element for QFlow.</p>
<p>An OnOff Controller is used to make sure, the volume does not freeze for the case of minimal mass flow and high QFlows.</p>
</html>"));
end IdealConsumer_DefinedMassFlow;
