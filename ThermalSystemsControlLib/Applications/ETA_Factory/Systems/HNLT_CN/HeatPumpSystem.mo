within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNLT_CN;
model HeatPumpSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  Components.CompressionChiller.CompressionChiller HeatPump(
    redeclare package Medium = Medium1,
    redeclare package Medium1 = Medium2,
    redeclare Records.ViessmannVitocal350G deviceData) annotation (Placement(transformation(extent={{60,12},{80,-8}})));
  Components.Valves.TwoWayValve SV246(redeclare package Medium = Medium2, redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Components.HeatMeter.HeatMeter WMZ246(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Components.Valves.TwoWayValve SV146(redeclare package Medium = Medium1, redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{40,-20},{60,-40}})));
  Components.Pumps.Pump PU_int_HNLT(redeclare package Medium = Medium2, pumpType=2) annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium2,
    dp_nominal=60000,
    m_flow_nominal=0.2)                                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-30})));
  Components.Pumps.Pump PU_int_CN(redeclare package Medium = Medium1, pumpType=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={50,84})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop1(
    redeclare package Medium = Medium1,
    dp_nominal=64000,
    m_flow_nominal=0.3)                                     annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={50,30})));
  Components.HeatMeter.HeatMeter WMZ146(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{40,68},{60,48}})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{100,-20},{120,0}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium1)
                                                                                     annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{20,66},{30,84}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{30,96}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=2) annotation (Placement(transformation(extent={{40,-2},{50,16}})));
