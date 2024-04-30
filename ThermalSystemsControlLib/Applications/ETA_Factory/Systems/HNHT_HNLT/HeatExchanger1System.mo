within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT_HNLT;
model HeatExchanger1System
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatExchanger_Icon;
  Components.Pumps.Pump PU215(k=0.265)
                              annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Components.Pumps.Pump PU315 annotation (Placement(transformation(extent={{40,40},{60,20}})));
  Components.HeatExchanger.PhysicalModels.HeatExchanger HeatExchanger1(
    redeclare replaceable package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    redeclare Records.HEX1 deviceData) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={70,0})));
  Components.HeatMeter.HeatMeter WMZ215 annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  Components.Valves.ThreeWayValve RV315(
    k=0.1,
    yMin=0.5,
    redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.SV deviceData) annotation (Placement(transformation(extent={{40,80},{60,60}})));
  Components.Valves.TwoWayValve SV215(redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.RV deviceData) annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{102,60},{82,80}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{66,20},{74,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=100)
                                                               annotation (Placement(transformation(extent={{64,-34},{72,-24}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=1) annotation (Placement(transformation(extent={{26,70},{34,80}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,-30})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=100)
                                                               annotation (Placement(transformation(extent={{66,28},{74,36}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=100)
                                                               annotation (Placement(transformation(extent={{26,24},{34,34}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression3(y=0) annotation (Placement(transformation(extent={{26,30},{34,40}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression4(y=0) annotation (Placement(transformation(extent={{64,-40},{72,-30}})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{60,-80},{40,-60}})));
  Modelica.Fluid.Sensors.Temperature temperature3(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{0,-40},{-20,-20}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fFeedTemperature_hot annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=180,
        origin={-31,-29})));
equation
  connect(WMZ215.port_a, port_a2) annotation (Line(points={{100,-80},{100,-100}}, color={0,127,255}));
  connect(PU215.port_a, WMZ215.port_b) annotation (Line(points={{100,-40},{100,-60}}, color={0,127,255}));
  connect(temperature1.port, port_b2) annotation (Line(points={{92,60},{100,60},{100,100}}, color={0,127,255}));
  connect(WMZ215.fHeatFlowRate, PU215.fThermalPowerExternal) annotation (Line(points={{79,-70},{95,-70},{95,-42}}, color={0,0,127}));
  connect(HeatExchanger1.port_a2, PU215.port_b) annotation (Line(points={{74,-10},{100,-10},{100,-20}}, color={0,127,255}));
  connect(HeatExchanger1.port_a1, PU315.port_b) annotation (Line(points={{66,10},{60,10},{60,20}}, color={0,127,255}));
  connect(RV315.port_a, port_a1) annotation (Line(points={{60,80},{60,100}}, color={0,127,255}));
  connect(pipe2.port_a, HeatExchanger1.port_b1) annotation (Line(points={{40,-40},{50,-40},{50,-10},{66,-10}}, color={0,127,255}));
  connect(pipe2.port_b,RV315. port_a1) annotation (Line(points={{40,-20},{40,70},{60,70}}, color={0,127,255}));
  connect(HeatExchanger1.port_b2,SV215. port_a) annotation (Line(points={{74,10},{80,10},{80,20},{100,20}}, color={0,127,255}));
  connect(SV215.port_b, port_b2) annotation (Line(points={{100,40},{100,100}}, color={0,127,255}));
  connect(port_b1, HeatExchanger1.port_b1) annotation (Line(points={{60,-100},{60,-10},{66,-10}}, color={0,127,255}));
  connect(RV315.port_b, PU315.port_a) annotation (Line(points={{60,60},{60,40}}, color={0,127,255}));
  connect(bAlgorithmPermission,RV315. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(PU315.bAlgorithmPermission,RV315. bAlgorithmPermission) annotation (Line(points={{38,25},{20,25},{20,65},{38,65}}, color={255,0,255}));
  connect(SV215.bAlgorithmPermission,RV315. bAlgorithmPermission) annotation (Line(points={{78,35},{66,35},{66,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(PU215.bAlgorithmPermission,RV315. bAlgorithmPermission) annotation (Line(points={{78,-25},{66,-25},{66,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[1],RV315. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{10,70},{10,60},{36,60},{36,61},{38,61}}, color={255,0,255}));
  connect(PU315.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{38,21},{38,20},{10,20},{10,70},{-19,70}}, color={255,0,255}));
  connect(SV215.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{78,39},{10,39},{10,70},{-19,70}}, color={255,0,255}));
  connect(PU215.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{78,-21},{10,-21},{10,70},{-19,70}}, color={255,0,255}));
  connect(RV315.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{45,59},{45,81},{-30,81}}, color={255,0,255}));
  connect(PU315.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{45,19},{45,81},{-30,81}}, color={255,0,255}));
  connect(PU315.bStatusOn, bStatusOn) annotation (Line(points={{45,19},{45,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(temperature1.T,RV315. fTemperatureExternal) annotation (Line(points={{85,70},{80,70},{80,90},{45,90},{45,82}}, color={0,0,127}));
  connect(WMZ215.fFeedTemperature, temperature1.T) annotation (Line(points={{102,-70},{120,-70},{120,70},{85,70}}, color={0,0,127}));
  connect(WMZ215.fHeatFlowRate,SV215. fThermalPowerExternal) annotation (Line(points={{79,-70},{95,-70},{95,18}}, color={0,0,127}));
  connect(PU315.fThermalPowerExternal,SV215. fThermalPowerExternal) annotation (Line(points={{55,42},{55,48},{95,48},{95,18}}, color={0,0,127}));
  connect(RV315.fThermalPowerExternal, PU215.fThermalPowerExternal) annotation (Line(points={{55.2,82},{56,82},{56,88},{95,88},{95,-42}}, color={0,0,127}));
  connect(integerExpression2.y,SV215. nControlModeAutomatic) annotation (Line(points={{74.4,25},{78,25}}, color={255,127,0}));
  connect(SV215.fSetPointAutomatic, realExpression2.y) annotation (Line(points={{78,31},{76,31},{76,32},{74.4,32}}, color={0,0,127}));
  connect(realExpression1.y, PU215.fSetPointAutomatic) annotation (Line(points={{72.4,-29},{75.2,-29},{75.2,-29},{78,-29}}, color={0,0,127}));
  connect(PU315.fSetPointAutomatic, realExpression3.y) annotation (Line(points={{38,29},{34.4,29}}, color={0,0,127}));
  connect(RV315.fSetPointAutomatic, selectSetPoint.fSetPoint) annotation (Line(points={{38,69},{-20,69},{-20,30},{-59,30}}, color={0,0,127}));
  connect(RV315.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{38,75},{34.4,75}}, color={255,127,0}));
  connect(PU315.nControlModeAutomatic, integerExpression3.y) annotation (Line(points={{38,35},{34.4,35}}, color={255,127,0}));
  connect(PU215.nControlModeAutomatic, integerExpression4.y) annotation (Line(points={{78,-35},{72.4,-35}}, color={255,127,0}));
  connect(PU215.fTemperatureExternal, temperature1.T) annotation (Line(points={{85,-42},{85,-42},{85,70}}, color={0,0,127}));
  connect(temperature2.port, HeatExchanger1.port_b1) annotation (Line(points={{50,-80},{60,-80},{60,-10},{66,-10}}, color={0,127,255}));
  connect(temperature2.T, PU315.fTemperatureExternal) annotation (Line(points={{43,-70},{40,-70},{40,42},{45,42}}, color={0,0,127}));
  connect(SV215.fTemperatureExternal,SV215. fThermalPowerExternal) annotation (Line(points={{85,18},{90.5,18},{90.5,18},{95,18}}, color={0,0,127}));
  connect(temperature3.port, PU315.port_b) annotation (Line(points={{-10,-40},{20,-40},{20,16},{60,16},{60,20}}, color={0,127,255}));
  connect(fFeedTemperature_hot.Kelvin, temperature3.T) annotation (Line(points={{-27.4,-29},{-17,-29},{-17,-30}}, color={0,0,127}));
  connect(temperature1.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{85,70},{84,70},{84,94},{0,94},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatExchanger1System;
