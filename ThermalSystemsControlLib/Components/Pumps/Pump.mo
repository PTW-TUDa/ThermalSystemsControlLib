within ThermalSystemsControlLib.Components.Pumps;
model Pump
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous_LocalControlMode;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Pump_Icon;

  parameter Integer pumpType=1 "Pump type"
                                          annotation (Evaluate = true,choices(choice=1 "Grundfos_Magna3_25_40", choice=2 "Grundfos_Magna3_25_80", choice=3 "Grundfos_Magna3_25_120", choice=4 "Grundfos_Magna3_32_60F", choice=5 "Grundfos_Magna3_32_120FN", choice=6 "Grundfos_Magna3_40_40F", choice=7 "Grundfos_Magna3_40_60F", choice=8 "Grundfos_Magna3_40_80F", choice=9 "Grundfos_Magna3_40_120F", choice=10 "Grundfos_Magna3_40_150FN", choice=11 "Grundfos_Magna3_50_80F", choice=12 "Grundfos_Unilift_CC9_A1", choice=13 "Heidelberger_CHP_Pump",choice=14 "Heidelberger_Boiler_Pump"));
  parameter Real k=1   "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1   "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0   "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));

  PhysicalModels.Pump_Physical                 pump_Physical(redeclare package Medium = Medium,
                                                             pumpType=pumpType)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,0})));
  Methods.ControlPump         controlPump(
    k=k,
    yMax=yMax,
    yMin=yMin) annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Interfaces.RealInput fThermalPowerExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-120})));

  Modelica.Blocks.Interfaces.RealInput fTemperatureExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-120})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,-50})));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,-40},{60,-20}})));
equation
  connect(pump_Physical.port_b, port_b) annotation (Line(points={{80,10},{80,100},{100,100}}, color={0,127,255}));
  connect(pump_Physical.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{81,4},{0,4},{0,0},{-70,0},{-70,18}},           color={0,0,127}));
  connect(controlPump.nControlMode, selectLocalControlMode.nControlMode) annotation (Line(points={{-22,-59},{-40,-59},{-40,-70},{-59,-70}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, controlPump.fSetPoint) annotation (Line(points={{-59,30},{-40,30},{-40,-50},{-22,-50}}, color={0,0,127}));
  connect(selectControlMode.bSetStatusOn, controlPump.bSetStatusOn) annotation (Line(points={{-59,70},{-22,70},{-22,-41}}, color={255,0,255}));
  connect(controlPump.fSetPointInternal, pump_Physical.fSetPoint) annotation (Line(points={{1,-50},{20,-50},{20,20},{70,20},{70,12}},
                                                                                                                            color={0,0,127}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(pump_Physical.port_a, port_a) annotation (Line(points={{80,-10},{80,-100},{100,-100}}, color={0,127,255}));
  connect(controlPump.fThermalPowerExternal, fThermalPowerExternal) annotation (Line(points={{-10,-62},{-10,-72},{50,-72},{50,-120}},        color={0,0,127}));
  connect(pump_Physical.bStatusOn, bStatusOn) annotation (Line(points={{81,8},{76,8},{76,80},{-50,80},{-50,110}}, color={255,0,255}));
  connect(controlPump.fTemperatureExternal, fTemperatureExternal) annotation (Line(points={{-15,-62},{-15,-80},{-50,-80},{-50,-120}}, color={0,0,127}));
  connect(add.y, controlPump.fTemperatureDifference) annotation (Line(points={{39,-50},{20,-50},{20,-62},{-5,-62}}, color={0,0,127}));
  connect(add.u2, fTemperatureExternal) annotation (Line(points={{62,-56},{62,-80},{-50,-80},{-50,-120}},                              color={0,0,127}));
  connect(temperature.port, port_a) annotation (Line(points={{70,-40},{80,-40},{80,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.T, add.u1) annotation (Line(points={{63,-30},{60,-30},{60,-44},{62,-44}}, color={0,0,127}));
  connect(pump_Physical.bSetStatusOn, controlPump.bSetStatusOn) annotation (Line(points={{65,12},{64,12},{64,70},{-22,70},{-22,-41}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Pressure building pump including control method.</p>
</html>"));
end Pump;