equation
  connect(temperature2.port, pressureDrop.port_b) annotation (Line(points={{110,-20},{100,-20}}, color={0,127,255}));
  connect(temperature2.T, WMZ246.fFeedTemperature) annotation (Line(points={{117,-10},{117,70},{102,70}}, color={0,0,127}));
  connect(PU_int_CN.port_a, port_a1) annotation (Line(points={{60,94},{60,100}}, color={0,127,255}));
  connect(HeatPump.port_a1, pressureDrop.port_b) annotation (Line(points={{80.2,-2},{100,-2},{100,-20}}, color={0,127,255}));
  connect(HeatPump.port_b1, SV246.port_a) annotation (Line(points={{80,6},{100,6},{100,20}}, color={0,127,255}));
  connect(pressureDrop1.port_b, HeatPump.port_a) annotation (Line(points={{60,20},{60,12},{80,12}}, color={0,127,255}));
  connect(HeatPump.port_b, SV146.port_a) annotation (Line(points={{80,-8},{80,-14},{60,-14},{60,-20}}, color={0,127,255}));
  connect(pressureDrop.port_a, PU_int_HNLT.port_b) annotation (Line(points={{100,-40},{100,-60}}, color={0,127,255}));
  connect(PU_int_HNLT.port_a, port_a2) annotation (Line(points={{100,-80},{100,-100}}, color={0,127,255}));
  connect(bAlgorithmPermission, PU_int_CN.bAlgorithmPermission) annotation (Line(points={{-120,50},{30,50},{30,79},{38,79}}, color={255,0,255}));
  connect(SV246.bAlgorithmPermission, PU_int_CN.bAlgorithmPermission) annotation (Line(points={{78,35},{30,35},{30,79},{38,79}}, color={255,0,255}));
  connect(SV146.bAlgorithmPermission, PU_int_CN.bAlgorithmPermission) annotation (Line(points={{38,-35},{30,-35},{30,79},{38,79}}, color={255,0,255}));
  connect(PU_int_HNLT.bAlgorithmPermission, PU_int_CN.bAlgorithmPermission) annotation (Line(points={{78,-65},{30,-65},{30,79},{38,79}}, color={255,0,255}));
  connect(PU_int_CN.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{38,89},{34,89},{34,75},{30.5,75}},
                                                                                                              color={255,127,0}));
  connect(SV246.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,25},{32,25},{32,75},{30.5,75}}, color={255,127,0}));
  connect(SV146.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{38,-25},{36,-25},{36,-26},{32,-26},{32,75},{30.5,75}}, color={255,127,0}));
  connect(PU_int_HNLT.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,-75},{32,-75},{32,75},{30.5,75}}, color={255,127,0}));
  connect(PU_int_CN.fSetPointAutomatic, realExpression.y) annotation (Line(points={{38,83},{34,83},{34,88},{30.5,88}}, color={0,0,127}));
  connect(SV246.fSetPointAutomatic, realExpression.y) annotation (Line(points={{78,31},{34,31},{34,88},{30.5,88}}, color={0,0,127}));
  connect(HeatPump.bAlgorithmPermission, PU_int_CN.bAlgorithmPermission) annotation (Line(points={{58,-3},{30,-3},{30,79},{38,79}}, color={255,0,255}));
  connect(WMZ246.fHeatFlowRate, SV246.fThermalPowerExternal) annotation (Line(points={{79,70},{95,70},{95,18}}, color={0,0,127}));
  connect(WMZ246.port_b, port_b2) annotation (Line(points={{100,80},{100,100}}, color={0,127,255}));
  connect(PU_int_HNLT.fThermalPowerExternal, SV246.fThermalPowerExternal) annotation (Line(points={{95,-82},{96,-82},{96,30},{95,30},{95,18}}, color={0,0,127}));
  connect(PU_int_HNLT.fTemperatureExternal, temperature2.T) annotation (Line(points={{85,-82},{86,-82},{86,-72},{120,-72},{120,-10},{117,-10}}, color={0,0,127}));
  connect(SV146.fSetPointAutomatic, realExpression.y) annotation (Line(points={{38,-31},{34,-31},{34,88},{30.5,88}}, color={0,0,127}));
  connect(PU_int_HNLT.fSetPointAutomatic, realExpression.y) annotation (Line(points={{78,-69},{34,-69},{34,88},{30.5,88}}, color={0,0,127}));
  connect(HeatPump.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,-9},{70,-12},{0,-12},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(SV146.fTemperatureExternal, SV146.fThermalPowerExternal) annotation (Line(points={{45,-18},{55,-18}}, color={0,0,127}));
  connect(SV246.fTemperatureExternal, SV246.fThermalPowerExternal) annotation (Line(points={{85,18},{95,18}}, color={0,0,127}));
  connect(SV246.port_b, WMZ246.port_a) annotation (Line(points={{100,40},{100,60}}, color={0,127,255}));
  connect(SV146.port_b, port_b1) annotation (Line(points={{60,-40},{60,-100}}, color={0,127,255}));
  connect(temperature1.port, SV146.port_b) annotation (Line(points={{70,-40},{60,-40}}, color={0,127,255}));
  connect(WMZ146.port_a, PU_int_CN.port_b) annotation (Line(points={{60,68},{60,74}}, color={0,127,255}));
  connect(WMZ146.port_b, pressureDrop1.port_a) annotation (Line(points={{60,48},{60,40}}, color={0,127,255}));
  connect(WMZ146.fFeedTemperature, temperature1.T) annotation (Line(points={{62,58},{74,58},{74,-30},{77,-30}}, color={0,0,127}));
  connect(WMZ146.fHeatFlowRate, PU_int_CN.fThermalPowerExternal) annotation (Line(points={{39,58},{52,58},{52,96},{55,96}}, color={0,0,127}));
  connect(PU_int_CN.fTemperatureExternal, PU_int_CN.fThermalPowerExternal) annotation (Line(points={{45,96},{46,96},{46,84},{52,84},{52,96},{55,96}}, color={0,0,127}));
  connect(SV146.fThermalPowerExternal, PU_int_CN.fThermalPowerExternal) annotation (Line(points={{55,-18},{55,58},{52,58},{52,96},{55,96}}, color={0,0,127}));
  connect(HeatPump.nControlModeAutomatic, integerExpression2.y) annotation (Line(points={{58,7},{50.5,7}}, color={255,127,0}));
  connect(SV146.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{38,-39},{20,-39},{20,70},{-19,70}}, color={255,0,255}));
  connect(SV246.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{78,39},{78,70},{-19,70}}, color={255,0,255}));
  connect(SV146.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{45,-41},{45,-60},{-30,-60},{-30,81}}, color={255,0,255}));
  connect(PU_int_CN.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{38,75},{30,75},{30,76},{20,76},{20,70},{-19,70}}, color={255,0,255}));
  connect(PU_int_HNLT.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{78,-61},{20,-61},{20,70},{-19,70}}, color={255,0,255}));
  connect(HeatPump.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{58,-7},{20,-7},{20,70},{-19,70}}, color={255,0,255}));
  connect(PU_int_CN.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{45,73},{45,120},{-30,120},{-30,81}}, color={255,0,255}));
  connect(HeatPump.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{65,-9},{65,120},{-30,120},{-30,81}}, color={255,0,255}));
  connect(HeatPump.bStatusOn, bStatusOn) annotation (Line(points={{65,-9},{65,128},{-70,128},{-70,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(HeatPump.fSetPointAutomatic, selectSetPoint.fSetPoint) annotation (Line(points={{58,1},{10,1},{10,30},{-59,30}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatPumpSystem;
