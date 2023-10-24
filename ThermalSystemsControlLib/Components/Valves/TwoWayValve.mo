within ThermalSystemsControlLib.Components.Valves;
model TwoWayValve
  extends ThermalSystemsControlLib.BaseClasses.Icons.TwoWayValve_Icon;
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;

  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties deviceData constrainedby ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties annotation (choicesAllMatching=true);

  Methods.ControlTwoWayValve controlValve(
    k=k,
    yMax=yMax,
    yMin=yMin) annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Interfaces.RealInput fThermalPowerExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-120})));
  PhysicalModels.TwoWayValve_Physical twoWayValve_Physical(redeclare package Medium = Medium, deviceData=deviceData) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  Modelica.Blocks.Interfaces.RealInput fTemperatureExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-120})));
equation
  connect(controlValve.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlValve.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlValve.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(twoWayValve_Physical.port_b, port_b) annotation (Line(points={{70,10},{70,100},{100,100}}, color={0,127,255}));
  connect(twoWayValve_Physical.port_a1, port_a) annotation (Line(points={{70,-10},{70,-100},{100,-100}}, color={0,127,255}));
  connect(fThermalPowerExternal, controlValve.fThermalPowerExternal) annotation (Line(points={{50,-120},{50,-80},{-10,-80},{-10,-62}},
                                                                                                                                     color={0,0,127}));
  connect(controlValve.fSetPointInternal, twoWayValve_Physical.fSetPoint) annotation (Line(points={{1,-50},{20,-50},{20,8.88178e-16},{58,8.88178e-16}}, color={0,0,127}));
  connect(twoWayValve_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{66,11},{66,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(fTemperatureExternal, controlValve.fTemperatureExternal) annotation (Line(points={{-50,-120},{-50,-80},{-15,-80},{-15,-62}}, color={0,0,127}));
  connect(twoWayValve_Physical.bStatusOn, bStatusOn) annotation (Line(points={{62,11},{62,100},{-50,100},{-50,110}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Linear two way valve including control methods.</p>
</html>"));
end TwoWayValve;
