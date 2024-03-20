within ThermalSystemsControlLib.Components.GasBoiler;
model GasBoiler
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CondensingBoiler_Icon;

  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));
  replaceable parameter ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties deviceData constrainedby ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties annotation (choicesAllMatching=true);
  PhysicalModels.GasBoiler_Physical gasBoiler_Physical(redeclare package Medium = Medium, deviceData=deviceData)
                                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  Methods.ControlBoiler controlBoiler(
    k=k,
    yMax=yMax,
    yMin=yMin)                        annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,50})));
  Modelica.Blocks.Interfaces.RealOutput P_gas "Output signal connector" annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
equation
  connect(gasBoiler_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{66,11},{66,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(controlBoiler.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlBoiler.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlBoiler.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlBoiler.fSetPointInternal, gasBoiler_Physical.fSetPoint) annotation (Line(points={{1,-50},{40,-50},{40,6.66134e-16},{58,6.66134e-16}}, color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(gasBoiler_Physical.port_a, port_a) annotation (Line(points={{70,-10},{70,-100},{100,-100}}, color={0,127,255}));
  connect(gasBoiler_Physical.bStatusOn, bStatusOn) annotation (Line(points={{62,11},{62,80},{-50,80},{-50,110}}, color={255,0,255}));
  connect(gasBoiler_Physical.port_b, temperature.port_a) annotation (Line(points={{70,10},{70,40}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{70,60},{70,100},{100,100}}, color={0,127,255}));
  connect(temperature.T, controlBoiler.fTemperatureExternal) annotation (Line(points={{59,50},{20,50},{20,-20},{-10,-20},{-10,-62}}, color={0,0,127}));
  connect(gasBoiler_Physical.P_gas, P_gas) annotation (Line(points={{61,-11},{61,-20},{110,-20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Gas boiler model including control method.</p>
</html>"));
end GasBoiler;
