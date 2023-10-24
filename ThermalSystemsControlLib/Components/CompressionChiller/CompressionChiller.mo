within ThermalSystemsControlLib.Components.CompressionChiller;
model CompressionChiller
    extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;

  replaceable package Medium1 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerProperties deviceData constrainedby ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerProperties annotation (choicesAllMatching=true);
  PhysicalModels.CompressionChiller_Physical compressionChiller_Physical(redeclare package Medium = Medium,
    redeclare package Medium1 = Medium1,                                                                    deviceData=deviceData)
                                                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  Methods.ControlChiller          controlChiller
                                                annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,50})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1)
                                                annotation (Placement(transformation(extent={{92,30},{112,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1)
                                                annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Medium)
                                                                                           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={80,-30})));
equation
  connect(compressionChiller_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{66,11},{66,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(controlChiller.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlChiller.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlChiller.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlChiller.fSetPointInternal, compressionChiller_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,6.66134e-16},{58,6.66134e-16}}, color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(compressionChiller_Physical.port_a, port_a) annotation (Line(points={{70,-10},{70,-100},{100,-100}}, color={0,127,255}));
  connect(compressionChiller_Physical.bStatusOn, bStatusOn) annotation (Line(points={{62,11},{62,80},{-50,80},{-50,110}}, color={255,0,255}));
  connect(compressionChiller_Physical.port_b, temperature.port_a) annotation (Line(points={{70,10},{70,40}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{70,60},{70,100},{100,100}}, color={0,127,255}));
  connect(compressionChiller_Physical.port_a1, port_a1) annotation (Line(points={{80,10},{80,40},{102,40}}, color={0,127,255}));
  connect(temperature1.port_a, compressionChiller_Physical.port_b1) annotation (Line(points={{80,-20},{80,-10}}, color={0,127,255}));
  connect(temperature1.port_b, port_b1) annotation (Line(points={{80,-40},{100,-40}}, color={0,127,255}));
  connect(controlChiller.fTemperatureExternal_HeatPump, temperature1.T) annotation (Line(points={{-15,-62},{-15,-80},{60,-80},{60,-30},{69,-30}}, color={0,0,127}));
  connect(controlChiller.fTemperatureExternal_Chiller, temperature.T) annotation (Line(points={{-5,-62},{-8,-62},{-8,-20},{20,-20},{20,50},{59,50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Compression chiller model including control method.</p>
</html>"));
end CompressionChiller;
