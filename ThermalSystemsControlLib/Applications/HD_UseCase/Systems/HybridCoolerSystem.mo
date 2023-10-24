within ThermalSystemsControlLib.Applications.HD_UseCase.Systems;
model HybridCoolerSystem
  outer Modelica.Fluid.System system;
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  Components.Valves.IdealThreeWayValve RV(k=5, yMin=0.5) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pumps.IdealPump PU(redeclare Records.Pumps.SimplePump_HD_HybridCooler_Water deviceData)
                                                                                      annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression(y=1) annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{20,72},{40,92}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Components.HybridCooler.HybridCooler hybridCooler(redeclare Records.Converters.HybridCooler_HD deviceData)
                                                    annotation (Placement(transformation(extent={{60,6},{80,26}})));
  Components.HeatMeter.HeatMeter WMZ321 annotation (Placement(transformation(extent={{60,-78},{80,-58}})));
equation
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a, PU.port_b) annotation (Line(points={{80,80},{80,80},{80,70}}, color={0,127,255}));
  connect(bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(RV.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,65},{58,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2], PU.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,69}}, color={255,0,255}));
  connect(RV.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(realExpression.y, PU.fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,61},{58,61}}, color={0,0,127}));
  connect(temperature1.port, RV.port_b) annotation (Line(points={{90,-20},{80,-20}}, color={0,127,255}));
  connect(RV.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-42},{65,-26},{83,-26},{83,-10}}, color={0,0,127}));
  connect(integerExpression1.y, PU.nControlModeAutomatic) annotation (Line(points={{41,82},{44,82},{44,55},{58,55}}, color={255,127,0}));
  connect(hybridCooler.port_b, PU.port_a) annotation (Line(points={{80,26},{80,50}}, color={0,127,255}));
  connect(hybridCooler.port_a, RV.port_b) annotation (Line(points={{80,6},{80,-20}}, color={0,127,255}));
  connect(hybridCooler.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{58,25},{40,25},{40,70},{-19,70}}, color={255,0,255}));
  connect(hybridCooler.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,21},{28,21},{28,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(integerExpression.y, hybridCooler.nControlModeAutomatic) annotation (Line(points={{1,-10},{34,-10},{34,11},{58,11}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, hybridCooler.fSetPointAutomatic) annotation (Line(points={{-59,30},{34,30},{34,17},{58,17}}, color={0,0,127}));
  connect(hybridCooler.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,27},{70,34},{0,34},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(RV.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-19},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(PU.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(hybridCooler.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{65,27},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(systemFlowControl.bStatusOn_Components[3], selectControlMode.bStatusOn) annotation (Line(points={{-30,81},{-30,82},{-70,82}}, color={255,0,255}));
  connect(integerExpression1.y, RV.nControlModeAutomatic) annotation (Line(points={{41,82},{44,82},{44,-35},{58,-35}}, color={255,127,0}));
  connect(RV.fSetPointAutomatic, PU.fSetPointAutomatic) annotation (Line(points={{58,-29},{48,-29},{48,61},{58,61}}, color={0,0,127}));
  connect(temperature.T, WMZ321.fFeedTemperature) annotation (Line(points={{91,90},{100,90},{100,-68},{82,-68}}, color={0,0,127}));
  connect(WMZ321.fHeatFlowRate, RV.fThermalPowerExternal) annotation (Line(points={{59,-68},{52,-68},{52,-52},{75.2,-52},{75.2,-42}}, color={0,0,127}));
  connect(WMZ321.fHeatFlowRate, PU.fThermalPowerExternal) annotation (Line(points={{59,-68},{52,-68},{52,-52},{70,-52},{70,48}}, color={0,0,127}));
  connect(RV.port_a, WMZ321.port_b) annotation (Line(points={{80,-40},{80,-58}}, color={0,127,255}));
  connect(WMZ321.port_a, port_a) annotation (Line(points={{80,-78},{80,-100},{100,-100}}, color={0,127,255}));
  connect(PU.port_b, RV.port_a1) annotation (Line(points={{80,70},{100,70},{100,-30},{80,-30}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HybridCoolerSystem;
