within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.CN;
model CentralMachineCoolingSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  Components.Pumps.Pump PU100(pumpType=8, k=0.2)
                              annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=41000,
    m_flow_nominal=0.15) "pressure drop must be adjusted after measurement"
                                                            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,30})));
  Components.HeatMeter.HeatMeter WMZ100 annotation (Placement(transformation(extent={{60,80},{80,100}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,-70})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100)
                                                             annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Components.Consumer.PhysicalModels.IdealConsumer_VariableMassFlow CentralMachineCooling(
    redeclare package Medium = Medium,
    V_int=0.2,
    riseTime=900) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,0})));
  Modelica.Blocks.Interfaces.RealInput fHeatFlowRate annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));
  Components.Valves.TwoWayValve SV100(redeclare Records.RV deviceData) annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin annotation (Placement(transformation(extent={{-3,-3},{3,3}},
        rotation=180,
        origin={51,17})));
equation
  connect(temperature.T,WMZ100. fFeedTemperature) annotation (Line(points={{91,-70},{96,-70},{96,90},{82,90}}, color={0,0,127}));
  connect(WMZ100.fHeatFlowRate,PU100. fThermalPowerExternal) annotation (Line(points={{59,90},{75,90},{75,-42}},  color={0,0,127}));
  connect(SV100.port_a, pressureDrop.port_b) annotation (Line(points={{80,50},{80,40}}, color={0,127,255}));
  connect(pressureDrop.port_a, CentralMachineCooling.port_b) annotation (Line(points={{80,20},{80,10}}, color={0,127,255}));
  connect(CentralMachineCooling.port_a, PU100.port_b) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(SV100.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{58,65},{40,65},{40,50},{-120,50}}, color={255,0,255}));
  connect(PU100.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{58,-25},{40,-25},{40,50},{-120,50}}, color={255,0,255}));
  connect(SV100.fSetPointAutomatic, realExpression.y) annotation (Line(points={{58,61},{50,61},{50,50},{41,50}}, color={0,0,127}));
  connect(integerExpression2.y,SV100. nControlModeAutomatic) annotation (Line(points={{41,30},{52,30},{52,55},{58,55}}, color={255,127,0}));
  connect(systemFlowControl.bSetStatusOn_Components[1],SV100. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{20,70},{20,69},{58,69}}, color={255,0,255}));
  connect(PU100.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{58,-21},{20,-21},{20,70},{-19,70}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint,PU100. fSetPointAutomatic) annotation (Line(points={{-59,30},{10,30},{10,-29},{58,-29}}, color={0,0,127}));
  connect(CentralMachineCooling.Q_flow, fHeatFlowRate) annotation (Line(points={{68,0},{30,0},{30,-70},{-120,-70}}, color={0,0,127}));
  connect(SV100.fThermalPowerExternal,PU100. fThermalPowerExternal) annotation (Line(points={{75,48},{75,4},{75,-42},{75,-42}}, color={0,0,127}));
  connect(PU100.fTemperatureExternal,WMZ100. fFeedTemperature) annotation (Line(points={{65,-42},{65,-50},{96,-50},{96,90},{82,90}},   color={0,0,127}));
  connect(integerExpression1.y,PU100. nControlModeAutomatic) annotation (Line(points={{41,-50},{58,-50},{58,-35}}, color={255,127,0}));
  connect(SV100.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(PU100.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,-19},{65,42},{64,42},{64,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(PU100.bStatusOn, bStatusOn) annotation (Line(points={{65,-19},{65,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(SV100.fTemperatureExternal, SV100.fThermalPowerExternal) annotation (Line(points={{65,48},{75,48}}, color={0,0,127}));
  connect(WMZ100.port_a, SV100.port_b) annotation (Line(points={{80,80},{80,70}}, color={0,127,255}));
  connect(WMZ100.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a, port_a) annotation (Line(points={{80,-80},{80,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.port_b, PU100.port_a) annotation (Line(points={{80,-60},{80,-40}}, color={0,127,255}));
  connect(fromKelvin.Kelvin, CentralMachineCooling.T_Consumer) annotation (Line(points={{54.6,17},{87,17},{87,11}}, color={0,0,127}));
  connect(fromKelvin.Celsius, selectSetPoint.fOperatingPoint) annotation (Line(points={{47.7,17},{0,17},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CentralMachineCoolingSystem;
