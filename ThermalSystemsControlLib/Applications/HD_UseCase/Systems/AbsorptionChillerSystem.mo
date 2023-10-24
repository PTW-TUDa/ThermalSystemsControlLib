within ThermalSystemsControlLib.Applications.HD_UseCase.Systems;
model AbsorptionChillerSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidSixPort;

  //## PARAMETERS ##
  replaceable parameter ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties deviceData_Pump_Hot constrainedby ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties deviceData_Pump_Warm constrainedby ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties deviceData_Pump_Cold constrainedby ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties annotation (__Dymola_choicesAllMatching=true);

  Components.AbsorptionChiller.PhysicalModels.AbsorptionChiller absorptionChiller(
    redeclare package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    redeclare package Medium3 = Medium3,
    Q_flow_nom_GEN=1000000,
    Q_flow_nom_CD=600000,
    Q_flow_nom_ABS=600000,
    Q_flow_nom_EV=800000) annotation (Placement(transformation(extent={{50,-8},{70,12}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_cold_out(redeclare package Medium = Medium3)
                                                                                          annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={100,-20})));
  Modelica.Blocks.Continuous.LimPID hot(controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=0.2,
    yMax=1,
    yMin=0.3)                                                                                         annotation (Placement(transformation(extent={{190,40},{170,60}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_warm_in(redeclare package Medium = Medium2)
                                                                                         annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=270,
        origin={60,-26})));
  Modelica.Blocks.Sources.Constant const1(k=50 + 273.15) annotation (Placement(transformation(extent={{220,-80},{200,-60}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=T_cold_out.T) annotation (Placement(transformation(extent={{220,40},{200,60}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=selectSetPoint.fSetPoint) annotation (Placement(transformation(extent={{220,20},{200,40}})));
  Modelica.Blocks.Continuous.LimPID warm(controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=0.2,
    yMax=1,
    yMin=0.3)                                                                                          annotation (Placement(transformation(extent={{190,-60},{170,-40}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=T_warm_out.T)
                                                                        annotation (Placement(transformation(extent={{220,-60},{200,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_cold_in(redeclare package Medium = Medium3)
                                                                                         annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={100,20})));
  Modelica.Blocks.Sources.Constant const3(k=22 + 273.15) annotation (Placement(transformation(extent={{220,-30},{200,-10}})));
  Modelica.Blocks.Continuous.LimPID cold(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=0.2,
    yMax=1,
    yMin=0.3) annotation (Placement(transformation(extent={{190,-10},{170,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=T_cold_in.T) annotation (Placement(transformation(extent={{220,-10},{200,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_warm_out(redeclare package Medium = Medium2)
                                                                                         annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=270,
        origin={60,26})));
  Components.Pumps.IdealPump idealPump(redeclare package Medium = Medium1, deviceData=deviceData_Pump_Hot) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={18,38})));
  Components.Pumps.IdealPump idealPump1(redeclare package Medium = Medium3, deviceData=deviceData_Pump_Cold) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={84,50})));
  Components.Pumps.IdealPump idealPump2(redeclare package Medium = Medium2, deviceData=deviceData_Pump_Warm) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={50,-48})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression annotation (Placement(transformation(extent={{-60,-26},{-40,-6}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression annotation (Placement(transformation(extent={{-60,-44},{-40,-24}})));
  Components.HeatMeter.HeatMeter heatMeter annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={31,73})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hot_in(redeclare package Medium = Medium1) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={20,88})));
  Components.HeatMeter.HeatMeter heatMeter1(redeclare package Medium = Medium2) annotation (Placement(transformation(
        extent={{7,7},{-7,-7}},
        rotation=180,
        origin={53,-79})));
  Components.HeatMeter.HeatMeter heatMeter2(redeclare package Medium = Medium3) annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=0,
        origin={93,81})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hot_in1(redeclare package Medium = Medium1)
                                                                                         annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={20,-76})));
equation
  connect(T_cold_out.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{106.6,-20},{120,-20},{120,-66},{-70,-66},{-70,18}}, color={0,0,127}));
  connect(realExpression.y, hot.u_s) annotation (Line(points={{199,50},{192,50}},   color={0,0,127}));
  connect(realExpression1.y, hot.u_m) annotation (Line(points={{199,30},{180,30},{180,38}},    color={0,0,127}));
  connect(warm.u_s, realExpression2.y) annotation (Line(points={{192,-50},{199,-50}}, color={0,0,127}));
  connect(const1.y, warm.u_m) annotation (Line(points={{199,-70},{180,-70},{180,-62}}, color={0,0,127}));
  connect(realExpression3.y, cold.u_s) annotation (Line(points={{199,0},{192,0}}, color={0,0,127}));
  connect(const3.y, cold.u_m) annotation (Line(points={{199,-20},{180,-20},{180,-12}}, color={0,0,127}));
  connect(T_warm_in.port_b,absorptionChiller.port_a2)  annotation (Line(points={{60,-20},{60,-14},{66,-14},{66,-8}}, color={0,127,255}));
  connect(absorptionChiller.port_b2, T_warm_out.port_a) annotation (Line(points={{66,12},{66,16},{60,16},{60,20}},         color={0,127,255}));
  connect(T_warm_out.port_b,port_b2)  annotation (Line(points={{60,32},{60,100}},         color={0,127,255}));
  connect(absorptionChiller.port_a3, T_cold_in.port_b) annotation (Line(points={{70.2,12},{100,12},{100,14}},
                                                                                                          color={0,127,255}));
  connect(absorptionChiller.port_b3, T_cold_out.port_a) annotation (Line(points={{70,-8},{100,-8},{100,-14}},
                                                                                                            color={0,127,255}));
  connect(T_cold_out.port_b,port_b3)  annotation (Line(points={{100,-26},{100,-100}},
                                                                                    color={0,127,255}));
  connect(hot.y, idealPump.fSetPointAutomatic) annotation (Line(points={{169,50},{142,50},{142,68},{-8,68},{-8,39},{6,39}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[1], idealPump.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{-4,70},{-4,47},{6,47}}, color={255,0,255}));
  connect(bStatusOn, bStatusOn) annotation (Line(points={{-50,110},{-50,110}}, color={255,0,255}));
  connect(idealPump1.port_b, T_cold_in.port_a) annotation (Line(points={{94,60},{100,60},{100,26}}, color={0,127,255}));
  connect(cold.y, idealPump1.fSetPointAutomatic) annotation (Line(points={{169,0},{124,0},{124,62},{66,62},{66,51},{72,51}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[3], idealPump1.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{72,70},{72,59}}, color={255,0,255}));
  connect(idealPump1.bStatusOn, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{79,61},{79,81},{-30,81}}, color={255,0,255}));
  connect(idealPump.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{13,49},{13,81},{-30,81}}, color={255,0,255}));
  connect(idealPump1.bStatusOn, bStatusOn) annotation (Line(points={{79,61},{79,110},{-50,110}}, color={255,0,255}));
  connect(idealPump2.port_b, T_warm_in.port_a) annotation (Line(points={{60,-38},{60,-32}}, color={0,127,255}));
  connect(warm.y, idealPump2.fSetPointAutomatic) annotation (Line(points={{169,-50},{90,-50},{90,-74},{26,-74},{26,-47},{38,-47}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[2], idealPump2.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{-4,70},{-4,-38},{38,-38},{38,-39}}, color={255,0,255}));
  connect(idealPump2.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{45,-37},{45,81},{-30,81}}, color={255,0,255}));
  connect(integerExpression.y, idealPump.nControlModeAutomatic) annotation (Line(points={{-39,-16},{-18,-16},{-18,33},{6,33}}, color={255,127,0}));
  connect(integerExpression.y, idealPump1.nControlModeAutomatic) annotation (Line(points={{-39,-16},{36,-16},{36,45},{72,45}}, color={255,127,0}));
  connect(integerExpression.y, idealPump2.nControlModeAutomatic) annotation (Line(points={{-39,-16},{-18,-16},{-18,-53},{38,-53}}, color={255,127,0}));
  connect(booleanExpression.y, idealPump2.bAlgorithmPermission) annotation (Line(points={{-39,-34},{-10,-34},{-10,-43},{38,-43}}, color={255,0,255}));
  connect(booleanExpression.y, idealPump.bAlgorithmPermission) annotation (Line(points={{-39,-34},{-10,-34},{-10,43},{6,43}}, color={255,0,255}));
  connect(booleanExpression.y, idealPump1.bAlgorithmPermission) annotation (Line(points={{-39,-34},{-10,-34},{-10,55},{72,55}}, color={255,0,255}));
  connect(port_a1, T_hot_in.port_a) annotation (Line(points={{20,100},{20,94}}, color={0,127,255}));
  connect(T_hot_in.port_b, heatMeter.port_a) annotation (Line(points={{20,82},{20,80},{24,80}}, color={0,127,255}));
  connect(heatMeter.fHeatFlowRate, idealPump.fThermalPowerExternal) annotation (Line(points={{38.7,73},{48,73},{48,18},{18,18},{18,26}}, color={0,0,127}));
  connect(port_a2, heatMeter1.port_a) annotation (Line(points={{60,-100},{60,-86}}, color={0,127,255}));
  connect(idealPump2.port_a, heatMeter1.port_b) annotation (Line(points={{60,-58},{60,-72}}, color={0,127,255}));
  connect(heatMeter1.fHeatFlowRate, idealPump2.fThermalPowerExternal) annotation (Line(points={{45.3,-79},{40,-79},{40,-60},{50,-60}}, color={0,0,127}));
  connect(port_a2, port_b3) annotation (Line(points={{60,-100},{73,-100},{73,-100},{100,-100}}, color={0,127,255}));
  connect(port_a3, heatMeter2.port_a) annotation (Line(points={{102,100},{100,100},{100,88}}, color={0,127,255}));
  connect(heatMeter2.port_b, idealPump1.port_a) annotation (Line(points={{100,74},{100,40},{94,40}}, color={0,127,255}));
  connect(heatMeter2.fHeatFlowRate, idealPump1.fThermalPowerExternal) annotation (Line(points={{85.3,81},{84,81},{84,38}}, color={0,0,127}));
  connect(heatMeter.port_b, idealPump.port_a) annotation (Line(points={{24,66},{24,52},{32,52},{32,22},{28,22},{28,28}}, color={0,127,255}));
  connect(idealPump.port_b, absorptionChiller.port_a1) annotation (Line(points={{28,48},{42,48},{42,12},{62,12}}, color={0,127,255}));
  connect(T_cold_out.T, heatMeter2.fFeedTemperature) annotation (Line(points={{106.6,-20},{112,-20},{112,81},{101.4,81}}, color={0,0,127}));
  connect(T_warm_out.T, heatMeter1.fFeedTemperature) annotation (Line(points={{53.4,26},{50,26},{50,-36},{74,-36},{74,-79},{61.4,-79}}, color={0,0,127}));
  connect(absorptionChiller.port_b1, T_hot_in1.port_a) annotation (Line(points={{62,-8},{20,-8},{20,-70}}, color={0,127,255}));
  connect(T_hot_in1.port_b, port_b1) annotation (Line(points={{20,-82},{20,-100}}, color={0,127,255}));
  connect(T_hot_in1.T, heatMeter.fFeedTemperature) annotation (Line(points={{13.4,-76},{4,-76},{4,73},{22.6,73}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
end AbsorptionChillerSystem;
