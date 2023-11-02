within ThermalSystemsControlLib.Components.CombinedHeatPower;
model CHP_Type1
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CHP_Icon;

  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Type1_Properties deviceData constrainedby ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Type1_Properties annotation (choicesAllMatching=true);
  PhysicalModels.CHP_Type1 cHP_Physical(redeclare package Medium = Medium, deviceData=deviceData) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  Methods.ControlCHP controlCHP(
    k=k,
    yMax=yMax,
    yMin=yMin)                  annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,56})));
equation
  connect(cHP_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{66,11},{66,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(controlCHP.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlCHP.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlCHP.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlCHP.fSetPointInternal, cHP_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,6.66134e-16},{58,6.66134e-16}}, color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(cHP_Physical.port_a, port_a) annotation (Line(points={{70,-10},{70,-100},{100,-100}}, color={0,127,255}));
  connect(cHP_Physical.bStatusOn, bStatusOn) annotation (Line(points={{62,11},{62,80},{-50,80},{-50,110}}, color={255,0,255}));
  connect(cHP_Physical.port_b, temperature.port_a) annotation (Line(points={{70,10},{70,46}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{70,66},{70,100},{100,100}}, color={0,127,255}));
  connect(controlCHP.fTemperatureExternal, temperature.T) annotation (Line(points={{-10,-62},{-10,-20},{20,-20},{20,56},{59,56}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Combined heat power model including control methods.</p>
</html>"));
end CHP_Type1;
