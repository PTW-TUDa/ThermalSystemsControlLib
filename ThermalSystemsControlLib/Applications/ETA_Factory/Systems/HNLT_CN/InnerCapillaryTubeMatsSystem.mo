within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNLT_CN;
model InnerCapillaryTubeMatsSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatExchanger_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);
  Components.Pumps.Pump PU405(redeclare package Medium = Medium,
                              pumpType=6)
                              annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Components.Pumps.Pump PU500(redeclare package Medium = Medium,
                              pumpType=10)
                              annotation (Placement(transformation(extent={{40,40},{60,20}})));
  Components.HeatExchanger.PhysicalModels.HeatExchanger HeatExchanger3(
    redeclare replaceable package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    redeclare Records.PWT3_SWEP_40kW deviceData) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={70,0})));
  Components.HeatMeter.HeatMeter WMZ405(redeclare package Medium = Medium)
                                        annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Components.Valves.ThreeWayValve RV500(
    redeclare package Medium = Medium,
    k=0.01,                             redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{40,80},{60,60}})));
  Components.Valves.TwoWayValve SV_HNLT(redeclare package Medium = Medium,
                                        redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-80},{80,-60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{66,20},{74,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=70) annotation (Placement(transformation(extent={{64,-34},{72,-24}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    redeclare package Medium = Medium,
    length=1,
    diameter=0.015,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={20,60})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=50) annotation (Placement(transformation(extent={{66,28},{74,36}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=50) annotation (Placement(transformation(extent={{26,24},{34,34}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression3(y=0) annotation (Placement(transformation(extent={{26,30},{34,40}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression4(y=0) annotation (Placement(transformation(extent={{64,-40},{72,-30}})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{40,-80},{20,-60}})));
  Modelica.Fluid.Sensors.Temperature temperature3(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,80},{80,100}})));
  Components.Consumer.PhysicalModels.Consumer_InherentHeatCapacity InnerCapillaryTubeMats(
    redeclare package Medium = Medium,
    V_int=0.2,
    C=3*44000000,
    R_MediumToComponent=0.0005,
    R_ComponentToAmbient=0.001)
                     annotation (Placement(transformation(
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
  Components.Valves.TwoWayValve SV(k=0.1,
    redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{-30,-100},{-10,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{0,-120},{20,-100}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=30000,
    m_flow_nominal=1.5)                                     annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={30,-50})));
  Components.Valves.ThreeWayValve SVHNLT_CN(redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,-140},{80,-120}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression6(y=0) annotation (Placement(transformation(extent={{44,-140},{52,-130}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=100)
                                                             annotation (Placement(transformation(extent={{44,-136},{52,-124}})));
  Modelica.Blocks.Interfaces.BooleanInput bHeatingModeAutomatic annotation (Placement(transformation(extent={{-140,-110},{-100,-70}})));
  Components.Valves.ThreeWayValve SV1(redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,140},{80,120}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression7(y=0) annotation (Placement(transformation(extent={{42,130},{50,140}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=100)
                                                             annotation (Placement(transformation(extent={{42,124},{50,136}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT1(redeclare package Medium = Medium)                                           annotation (Placement(transformation(extent={{50,90},{70,110}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin annotation (Placement(transformation(extent={{-3,-3},{3,3}},
        rotation=90,
        origin={-1,-11})));
equation
   if bHeatingModeAutomatic == true then
     RV500.nControlModeAutomatic = 1;
     SV.nControlModeAutomatic = 1;
   else
     RV500.nControlModeAutomatic = 2;
     SV.nControlModeAutomatic = 2;
   end if;

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
  connect(PU500.nControlModeAutomatic, integerExpression3.y) annotation (Line(points={{38,35},{34.4,35}}, color={255,127,0}));
  connect(PU405.nControlModeAutomatic, integerExpression4.y) annotation (Line(points={{78,-35},{72.4,-35}}, color={255,127,0}));
  connect(temperature2.T,PU500. fTemperatureExternal) annotation (Line(points={{23,-70},{20,-70},{20,42},{45,42}}, color={0,0,127}));
  connect(WMZ405.port_a, SV_HNLT.port_b) annotation (Line(points={{100,60},{100,40}}, color={0,127,255}));
  connect(WMZ405.fFeedTemperature, temperature1.T) annotation (Line(points={{102,70},{120,70},{120,-70},{83,-70}}, color={0,0,127}));
  connect(WMZ405.fHeatFlowRate,PU405. fThermalPowerExternal) annotation (Line(points={{79,70},{95,70},{95,-42}}, color={0,0,127}));
  connect(temperature3.port, WMZ405.port_b) annotation (Line(points={{90,80},{100,80}}, color={0,127,255}));
  connect(temperature3.T,PU405. fTemperatureExternal) annotation (Line(points={{83,90},{85,90},{85,-42}}, color={0,0,127}));
  connect(fAmbientTemperature,combiTable1D. u[1]) annotation (Line(points={{-120,-30},{-80,-30},{-80,-20},{-62,-20}},   color={0,0,127}));
  connect(prescribedTemperature.T, fAmbientTemperature) annotation (Line(points={{-62,-50},{-92,-50},{-92,-30},{-120,-30}},
                                                                                                        color={0,0,127}));
  connect(prescribedTemperature.port, InnerCapillaryTubeMats.port_ambient) annotation (Line(points={{-40,-50},{-20.6,-50}}, color={191,0,0}));
  connect(combiTable1D.y[1], RV500.fSetPointAutomatic) annotation (Line(points={{-39,-20},{30,-20},{30,69},{38,69}}, color={0,0,127}));
  connect(InnerCapillaryTubeMats.port_a, SV.port_b) annotation (Line(points={{-10,-60},{-10,-80}}, color={0,127,255}));
  connect(selectSetPoint.fSetPoint, SV.fSetPointAutomatic) annotation (Line(points={{-59,30},{-40,30},{-40,-89},{-32,-89}}, color={0,0,127}));
  connect(SV.bAlgorithmPermission, RV500.bAlgorithmPermission) annotation (Line(points={{-32,-85},{20,-85},{20,65},{38,65}}, color={255,0,255}));
  connect(SV.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{-32,-81},{10,-81},{10,70},{-19,70}}, color={255,0,255}));
  connect(WMZ405.fHeatFlowRate, SV_HNLT.fThermalPowerExternal) annotation (Line(points={{79,70},{80,70},{80,48},{95,48},{95,18}}, color={0,0,127}));
  connect(RV500.fTemperatureExternal, PU500.fTemperatureExternal) annotation (Line(points={{45,82},{40,82},{40,42},{45,42}}, color={0,0,127}));
  connect(SV.fThermalPowerExternal, PU405.fThermalPowerExternal) annotation (Line(points={{-15,-102},{-15,-90},{70,-90},{70,-30},{95,-30},{95,-42}}, color={0,0,127}));
  connect(SV_HNLT.fTemperatureExternal, SV_HNLT.fThermalPowerExternal) annotation (Line(points={{85,18},{95,18}}, color={0,0,127}));
  connect(InnerCapillaryTubeMats.T_Room, SV.fTemperatureExternal) annotation (Line(points={{-3,-39},{-3,-74},{-25,-74},{-25,-102}}, color={0,0,127}));
  connect(pressureDrop.port_b, SV.port_a) annotation (Line(points={{40,-60},{40,-100},{-10,-100}}, color={0,127,255}));
  connect(boundary.ports[1], SV.port_a) annotation (Line(points={{20,-110},{40,-110},{40,-100},{-10,-100}}, color={0,127,255}));
  connect(temperature2.port, SV.port_a) annotation (Line(points={{30,-80},{40,-80},{40,-100},{-10,-100}}, color={0,127,255}));
  connect(PU500.port_b, pressureDrop.port_a) annotation (Line(points={{60,20},{60,-40},{40,-40}},
                                                                                         color={0,127,255}));
  connect(pipe2.port_b, RV500.port_a1) annotation (Line(points={{10,70},{60,70}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_b, pipe2.port_a) annotation (Line(points={{-10,-40},{-10,50},{10,50}}, color={0,127,255}));
  connect(HeatExchanger3.port_a1, pipe2.port_a) annotation (Line(points={{66,10},{66,90},{-10,90},{-10,50},{10,50}}, color={0,127,255}));
  connect(RV500.port_a,HeatExchanger3. port_b1) annotation (Line(points={{60,80},{70,80},{70,-10},{66,-10}}, color={0,127,255}));
  connect(temperature1.port, PU405.port_a) annotation (Line(points={{90,-80},{100,-80},{100,-40}}, color={0,127,255}));
  connect(SVHNLT_CN.port_a, port_a_HNLT) annotation (Line(points={{80,-140},{100,-140},{100,-100}}, color={0,127,255}));
  connect(port_a_CN, SVHNLT_CN.port_a1) annotation (Line(points={{60,-100},{60,-130},{80,-130}}, color={0,127,255}));
  connect(SVHNLT_CN.port_b, PU405.port_a) annotation (Line(points={{80,-120},{80,-80},{100,-80},{100,-40}}, color={0,127,255}));
  connect(SVHNLT_CN.fThermalPowerExternal, temperature1.T) annotation (Line(points={{75.2,-142},{120,-142},{120,-70},{83,-70}}, color={0,0,127}));
  connect(SVHNLT_CN.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-142},{120,-142},{120,-70},{83,-70}}, color={0,0,127}));
  connect(integerExpression6.y, SVHNLT_CN.nControlModeAutomatic) annotation (Line(points={{52.4,-135},{54.2,-135},{54.2,-135},{58,-135}}, color={255,127,0}));
  connect(realExpression4.y, SVHNLT_CN.fSetPointAutomatic) annotation (Line(points={{52.4,-130},{56,-130},{56,-129},{58,-129}}, color={0,0,127}));
  connect(SVHNLT_CN.bAlgorithmPermission, RV500.bAlgorithmPermission) annotation (Line(points={{58,-125},{20,-125},{20,65},{38,65}}, color={255,0,255}));
  connect(SVHNLT_CN.bSetStatusOnAutomatic, bHeatingModeAutomatic) annotation (Line(points={{58,-121},{-80,-121},{-80,-90},{-120,-90}}, color={255,0,255}));
  connect(SV1.nControlModeAutomatic,integerExpression7. y) annotation (Line(points={{58,135},{58,136},{50.4,136},{50.4,135}}, color={255,127,0}));
  connect(SV1.fSetPointAutomatic,realExpression5. y) annotation (Line(points={{58,129},{54,129},{54,130},{50.4,130}}, color={0,0,127}));
  connect(SV1.port_a,port_b_HNLT)  annotation (Line(points={{80,140},{100,140},{100,100}}, color={0,127,255}));
  connect(SV1.port_a1,port_b_HNLT1)  annotation (Line(points={{80,130},{60,130},{60,100}}, color={0,127,255}));
  connect(SV1.port_b, WMZ405.port_b) annotation (Line(points={{80,120},{80,80},{100,80}}, color={0,127,255}));
  connect(SV1.fThermalPowerExternal, temperature3.T) annotation (Line(points={{75.2,142},{76,142},{76,160},{83,160},{83,90}}, color={0,0,127}));
  connect(SV1.fTemperatureExternal, temperature3.T) annotation (Line(points={{65,142},{66,142},{66,160},{83,160},{83,90}}, color={0,0,127}));
  connect(SV1.bAlgorithmPermission, RV500.bAlgorithmPermission) annotation (Line(points={{58,125},{20,125},{20,65},{38,65}}, color={255,0,255}));
  connect(SV1.bSetStatusOnAutomatic, bHeatingModeAutomatic) annotation (Line(points={{58,121},{4,121},{4,-121},{-80,-121},{-80,-90},{-120,-90}}, color={255,0,255}));
  connect(fromKelvin.Kelvin, InnerCapillaryTubeMats.T_Room) annotation (Line(points={{-1,-14.6},{-1,-39},{-3,-39}}, color={0,0,127}));
  connect(fromKelvin.Celsius, selectSetPoint.fOperatingPoint) annotation (Line(points={{-1,-7.7},{-1,0},{-70,0},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end InnerCapillaryTubeMatsSystem;
