within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNLT_CN;
model UnderfloorHeatingSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;

  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);

  Components.Valves.ThreeWayValve RV425(k=0.01,  redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Records.Belimo_R2032_S2_ThreeWay
                                                                                                                                              deviceData) annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Components.Pumps.Pump PU425 annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=9000,
    m_flow_nominal=1.5)                                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,60})));
  Components.HeatMeter.HeatMeter WMZ425 annotation (Placement(transformation(extent={{60,80},{80,100}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,-90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-50},{80,-30}})));
  Modelica.Blocks.Interfaces.RealInput fAmbientTemperature
                                                          annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[-5 + 273.15,313.15; 20 + 273.15,288.15],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,60})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression5(y=0) annotation (Placement(transformation(extent={{44,-40},{52,-30}})));
  Components.Valves.ThreeWayValve SV423(redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,-140},{80,-120}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{42,-140},{50,-130}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=1)
                                                             annotation (Placement(transformation(extent={{42,-136},{50,-124}})));
  Modelica.Blocks.Interfaces.BooleanInput bHeatingModeAutomatic annotation (Placement(transformation(extent={{-140,-110},{-100,-70}})));
  Components.Valves.ThreeWayValve SV1(redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,140},{80,120}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{42,130},{50,140}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1)
                                                             annotation (Placement(transformation(extent={{42,124},{50,136}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT1(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{50,90},{70,110}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Components.Consumer.PhysicalModels.Room_Heating InnerCapillaryTubeMats(
    redeclare package Medium = Medium,
    V_int=0.1,
    C_Air=2400000,
    R_Building=0.003,
    R_Heater=0.0001)                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,30})));
  Components.Valves.TwoWayValve SV(
    k=0.01,
    yMin=0.001,
    redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{60,-6},{80,14}})));
