within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNLT;
model InnerCapillaryTubeMatsSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatExchanger_Icon;
  Components.Pumps.Pump PU405(redeclare package Medium = Medium,
                              pumpType=6)
                              annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Components.Pumps.Pump PU500(redeclare package Medium = Medium,
                              pumpType=10)
                              annotation (Placement(transformation(extent={{40,40},{60,20}})));
  Components.HeatExchanger.PhysicalModels.HeatExchanger_Physical HeatExchanger3(
    redeclare replaceable package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    redeclare Records.PWT3_SWEP_40kW deviceData)                                                                                                                               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={70,0})));
  Components.HeatMeter.HeatMeter WMZ405(redeclare package Medium = Medium)
                                        annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Components.Valves.ThreeWayValve RV500(
    redeclare package Medium = Medium,
    k=0.01,
    yMin=0.001,                         redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Records.Belimo_R2032_S2_ThreeWay
                                                                                                                                     deviceData) annotation (Placement(transformation(extent={{40,80},{60,60}})));
  Components.Valves.TwoWayValve SV_HNLT(redeclare package Medium = Medium,
                                        redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Records.Belimo_R2032_S2
                                                                                                                            deviceData) annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-80},{80,-60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{66,20},{74,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.5)
                                                               annotation (Placement(transformation(extent={{64,-34},{72,-24}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=1) annotation (Placement(transformation(extent={{26,70},{34,80}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.015,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={20,60})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1)  annotation (Placement(transformation(extent={{66,28},{74,36}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=0.5)
                                                               annotation (Placement(transformation(extent={{26,24},{34,34}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression3(y=0) annotation (Placement(transformation(extent={{26,30},{34,40}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression4(y=0) annotation (Placement(transformation(extent={{64,-40},{72,-30}})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{60,-80},{40,-60}})));
  Modelica.Fluid.Sensors.Temperature temperature3(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,80},{80,100}})));
  Components.Consumer.PhysicalModels.Room_Heating InnerCapillaryTubeMats(
    redeclare package Medium = Medium,
    V_int=0.2,
    C_Air=4440,
    R_Building=0.002,
    R_Heater=0.0001)                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-10,-50})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[-5 + 273.15,313.15; 20 + 273.15,288.15],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Interfaces.RealInput fAmbientTemperature
                                                          annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Components.Valves.TwoWayValve SV_IFA(
    k=0.01,
    yMin=0.001,                        redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{-30,-100},{-10,-80}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression5(y=1) annotation (Placement(transformation(extent={{-54,-100},{-46,-90}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{20,-120},{40,-100}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=30000,
    m_flow_nominal=1.5)                                     annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={50,-50})));
equation
  connect(HeatExchanger3.port_a2,PU405. port_b) annotation (Line(points={{74,-10},{100,-10},{100,-20}}, color={0,127,255}));
  connect(HeatExchanger3.port_b2, SV_HNLT.port_a) annotation (Line(points={{74,10},{80,10},{80,20},{100,20}}, color={0,127,255}));
  connect(RV500.port_b,PU500. port_a) annotation (Line(points={{60,60},{60,40}}, color={0,127,255}));
  connect(bAlgorithmPermission,RV500. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(PU500.bAlgorithmPermission,RV500. bAlgorithmPermission) annotation (Line(points={{38,25},{20,25},{20,65},{38,65}}, color={255,0,255}));
  connect(SV_HNLT.bAlgorithmPermission, RV500.bAlgorithmPermission) annotation (Line(points={{78,35},{66,35},{66,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(PU405.bAlgorithmPermission,RV500. bAlgorithmPermission) annotation (Line(points={{78,-25},{66,-25},{66,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[1],RV500. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{10,70},{10,60},{36,60},{36,61},{38,61}}, color={255,0,255}));
  connect(PU500.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{38,21},{38,20},{10,20},{10,70},{-19,70}}, color={255,0,255}));
  connect(SV_HNLT.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{78,39},{10,39},{10,70},{-19,70}}, color={255,0,255}));
  connect(PU405.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{78,-21},{10,-21},{10,70},{-19,70}}, color={255,0,255}));
  connect(RV500.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{45,59},{45,81},{-30,81}}, color={255,0,255}));
  connect(PU500.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{45,19},{45,81},{-30,81}}, color={255,0,255}));
  connect(PU500.bStatusOn, bStatusOn) annotation (Line(points={{45,19},{45,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(PU500.fThermalPowerExternal, SV_HNLT.fThermalPowerExternal) annotation (Line(points={{55,42},{55,48},{95,48},{95,18}}, color={0,0,127}));
  connect(RV500.fThermalPowerExternal,PU405. fThermalPowerExternal) annotation (Line(points={{55.2,82},{56,82},{56,88},{95,88},{95,-42}}, color={0,0,127}));
  connect(integerExpression2.y, SV_HNLT.nControlModeAutomatic) annotation (Line(points={{74.4,25},{78,25}}, color={255,127,0}));
  connect(SV_HNLT.fSetPointAutomatic, realExpression2.y) annotation (Line(points={{78,31},{76,31},{76,32},{74.4,32}}, color={0,0,127}));
  connect(realExpression1.y,PU405. fSetPointAutomatic) annotation (Line(points={{72.4,-29},{75.2,-29},{75.2,-29},{78,-29}}, color={0,0,127}));
  connect(PU500.fSetPointAutomatic, realExpression3.y) annotation (Line(points={{38,29},{34.4,29}}, color={0,0,127}));
  connect(RV500.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{38,75},{34.4,75}}, color={255,127,0}));
  connect(PU500.nControlModeAutomatic, integerExpression3.y) annotation (Line(points={{38,35},{34.4,35}}, color={255,127,0}));
  connect(PU405.nControlModeAutomatic, integerExpression4.y) annotation (Line(points={{78,-35},{72.4,-35}}, color={255,127,0}));
  connect(temperature2.T,PU500. fTemperatureExternal) annotation (Line(points={{43,-70},{40,-70},{40,42},{45,42}}, color={0,0,127}));
  connect(WMZ405.port_a, SV_HNLT.port_b) annotation (Line(points={{100,60},{100,40}}, color={0,127,255}));
  connect(WMZ405.port_b, port_b) annotation (Line(points={{100,80},{100,100}}, color={0,127,255}));
  connect(WMZ405.fFeedTemperature, temperature1.T) annotation (Line(points={{102,70},{120,70},{120,-70},{83,-70}}, color={0,0,127}));
  connect(temperature1.port, port_a) annotation (Line(points={{90,-80},{100,-80},{100,-100}}, color={0,127,255}));
  connect(PU405.port_a, port_a) annotation (Line(points={{100,-40},{100,-100}}, color={0,127,255}));
  connect(WMZ405.fHeatFlowRate,PU405. fThermalPowerExternal) annotation (Line(points={{79,70},{95,70},{95,-42}}, color={0,0,127}));
  connect(temperature3.port, WMZ405.port_b) annotation (Line(points={{90,80},{100,80}}, color={0,127,255}));
  connect(temperature3.T,PU405. fTemperatureExternal) annotation (Line(points={{83,90},{85,90},{85,-42}}, color={0,0,127}));
  connect(fAmbientTemperature,combiTable1D. u[1]) annotation (Line(points={{-120,-30},{-80,-30},{-80,-20},{-62,-20}},   color={0,0,127}));
  connect(prescribedTemperature.T, fAmbientTemperature) annotation (Line(points={{-62,-50},{-92,-50},{-92,-30},{-120,-30}},
                                                                                                        color={0,0,127}));
  connect(prescribedTemperature.port, InnerCapillaryTubeMats.port_ambient) annotation (Line(points={{-40,-50},{-20.6,-50}}, color={191,0,0}));
  connect(combiTable1D.y[1], RV500.fSetPointAutomatic) annotation (Line(points={{-39,-20},{30,-20},{30,69},{38,69}}, color={0,0,127}));
  connect(InnerCapillaryTubeMats.port_a, SV_IFA.port_b) annotation (Line(points={{-10,-60},{-10,-80}}, color={0,127,255}));
  connect(SV_IFA.nControlModeAutomatic, integerExpression5.y) annotation (Line(points={{-32,-95},{-45.6,-95}}, color={255,127,0}));
  connect(selectSetPoint.fSetPoint, SV_IFA.fSetPointAutomatic) annotation (Line(points={{-59,30},{-40,30},{-40,-89},{-32,-89}}, color={0,0,127}));
  connect(SV_IFA.bAlgorithmPermission, RV500.bAlgorithmPermission) annotation (Line(points={{-32,-85},{20,-85},{20,65},{38,65}}, color={255,0,255}));
  connect(SV_IFA.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{-32,-81},{10,-81},{10,70},{-19,70}}, color={255,0,255}));
  connect(InnerCapillaryTubeMats.T_Room, selectSetPoint.fOperatingPoint) annotation (Line(points={{-3,-39},{-3,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(WMZ405.fHeatFlowRate, SV_HNLT.fThermalPowerExternal) annotation (Line(points={{79,70},{80,70},{80,48},{95,48},{95,18}}, color={0,0,127}));
  connect(RV500.fTemperatureExternal, PU500.fTemperatureExternal) annotation (Line(points={{45,82},{40,82},{40,42},{45,42}}, color={0,0,127}));
  connect(SV_IFA.fThermalPowerExternal,PU405. fThermalPowerExternal) annotation (Line(points={{-15,-102},{-15,-90},{90,-90},{90,-30},{95,-30},{95,-42}}, color={0,0,127}));
  connect(SV_HNLT.fTemperatureExternal, SV_HNLT.fThermalPowerExternal) annotation (Line(points={{85,18},{95,18}}, color={0,0,127}));
  connect(InnerCapillaryTubeMats.T_Room, SV_IFA.fTemperatureExternal) annotation (Line(points={{-3,-39},{-3,-74},{-25,-74},{-25,-102}}, color={0,0,127}));
  connect(pressureDrop.port_b, SV_IFA.port_a) annotation (Line(points={{60,-60},{60,-100},{-10,-100}}, color={0,127,255}));
  connect(boundary.ports[1], SV_IFA.port_a) annotation (Line(points={{40,-110},{60,-110},{60,-100},{-10,-100}}, color={0,127,255}));
  connect(temperature2.port, SV_IFA.port_a) annotation (Line(points={{50,-80},{60,-80},{60,-100},{-10,-100}}, color={0,127,255}));
  connect(PU500.port_b, pressureDrop.port_a) annotation (Line(points={{60,20},{60,-40}}, color={0,127,255}));
  connect(pipe2.port_b, RV500.port_a1) annotation (Line(points={{10,70},{60,70}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_b, pipe2.port_a) annotation (Line(points={{-10,-40},{-10,50},{10,50}}, color={0,127,255}));
  connect(HeatExchanger3.port_a1, pipe2.port_a) annotation (Line(points={{66,10},{66,90},{-10,90},{-10,50},{10,50}}, color={0,127,255}));
  connect(RV500.port_a,HeatExchanger3. port_b1) annotation (Line(points={{60,80},{70,80},{70,-10},{66,-10}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end InnerCapillaryTubeMatsSystem;
