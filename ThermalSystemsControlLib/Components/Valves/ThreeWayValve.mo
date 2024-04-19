within ThermalSystemsControlLib.Components.Valves;
model ThreeWayValve
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidThreePort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.ThreeWayValve_Icon;

  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.ThreeWayValveProperties deviceData constrainedby ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.ThreeWayValveProperties annotation (choicesAllMatching=true);

  PhysicalModels.ThreeWayValve_Physical      threeWayValve_Physical(redeclare package Medium = Medium,
                                                                    deviceData=deviceData)
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
  Modelica.Blocks.Interfaces.RealInput fThermalPowerExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={52,-120})));
  Modelica.Blocks.Math.Gain gain(k=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={28,20})));
equation
  connect(threeWayValve_Physical.port_a1, port_a1) annotation (Line(points={{80,0},{100,0}}, color={0,127,255}));
  connect(threeWayValve_Physical.port_a, port_a) annotation (Line(points={{70,-10},{70,-100},{100,-100}}, color={0,127,255}));
  connect(threeWayValve_Physical.port_b, port_b) annotation (Line(points={{70,10},{70,100},{100,100}}, color={0,127,255}));
  connect(controlValve.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlValve.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlValve.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlValve.fSetPointInternal, threeWayValve_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,0},{58,0}}, color={0,0,127}));
  connect(controlValve.fTemperatureExternal, fTemperatureExternal) annotation (Line(points={{-15,-62},{-14,-62},{-14,-100},{-50,-100},{-50,-120}}, color={0,0,127}));
  connect(controlValve.fThermalPowerExternal, fThermalPowerExternal) annotation (Line(points={{-5,-62},{-5,-100},{52,-100},{52,-120}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, bStatusOn) annotation (Line(points={{-59,70},{-50,70},{-50,110}}, color={255,0,255}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(threeWayValve_Physical.fOperatingPoint, gain.u) annotation (Line(points={{64,11},{64,20},{40,20}}, color={0,0,127}));
  connect(gain.y, selectSetPoint.fOperatingPoint) annotation (Line(points={{17,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Three way valve considering pressure differences including control methods.</p>
</html>"));
end ThreeWayValve;
