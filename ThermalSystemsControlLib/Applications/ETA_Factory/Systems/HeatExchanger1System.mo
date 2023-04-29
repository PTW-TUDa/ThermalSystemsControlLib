within ThermalSystemsControlLib.Applications.ETA_Factory.Systems;
model HeatExchanger1System
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatExchanger_Icon;
  Components.Pumps.Pump PU215(k=0.265)
                              annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Components.Pumps.Pump PU315 annotation (Placement(transformation(extent={{40,80},{60,60}})));
  Components.HeatExchanger.PhysicalModels.HeatExchanger_Physical HeatExchanger1(
    redeclare replaceable package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,                                        redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.PWT1_SWEP_50kW deviceData) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={70,0})));
  Components.HeatMeter.HeatMeter WMZ215 annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  Components.Valves.ThreeWayValve RV215(k=0.1,
                                        redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2020_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{80,40},{100,20}})));
  Components.Valves.TwoWayValve SV315(redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2020_S2 deviceData) annotation (Placement(transformation(extent={{40,-60},{60,-80}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{100,60},{80,80}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{0,80},{20,100}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.5)
                                                               annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=2) annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={124,0})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1)  annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
equation
  connect(WMZ215.port_a, port_a2) annotation (Line(points={{100,-80},{100,-100}}, color={0,127,255}));
  connect(PU215.port_a, WMZ215.port_b) annotation (Line(points={{100,-40},{100,-60}}, color={0,127,255}));
  connect(RV215.port_a, port_b2) annotation (Line(points={{100,40},{100,100}}, color={0,127,255}));
  connect(temperature1.port, port_b2) annotation (Line(points={{90,60},{100,60},{100,100}}, color={0,127,255}));
  connect(temperature1.T, RV215.fTemperatureExternal) annotation (Line(points={{83,70},{85,70},{85,42}}, color={0,0,127}));
  connect(WMZ215.fHeatFlowRate, PU215.fThermalPowerExternal) annotation (Line(points={{79,-70},{90,-70},{90,-42}}, color={0,0,127}));
  connect(RV215.fThermalPowerExternal, PU215.fThermalPowerExternal) annotation (Line(points={{95.2,42},{96,42},{96,-70},{90,-70},{90,-42}}, color={0,0,127}));
  connect(PU315.port_a, port_a1) annotation (Line(points={{60,80},{60,100}}, color={0,127,255}));
  connect(SV315.port_b, port_b1) annotation (Line(points={{60,-80},{60,-100}}, color={0,127,255}));
  connect(SV315.fThermalPowerExternal, PU215.fThermalPowerExternal) annotation (Line(points={{50,-58},{50,-70},{90,-70},{90,-42}}, color={0,0,127}));
  connect(PU315.fThermalPowerExternal, PU215.fThermalPowerExternal) annotation (Line(points={{50,82},{50,-70},{90,-70},{90,-42}}, color={0,0,127}));
  connect(bAlgorithmPermission, PU315.bAlgorithmPermission) annotation (Line(points={{-120,50},{30,50},{30,65},{38,65}}, color={255,0,255}));
  connect(RV215.bAlgorithmPermission, PU315.bAlgorithmPermission) annotation (Line(points={{78,25},{30,25},{30,65},{38,65}}, color={255,0,255}));
  connect(PU215.bAlgorithmPermission, PU315.bAlgorithmPermission) annotation (Line(points={{78,-25},{30,-25},{30,65},{38,65}}, color={255,0,255}));
  connect(SV315.bAlgorithmPermission, PU315.bAlgorithmPermission) annotation (Line(points={{38,-75},{30,-75},{30,65},{38,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[1], SV315.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{20,70},{20,-79},{38,-79}}, color={255,0,255}));
  connect(RV215.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{78,21},{20,21},{20,70},{-19,70}}, color={255,0,255}));
  connect(PU215.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{78,-21},{20,-21},{20,70},{-19,70}}, color={255,0,255}));
  connect(PU315.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{38,61},{20,61},{20,70},{-19,70}}, color={255,0,255}));
  connect(integerExpression2.y, PU315.nControlModeAutomatic) annotation (Line(points={{21,90},{38,90},{38,75}}, color={255,127,0}));
  connect(SV315.nControlModeAutomatic, PU315.nControlModeAutomatic) annotation (Line(points={{38,-65},{26,-65},{26,90},{38,90},{38,75}}, color={255,127,0}));
  connect(PU215.nControlModeAutomatic, PU315.nControlModeAutomatic) annotation (Line(points={{78,-35},{26,-35},{26,90},{38,90},{38,75}}, color={255,127,0}));
  connect(realExpression1.y, PU315.fSetPointAutomatic) annotation (Line(points={{21,70},{32,70},{32,69},{38,69}}, color={0,0,127}));
  connect(PU215.fSetPointAutomatic, PU315.fSetPointAutomatic) annotation (Line(points={{78,-29},{24,-29},{24,70},{32,70},{32,69},{38,69}}, color={0,0,127}));
  connect(systemFlowControl.bStatusOn_Components[1], SV315.bStatusOn) annotation (Line(points={{-30,81},{-30,-81},{45,-81}}, color={255,0,255}));
  connect(PU315.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{45,59},{45,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(PU315.bStatusOn, bStatusOn) annotation (Line(points={{45,59},{45,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(temperature1.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{83,70},{70,70},{70,40},{0,40},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(temperature1.T, WMZ215.fFeedTemperature) annotation (Line(points={{83,70},{102,70},{102,-70}}, color={0,0,127}));
  connect(RV215.fSetPointAutomatic, selectSetPoint.fSetPoint) annotation (Line(points={{78,29},{78,30},{-59,30}}, color={0,0,127}));
  connect(integerExpression1.y, RV215.nControlModeAutomatic) annotation (Line(points={{81,50},{78,50},{78,35}}, color={255,127,0}));
  connect(RV215.port_a1, pipe2.port_a) annotation (Line(points={{100,30},{114,30},{114,10}},color={0,127,255}));
  connect(pipe2.port_b, PU215.port_a) annotation (Line(points={{114,-10},{114,-40},{100,-40}}, color={0,127,255}));
  connect(HeatExchanger1.port_a2, PU215.port_b) annotation (Line(points={{74,-10},{100,-10},{100,-20}}, color={0,127,255}));
  connect(HeatExchanger1.port_b2, RV215.port_b) annotation (Line(points={{74,10},{100,10},{100,20}}, color={0,127,255}));
  connect(HeatExchanger1.port_a1, PU315.port_b) annotation (Line(points={{66,10},{60,10},{60,60}}, color={0,127,255}));
  connect(HeatExchanger1.port_b1, SV315.port_a) annotation (Line(points={{66,-10},{60,-10},{60,-60}}, color={0,127,255}));
  connect(realExpression2.y, SV315.fSetPointAutomatic) annotation (Line(points={{1,-70},{20,-70},{20,-71},{38,-71}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatExchanger1System;
