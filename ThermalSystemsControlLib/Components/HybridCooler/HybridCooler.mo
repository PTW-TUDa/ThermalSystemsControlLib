within ThermalSystemsControlLib.Components.HybridCooler;
model HybridCooler
  extends ThermalSystemsControlLib.BaseClasses.Icons.CoolingTower_Icon;
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.HybridCooler.PhysicalModels.Records.HybridCoolerProperties deviceData constrainedby ThermalSystemsControlLib.Components.HybridCooler.PhysicalModels.Records.HybridCoolerProperties annotation (choicesAllMatching=true);
  PhysicalModels.HybridCooler_Physical HybridCooler_Physical(redeclare package Medium = Medium, deviceData=deviceData) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={72,2})));
  Methods.ControlHybridCooler controlHybridCooler annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,50})));
equation
  connect(HybridCooler_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{68,13},{68,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(controlHybridCooler.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlHybridCooler.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlHybridCooler.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlHybridCooler.fSetPointInternal, HybridCooler_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,2},{60,2}},                     color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(HybridCooler_Physical.port_a, port_a) annotation (Line(points={{72,-8},{72,-100},{100,-100}},  color={0,127,255}));
  connect(HybridCooler_Physical.bStatusOn, bStatusOn) annotation (Line(points={{64,13},{64,80},{-50,80},{-50,110}}, color={255,0,255}));
  connect(HybridCooler_Physical.port_b, temperature.port_a) annotation (Line(points={{72,12},{72,26},{70,26},{70,40}},
                                                                                                       color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{70,60},{70,100},{100,100}}, color={0,127,255}));
  connect(temperature.T, controlHybridCooler.fTemperatureExternal) annotation (Line(points={{59,50},{20,50},{20,-20},{-10,-20},{-10,-62}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Hybrid cooler model using an ideal pump for ventilation modeling. Heat is transfered by a counterflow heat exchanger considering wet bulb temperature including control methods.</p>
</html>"));
end HybridCooler;
