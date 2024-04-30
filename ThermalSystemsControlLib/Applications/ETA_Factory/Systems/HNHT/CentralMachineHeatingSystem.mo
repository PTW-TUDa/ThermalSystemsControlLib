within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT;
model CentralMachineHeatingSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  Components.Pumps.Pump PU300(pumpType=1, k=0.1)
                              annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=41000,
    m_flow_nominal=0.9)  "pressure drop must be adjusted after measurement"
                                                            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,30})));
  Components.HeatMeter.HeatMeter WMZ300 annotation (Placement(transformation(extent={{60,80},{80,100}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,-70})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100)
                                                             annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Components.Consumer.PhysicalModels.IdealConsumer_VariableMassFlow consumer_Physical(
    redeclare package Medium = Medium,
    V_int=0.2,
    riseTime=900) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,0})));
  Modelica.Blocks.Interfaces.RealInput fHeatFlowRate annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));
  Components.Valves.TwoWayValve SV300(redeclare Records.RV deviceData) annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin ConsumerTemperature annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=180,
        origin={29,15})));
equation
  connect(SV300.port_a, pressureDrop.port_b) annotation (Line(points={{80,50},{80,40}}, color={0,127,255}));
  connect(pressureDrop.port_a, consumer_Physical.port_b) annotation (Line(points={{80,20},{80,10}}, color={0,127,255}));
  connect(consumer_Physical.port_a, PU300.port_b) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(SV300.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{58,65},{40,65},{40,50},{-120,50}}, color={255,0,255}));
  connect(PU300.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{58,-25},{40,-25},{40,50},{-120,50}}, color={255,0,255}));
  connect(SV300.fSetPointAutomatic, realExpression.y) annotation (Line(points={{58,61},{50,61},{50,50},{41,50}}, color={0,0,127}));
  connect(integerExpression2.y, SV300.nControlModeAutomatic) annotation (Line(points={{41,30},{52,30},{52,55},{58,55}}, color={255,127,0}));
  connect(systemFlowControl.bSetStatusOn_Components[1], SV300.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{20,70},{20,69},{58,69}}, color={255,0,255}));
  connect(PU300.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{58,-21},{20,-21},{20,70},{-19,70}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, PU300.fSetPointAutomatic) annotation (Line(points={{-59,30},{10,30},{10,-29},{58,-29}}, color={0,0,127}));
  connect(consumer_Physical.Q_flow, fHeatFlowRate) annotation (Line(points={{68,0},{30,0},{30,-70},{-120,-70}}, color={0,0,127}));
  connect(SV300.fThermalPowerExternal, PU300.fThermalPowerExternal) annotation (Line(points={{75,48},{75,4},{75,-42},{75,-42}}, color={0,0,127}));
  connect(integerExpression1.y, PU300.nControlModeAutomatic) annotation (Line(points={{41,-50},{58,-50},{58,-35}}, color={255,127,0}));
  connect(SV300.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(PU300.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,-19},{65,42},{64,42},{64,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(PU300.bStatusOn, bStatusOn) annotation (Line(points={{65,-19},{65,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(SV300.fTemperatureExternal, SV300.fThermalPowerExternal) annotation (Line(points={{65,48},{75,48}}, color={0,0,127}));
  connect(ConsumerTemperature.Kelvin, consumer_Physical.T_Consumer) annotation (Line(points={{32.6,15},{87,15},{87,11}}, color={0,0,127}));
  connect(WMZ300.port_a, SV300.port_b) annotation (Line(points={{80,80},{80,70}}, color={0,127,255}));
  connect(WMZ300.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a, port_a) annotation (Line(points={{80,-80},{80,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.port_b, PU300.port_a) annotation (Line(points={{80,-60},{80,-40}}, color={0,127,255}));
  connect(temperature.T, WMZ300.fFeedTemperature) annotation (Line(points={{91,-70},{100,-70},{100,90},{82,90}}, color={0,0,127}));
  connect(WMZ300.fHeatFlowRate, SV300.fThermalPowerExternal) annotation (Line(points={{59,90},{75,90},{75,48}}, color={0,0,127}));
  connect(PU300.fTemperatureExternal, PU300.fThermalPowerExternal) annotation (Line(points={{65,-42},{75,-42}}, color={0,0,127}));
  connect(PU300.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,-19},{70,-14},{0,-14},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CentralMachineHeatingSystem;
