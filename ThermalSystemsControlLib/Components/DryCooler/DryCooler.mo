within ThermalSystemsControlLib.Components.DryCooler;
model DryCooler
  extends ThermalSystemsControlLib.BaseClasses.Icons.CoolingTower_Icon;
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.DryCooler.PhysicalModels.Records.DryCoolerProperties deviceData constrainedby ThermalSystemsControlLib.Components.DryCooler.PhysicalModels.Records.DryCoolerProperties annotation (choicesAllMatching=true);
  PhysicalModels.DryCooler_Physical                             dryCooler_Physical(
    redeclare package Medium = Medium,
    deviceData=deviceData) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  Methods.ControlDryCooler        controlDryCooler
                                                annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,50})));
  Modelica.Blocks.Interfaces.RealInput T_air1
    "Prescribed boundary temperature" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
equation
  connect(dryCooler_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{66,11},{66,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(controlDryCooler.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlDryCooler.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlDryCooler.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlDryCooler.fSetPointInternal, dryCooler_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,6.66134e-16},{58,6.66134e-16}}, color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(dryCooler_Physical.port_a, port_a) annotation (Line(points={{70,-10},{70,-100},{100,-100}}, color={0,127,255}));
  connect(dryCooler_Physical.bStatusOn, bStatusOn) annotation (Line(points={{62,11},{62,80},{-50,80},{-50,110}}, color={255,0,255}));
  connect(dryCooler_Physical.port_b, temperature.port_a) annotation (Line(points={{70,10},{70,40}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{70,60},{70,100},{100,100}}, color={0,127,255}));
  connect(temperature.T, controlDryCooler.fTemperatureExternal) annotation (Line(points={{59,50},{20,50},{20,-20},{-10,-20},{-10,-62}}, color={0,0,127}));
  connect(dryCooler_Physical.T_air, T_air1) annotation (Line(points={{65,-12},{64,-12},{64,-100},{0,-100},{0,-120}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Dry cooler model using an ideal pump for ventilation modeling including control methods.</p>
</html>"));
end DryCooler;
