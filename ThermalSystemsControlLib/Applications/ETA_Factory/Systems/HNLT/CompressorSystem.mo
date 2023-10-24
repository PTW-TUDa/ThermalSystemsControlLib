within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNLT;
model CompressorSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  Components.Valves.ThreeWayValve RV251(
    k=0.1,
    yMin=0.1,                                    redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pumps.Pump PU251 annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=10000,
    m_flow_nominal=0.12)                                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,30})));
  Components.HeatMeter.HeatMeter WMZ251 annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=0.7)
                                                             annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=2) annotation (Placement(transformation(extent={{40,-46},{52,-28}})));
  Components.Consumer.PhysicalModels.Consumer_Physical Compressor(
    redeclare package Medium = Medium,
    V_int=0.05,
    riseTime=300) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,0})));
  Modelica.Blocks.Interfaces.RealInput fHeatFlowRate annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,30})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{40,46},{52,64}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
equation
  connect(RV251.port_a,WMZ251. port_b) annotation (Line(points={{80,-40},{80,-50}}, color={0,127,255}));
  connect(PU251.port_a, pressureDrop.port_b) annotation (Line(points={{80,50},{80,40}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a,PU251. port_b) annotation (Line(points={{80,80},{80,80},{80,70}}, color={0,127,255}));
  connect(temperature.T,WMZ251. fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-60},{82,-60}}, color={0,0,127}));
  connect(bAlgorithmPermission,PU251. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(RV251.bAlgorithmPermission,PU251. bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,65},{58,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2],PU251. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,69}}, color={255,0,255}));
  connect(RV251.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(realExpression.y,PU251. fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,61},{58,61}}, color={0,0,127}));
  connect(integerExpression2.y,RV251. nControlModeAutomatic) annotation (Line(points={{52.6,-37},{52,-37},{52,-36},{56,-36},{56,-35},{58,-35}},
                                                                                                                                             color={255,127,0}));
  connect(PU251.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(WMZ251.port_a, port_a) annotation (Line(points={{80,-70},{80,-100},{100,-100}}, color={0,127,255}));
  connect(Compressor.port_a, RV251.port_b) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(Compressor.port_b, pressureDrop.port_a) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(WMZ251.fHeatFlowRate,RV251. fThermalPowerExternal) annotation (Line(points={{59,-60},{75.2,-60},{75.2,-42}}, color={0,0,127}));
  connect(WMZ251.fHeatFlowRate,PU251. fThermalPowerExternal) annotation (Line(points={{59,-60},{75,-60},{75,48}}, color={0,0,127}));
  connect(RV251.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-19},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(bStatusOn,PU251. bStatusOn) annotation (Line(points={{-50,110},{-50,100},{65,100},{65,71}}, color={255,0,255}));
  connect(RV251.port_a1, pipe2.port_b) annotation (Line(points={{80,-30},{100,-30},{100,20}}, color={0,127,255}));
  connect(pipe2.port_a,PU251. port_b) annotation (Line(points={{100,40},{100,70},{80,70}}, color={0,127,255}));
  connect(temperature.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{91,90},{96,90},{96,96},{0,96},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(selectSetPoint.fSetPoint,RV251. fSetPointAutomatic) annotation (Line(points={{-59,30},{10,30},{10,-29},{58,-29}}, color={0,0,127}));
  connect(PU251.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{58,55},{52.6,55}}, color={255,127,0}));
  connect(temperature1.port,RV251. port_b) annotation (Line(points={{90,-20},{80,-20}}, color={0,127,255}));
  connect(temperature1.T,PU251. fTemperatureExternal) annotation (Line(points={{83,-10},{65,-10},{65,48}}, color={0,0,127}));
  connect(Compressor.Q_flow, fHeatFlowRate) annotation (Line(points={{68,0},{26,0},{26,-30},{-120,-30}}, color={0,0,127}));
  connect(temperature.T, RV251.fTemperatureExternal) annotation (Line(points={{91,90},{65,90},{65,-42}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompressorSystem;
