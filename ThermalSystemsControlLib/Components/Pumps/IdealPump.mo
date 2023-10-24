within ThermalSystemsControlLib.Components.Pumps;
model IdealPump
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Pump_Icon;

  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties deviceData constrainedby ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties annotation (choicesAllMatching=true);
  PhysicalModels.IdealPump_Physical idealPump_Physical(redeclare package Medium = Medium, deviceData=deviceData)
                                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,0})));
  Methods.ControlPump controlPump annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Interfaces.RealInput fThermalPowerExternal(start=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-120})));
  Modelica.Blocks.Interfaces.RealInput fTemperatureExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-120})));
equation
  connect(idealPump_Physical.port_b, port_b) annotation (Line(points={{80,10},{80,100},{100,100}}, color={0,127,255}));
  connect(idealPump_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{81,4},{0,4},{0,0},{-70,0},{-70,18}},           color={0,0,127}));
  connect(controlPump.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlPump.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlPump.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlPump.fSetPointInternal, idealPump_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,12},{70,12}},                   color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(idealPump_Physical.port_a, port_a) annotation (Line(points={{80,-10},{80,-100},{100,-100}}, color={0,127,255}));
  connect(controlPump.fThermalPowerExternal, fThermalPowerExternal) annotation (Line(points={{-5,-62},{-5,-80},{50,-80},{50,-120}}, color={0,0,127}));
  connect(idealPump_Physical.bStatusOn, bStatusOn) annotation (Line(points={{81,8},{81,80},{-50,80},{-50,110}},  color={255,0,255}));
  connect(controlPump.fTemperatureExternal, fTemperatureExternal) annotation (Line(points={{-15,-62},{-15,-80},{-50,-80},{-50,-120}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Ideal mass-flow building pump including control method.</p>
</html>"));
end IdealPump;
