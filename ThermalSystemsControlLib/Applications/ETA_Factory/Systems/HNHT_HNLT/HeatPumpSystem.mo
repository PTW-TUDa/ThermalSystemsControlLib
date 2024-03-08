within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT_HNLT;
model HeatPumpSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  Components.Pumps.Pump PU_int(pumpType=1) annotation (Placement(transformation(extent={{140,-40},{160,-20}})));
  Components.HeatMeter.HeatMeter WMZ342 annotation (Placement(transformation(extent={{140,-80},{160,-60}})));
  Components.Valves.ThreeWayValve RV342(k=0.1,
                                        redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{140,80},{160,60}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=50) annotation (Placement(transformation(extent={{26,24},{34,34}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=1) annotation (Placement(transformation(extent={{20,80},{28,90}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={170,0})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{160,80},{180,100}})));
  Components.CompressionChiller.CompressionChiller HeatPump(
    redeclare package Medium = Medium1,
    redeclare package Medium1 = Medium2,
    k=0.1,
    redeclare Records.ViessmannVitocal200G deviceData) annotation (Placement(transformation(extent={{120,10},{140,-10}})));
  Components.Valves.ThreeWayValve RV242(
    k=0.1,
    redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={50,80})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{100,20},{120,40}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(dp_nominal=25000, m_flow_nominal=0.2)
                                                                                                 annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=0,
        origin={50,-10})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop1(dp_nominal=25000, m_flow_nominal=0.2)
                                                                                                 annotation (Placement(transformation(extent={{140,20},{160,40}})));
  Components.Pumps.Pump PU242(pumpType=2) annotation (Placement(transformation(extent={{40,40},{60,20}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=100)
                                                               annotation (Placement(transformation(extent={{126,-34},{134,-24}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=100)
                                                               annotation (Placement(transformation(extent={{124,64},{132,74}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=293.15)
                                                               annotation (Placement(transformation(extent={{20,74},{28,84}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{126,-40},{134,-30}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression5(y=0) annotation (Placement(transformation(extent={{26,30},{34,40}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression6(y=0) annotation (Placement(transformation(extent={{124,70},{132,80}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression7(y=1) annotation (Placement(transformation(extent={{108,0},{116,10}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop2(dp_nominal=65000, m_flow_nominal=0.83)
                                                                                                 annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={90,58})));
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
  connect(temperature2.port,RV342. port_a) annotation (Line(points={{170,80},{160,80}}, color={0,127,255}));
  connect(RV342.port_b, pressureDrop1.port_b) annotation (Line(points={{160,60},{160,40}}, color={0,127,255}));
  connect(pressureDrop1.port_a, HeatPump.port_b1) annotation (Line(points={{160,20},{160,4},{140,4}}, color={0,127,255}));
  connect(HeatPump.fSetPointAutomatic, selectSetPoint.fSetPoint) annotation (Line(points={{118,-1},{4,-1},{4,30},{-59,30}}, color={0,0,127}));
  connect(PU242.fTemperatureExternal, WMZ342.fHeatFlowRate) annotation (Line(points={{45,42},{50,42},{50,-70},{139,-70}}, color={0,0,127}));
  connect(PU242.fThermalPowerExternal, WMZ342.fHeatFlowRate) annotation (Line(points={{55,42},{50,42},{50,-70},{139,-70}}, color={0,0,127}));
  connect(PU242.fSetPointAutomatic, realExpression1.y) annotation (Line(points={{38,29},{34.4,29}}, color={0,0,127}));
  connect(PU_int.fSetPointAutomatic, realExpression3.y) annotation (Line(points={{138,-29},{134.4,-29}}, color={0,0,127}));
  connect(RV342.fSetPointAutomatic, realExpression5.y) annotation (Line(points={{138,69},{132.4,69}}, color={0,0,127}));
  connect(PU_int.nControlModeAutomatic, integerExpression2.y) annotation (Line(points={{138,-35},{134.4,-35}}, color={255,127,0}));
  connect(PU242.nControlModeAutomatic, integerExpression5.y) annotation (Line(points={{38,35},{34.4,35}}, color={255,127,0}));
  connect(RV342.nControlModeAutomatic, integerExpression6.y) annotation (Line(points={{138,75},{132.4,75}}, color={255,127,0}));
  connect(HeatPump.nControlModeAutomatic, integerExpression7.y) annotation (Line(points={{118,5},{116.4,5}}, color={255,127,0}));
  connect(pressureDrop.port_b, HeatPump.port_a) annotation (Line(points={{60,-20},{60,-40},{100,-40},{100,10},{140,10}},
                                                                                                      color={0,127,255}));
  connect(RV242.port_a, port_a1) annotation (Line(points={{60,90},{60,100}}, color={0,127,255}));
  connect(RV242.port_b, PU242.port_a) annotation (Line(points={{60,70},{60,40}}, color={0,127,255}));
  connect(realExpression6.y, RV242.fSetPointAutomatic) annotation (Line(points={{28.4,79},{38,79}}, color={0,0,127}));
  connect(integerExpression1.y, RV242.nControlModeAutomatic) annotation (Line(points={{28.4,85},{38,85}}, color={255,127,0}));
  connect(RV242.fTemperatureExternal, temperature1.T) annotation (Line(points={{45,92},{46,92},{46,80},{117,80},{117,30}}, color={0,0,127}));
  connect(RV242.fThermalPowerExternal, temperature1.T) annotation (Line(points={{55.2,92},{56,92},{56,80},{117,80},{117,30}}, color={0,0,127}));
  connect(temperature2.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{177,90},{80,90},{80,84},{0,84},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(port_b1, HeatPump.port_b) annotation (Line(points={{60,-100},{80,-100},{80,-20},{140,-20},{140,-10}}, color={0,127,255}));
  connect(pressureDrop2.port_b, RV242.port_a1) annotation (Line(points={{80,68},{80,80},{60,80}}, color={0,127,255}));
  connect(pressureDrop2.port_a, HeatPump.port_b) annotation (Line(points={{80,48},{80,-20},{140,-20},{140,-10}}, color={0,127,255}));
  connect(bAlgorithmPermission, RV242.bAlgorithmPermission) annotation (Line(points={{-120,50},{12,50},{12,75},{38,75}}, color={255,0,255}));
  connect(PU242.bAlgorithmPermission, RV242.bAlgorithmPermission) annotation (Line(points={{38,25},{12,25},{12,75},{38,75}}, color={255,0,255}));
  connect(RV342.bAlgorithmPermission, RV242.bAlgorithmPermission) annotation (Line(points={{138,65},{76,65},{76,64},{12,64},{12,75},{38,75}}, color={255,0,255}));
  connect(HeatPump.bAlgorithmPermission, RV242.bAlgorithmPermission) annotation (Line(points={{118,-5},{12,-5},{12,75},{38,75}}, color={255,0,255}));
  connect(PU_int.bAlgorithmPermission, RV242.bAlgorithmPermission) annotation (Line(points={{138,-25},{12,-25},{12,75},{38,75}}, color={255,0,255}));
  connect(PU242.port_b, pressureDrop.port_a) annotation (Line(points={{60,20},{60,0}}, color={0,127,255}));
  connect(temperature1.port, HeatPump.port_a) annotation (Line(points={{110,20},{110,10},{140,10}}, color={0,127,255}));
  connect(RV242.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{38,71},{28,71},{28,70},{-19,70}}, color={255,0,255}));
  connect(RV242.bSetStatusOnAutomatic, RV342.bSetStatusOnAutomatic) annotation (Line(points={{38,71},{28,71},{28,61},{138,61}}, color={255,0,255}));
  connect(RV242.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{45,69},{45,120},{-30,120},{-30,81}}, color={255,0,255}));
  connect(PU242.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{38,21},{34,21},{34,22},{28,22},{28,70},{-19,70}}, color={255,0,255}));
  connect(PU_int.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{138,-21},{28,-21},{28,70},{-19,70}}, color={255,0,255}));
  connect(PU242.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{45,19},{45,70},{46,70},{46,120},{-30,120},{-30,81}}, color={255,0,255}));
  connect(HeatPump.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{118,-9},{22,-9},{22,70},{-19,70}}, color={255,0,255}));
  connect(HeatPump.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{125,-11},{125,140},{-30,140},{-30,81}}, color={255,0,255}));
  connect(HeatPump.bStatusOn, bStatusOn) annotation (Line(points={{125,-11},{125,144},{-70,144},{-70,100},{-50,100},{-50,110}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatPumpSystem;
