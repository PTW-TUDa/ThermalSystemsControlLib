within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT;
model StaticHeatingSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  Components.Valves.ThreeWayValve RV350(         redeclare ThermalSystemsControlLib.Applications.ETA_Factory.Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Components.Pumps.Pump PU350 annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Components.Pipes.PhysicalModels.PressureDrop pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=41000,
    m_flow_nominal=0.15)                                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,70})));
  Components.HeatMeter.HeatMeter WMZ350 annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium)
                                                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,90})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{42,4},{52,18}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=1) annotation (Placement(transformation(extent={{40,-74},{52,-56}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Modelica.Blocks.Interfaces.RealInput fAmbientTemperature
                                                          annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[-10 + 273.15,343.15; 10 + 273.15,323.15],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=1,
    diameter=0.015,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,30})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{44,-4},{52,10}})));
  Components.Consumer.PhysicalModels.Consumer_InherentHeatCapacity StaticHeating(
    redeclare package Medium = Medium,
    V_int=0.05,
    C=1410000,
    R_MediumToComponent=0.0001,
    R_ComponentToAmbient=0.003)
                     annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,40})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Components.Valves.TwoWayValve SV(
    k=0.01,
    yMin=0.001,
    redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin annotation (Placement(transformation(extent={{-3,-3},{3,3}},
        rotation=180,
        origin={27,55})));
equation
  connect(temperature.port_b, port_b) annotation (Line(points={{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.T,WMZ350. fFeedTemperature) annotation (Line(points={{91,90},{96,90},{96,-90},{82,-90}}, color={0,0,127}));
  connect(bAlgorithmPermission,PU350. bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,15},{58,15}}, color={255,0,255}));
  connect(RV350.bAlgorithmPermission,PU350. bAlgorithmPermission) annotation (Line(points={{58,-55},{20,-55},{20,15},{58,15}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[2],PU350. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{40,70},{40,20},{58,20},{58,19}},
                                                                                                                                         color={255,0,255}));
  connect(RV350.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{58,-51},{40,-51},{40,70},{-19,70}}, color={255,0,255}));
  connect(realExpression.y,PU350. fSetPointAutomatic) annotation (Line(points={{52.5,11},{58,11}},               color={0,0,127}));
  connect(integerExpression2.y,RV350. nControlModeAutomatic) annotation (Line(points={{52.6,-65},{52,-65},{52,-66},{56,-66},{56,-65},{58,-65}},
                                                                                                                                             color={255,127,0}));
  connect(RV350.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,-72},{65,-56},{83,-56},{83,-10}}, color={0,0,127}));
  connect(PU350.bStatusOn, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{65,21},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(fAmbientTemperature, combiTable1D.u[1]) annotation (Line(points={{-120,-30},{-102,-30},{-102,-50},{-82,-50}}, color={0,0,127}));
  connect(RV350.fSetPointAutomatic, combiTable1D.y[1]) annotation (Line(points={{58,-59},{14,-59},{14,-50},{-59,-50}}, color={0,0,127}));
  connect(WMZ350.fHeatFlowRate, RV350.fThermalPowerExternal) annotation (Line(points={{59,-90},{75.2,-90},{75.2,-72}}, color={0,0,127}));
  connect(RV350.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{65,-49},{65,100},{-30,100},{-30,81}}, color={255,0,255}));
  connect(bStatusOn, PU350.bStatusOn) annotation (Line(points={{-50,110},{-50,100},{65,100},{65,21}}, color={255,0,255}));
  connect(PU350.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{58,5},{56,5},{56,3},{52.4,3}},
                                                                                                          color={255,127,0}));
  connect(WMZ350.port_a, port_a) annotation (Line(points={{80,-100},{100,-100}},          color={0,127,255}));
  connect(WMZ350.port_b, RV350.port_a) annotation (Line(points={{80,-80},{80,-70}}, color={0,127,255}));
  connect(RV350.port_b, temperature1.port) annotation (Line(points={{80,-50},{86,-50},{86,-20},{90,-20}},
                                                                                        color={0,127,255}));
  connect(RV350.port_a1, pipe2.port_b) annotation (Line(points={{80,-60},{100,-60},{100,20}}, color={0,127,255}));
  connect(StaticHeating.port_b, pressureDrop.port_a) annotation (Line(points={{80,50},{80,60}}, color={0,127,255}));
  connect(fAmbientTemperature, prescribedTemperature.T) annotation (Line(points={{-120,-30},{-100,-30},{-100,-20},{-82,-20}}, color={0,0,127}));
  connect(prescribedTemperature.port, StaticHeating.port_ambient) annotation (Line(points={{-60,-20},{10,-20},{10,40},{69.4,40}}, color={191,0,0}));
  connect(SV.port_a, RV350.port_b) annotation (Line(points={{80,-40},{80,-50}}, color={0,127,255}));
  connect(SV.bAlgorithmPermission, PU350.bAlgorithmPermission) annotation (Line(points={{58,-25},{20,-25},{20,15},{58,15}}, color={255,0,255}));
  connect(SV.nControlModeAutomatic, integerExpression2.y) annotation (Line(points={{58,-35},{52.6,-35},{52.6,-65}}, color={255,127,0}));
  connect(SV.bSetStatusOnAutomatic, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{58,-21},{40,-21},{40,70},{-19,70}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, SV.fSetPointAutomatic) annotation (Line(points={{-59,30},{16,30},{16,-29},{58,-29}}, color={0,0,127}));
  connect(SV.fTemperatureExternal, StaticHeating.T_Room) annotation (Line(points={{65,-42},{64,-42},{64,-44},{88,-44},{88,51},{87,51}}, color={0,0,127}));
  connect(temperature.port_a, pressureDrop.port_b) annotation (Line(points={{80,80},{80,80}}, color={0,127,255}));
  connect(StaticHeating.port_a, PU350.port_b) annotation (Line(points={{80,30},{80,20}}, color={0,127,255}));
  connect(PU350.port_a, SV.port_b) annotation (Line(points={{80,0},{80,-20}}, color={0,127,255}));
  connect(PU350.fThermalPowerExternal, temperature1.T) annotation (Line(points={{75,-2},{83,-2},{83,-10}}, color={0,0,127}));
  connect(PU350.fTemperatureExternal, PU350.fThermalPowerExternal) annotation (Line(points={{65,-2},{75,-2}}, color={0,0,127}));
  connect(SV.fThermalPowerExternal, StaticHeating.T_Room) annotation (Line(points={{75,-42},{75,-44},{88,-44},{88,51},{87,51}}, color={0,0,127}));
  connect(fromKelvin.Kelvin, StaticHeating.T_Room) annotation (Line(points={{30.6,55},{87,55},{87,51}}, color={0,0,127}));
  connect(fromKelvin.Celsius, selectSetPoint.fOperatingPoint) annotation (Line(points={{23.7,55},{0,55},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end StaticHeatingSystem;
