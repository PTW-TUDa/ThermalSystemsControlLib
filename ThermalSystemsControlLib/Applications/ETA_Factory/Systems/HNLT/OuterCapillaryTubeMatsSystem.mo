within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNLT;
model OuterCapillaryTubeMatsSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatExchanger_Icon;
  Components.Pumps.Pump PU235(redeclare package Medium = Medium, pumpType=6)
                              annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Components.Pumps.Pump PU600(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, pumpType=5)
                              annotation (Placement(transformation(extent={{40,40},{60,20}})));
  Components.HeatExchanger.PhysicalModels.HeatExchanger_Physical HeatExchanger6(
    redeclare replaceable package Medium1 = Modelica.Media.Incompressible.Examples.Glycol47,
    redeclare package Medium2 = Medium,
    redeclare Records.PWT6_SWEP_30kW deviceData)                                                                                                                               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={70,0})));
  Components.HeatMeter.HeatMeter WMZ235(redeclare package Medium = Medium)
                                        annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Components.Valves.ThreeWayValve RV600(
    redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47,
                                        k=0.1,
                                        redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{40,80},{60,60}})));
  Components.Valves.TwoWayValve SV235(redeclare package Medium = Medium, redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-80},{80,-60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{66,20},{74,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.7)
                                                               annotation (Placement(transformation(extent={{64,-34},{72,-24}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=2) annotation (Placement(transformation(extent={{26,70},{34,80}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47,
    length=1,
    diameter=0.015,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,-30})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1)  annotation (Placement(transformation(extent={{66,28},{74,36}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=0.7)
                                                               annotation (Placement(transformation(extent={{26,24},{34,34}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression3(y=0) annotation (Placement(transformation(extent={{26,30},{34,40}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression4(y=0) annotation (Placement(transformation(extent={{64,-40},{72,-30}})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47)
                                                                                     annotation (Placement(transformation(extent={{60,-80},{40,-60}})));
  Modelica.Fluid.Sensors.Temperature temperature3(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,80},{80,100}})));
  Components.Consumer.PhysicalModels.OuterCapillaryTubeMats
                                                  OuterCapillaryTubeMats(
    redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47,
    V_int=0.05,
    R_Wall=0.000116)                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-10,-50})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Interfaces.RealInput fAmbientTemperature
                                                          annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{20,-100},{40,-80}})));
equation
  connect(HeatExchanger6.port_a2,PU235. port_b) annotation (Line(points={{74,-10},{100,-10},{100,-20}}, color={0,127,255}));
  connect(HeatExchanger6.port_a1,PU600. port_b) annotation (Line(points={{66,10},{60,10},{60,20}}, color={0,127,255}));
  connect(pipe2.port_a,HeatExchanger6. port_b1) annotation (Line(points={{40,-40},{50,-40},{50,-10},{66,-10}}, color={0,127,255}));
  connect(pipe2.port_b,RV600. port_a1) annotation (Line(points={{40,-20},{40,70},{60,70}}, color={0,127,255}));
  connect(HeatExchanger6.port_b2, SV235.port_a) annotation (Line(points={{74,10},{80,10},{80,20},{100,20}}, color={0,127,255}));
  connect(RV600.port_b,PU600. port_a) annotation (Line(points={{60,60},{60,40}}, color={0,127,255}));
  connect(bAlgorithmPermission,RV600. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(PU600.bAlgorithmPermission,RV600. bAlgorithmPermission) annotation (Line(points={{38,25},{20,25},{20,65},{38,65}}, color={255,0,255}));
  connect(SV235.bAlgorithmPermission, RV600.bAlgorithmPermission) annotation (Line(points={{78,35},{66,35},{66,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(PU235.bAlgorithmPermission,RV600. bAlgorithmPermission) annotation (Line(points={{78,-25},{66,-25},{66,50},{20,50},{20,65},{38,65}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[1],RV600. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{10,70},{10,60},{36,60},{36,61},{38,61}}, color={255,0,255}));
  connect(PU600.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{38,21},{38,20},{10,20},{10,70},{-19,70}}, color={255,0,255}));
  connect(SV235.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{78,39},{10,39},{10,70},{-19,70}}, color={255,0,255}));
  connect(PU235.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{78,-21},{10,-21},{10,70},{-19,70}}, color={255,0,255}));
  connect(RV600.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{45,59},{45,81},{-30,81}}, color={255,0,255}));
  connect(PU600.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{45,19},{45,81},{-30,81}}, color={255,0,255}));
  connect(PU600.bStatusOn, bStatusOn) annotation (Line(points={{45,19},{45,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(PU600.fThermalPowerExternal, SV235.fThermalPowerExternal) annotation (Line(points={{55,42},{55,48},{95,48},{95,18}}, color={0,0,127}));
  connect(RV600.fThermalPowerExternal,PU235. fThermalPowerExternal) annotation (Line(points={{55.2,82},{56,82},{56,88},{95,88},{95,-42}}, color={0,0,127}));
  connect(integerExpression2.y, SV235.nControlModeAutomatic) annotation (Line(points={{74.4,25},{78,25}}, color={255,127,0}));
  connect(SV235.fSetPointAutomatic, realExpression2.y) annotation (Line(points={{78,31},{76,31},{76,32},{74.4,32}}, color={0,0,127}));
  connect(realExpression1.y,PU235. fSetPointAutomatic) annotation (Line(points={{72.4,-29},{75.2,-29},{75.2,-29},{78,-29}}, color={0,0,127}));
  connect(PU600.fSetPointAutomatic, realExpression3.y) annotation (Line(points={{38,29},{34.4,29}}, color={0,0,127}));
  connect(RV600.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{38,75},{34.4,75}}, color={255,127,0}));
  connect(PU600.nControlModeAutomatic, integerExpression3.y) annotation (Line(points={{38,35},{34.4,35}}, color={255,127,0}));
  connect(PU235.nControlModeAutomatic, integerExpression4.y) annotation (Line(points={{78,-35},{72.4,-35}}, color={255,127,0}));
  connect(temperature2.port,HeatExchanger6. port_b1) annotation (Line(points={{50,-80},{60,-80},{60,-10},{66,-10}}, color={0,127,255}));
  connect(temperature2.T,PU600. fTemperatureExternal) annotation (Line(points={{43,-70},{40,-70},{40,42},{45,42}}, color={0,0,127}));
  connect(WMZ235.port_a, SV235.port_b) annotation (Line(points={{100,60},{100,40}}, color={0,127,255}));
  connect(WMZ235.port_b, port_b) annotation (Line(points={{100,80},{100,100}}, color={0,127,255}));
  connect(WMZ235.fFeedTemperature, temperature1.T) annotation (Line(points={{102,70},{120,70},{120,-70},{83,-70}}, color={0,0,127}));
  connect(temperature1.port, port_a) annotation (Line(points={{90,-80},{100,-80},{100,-100}}, color={0,127,255}));
  connect(PU235.port_a, port_a) annotation (Line(points={{100,-40},{100,-100}}, color={0,127,255}));
  connect(WMZ235.fHeatFlowRate,PU235. fThermalPowerExternal) annotation (Line(points={{79,70},{95,70},{95,-42}}, color={0,0,127}));
  connect(temperature3.port,WMZ235. port_b) annotation (Line(points={{90,80},{100,80}}, color={0,127,255}));
  connect(temperature3.T,PU235. fTemperatureExternal) annotation (Line(points={{83,90},{85,90},{85,-42}}, color={0,0,127}));
  connect(OuterCapillaryTubeMats.port_b,RV600. port_a) annotation (Line(points={{-10,-40},{-10,94},{60,94},{60,80}}, color={0,127,255}));
  connect(prescribedTemperature.T, fAmbientTemperature) annotation (Line(points={{-62,-50},{-92,-50},{-92,-30},{-120,-30}},
                                                                                                        color={0,0,127}));
  connect(prescribedTemperature.port,OuterCapillaryTubeMats. port_ambient) annotation (Line(points={{-40,-50},{-20.6,-50}}, color={191,0,0}));
  connect(WMZ235.fHeatFlowRate, SV235.fThermalPowerExternal) annotation (Line(points={{79,70},{80,70},{80,48},{95,48},{95,18}}, color={0,0,127}));
  connect(OuterCapillaryTubeMats.port_a, temperature2.port) annotation (Line(points={{-10,-60},{-10,-80},{50,-80}}, color={0,127,255}));
  connect(selectSetPoint.fSetPoint, RV600.fSetPointAutomatic) annotation (Line(points={{-59,30},{6,30},{6,69},{38,69}}, color={0,0,127}));
  connect(RV600.fTemperatureExternal, temperature3.T) annotation (Line(points={{45,82},{45,90},{83,90}}, color={0,0,127}));
  connect(temperature3.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{83,90},{0,90},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(boundary.ports[1], HeatExchanger6.port_b1) annotation (Line(points={{40,-90},{60,-90},{60,-10},{66,-10}}, color={0,127,255}));
  connect(SV235.fTemperatureExternal, SV235.fThermalPowerExternal) annotation (Line(points={{85,18},{90,18},{90,18},{95,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end OuterCapillaryTubeMatsSystem;
