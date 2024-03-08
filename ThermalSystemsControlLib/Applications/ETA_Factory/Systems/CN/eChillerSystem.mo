within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.CN;
model eChillerSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  Components.Pumps.Pump PU138(pumpType=4)
                              annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=15000,
    m_flow_nominal=1.38) "pressure drop must be adjusted after measurement"
                                                            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,30})));
  Components.HeatMeter.HeatMeter WMZ138 annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100)
                                                             annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Modelica.Blocks.Interfaces.RealInput fAmbientTemperature annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));
  Components.Valves.TwoWayValve SV138(redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Components.CompressionChiller.CompressionChiller_Simplified eChiller(redeclare Records.EfficientEnergy_eChiller_45_II deviceData) annotation (Placement(transformation(extent={{60,-8},{80,12}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression3(y=1) annotation (Placement(transformation(extent={{20,-20},{40,0}})));
equation
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.T,WMZ138. fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-70},{82,-70}}, color={0,0,127}));
  connect(WMZ138.port_a, port_a) annotation (Line(points={{80,-80},{80,-100},{100,-100}}, color={0,127,255}));
  connect(WMZ138.fHeatFlowRate,PU138. fThermalPowerExternal) annotation (Line(points={{59,-70},{75,-70},{75,-42}},color={0,0,127}));
  connect(SV138.port_a, pressureDrop.port_b) annotation (Line(points={{80,50},{80,40}}, color={0,127,255}));
  connect(SV138.port_b, temperature.port_a) annotation (Line(points={{80,70},{80,80}}, color={0,127,255}));
  connect(PU138.port_a,WMZ138. port_b) annotation (Line(points={{80,-40},{80,-60},{80,-60}}, color={0,127,255}));
  connect(SV138.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{58,65},{40,65},{40,50},{-120,50}}, color={255,0,255}));
  connect(PU138.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{58,-25},{40,-25},{40,50},{-120,50}}, color={255,0,255}));
  connect(SV138.fSetPointAutomatic, realExpression.y) annotation (Line(points={{58,61},{50,61},{50,50},{41,50}}, color={0,0,127}));
  connect(integerExpression2.y,SV138. nControlModeAutomatic) annotation (Line(points={{41,30},{52,30},{52,55},{58,55}}, color={255,127,0}));
  connect(SV138.fThermalPowerExternal,PU138. fThermalPowerExternal) annotation (Line(points={{75,48},{75,4},{75,-42},{75,-42}}, color={0,0,127}));
  connect(PU138.fTemperatureExternal,WMZ138. fFeedTemperature) annotation (Line(points={{65,-42},{65,-50},{96,-50},{96,-70},{82,-70}}, color={0,0,127}));
  connect(integerExpression1.y,PU138. nControlModeAutomatic) annotation (Line(points={{41,-50},{58,-50},{58,-35}}, color={255,127,0}));
  connect(eChiller.port_a, PU138.port_b) annotation (Line(points={{80,-8},{80,-20}}, color={0,127,255}));
  connect(eChiller.port_b, pressureDrop.port_a) annotation (Line(points={{80,12},{80,20}}, color={0,127,255}));
  connect(eChiller.T_air, fAmbientTemperature) annotation (Line(points={{70,-10},{70,-14},{-60,-14},{-60,-70},{-120,-70}}, color={0,0,127}));
  connect(selectSetPoint.fSetPoint, eChiller.fSetPointAutomatic) annotation (Line(points={{-59,30},{10,30},{10,3},{58,3}}, color={0,0,127}));
  connect(eChiller.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{58,7},{40,7},{40,50},{-120,50}}, color={255,0,255}));
  connect(temperature.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{91,90},{0,90},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PU138.fSetPointAutomatic, realExpression.y) annotation (Line(points={{58,-29},{50,-29},{50,50},{41,50}}, color={0,0,127}));
  connect(SV138.fTemperatureExternal, SV138.fThermalPowerExternal) annotation (Line(points={{65,48},{70.5,48},{70.5,48},{75,48}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[1], SV138.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{20,70},{20,69},{58,69}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2], PU138.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{20,70},{20,-21},{58,-21}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[3], eChiller.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{20,70},{20,11},{58,11}}, color={255,0,255}));
  connect(SV138.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,71},{65,120},{-30,120},{-30,81}}, color={255,0,255}));
  connect(PU138.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,-19},{65,-12},{-30,-12},{-30,81}}, color={255,0,255}));
  connect(eChiller.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{65,13},{65,20},{-30,20},{-30,81}}, color={255,0,255}));
  connect(eChiller.bStatusOn, bStatusOn) annotation (Line(points={{65,13},{65,20},{-30,20},{-30,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(integerExpression3.y, eChiller.nControlModeAutomatic) annotation (Line(points={{41,-10},{46,-10},{46,-3},{58,-3}}, color={255,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end eChillerSystem;
