within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT_HNLT;
model HeatPumpSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  Components.Pumps.Pump PU_int(pumpType=1) annotation (Placement(transformation(extent={{140,-40},{160,-20}})));
  Components.HeatExchanger.PhysicalModels.HeatExchanger_Physical hex(
    redeclare replaceable package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    redeclare Records.PWT_WP_Reflex_Longtherm_RMB_14_30 deviceData) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={70,0})));
  Components.HeatMeter.HeatMeter WMZ342 annotation (Placement(transformation(extent={{140,-80},{160,-60}})));
  Components.Valves.ThreeWayValve RV342(k=0.1,
                                        redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Records.Belimo_R2032_S2_ThreeWay
                                                                                                                                     deviceData) annotation (Placement(transformation(extent={{140,80},{160,60}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=5)  annotation (Placement(transformation(extent={{26,24},{34,34}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=1) annotation (Placement(transformation(extent={{20,80},{28,90}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={170,0})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression4(y=0) annotation (Placement(transformation(extent={{24,-70},{32,-60}})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{160,80},{180,100}})));
  Components.CompressionChiller.CompressionChiller HeatPump(
    redeclare package Medium = Medium1,
    redeclare package Medium1 = Medium2,
    k=0.1,
    redeclare Records.ViessmannVitocal200G deviceData) annotation (Placement(transformation(extent={{120,10},{140,-10}})));
  Components.Pumps.Pump PU_int2(pumpType=2) annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Components.Valves.ThreeWayValve RV242(
    k=0.1,
    yMin=0.2,
    redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={50,80})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{100,40},{120,60}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(dp_nominal=65000, m_flow_nominal=0.83)
                                                                                                 annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={120,30})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop1(dp_nominal=45000, m_flow_nominal=0.55)
                                                                                                 annotation (Placement(transformation(extent={{140,20},{160,40}})));
  Components.Pumps.Pump PU242(pumpType=2) annotation (Placement(transformation(extent={{40,40},{60,20}})));
  Components.Valves.TwoWayValve SV_int(redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{40,-60},{60,-80}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1)  annotation (Placement(transformation(extent={{64,26},{72,36}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1)  annotation (Placement(transformation(extent={{126,-34},{134,-24}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=1)  annotation (Placement(transformation(extent={{24,-76},{32,-66}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=1)  annotation (Placement(transformation(extent={{124,64},{132,74}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=293.15)
                                                               annotation (Placement(transformation(extent={{20,74},{28,84}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{126,-40},{134,-30}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression3(y=0) annotation (Placement(transformation(extent={{64,20},{72,30}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression5(y=3) annotation (Placement(transformation(extent={{26,30},{34,40}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression6(y=0) annotation (Placement(transformation(extent={{124,70},{132,80}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression7(y=1) annotation (Placement(transformation(extent={{108,0},{116,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{80,-50},{100,-30}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop2(dp_nominal=65000, m_flow_nominal=0.83)
                                                                                                 annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={82,60})));
equation
  connect(RV342.port_a1, pipe2.port_b) annotation (Line(points={{160,70},{180,70},{180,10}}, color={0,127,255}));
  connect(PU_int.port_b, HeatPump.port_a1) annotation (Line(points={{160,-20},{160,-4},{140.2,-4}}, color={0,127,255}));
  connect(pipe2.port_a, PU_int.port_a) annotation (Line(points={{180,-10},{180,-40},{160,-40}}, color={0,127,255}));
  connect(WMZ342.port_a, port_a2) annotation (Line(points={{160,-80},{160,-100},{100,-100}}, color={0,127,255}));
  connect(WMZ342.port_b, PU_int.port_a) annotation (Line(points={{160,-60},{160,-40}}, color={0,127,255}));
  connect(RV342.port_a, port_b2) annotation (Line(points={{160,80},{160,100},{100,100}}, color={0,127,255}));
  connect(temperature2.port, port_b2) annotation (Line(points={{170,80},{160,80},{160,100},{100,100}}, color={0,127,255}));
  connect(temperature2.T,WMZ342. fFeedTemperature) annotation (Line(points={{177,90},{200,90},{200,-70},{162,-70}}, color={0,0,127}));
  connect(RV342.fTemperatureExternal, temperature2.T) annotation (Line(points={{145,82},{145,90},{177,90}}, color={0,0,127}));
  connect(PU_int.fTemperatureExternal,RV342. fTemperatureExternal) annotation (Line(points={{145,-42},{145,82}}, color={0,0,127}));
  connect(WMZ342.fHeatFlowRate, PU_int.fThermalPowerExternal) annotation (Line(points={{139,-70},{155,-70},{155,-42}}, color={0,0,127}));
  connect(RV342.fThermalPowerExternal, PU_int.fThermalPowerExternal) annotation (Line(points={{155.2,82},{155,82},{155,-42}}, color={0,0,127}));
  connect(hex.port_b2,PU_int2. port_a) annotation (Line(points={{74,10},{74,20},{100,20}},  color={0,127,255}));
  connect(temperature2.port,RV342. port_a) annotation (Line(points={{170,80},{160,80}}, color={0,127,255}));
  connect(RV342.port_b, pressureDrop1.port_b) annotation (Line(points={{160,60},{160,40}}, color={0,127,255}));
  connect(pressureDrop1.port_a, HeatPump.port_b1) annotation (Line(points={{160,20},{160,4},{140,4}}, color={0,127,255}));
  connect(PU242.port_b, hex.port_a1) annotation (Line(points={{60,20},{66,20},{66,10}}, color={0,127,255}));
  connect(SV_int.port_a, hex.port_b1) annotation (Line(points={{60,-60},{60,-20},{66,-20},{66,-10}}, color={0,127,255}));
  connect(SV_int.port_b, port_b1) annotation (Line(points={{60,-80},{60,-100}}, color={0,127,255}));
  connect(HeatPump.fSetPointAutomatic, selectSetPoint.fSetPoint) annotation (Line(points={{118,-1},{4,-1},{4,30},{-59,30}}, color={0,0,127}));
  connect(bAlgorithmPermission, SV_int.bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,-75},{38,-75}}, color={255,0,255}));
  connect(PU_int.bAlgorithmPermission, SV_int.bAlgorithmPermission) annotation (Line(points={{138,-25},{20,-25},{20,-75},{38,-75}}, color={255,0,255}));
  connect(HeatPump.bAlgorithmPermission, SV_int.bAlgorithmPermission) annotation (Line(points={{118,-5},{20,-5},{20,-75},{38,-75}}, color={255,0,255}));
  connect(PU_int2.bAlgorithmPermission, SV_int.bAlgorithmPermission) annotation (Line(points={{78,35},{20,35},{20,-75},{38,-75}}, color={255,0,255}));
  connect(PU242.bAlgorithmPermission, SV_int.bAlgorithmPermission) annotation (Line(points={{38,25},{20,25},{20,-75},{38,-75}}, color={255,0,255}));
  connect(RV342.bAlgorithmPermission, SV_int.bAlgorithmPermission) annotation (Line(points={{138,65},{20,65},{20,-75},{38,-75}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2], PU242.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{28,70},{28,21},{38,21}}, color={255,0,255}));
  connect(RV342.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{138,61},{28,61},{28,70},{-19,70}}, color={255,0,255}));
  connect(PU_int2.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{78,39},{28,39},{28,70},{-19,70}}, color={255,0,255}));
  connect(HeatPump.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{118,-9},{28,-9},{28,70},{-19,70}}, color={255,0,255}));
  connect(SV_int.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{38,-79},{28,-79},{28,70},{-19,70}}, color={255,0,255}));
  connect(PU_int.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{138,-21},{28,-21},{28,70},{-19,70}}, color={255,0,255}));
  connect(SV_int.fThermalPowerExternal,WMZ342. fHeatFlowRate) annotation (Line(points={{55,-58},{55,-70},{139,-70}}, color={0,0,127}));
  connect(PU242.fTemperatureExternal, WMZ342.fHeatFlowRate) annotation (Line(points={{45,42},{50,42},{50,-70},{139,-70}}, color={0,0,127}));
  connect(PU242.fThermalPowerExternal, WMZ342.fHeatFlowRate) annotation (Line(points={{55,42},{50,42},{50,-70},{139,-70}}, color={0,0,127}));
  connect(PU_int2.fTemperatureExternal, temperature1.T) annotation (Line(points={{85,18},{88,18},{88,28},{110,28},{110,50},{117,50}}, color={0,0,127}));
  connect(PU_int2.fThermalPowerExternal, temperature1.T) annotation (Line(points={{95,18},{96,18},{96,28},{110,28},{110,50},{117,50}}, color={0,0,127}));
  connect(PU242.fSetPointAutomatic, realExpression1.y) annotation (Line(points={{38,29},{34.4,29}}, color={0,0,127}));
  connect(PU_int2.fSetPointAutomatic, realExpression2.y) annotation (Line(points={{78,31},{72.4,31}}, color={0,0,127}));
  connect(PU_int.fSetPointAutomatic, realExpression3.y) annotation (Line(points={{138,-29},{134.4,-29}}, color={0,0,127}));
  connect(SV_int.fSetPointAutomatic, realExpression4.y) annotation (Line(points={{38,-71},{32.4,-71}}, color={0,0,127}));
  connect(RV342.fSetPointAutomatic, realExpression5.y) annotation (Line(points={{138,69},{132.4,69}}, color={0,0,127}));
  connect(PU_int.nControlModeAutomatic, integerExpression2.y) annotation (Line(points={{138,-35},{134.4,-35}}, color={255,127,0}));
  connect(PU_int2.nControlModeAutomatic, integerExpression3.y) annotation (Line(points={{78,25},{72.4,25}}, color={255,127,0}));
  connect(PU242.nControlModeAutomatic, integerExpression5.y) annotation (Line(points={{38,35},{34.4,35}}, color={255,127,0}));
  connect(RV342.nControlModeAutomatic, integerExpression6.y) annotation (Line(points={{138,75},{132.4,75}}, color={255,127,0}));
  connect(HeatPump.nControlModeAutomatic, integerExpression7.y) annotation (Line(points={{118,5},{116.4,5}}, color={255,127,0}));
  connect(SV_int.nControlModeAutomatic, integerExpression4.y) annotation (Line(points={{38,-65},{32.4,-65}}, color={255,127,0}));
  connect(temperature1.port,PU_int2. port_b) annotation (Line(points={{110,40},{100,40}}, color={0,127,255}));
  connect(pressureDrop.port_a, temperature1.port) annotation (Line(points={{110,40},{110,40}}, color={0,127,255}));
  connect(pressureDrop.port_b, HeatPump.port_a) annotation (Line(points={{130,40},{130,10},{140,10}}, color={0,127,255}));
  connect(hex.port_a2, HeatPump.port_b) annotation (Line(points={{74,-10},{74,-16},{140,-16},{140,-10}}, color={0,127,255}));
  connect(RV242.port_a, port_a1) annotation (Line(points={{60,90},{60,100}}, color={0,127,255}));
  connect(RV242.port_b, PU242.port_a) annotation (Line(points={{60,70},{60,40}}, color={0,127,255}));
  connect(RV242.port_a1, pressureDrop2.port_b) annotation (Line(points={{60,80},{66,80},{66,70},{72,70}}, color={0,127,255}));
  connect(pressureDrop2.port_a, hex.port_b1) annotation (Line(points={{72,50},{70,50},{70,-10},{66,-10}}, color={0,127,255}));
  connect(RV242.bAlgorithmPermission, SV_int.bAlgorithmPermission) annotation (Line(points={{38,75},{20,75},{20,-75},{38,-75}}, color={255,0,255}));
  connect(RV242.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{38,71},{28,71},{28,70},{-19,70}}, color={255,0,255}));
  connect(realExpression6.y, RV242.fSetPointAutomatic) annotation (Line(points={{28.4,79},{38,79}}, color={0,0,127}));
  connect(integerExpression1.y, RV242.nControlModeAutomatic) annotation (Line(points={{28.4,85},{38,85}}, color={255,127,0}));
  connect(RV242.fTemperatureExternal, temperature1.T) annotation (Line(points={{45,92},{46,92},{46,80},{117,80},{117,50}}, color={0,0,127}));
  connect(RV242.fThermalPowerExternal, temperature1.T) annotation (Line(points={{55.2,92},{56,92},{56,80},{117,80},{117,50}}, color={0,0,127}));
  connect(temperature2.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{177,90},{80,90},{80,84},{0,84},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(SV_int.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{45,-81},{-30,-81},{-30,81}}, color={255,0,255}));
  connect(PU_int2.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{85,41},{85,44},{-30,44},{-30,81}}, color={255,0,255}));
  connect(HeatPump.bStatusOn, bStatusOn) annotation (Line(points={{125,-11},{-30,-11},{-30,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(HeatPump.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{125,-11},{-30,-11},{-30,81}}, color={255,0,255}));
  connect(boundary.ports[1],PU_int2. port_a) annotation (Line(points={{100,-40},{100,20}}, color={0,127,255}));
  connect(SV_int.fTemperatureExternal,WMZ342. fHeatFlowRate) annotation (Line(points={{45,-58},{50,-58},{50,-70},{139,-70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatPumpSystem;
