within ThermalSystemsControlLib.Components.Valves;
model IdealThreeWayValve
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidThreePort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.ThreeWayValve_Icon;

  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.IdealThreeWayValveProperties deviceData constrainedby ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.IdealThreeWayValveProperties annotation (choicesAllMatching=true);

  PhysicalModels.IdealThreeWayValve_Physical val(redeclare package Medium = Medium, deviceData=deviceData)
                                                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  Methods.ControlThreeWayValve controlValve(
    k=k,
    yMax=yMax,
    yMin=yMin) annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Interfaces.RealInput fTemperatureExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-120})));
  Modelica.Blocks.Interfaces.RealInput fThermalPowerExternal(start=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={52,-120})));
equation
  connect(val.port_a2, port_a1) annotation (Line(points={{80,-6.66134e-16},{90,-6.66134e-16},{90,0},{100,0}},
                                                                          color={0,127,255}));
  connect(val.port_a1, port_a) annotation (Line(points={{70,-10.2},{70,-100},{100,-100}}, color={0,127,255}));
  connect(val.port_b, port_b) annotation (Line(points={{70,10},{70,100},{100,100}}, color={0,127,255}));
  connect(val.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{66,11},{66,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(controlValve.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlValve.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlValve.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlValve.fSetPointInternal, val.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,8.88178e-16},{58,8.88178e-16}},
                                                                                                                   color={0,0,127}));
  connect(controlValve.fTemperatureExternal, fTemperatureExternal) annotation (Line(points={{-15,-62},{-14,-62},{-14,-100},{-50,-100},{-50,-120}}, color={0,0,127}));
  connect(controlValve.fThermalPowerExternal, fThermalPowerExternal) annotation (Line(points={{-5,-62},{-5,-100},{52,-100},{52,-120}}, color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(selectControlMode.bSetStatusOn, bStatusOn) annotation (Line(points={{-59,70},{-59,100},{-50,100},{-50,110}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Ideal three way valve without consideration of pressure differences including control methods.</p>
</html>"));
end IdealThreeWayValve;