equation
   if bHeatingModeAutomatic == true then
     RV425.nControlModeAutomatic = 1;
     SV.nControlModeAutomatic = 1;
   else
     RV425.nControlModeAutomatic = 2;
     SV.nControlModeAutomatic = 2;
   end if;
  connect(bAlgorithmPermission,PU425. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,-25},{58,-25}},
                                                                                                                         color={255,0,255}));
  connect(RV425.bAlgorithmPermission,PU425. bAlgorithmPermission) annotation (Line(points={{58,-55},{20,-55},{20,-25},{58,-25}},
                                                                                                                               color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2],PU425. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,-21}},color={255,0,255}));
  connect(RV425.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-51},{40,-51},{40,70},{-19,70}}, color={255,0,255}));
  connect(realExpression.y,PU425. fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,-29},{58,-29}},
                                                                                                                 color={0,0,127}));
  connect(RV425.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-72},{65,-40},{83,-40}},          color={0,0,127}));
  connect(PU425.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,-19},{65,100},{-30,100},{-30,81}},color={255,0,255}));
  connect(fAmbientTemperature, combiTable1D.u[1]) annotation (Line(points={{-120,-60},{-100,-60},{-100,-70},{-82,-70}}, color={0,0,127}));
  connect(RV425.fSetPointAutomatic, combiTable1D.y[1]) annotation (Line(points={{58,-59},{14,-59},{14,-70},{-59,-70}}, color={0,0,127}));
  connect(WMZ425.fHeatFlowRate,RV425. fThermalPowerExternal) annotation (Line(points={{59,90},{75.2,90},{75.2,-72}},   color={0,0,127}));
  connect(WMZ425.fHeatFlowRate,PU425. fThermalPowerExternal) annotation (Line(points={{59,90},{75,90},{75,-42}},  color={0,0,127}));
  connect(RV425.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-49},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(bStatusOn,PU425. bStatusOn) annotation (Line(points={{-50,110},{-50,100},{65,100},{65,-19}},color={255,0,255}));
  connect(pressureDrop.port_b, pipe2.port_a) annotation (Line(points={{80,70},{100,70}}, color={0,127,255}));
  connect(PU425.port_a, RV425.port_b) annotation (Line(points={{80,-40},{80,-50}},color={0,127,255}));
  connect(temperature1.port, RV425.port_b) annotation (Line(points={{90,-50},{80,-50}}, color={0,127,255}));
  connect(pipe2.port_b, RV425.port_a1) annotation (Line(points={{100,50},{100,-60},{80,-60}}, color={0,127,255}));
  connect(WMZ425.port_a, pressureDrop.port_b) annotation (Line(points={{80,80},{80,70}}, color={0,127,255}));
  connect(temperature.port_b, RV425.port_a) annotation (Line(points={{80,-80},{80,-70}}, color={0,127,255}));
  connect(WMZ425.fFeedTemperature, temperature.T) annotation (Line(points={{82,90},{96,90},{96,-90},{91,-90}}, color={0,0,127}));
  connect(PU425.fTemperatureExternal, PU425.fThermalPowerExternal) annotation (Line(points={{65,-42},{75,-42}},               color={0,0,127}));
  connect(temperature.port_a, SV423.port_b) annotation (Line(points={{80,-100},{80,-120}}, color={0,127,255}));
  connect(SV423.port_a, port_a_HNLT) annotation (Line(points={{80,-140},{100,-140},{100,-100}}, color={0,127,255}));
  connect(port_a_CN, SV423.port_a1) annotation (Line(points={{60,-100},{60,-130},{80,-130}}, color={0,127,255}));
  connect(SV423.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{58,-135},{50.4,-135}}, color={255,127,0}));
  connect(SV423.fSetPointAutomatic, realExpression1.y) annotation (Line(points={{58,-129},{54,-129},{54,-130},{50.4,-130}}, color={0,0,127}));
  connect(SV423.bAlgorithmPermission, PU425.bAlgorithmPermission) annotation (Line(points={{58,-125},{20,-125},{20,-25},{58,-25}}, color={255,0,255}));
  connect(SV423.bSetStatusOnAutomatic, bHeatingModeAutomatic) annotation (Line(points={{58,-121},{40,-121},{40,-90},{-120,-90}}, color={255,0,255}));
  connect(temperature.T, SV423.fThermalPowerExternal) annotation (Line(points={{91,-90},{96,-90},{96,-142},{75.2,-142}}, color={0,0,127}));
  connect(temperature.T, SV423.fTemperatureExternal) annotation (Line(points={{91,-90},{96,-90},{96,-142},{65,-142}}, color={0,0,127}));
  connect(SV1.nControlModeAutomatic, integerExpression2.y) annotation (Line(points={{58,135},{58,136},{50.4,136},{50.4,135}}, color={255,127,0}));
  connect(SV1.fSetPointAutomatic, realExpression2.y) annotation (Line(points={{58,129},{54,129},{54,130},{50.4,130}}, color={0,0,127}));
  connect(SV1.port_b, WMZ425.port_b) annotation (Line(points={{80,120},{80,100}}, color={0,127,255}));
  connect(SV1.port_a, port_b_HNLT) annotation (Line(points={{80,140},{100,140},{100,100}}, color={0,127,255}));
  connect(SV1.port_a1, port_b_HNLT1) annotation (Line(points={{80,130},{60,130},{60,100}}, color={0,127,255}));
  connect(SV1.fThermalPowerExternal, temperature.T) annotation (Line(points={{75.2,142},{76,142},{76,134},{96,134},{96,-90},{91,-90}}, color={0,0,127}));
  connect(SV1.fTemperatureExternal, temperature.T) annotation (Line(points={{65,142},{66,142},{66,134},{96,134},{96,-90},{91,-90}}, color={0,0,127}));
  connect(SV1.bAlgorithmPermission, PU425.bAlgorithmPermission) annotation (Line(points={{58,125},{20,125},{20,-25},{58,-25}}, color={255,0,255}));
  connect(SV1.bSetStatusOnAutomatic, bHeatingModeAutomatic) annotation (Line(points={{58,121},{34,121},{34,120},{10,120},{10,-90},{-120,-90}}, color={255,0,255}));
  connect(prescribedTemperature.T, fAmbientTemperature) annotation (Line(points={{-82,-30},{-100,-30},{-100,-60},{-120,-60}}, color={0,0,127}));
  connect(InnerCapillaryTubeMats.port_b, pressureDrop.port_a) annotation (Line(points={{80,40},{80,50}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_ambient, prescribedTemperature.port) annotation (Line(points={{69.4,30},{-10,30},{-10,-30},{-60,-30}}, color={191,0,0}));
  connect(InnerCapillaryTubeMats.T_Room, selectSetPoint.fOperatingPoint) annotation (Line(points={{87,41},{87,40},{0,40},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(InnerCapillaryTubeMats.port_a, SV.port_b) annotation (Line(points={{80,20},{80,14}}, color={0,127,255}));
  connect(SV.port_a, PU425.port_b) annotation (Line(points={{80,-6},{80,-20}}, color={0,127,255}));
  connect(selectSetPoint.fSetPoint, SV.fSetPointAutomatic) annotation (Line(points={{-59,30},{-20,30},{-20,5},{58,5}}, color={0,0,127}));
  connect(SV.bAlgorithmPermission, PU425.bAlgorithmPermission) annotation (Line(points={{58,9},{20,9},{20,-25},{58,-25}}, color={255,0,255}));
  connect(SV.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,13},{40,13},{40,70},{-19,70}}, color={255,0,255}));
  connect(SV.fThermalPowerExternal, RV425.fThermalPowerExternal) annotation (Line(points={{75,-8},{75.2,-8},{75.2,-72}}, color={0,0,127}));
  connect(integerExpression5.y, PU425.nControlModeAutomatic) annotation (Line(points={{52.4,-35},{58,-35}}, color={255,127,0}));
  connect(SV.fTemperatureExternal, selectSetPoint.fOperatingPoint) annotation (Line(points={{65,-8},{70,-8},{70,40},{0,40},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end UnderfloorHeatingSystem;
