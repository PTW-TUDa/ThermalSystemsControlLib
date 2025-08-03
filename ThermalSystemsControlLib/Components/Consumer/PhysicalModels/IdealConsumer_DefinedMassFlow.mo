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
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={22,-56})));
  Modelica.Blocks.Sources.RealExpression ZeroQFlow(y=0) annotation (Placement(transformation(extent={{-42,-58},{-22,-38}})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=if volume.use_T_start then volume.system.T_start else Medium.temperature_phX(
      volume.p_start,
      volume.h_start,
      volume.X_start) "Start value of volume temperature";
  Modelica.Blocks.Sources.RealExpression volume_Temperature(y=volume.medium.T) annotation (Placement(transformation(extent={{-84,-86},{-64,-66}})));
  Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=5, pre_y_start=false) annotation (Placement(transformation(extent={{-42,-80},{-22,-60}})));
  Modelica.Blocks.Sources.RealExpression min_temp(y=273.15 + 10) annotation (Placement(transformation(extent={{-84,-74},{-64,-54}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-76,-28})));
equation
  connect(volume.ports[1], port_b) annotation (Line(points={{1,0},{100,0}}, color={0,127,255}));
  connect(prescribedHeatFlow.port, volume.heatPort) annotation (Line(points={{80,-18},{80,10},{10,10}},             color={191,0,0}));
  connect(temperatureSensor.port, volume.heatPort) annotation (Line(points={{20,70},{10,70},{10,10}},   color={191,0,0}));
  connect(temperatureSensor.T, T_Consumer) annotation (Line(points={{41,70},{110,70}}, color={0,0,127}));
  connect(idealSource_simple.port_a, port_a) annotation (Line(points={{-64,0},{-100,0}}, color={0,127,255}));
  connect(idealSource_simple.port_b, volume.ports[2]) annotation (Line(points={{-44,0},{-1,0}},color={0,127,255}));
  connect(onOffController.y, switch1.u2) annotation (Line(points={{-21,-70},{-2,-70},{-2,-56},{10,-56}}, color={255,0,255}));
  connect(volume_Temperature.y, onOffController.u) annotation (Line(points={{-63,-76},{-44,-76}}, color={0,0,127}));
  connect(min_temp.y, onOffController.reference) annotation (Line(points={{-63,-64},{-44,-64}}, color={0,0,127}));
  connect(ZeroQFlow.y, switch1.u1) annotation (Line(points={{-21,-48},{10,-48}}, color={0,0,127}));
  connect(Q_flow, firstOrder.u) annotation (Line(points={{0,-120},{0,-96}}, color={0,0,127}));
  connect(firstOrder.y, switch1.u3) annotation (Line(points={{0,-73},{0,-64},{10,-64}}, color={0,0,127}));
  connect(switch1.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{33,-56},{80,-56},{80,-38}}, color={0,0,127}));
  connect(m_flow_in, firstOrder1.u) annotation (Line(points={{-100,-120},{-100,-28},{-88,-28}}, color={0,0,127}));
  connect(firstOrder1.y, idealSource_simple.m_flow_in) annotation (Line(points={{-65,-28},{-60,-28},{-60,-12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Thermal consumer including a PT1-element for QFlow.</p>
<p>An OnOff Controller is used to make sure, the volume does not freeze for the case of minimal mass flow and high QFlows.</p>
</html>"));
end IdealConsumer_DefinedMassFlow;
