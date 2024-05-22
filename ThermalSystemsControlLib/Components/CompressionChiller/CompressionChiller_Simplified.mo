within ThermalSystemsControlLib.Components.CompressionChiller;
model CompressionChiller_Simplified
    extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerSimplifiedProperties deviceData constrainedby ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerSimplifiedProperties annotation (choicesAllMatching=true);
  PhysicalModels.CompressionChiller_Simplified_Physical
                                             compressionChiller_Simplified_Physical(
                                                                         redeclare package Medium = Medium, deviceData=deviceData)
                                                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,2})));
  Methods.ControlChiller          controlChiller(
    k=k,
    yMax=yMax,
    yMin=yMin)                                  annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,50})));
  Modelica.Blocks.Interfaces.RealInput T_air "Connector of Real input signal" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Interfaces.RealOutput P_el "Output signal connector" annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  connect(compressionChiller_Simplified_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{64,13},{64,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(controlChiller.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlChiller.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlChiller.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlChiller.fSetPointInternal, compressionChiller_Simplified_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,2},{58,2}},                     color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(compressionChiller_Simplified_Physical.port_a, port_a) annotation (Line(points={{70,-8},{70,-100},{100,-100}},  color={0,127,255}));
  connect(compressionChiller_Simplified_Physical.port_b, temperature.port_a) annotation (Line(points={{70,12},{70,40}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{70,60},{70,100},{100,100}}, color={0,127,255}));
  connect(temperature.T, controlChiller.fTemperatureExternal_Chiller) annotation (Line(points={{59,50},{20,50},{20,-20},{-5,-20},{-5,-62}}, color={0,0,127}));
  connect(compressionChiller_Simplified_Physical.T_air, T_air) annotation (Line(points={{63,-10},{63,-80},{0,-80},{0,-120}}, color={0,0,127}));
  connect(controlChiller.fTemperatureExternal_HeatPump, controlChiller.fTemperatureExternal_Chiller) annotation (Line(points={{-15,-62},{-14,-62},{-14,-20},{-5,-20},{-5,-62}}, color={0,0,127}));
  connect(compressionChiller_Simplified_Physical.P_el, P_el) annotation (Line(points={{66,13},{66,20},{110,20}}, color={0,0,127}));
  connect(bStatusOn, controlChiller.bSetStatusOn) annotation (Line(points={{-50,110},{-50,70},{-22,70},{-22,-41}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Compression chiller model including control method.</p>
</html>"));
end CompressionChiller_Simplified;
