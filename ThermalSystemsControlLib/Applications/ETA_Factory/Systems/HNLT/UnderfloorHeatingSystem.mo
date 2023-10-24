within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNLT;
model UnderfloorHeatingSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  Components.Valves.ThreeWayValve RV425(k=0.01,  redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
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
                                                          annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
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
  Components.Consumer.PhysicalModels.Room_Heating UnderFloorHeating(
    redeclare package Medium = Medium,
    V_int=0.1,
    C_Air=2400,
    R_Building=0.003,
    R_Heater=0.0001)
                    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,30})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Components.Valves.TwoWayValve SV_UnderfloorHeating(k=0.1, redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression5(y=1) annotation (Placement(transformation(extent={{26,-10},{34,0}})));
equation
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
  connect(fAmbientTemperature, combiTable1D.u[1]) annotation (Line(points={{-120,-30},{-102,-30},{-102,-70},{-82,-70}}, color={0,0,127}));
  connect(RV425.fSetPointAutomatic, combiTable1D.y[1]) annotation (Line(points={{58,-59},{14,-59},{14,-70},{-59,-70}}, color={0,0,127}));
  connect(PU425.nControlModeAutomatic,RV425. nControlModeAutomatic) annotation (Line(points={{58,-35},{44,-35},{44,-65},{58,-65}},                                 color={255,127,0}));
  connect(WMZ425.fHeatFlowRate,RV425. fThermalPowerExternal) annotation (Line(points={{59,90},{75.2,90},{75.2,-72}},   color={0,0,127}));
  connect(WMZ425.fHeatFlowRate,PU425. fThermalPowerExternal) annotation (Line(points={{59,90},{75,90},{75,-42}},  color={0,0,127}));
  connect(RV425.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-49},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(bStatusOn,PU425. bStatusOn) annotation (Line(points={{-50,110},{-50,100},{65,100},{65,-19}},color={255,0,255}));
  connect(selectSetPoint.fSetPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{-59,30},{0,30},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(prescribedTemperature.T, fAmbientTemperature) annotation (Line(points={{-82,-30},{-120,-30}}, color={0,0,127}));
  connect(prescribedTemperature.port, UnderFloorHeating.port_ambient) annotation (Line(points={{-60,-30},{8,-30},{8,30},{69.4,30}}, color={191,0,0}));
  connect(pressureDrop.port_b, pipe2.port_a) annotation (Line(points={{80,70},{100,70}}, color={0,127,255}));
  connect(pressureDrop.port_a, UnderFloorHeating.port_b) annotation (Line(points={{80,50},{80,40}}, color={0,127,255}));
  connect(PU425.port_a, RV425.port_b) annotation (Line(points={{80,-40},{80,-50}},color={0,127,255}));
  connect(temperature1.port, RV425.port_b) annotation (Line(points={{90,-50},{80,-50}}, color={0,127,255}));
  connect(pipe2.port_b, RV425.port_a1) annotation (Line(points={{100,50},{100,-60},{80,-60}}, color={0,127,255}));
  connect(WMZ425.port_a, pressureDrop.port_b) annotation (Line(points={{80,80},{80,70}}, color={0,127,255}));
  connect(WMZ425.port_b, port_b) annotation (Line(points={{80,100},{90,100},{90,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a, port_a) annotation (Line(points={{80,-100},{100,-100}},          color={0,127,255}));
  connect(temperature.port_b, RV425.port_a) annotation (Line(points={{80,-80},{80,-70}}, color={0,127,255}));
  connect(WMZ425.fFeedTemperature, temperature.T) annotation (Line(points={{82,90},{96,90},{96,-90},{91,-90}}, color={0,0,127}));
  connect(PU425.fTemperatureExternal, PU425.fThermalPowerExternal) annotation (Line(points={{65,-42},{75,-42}},               color={0,0,127}));
  connect(SV_UnderfloorHeating.nControlModeAutomatic, integerExpression5.y) annotation (Line(points={{58,-5},{34.4,-5}}, color={255,127,0}));
  connect(integerExpression5.y, RV425.nControlModeAutomatic) annotation (Line(points={{34.4,-5},{44,-5},{44,-65},{58,-65}}, color={255,127,0}));
  connect(SV_UnderfloorHeating.fSetPointAutomatic, selectSetPoint.fOperatingPoint) annotation (Line(points={{58,1},{0,1},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(SV_UnderfloorHeating.bAlgorithmPermission, PU425.bAlgorithmPermission) annotation (Line(points={{58,5},{20,5},{20,-25},{58,-25}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[1], SV_UnderfloorHeating.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{30,70},{30,9},{58,9}}, color={255,0,255}));
  connect(SV_UnderfloorHeating.fTemperatureExternal, UnderFloorHeating.T_Room) annotation (Line(points={{65,-12},{70,-12},{70,26},{87,26},{87,41}}, color={0,0,127}));
  connect(SV_UnderfloorHeating.port_b, UnderFloorHeating.port_a) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(SV_UnderfloorHeating.port_a, PU425.port_b) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(WMZ425.fHeatFlowRate, SV_UnderfloorHeating.fThermalPowerExternal) annotation (Line(points={{59,90},{75,90},{75,-12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end UnderfloorHeatingSystem;
