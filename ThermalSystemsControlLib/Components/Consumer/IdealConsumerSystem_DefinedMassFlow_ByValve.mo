within ThermalSystemsControlLib.Components.Consumer;
model IdealConsumerSystem_DefinedMassFlow_ByValve
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
  Modelica.Blocks.Interfaces.RealInput m_flow_in "Prescribed mass flow rate" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-100,-120})));
  HeatMeter.HeatMeter WMZxxx(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={60,-10})));
  Modelica.Fluid.Sensors.TemperatureTwoPort FeedTemperatureHeatExchanger1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  parameter Valves.PhysicalModels.Records.TwoWayValveProperties deviceData;
  PhysicalModels.IdealConsumer_DefinedMassFlow_ByValve idealConsumer_DefinedMassFlow_MSL_only(
    redeclare package Medium = Medium,
    V_int=V_int,
    riseTime=riseTime,
    deviceData=deviceData) annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
equation
  connect(WMZxxx.port_b, port_b) annotation (Line(points={{70,0},{100,0}}, color={0,127,255}));
  connect(FeedTemperatureHeatExchanger1.port_a, port_a) annotation (Line(points={{-70,0},{-100,0}}, color={0,127,255}));
  connect(FeedTemperatureHeatExchanger1.T, WMZxxx.fFeedTemperature) annotation (Line(points={{-60,11},{-60,40},{60,40},{60,2}}, color={0,0,127}));
  connect(idealConsumer_DefinedMassFlow_MSL_only.port_b, WMZxxx.port_a) annotation (Line(points={{8,0},{50,0}}, color={0,127,255}));
  connect(idealConsumer_DefinedMassFlow_MSL_only.port_a, FeedTemperatureHeatExchanger1.port_b) annotation (Line(points={{-12,0},{-50,0}}, color={0,127,255}));
  connect(idealConsumer_DefinedMassFlow_MSL_only.m_flow_in, m_flow_in) annotation (Line(points={{-12,-12},{-24,-12},{-24,-90},{-100,-90},{-100,-120}}, color={0,0,127}));
  connect(idealConsumer_DefinedMassFlow_MSL_only.Q_flow, Q_flow) annotation (Line(points={{-2,-12},{-2,-96},{0,-96},{0,-120}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Thermal consumer including a PT1-element.</p>
</html>"));
end IdealConsumerSystem_DefinedMassFlow_ByValve;
