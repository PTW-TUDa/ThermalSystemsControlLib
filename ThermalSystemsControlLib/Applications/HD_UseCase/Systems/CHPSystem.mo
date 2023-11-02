within ThermalSystemsControlLib.Applications.HD_UseCase.Systems;
model CHPSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  Components.CombinedHeatPower.CHP_Type1 CHP(
    redeclare package Medium = Medium,
    k=0.1,
    yMax=1,
    yMin=0.2,
    redeclare Records.Converters.CHP_Heidelberger_2MW deviceData) annotation (Placement(transformation(extent={{60,-8},{80,12}})));
  Components.Valves.IdealThreeWayValve RV(
    redeclare package Medium = Medium,
    k=3,                                       yMin=0.5)       annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pumps.IdealPump PU(redeclare package Medium = Medium, redeclare Records.Pumps.SimplePump_HD_CHP deviceData(riseTime=1000))
                                                                                      annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Components.HeatMeter.HeatMeter WMZ321(redeclare package Medium = Medium)
                                        annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression(y=1) annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=2) annotation (Placement(transformation(extent={{-20,-64},{0,-44}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=15) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
equation
  connect(CHP.port_a, RV.port_b) annotation (Line(points={{80,-8},{80,-20}}, color={0,127,255}));
  connect(RV.port_a, WMZ321.port_b) annotation (Line(points={{80,-40},{80,-50}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a, PU.port_b) annotation (Line(points={{80,80},{80,80},{80,70}}, color={0,127,255}));
  connect(temperature.T, WMZ321.fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-60},{82,-60}}, color={0,0,127}));
  connect(bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(CHP.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,7},{20,7},{20,65},{58,65}}, color={255,0,255}));
  connect(RV.bAlgorithmPermission, PU.bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,65},{58,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2], PU.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,69}}, color={255,0,255}));
  connect(RV.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(CHP.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{58,11},{40,11},{40,70},{-19,70}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, CHP.fSetPointAutomatic) annotation (Line(points={{-59,30},{52,30},{52,3},{58,3}}, color={0,0,127}));
  connect(realExpression.y, PU.fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,61},{58,61}}, color={0,0,127}));
  connect(integerExpression.y, CHP.nControlModeAutomatic) annotation (Line(points={{1,-10},{58,-10},{58,-3}}, color={255,127,0}));
  connect(temperature1.port, RV.port_b) annotation (Line(points={{90,-20},{80,-20}}, color={0,127,255}));
  connect(RV.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-42},{65,-26},{83,-26},{83,-10}}, color={0,0,127}));
  connect(realExpression1.y, add.u2) annotation (Line(points={{-59,-50},{-40,-50},{-40,-36},{-22,-36}}, color={0,0,127}));
  connect(add.u1, CHP.fSetPointAutomatic) annotation (Line(points={{-22,-24},{-30,-24},{-30,30},{52,30},{52,3},{58,3}}, color={0,0,127}));
  connect(add.y, RV.fSetPointAutomatic) annotation (Line(points={{1,-30},{58,-30},{58,-29}}, color={0,0,127}));
  connect(CHP.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,13},{70,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PU.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(CHP.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{65,13},{65,46},{56,46},{56,42},{-30,42},{-30,81}},
                                                                                                                                   color={255,0,255}));
  connect(CHP.bStatusOn, bStatusOn) annotation (Line(points={{65,13},{65,12},{114,12},{114,114},{-50,114},{-50,110}},
                                                                                                    color={255,0,255}));
  connect(PU.port_a, CHP.port_b) annotation (Line(points={{80,50},{80,12}}, color={0,127,255}));
  connect(PU.port_b, RV.port_a1) annotation (Line(points={{80,70},{100,70},{100,-30},{80,-30}}, color={0,127,255}));
  connect(integerExpression1.y, PU.nControlModeAutomatic) annotation (Line(points={{1,-54},{44,-54},{44,55},{58,55}},color={255,127,0}));
  connect(WMZ321.port_a, port_a) annotation (Line(points={{80,-70},{80,-100},{100,-100}}, color={0,127,255}));
  connect(WMZ321.fHeatFlowRate, RV.fThermalPowerExternal) annotation (Line(points={{59,-60},{75.2,-60},{75.2,-42}}, color={0,0,127}));
  connect(PU.fThermalPowerExternal, RV.fThermalPowerExternal) annotation (Line(points={{70,48},{70,62},{75.2,62},{75.2,-42}}, color={0,0,127}));
  connect(RV.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-19},{65,-20},{50,-20},{50,122},{-30,122},{-30,81}},
                                                                                                                                   color={255,0,255}));
  connect(integerExpression1.y, RV.nControlModeAutomatic) annotation (Line(points={{1,-54},{44,-54},{44,-36},{58,-36},{58,-35}}, color={255,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CHPSystem;
