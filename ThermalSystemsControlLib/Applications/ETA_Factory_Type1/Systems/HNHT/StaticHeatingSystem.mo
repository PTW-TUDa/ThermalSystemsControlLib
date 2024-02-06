within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT;
model StaticHeatingSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  Components.Valves.ThreeWayValve RV350(         redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Records.Belimo_R2032_S2_ThreeWay
                                                                                                                                              deviceData) annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Components.Pumps.Pump PU350 annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=41000,
    m_flow_nominal=0.15)                                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,30})));
  Components.HeatMeter.HeatMeter WMZ350 annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=1) annotation (Placement(transformation(extent={{40,-74},{52,-56}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Modelica.Blocks.Interfaces.RealInput fAmbientTemperature
                                                          annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[-10 + 273.15,343.15; 10 + 273.15,323.15],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,30})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{40,46},{52,64}})));
  Components.Consumer.PhysicalModels.Room_Heating InnerCapillaryTubeMats(
    redeclare package Medium = Medium,
    V_int=0.05,
    C_Air=1200000,
    R_Building=0.003,
    R_Heater=0.0001)                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,0})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Components.Valves.TwoWayValve SV(
    k=0.01,
    yMin=0.001,
    redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
equation
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a,PU350. port_b) annotation (Line(points={{80,80},{80,80},{80,70}}, color={0,127,255}));
  connect(temperature.T,WMZ350. fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-90},{82,-90}}, color={0,0,127}));
  connect(bAlgorithmPermission,PU350. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(RV350.bAlgorithmPermission,PU350. bAlgorithmPermission) annotation (Line(points={{58,-55},{20,-55},{20,65},{58,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2],PU350. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,69}}, color={255,0,255}));
  connect(RV350.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-51},{40,-51},{40,70},{-19,70}}, color={255,0,255}));
  connect(realExpression.y,PU350. fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,61},{58,61}}, color={0,0,127}));
  connect(integerExpression2.y,RV350. nControlModeAutomatic) annotation (Line(points={{52.6,-65},{52,-65},{52,-66},{56,-66},{56,-65},{58,-65}},
                                                                                                                                             color={255,127,0}));
  connect(RV350.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-72},{65,-56},{83,-56},{83,-10}}, color={0,0,127}));
  connect(PU350.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(fAmbientTemperature, combiTable1D.u[1]) annotation (Line(points={{-120,-30},{-102,-30},{-102,-50},{-82,-50}}, color={0,0,127}));
  connect(RV350.fSetPointAutomatic, combiTable1D.y[1]) annotation (Line(points={{58,-59},{14,-59},{14,-50},{-59,-50}}, color={0,0,127}));
  connect(WMZ350.fHeatFlowRate, RV350.fThermalPowerExternal) annotation (Line(points={{59,-90},{75.2,-90},{75.2,-72}}, color={0,0,127}));
  connect(WMZ350.fHeatFlowRate, PU350.fThermalPowerExternal) annotation (Line(points={{59,-90},{75,-90},{75,48}}, color={0,0,127}));
  connect(RV350.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-49},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(bStatusOn, PU350.bStatusOn) annotation (Line(points={{-50,110},{-50,100},{65,100},{65,71}}, color={255,0,255}));
  connect(pipe2.port_a, PU350.port_b) annotation (Line(points={{100,40},{100,70},{80,70}}, color={0,127,255}));
  connect(PU350.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,48},{64,48},{64,60},{83,60},{83,-10}}, color={0,0,127}));
  connect(PU350.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{58,55},{52.6,55}}, color={255,127,0}));
  connect(WMZ350.port_a, port_a) annotation (Line(points={{80,-100},{100,-100}},          color={0,127,255}));
  connect(WMZ350.port_b, RV350.port_a) annotation (Line(points={{80,-80},{80,-70}}, color={0,127,255}));
  connect(RV350.port_b, temperature1.port) annotation (Line(points={{80,-50},{86,-50},{86,-20},{90,-20}},
                                                                                        color={0,127,255}));
  connect(RV350.port_a1, pipe2.port_b) annotation (Line(points={{80,-60},{100,-60},{100,20}}, color={0,127,255}));
  connect(PU350.port_a, pressureDrop.port_b) annotation (Line(points={{80,50},{80,40}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_b, pressureDrop.port_a) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(fAmbientTemperature, prescribedTemperature.T) annotation (Line(points={{-120,-30},{-100,-30},{-100,-20},{-82,-20}}, color={0,0,127}));
  connect(prescribedTemperature.port, InnerCapillaryTubeMats.port_ambient) annotation (Line(points={{-60,-20},{10,-20},{10,1.9984e-15},{69.4,1.9984e-15}}, color={191,0,0}));
  connect(InnerCapillaryTubeMats.port_a, SV.port_b) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(SV.port_a, RV350.port_b) annotation (Line(points={{80,-40},{80,-50}}, color={0,127,255}));
  connect(SV.fThermalPowerExternal, PU350.fThermalPowerExternal) annotation (Line(points={{75,-42},{75,48}}, color={0,0,127}));
  connect(SV.bAlgorithmPermission, PU350.bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,65},{58,65}}, color={255,0,255}));
  connect(SV.nControlModeAutomatic, integerExpression2.y) annotation (Line(points={{58,-35},{52.6,-35},{52.6,-65}}, color={255,127,0}));
  connect(SV.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, SV.fSetPointAutomatic) annotation (Line(points={{-59,30},{16,30},{16,-29},{58,-29}}, color={0,0,127}));
  connect(InnerCapillaryTubeMats.T_Room, selectSetPoint.fOperatingPoint) annotation (Line(points={{87,11},{87,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(SV.fTemperatureExternal, InnerCapillaryTubeMats.T_Room) annotation (Line(points={{65,-42},{64,-42},{64,20},{86,20},{86,11},{87,11}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end StaticHeatingSystem;
