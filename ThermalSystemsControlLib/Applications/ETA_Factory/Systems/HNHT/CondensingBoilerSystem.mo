within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT;
model CondensingBoilerSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CondensingBoiler_Icon;
  Components.GasBoiler.GasBoiler CondensingBoiler(
    redeclare package Medium = Medium,
    k=5,
    yMin=0.5,
    redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.CondensingBoiler deviceData) annotation (Placement(transformation(extent={{60,-8},{80,12}})));
  Components.Valves.ThreeWayValve RV331(
    k=5,
    yMin=0.5,
    redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.SV deviceData) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pumps.Pump      PU                                                                                                           annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Components.Valves.TwoWayValve SV331(redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.RV deviceData) annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
  Components.HeatMeter.HeatMeter WMZ331 annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100)
                                                             annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression(y=1) annotation (Placement(transformation(extent={{42,-18},{52,-4}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,30})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=8.95,
    diameter=0.013,
    n_Bending=12)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={70,30})));
equation
  connect(CondensingBoiler.port_a, RV331.port_b) annotation (Line(points={{80,-8},{80,-20}}, color={0,127,255}));
  connect(SV331.port_a, port_a) annotation (Line(points={{80,-100},{100,-100}}, color={0,127,255}));
  connect(RV331.port_a, WMZ331.port_b) annotation (Line(points={{80,-40},{80,-50}}, color={0,127,255}));
  connect(WMZ331.port_a, SV331.port_b) annotation (Line(points={{80,-70},{80,-80}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a, PU.port_b) annotation (Line(points={{80,80},{80,80},{80,70}}, color={0,127,255}));
  connect(temperature.T, WMZ331.fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-60},{82,-60}}, color={0,0,127}));
  connect(bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(CondensingBoiler.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,7},{20,7},{20,65},{58,65}}, color={255,0,255}));
  connect(RV331.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,65},{58,65}}, color={255,0,255}));
  connect(SV331.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,-85},{20,-85},{20,65},{58,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2], PU.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,69}}, color={255,0,255}));
  connect(RV331.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(CondensingBoiler.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{58,11},{40,11},{40,70},{-19,70}}, color={255,0,255}));
  connect(SV331.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-81},{40,-81},{40,70},{-19,70}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, CondensingBoiler.fSetPointAutomatic) annotation (Line(points={{-59,30},{52,30},{52,3},{58,3}}, color={0,0,127}));
  connect(realExpression.y, PU.fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,61},{58,61}}, color={0,0,127}));
  connect(SV331.fSetPointAutomatic, PU.fSetPointAutomatic) annotation (Line(points={{58,-89},{48,-89},{48,61},{58,61}}, color={0,0,127}));
  connect(integerExpression.y, CondensingBoiler.nControlModeAutomatic) annotation (Line(points={{52.5,-11},{58,-11},{58,-3}},
                                                                                                                           color={255,127,0}));
  connect(integerExpression1.y,SV331. nControlModeAutomatic) annotation (Line(points={{1,-70},{30,-70},{30,-95},{58,-95}}, color={255,127,0}));
  connect(PU.nControlModeAutomatic, SV331.nControlModeAutomatic) annotation (Line(points={{58,55},{30,55},{30,-95},{58,-95}}, color={255,127,0}));
  connect(temperature1.port,RV331. port_b) annotation (Line(points={{90,-20},{80,-20}}, color={0,127,255}));
  connect(RV331.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-42},{65,-26},{83,-26},{83,-10}}, color={0,0,127}));
  connect(CondensingBoiler.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,13},{70,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PU.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(CondensingBoiler.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{65,13},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(CondensingBoiler.bStatusOn, bStatusOn) annotation (Line(points={{65,13},{65,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(SV331.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-79},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(WMZ331.fHeatFlowRate, SV331.fThermalPowerExternal) annotation (Line(points={{59,-60},{76,-60},{76,-102},{75,-102}}, color={0,0,127}));
  connect(RV331.fThermalPowerExternal,SV331. fThermalPowerExternal) annotation (Line(points={{75.2,-42},{76,-42},{76,-102},{75,-102}}, color={0,0,127}));
  connect(PU.fThermalPowerExternal, SV331.fThermalPowerExternal) annotation (Line(points={{75,48},{76,48},{76,-102},{75,-102}},         color={0,0,127}));
  connect(RV331.fSetPointAutomatic, PU.fSetPointAutomatic) annotation (Line(points={{58,-29},{48,-29},{48,61},{58,61}}, color={0,0,127}));
  connect(RV331.nControlModeAutomatic, SV331.nControlModeAutomatic) annotation (Line(points={{58,-35},{44,-35},{44,-34},{30,-34},{30,-95},{58,-95}}, color={255,127,0}));
  connect(RV331.port_a1, pipe2.port_b) annotation (Line(points={{80,-30},{100,-30},{100,20}}, color={0,127,255}));
  connect(pipe2.port_a, PU.port_b) annotation (Line(points={{100,40},{100,70},{80,70}}, color={0,127,255}));
  connect(CondensingBoiler.port_b, pipe1.port_a) annotation (Line(points={{80,12},{80,20}}, color={0,127,255}));
  connect(pipe1.port_b, PU.port_a) annotation (Line(points={{80,40},{80,50}}, color={0,127,255}));
  connect(PU.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,48},{66,48},{66,60},{83,60},{83,-10}}, color={0,0,127}));
  connect(SV331.fTemperatureExternal, SV331.fThermalPowerExternal) annotation (Line(points={{65,-102},{66,-102},{66,-90},{76,-90},{76,-102},{75,-102}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CondensingBoilerSystem;
