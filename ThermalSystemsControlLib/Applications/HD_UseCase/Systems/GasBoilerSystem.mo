within ThermalSystemsControlLib.Applications.HD_UseCase.Systems;
model GasBoilerSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  Components.GasBoiler.GasBoiler CondensingBoiler(
    redeclare package Medium = Medium,
    k=0.1,
    yMax=1,
    yMin=0.2,
    redeclare Records.Converters.CondensingBoiler_Heidelberger_15MW deviceData) annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Components.Valves.IdealThreeWayValve RV(
    redeclare package Medium = Medium,    k=5, yMin=0.5) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pumps.IdealPump PU(redeclare package Medium = Medium,
                                redeclare Records.Pumps.SimplePump_HD_GasBoiler deviceData)                                               annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Components.HeatMeter.HeatMeter WMZ331(redeclare package Medium = Medium)
                                        annotation (Placement(transformation(extent={{60,-76},{80,-56}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression(y=1) annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=2) annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
equation
  connect(CondensingBoiler.port_a, RV.port_b) annotation (Line(points={{80,-10},{80,-20}},color={0,127,255}));
  connect(RV.port_a, WMZ331.port_b) annotation (Line(points={{80,-40},{80,-56}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a, PU.port_b) annotation (Line(points={{80,80},{80,80},{80,70}}, color={0,127,255}));
  connect(temperature.T, WMZ331.fFeedTemperature) annotation (Line(points={{91,90},{100,90},{100,-66},{82,-66}},
                                                                                                               color={0,0,127}));
  connect(bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(CondensingBoiler.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,5},{20,5},{20,65},{58,65}}, color={255,0,255}));
  connect(RV.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,65},{58,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2], PU.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,69}}, color={255,0,255}));
  connect(RV.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(CondensingBoiler.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{58,9},{40,9},{40,70},{-19,70}},   color={255,0,255}));
  connect(selectSetPoint.fSetPoint, CondensingBoiler.fSetPointAutomatic) annotation (Line(points={{-59,30},{52,30},{52,1},{58,1}}, color={0,0,127}));
  connect(realExpression.y, PU.fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,61},{58,61}}, color={0,0,127}));
  connect(integerExpression.y, CondensingBoiler.nControlModeAutomatic) annotation (Line(points={{1,-10},{58,-10},{58,-5}}, color={255,127,0}));
  connect(temperature1.port, RV.port_b) annotation (Line(points={{90,-20},{80,-20}}, color={0,127,255}));
  connect(RV.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-42},{65,-26},{83,-26},{83,-10}}, color={0,0,127}));
  connect(CondensingBoiler.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,11},{70,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PU.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(CondensingBoiler.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{65,11},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(CondensingBoiler.bStatusOn, bStatusOn) annotation (Line(points={{65,11},{65,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(RV.fSetPointAutomatic, PU.fSetPointAutomatic) annotation (Line(points={{58,-29},{48,-29},{48,61},{58,61}}, color={0,0,127}));
  connect(integerExpression1.y, PU.nControlModeAutomatic) annotation (Line(points={{1,-30},{48,-30},{48,54},{58,54},{58,55}},
                                                                                                             color={255,127,0}));
  connect(PU.port_a, CondensingBoiler.port_b) annotation (Line(points={{80,50},{80,10}}, color={0,127,255}));
  connect(WMZ331.fHeatFlowRate, RV.fThermalPowerExternal) annotation (Line(points={{59,-66},{75.2,-66},{75.2,-42}}, color={0,0,127}));
  connect(PU.fThermalPowerExternal, RV.fThermalPowerExternal) annotation (Line(points={{70,48},{70,62},{74,62},{74,-60},{75.2,-60},{75.2,-42}}, color={0,0,127}));
  connect(WMZ331.port_a, port_a) annotation (Line(points={{80,-76},{80,-100},{100,-100}}, color={0,127,255}));
  connect(RV.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-19},{65,81},{-30,81}}, color={255,0,255}));
  connect(RV.nControlModeAutomatic, PU.nControlModeAutomatic) annotation (Line(points={{58,-35},{48,-35},{48,54},{58,54},{58,55}}, color={255,127,0}));
  connect(temperature.port_a, RV.port_a1) annotation (Line(points={{80,80},{100,80},{100,-30},{80,-30}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end GasBoilerSystem;
