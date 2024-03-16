within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model IdealConsumer_VariableMassFlow
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
        origin={0,-30})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-70})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Interfaces.RealOutput T_Consumer "Absolute temperature as output signal" annotation (Placement(transformation(extent={{100,60},{120,80}})));
equation
  connect(volume.ports[1], port_a) annotation (Line(points={{-2,0},{-50,0},{-50,0},{-100,0}}, color={0,127,255}));
  connect(volume.ports[2], port_b) annotation (Line(points={{2,0},{100,0}}, color={0,127,255}));
  connect(prescribedHeatFlow.port, volume.heatPort) annotation (Line(points={{6.66134e-16,-20},{-10,-20},{-10,10}}, color={191,0,0}));
  connect(Q_flow, firstOrder.u) annotation (Line(points={{0,-120},{0,-101},{-6.66134e-16,-101},{-6.66134e-16,-82}}, color={0,0,127}));
  connect(firstOrder.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{7.21645e-16,-59},{7.21645e-16,-49.5},{0,-49.5},{0,-40}}, color={0,0,127}));
  connect(temperatureSensor.port, volume.heatPort) annotation (Line(points={{20,70},{-10,70},{-10,10}}, color={191,0,0}));
  connect(temperatureSensor.T, T_Consumer) annotation (Line(points={{40,70},{110,70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Thermal consumer including a PT1-element.</p>
</html>"));
end IdealConsumer_VariableMassFlow;
