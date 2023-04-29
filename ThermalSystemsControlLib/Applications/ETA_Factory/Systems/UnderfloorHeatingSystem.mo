within ThermalSystemsControlLib.Applications.ETA_Factory.Systems;
model UnderfloorHeatingSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  Components.Valves.ThreeWayValve RV425(k=0.05,  redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2020_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pumps.Pump PU425 annotation (Placement(transformation(extent={{60,-6},{80,14}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=9000,
    m_flow_nominal=1.5)                                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,60})));
  Components.HeatMeter.HeatMeter WMZ425 annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=1) annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Components.Consumer.PhysicalModels.Consumer_Physical consumer_Physical(redeclare package Medium = Medium,
    V_int=0.5,
    riseTime=1800)                                                                                          annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,30})));
  Modelica.Blocks.Interfaces.RealInput fAmbientTemperature
                                                          annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[-10 + 273.15,313.15; 30 + 273.15,293.15],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Interfaces.RealInput fHeatFlowRate annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,60})));
equation
  connect(RV425.port_a,WMZ425. port_b) annotation (Line(points={{80,-40},{80,-50}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.T,WMZ425. fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-60},{82,-60}}, color={0,0,127}));
  connect(bAlgorithmPermission,PU425. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,9},{58,9}},   color={255,0,255}));
  connect(RV425.bAlgorithmPermission,PU425. bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,9},{58,9}},   color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2],PU425. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,13}}, color={255,0,255}));
  connect(RV425.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(realExpression.y,PU425. fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,5},{58,5}},   color={0,0,127}));
  connect(integerExpression2.y,RV425. nControlModeAutomatic) annotation (Line(points={{41,30},{52,30},{52,-36},{56,-36},{56,-35},{58,-35}},  color={255,127,0}));
  connect(temperature1.port,RV425. port_b) annotation (Line(points={{90,-20},{80,-20}}, color={0,127,255}));
  connect(RV425.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-42},{65,-26},{83,-26},{83,-10}}, color={0,0,127}));
  connect(PU425.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,15},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(WMZ425.port_a, port_a) annotation (Line(points={{80,-70},{80,-100},{100,-100}}, color={0,127,255}));
  connect(consumer_Physical.port_b, pressureDrop.port_a) annotation (Line(points={{80,40},{80,50}}, color={0,127,255}));
  connect(fAmbientTemperature, combiTable1D.u[1]) annotation (Line(points={{-120,-30},{-102,-30},{-102,-50},{-82,-50}}, color={0,0,127}));
  connect(RV425.fSetPointAutomatic, combiTable1D.y[1]) annotation (Line(points={{58,-29},{14,-29},{14,-50},{-59,-50}}, color={0,0,127}));
  connect(PU425.nControlModeAutomatic,RV425. nControlModeAutomatic) annotation (Line(points={{58,-1},{56,-1},{56,56},{52,56},{52,-36},{56,-36},{56,-35},{58,-35}}, color={255,127,0}));
  connect(consumer_Physical.Q_flow, fHeatFlowRate) annotation (Line(points={{68,30},{18,30},{18,-70},{-120,-70}}, color={0,0,127}));
  connect(WMZ425.fHeatFlowRate,RV425. fThermalPowerExternal) annotation (Line(points={{59,-60},{75.2,-60},{75.2,-42}}, color={0,0,127}));
  connect(WMZ425.fHeatFlowRate,PU425. fThermalPowerExternal) annotation (Line(points={{59,-60},{70,-60},{70,-8}}, color={0,0,127}));
  connect(RV425.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-19},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(bStatusOn,PU425. bStatusOn) annotation (Line(points={{-50,110},{-50,100},{65,100},{65,15}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{-59,30},{0,30},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(RV425.port_a1, pipe2.port_b) annotation (Line(points={{80,-30},{100,-30},{100,50}}, color={0,127,255}));
  connect(temperature.port_a, pressureDrop.port_b) annotation (Line(points={{80,80},{80,70}}, color={0,127,255}));
  connect(consumer_Physical.port_a, PU425.port_b) annotation (Line(points={{80,20},{80,14}}, color={0,127,255}));
  connect(PU425.port_a, RV425.port_b) annotation (Line(points={{80,-6},{80,-20}}, color={0,127,255}));
  connect(pipe2.port_a, pressureDrop.port_b) annotation (Line(points={{100,70},{80,70}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end UnderfloorHeatingSystem;
