within ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Systems.HNHT;
model CHP1System
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CHP_Icon;
  Components.CombinedHeatPower.CHP_Type1 CHP(
    redeclare package Medium = Medium,
    k=5,
    yMin=0.5,
    redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Records.ViessmannVitobloc200_EM_6_15 deviceData) annotation (Placement(transformation(extent={{60,-8},{80,12}})));
  Components.Valves.ThreeWayValve RV32x(
    k=5,
    yMin=0.5,
    redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Records.Belimo_R2032_S2_ThreeWay
                                                                                                 deviceData) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Components.Pumps.Pump PU32x(pumpType=1)
                              annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Components.Valves.TwoWayValve SV32x(redeclare ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Records.Belimo_R2032_S2
                                                                                                                          deviceData) annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
  Components.HeatMeter.HeatMeter WMZ32x annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression(y=1) annotation (Placement(transformation(extent={{44,-18},{52,-6}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=2) annotation (Placement(transformation(extent={{44,-54},{52,-40}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=20) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=0.55,
    diameter=0.025,
    n_Bending=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,30})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(dp_nominal=25000,m_flow_nominal=0.2) annotation (Placement(transformation(extent={{60,20},{80,40}})));
equation
  connect(CHP.port_a, RV32x.port_b) annotation (Line(points={{80,-8},{80,-20}}, color={0,127,255}));
  connect(SV32x.port_a, port_a) annotation (Line(points={{80,-100},{100,-100}}, color={0,127,255}));
  connect(RV32x.port_a,WMZ32x. port_b) annotation (Line(points={{80,-40},{80,-50}}, color={0,127,255}));
  connect(WMZ32x.port_a,SV32x. port_b) annotation (Line(points={{80,-70},{80,-80}}, color={0,127,255}));
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_a,PU32x. port_b) annotation (Line(points={{80,80},{80,80},{80,70}}, color={0,127,255}));
  connect(temperature.T,WMZ32x. fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-60},{82,-60}}, color={0,0,127}));
  connect(bAlgorithmPermission,PU32x. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{58,65}}, color={255,0,255}));
  connect(CHP.bAlgorithmPermission, PU32x.bAlgorithmPermission) annotation (Line(points={{58,7},{20,7},{20,65},{58,65}}, color={255,0,255}));
  connect(RV32x.bAlgorithmPermission,PU32x. bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,65},{58,65}}, color={255,0,255}));
  connect(SV32x.bAlgorithmPermission,PU32x. bAlgorithmPermission) annotation (Line(points={{58,-85},{20,-85},{20,65},{58,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2],PU32x. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{58,70},{58,69}}, color={255,0,255}));
  connect(RV32x.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(CHP.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{58,11},{40,11},{40,70},{-19,70}}, color={255,0,255}));
  connect(SV32x.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-81},{40,-81},{40,70},{-19,70}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, CHP.fSetPointAutomatic) annotation (Line(points={{-59,30},{52,30},{52,3},{58,3}}, color={0,0,127}));
  connect(realExpression.y,PU32x. fSetPointAutomatic) annotation (Line(points={{41,90},{48,90},{48,61},{58,61}}, color={0,0,127}));
  connect(SV32x.fSetPointAutomatic,PU32x. fSetPointAutomatic) annotation (Line(points={{58,-89},{48,-89},{48,61},{58,61}}, color={0,0,127}));
  connect(integerExpression.y, CHP.nControlModeAutomatic) annotation (Line(points={{52.4,-12},{58,-12},{58,-3}},
                                                                                                              color={255,127,0}));
  connect(integerExpression1.y,SV32x. nControlModeAutomatic) annotation (Line(points={{1,-70},{30,-70},{30,-95},{58,-95}}, color={255,127,0}));
  connect(PU32x.nControlModeAutomatic,SV32x. nControlModeAutomatic) annotation (Line(points={{58,55},{30,55},{30,-95},{58,-95}}, color={255,127,0}));
  connect(integerExpression2.y,RV32x. nControlModeAutomatic) annotation (Line(points={{52.4,-47},{52,-47},{52,-36},{56,-36},{56,-35},{58,-35}},
                                                                                                                                             color={255,127,0}));
  connect(temperature1.port,RV32x. port_b) annotation (Line(points={{90,-20},{80,-20}}, color={0,127,255}));
  connect(RV32x.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-42},{65,-26},{83,-26},{83,-10}}, color={0,0,127}));
  connect(realExpression1.y, add.u2) annotation (Line(points={{-59,-50},{-40,-50},{-40,-36},{-22,-36}}, color={0,0,127}));
  connect(add.u1, CHP.fSetPointAutomatic) annotation (Line(points={{-22,-24},{-30,-24},{-30,30},{52,30},{52,3},{58,3}}, color={0,0,127}));
  connect(add.y,RV32x. fSetPointAutomatic) annotation (Line(points={{1,-30},{58,-30},{58,-29}}, color={0,0,127}));
  connect(CHP.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,13},{70,20},{0,20},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PU32x.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,71},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(CHP.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{65,13},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(CHP.bStatusOn, bStatusOn) annotation (Line(points={{65,13},{65,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(SV32x.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-79},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(WMZ32x.fHeatFlowRate,SV32x. fThermalPowerExternal) annotation (Line(points={{59,-60},{76,-60},{76,-102},{75,-102}}, color={0,0,127}));
  connect(RV32x.fThermalPowerExternal,SV32x. fThermalPowerExternal) annotation (Line(points={{75.2,-42},{76,-42},{76,-102},{75,-102}}, color={0,0,127}));
  connect(PU32x.fThermalPowerExternal,SV32x. fThermalPowerExternal) annotation (Line(points={{75,48},{76,48},{76,-102},{75,-102}},         color={0,0,127}));
  connect(RV32x.port_a1, pipe2.port_b) annotation (Line(points={{80,-30},{100,-30},{100,20}}, color={0,127,255}));
  connect(pipe2.port_a,PU32x. port_b) annotation (Line(points={{100,40},{100,70},{80,70}}, color={0,127,255}));
  connect(pressureDrop.port_a, CHP.port_b) annotation (Line(points={{80,20},{80,12}}, color={0,127,255}));
  connect(pressureDrop.port_b, PU32x.port_a) annotation (Line(points={{80,40},{80,50},{80,50}}, color={0,127,255}));
  connect(PU32x.fTemperatureExternal, WMZ32x.fFeedTemperature) annotation (Line(points={{65,48},{64,48},{64,44},{96,44},{96,-60},{82,-60}}, color={0,0,127}));
  connect(SV32x.fTemperatureExternal, SV32x.fThermalPowerExternal) annotation (Line(points={{65,-102},{66,-102},{66,-88},{76,-88},{76,-102},{75,-102}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CHP1System;
