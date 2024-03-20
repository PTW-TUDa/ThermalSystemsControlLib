within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNLT;
model HVFAStorageSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous_Storage(systemFlowControl(nComponents=1));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  parameter SI.Temperature T_start "Start value for temperature";
  Components.BufferStorage.BufferStorage HVFAStorage(
    redeclare package Medium = Medium2,
    V=25,
    n_Seg=6,
    T_start=T_start) annotation (Placement(transformation(extent={{220,8},{200,28}})));
  Components.Valves.ThreeWayValve SVx05(redeclare package Medium = Medium1, redeclare Records.SV deviceData) annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  Components.Pumps.Pump PUx05(redeclare package Medium = Medium1, pumpType=7)
                                           annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Components.Valves.ThreeWayValve SVx06(redeclare Records.SV deviceData) annotation (Placement(transformation(extent={{80,90},{100,70}})));
  Components.HeatMeter.HeatMeter WMZx05 annotation (Placement(transformation(extent={{80,40},{100,60}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{60,78},{72,92}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100)
                                                             annotation (Placement(transformation(extent={{60,66},{72,80}})));
  Components.BufferStorage.Interfaces.BufferStorageState localStorageState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Components.HeatExchanger.PhysicalModels.HeatExchanger HeatExchanger5(
    redeclare replaceable package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    redeclare Records.HEX5 deviceData) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={104,18})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{78,10},{98,30}})));
  Components.Pumps.Pump PU7x0(redeclare package Medium = Medium2, pumpType=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={150,-10})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    redeclare package Medium = Medium2,
    length=50,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={130,50})));
  Components.HeatMeter.HeatMeter WMZ7x0(redeclare package Medium = Medium2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={170,50})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{200,0},{180,20}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium2, nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={210,70})));
  Components.Valves.ThreeWayValve RVx05(redeclare package Medium = Medium1, redeclare Records.SV deviceData) annotation (Placement(transformation(extent={{80,-50},{100,-30}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=0) annotation (Placement(transformation(extent={{-6,-7},{6,7}},
        rotation=90,
        origin={154,-33})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=100)
                                                             annotation (Placement(transformation(extent={{-6,-7},{6,7}},
        rotation=90,
        origin={146,-33})));
equation
  connect(SVx06.port_b,WMZx05. port_b) annotation (Line(points={{100,70},{100,60}},          color={0,127,255}));
  connect(HeatExchanger5.port_a1, PUx05.port_b) annotation (Line(points={{100,8},{100,0}}, color={0,127,255}));
  connect(HeatExchanger5.port_b1, WMZx05.port_a) annotation (Line(points={{100,28},{100,40}}, color={0,127,255}));
  connect(SVx05.port_a1, port_a2) annotation (Line(points={{100,-70},{120,-70},{120,-100},{100,-100}}, color={0,127,255}));
  connect(SVx05.port_a, port_b1) annotation (Line(points={{100,-80},{80,-80},{80,-100},{60,-100}}, color={0,127,255}));
  connect(SVx06.port_a1, port_b2) annotation (Line(points={{100,80},{120,80},{120,100},{100,100}}, color={0,127,255}));
  connect(SVx06.port_a, port_a1) annotation (Line(points={{100,90},{80,90},{80,100},{60,100}}, color={0,127,255}));
  connect(SVx06.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,85},{72.6,85}}, color={255,127,0}));
  connect(PUx05.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,-15},{76,-15},{76,-6},{72.6,-6},{72.6,85}}, color={255,127,0}));
  connect(SVx05.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,-75},{78,-74},{72,-74},{72,-6},{72.6,-6},{72.6,85}}, color={255,127,0}));
  connect(SVx06.fSetPointAutomatic, realExpression.y) annotation (Line(points={{78,79},{72.6,79},{72.6,73}}, color={0,0,127}));
  connect(SVx05.fSetPointAutomatic, realExpression.y) annotation (Line(points={{78,-69},{72.6,-69},{72.6,73}}, color={0,0,127}));
  connect(bAlgorithmPermission, SVx06.bAlgorithmPermission) annotation (Line(points={{-120,50},{60,50},{60,75},{78,75}}, color={255,0,255}));
  connect(PUx05.bAlgorithmPermission, SVx06.bAlgorithmPermission) annotation (Line(points={{78,-5},{60,-5},{60,75},{78,75}}, color={255,0,255}));
  connect(SVx05.bAlgorithmPermission, SVx06.bAlgorithmPermission) annotation (Line(points={{78,-65},{60,-65},{60,75},{78,75}}, color={255,0,255}));
  connect(pipe2.port_b, HeatExchanger5.port_a2) annotation (Line(points={{120,40},{108,40},{108,28}}, color={0,127,255}));
  connect(WMZ7x0.port_b, pipe2.port_a) annotation (Line(points={{160,40},{140,40}}, color={0,127,255}));
  connect(HVFAStorage.port_a, PU7x0.port_a) annotation (Line(points={{200,8},{200,0},{160,0}}, color={0,127,255}));
  connect(HVFAStorage.port_b, WMZ7x0.port_a) annotation (Line(points={{200,28},{200,40},{180,40}}, color={0,127,255}));
  connect(HVFAStorage.port_a, temperature2.port) annotation (Line(points={{200,8},{200,0},{190,0}}, color={0,127,255}));
  connect(temperature2.T, WMZ7x0.fFeedTemperature) annotation (Line(points={{183,10},{182,10},{182,20},{170,20},{170,38}}, color={0,0,127}));
  connect(HeatExchanger5.port_b2, PU7x0.port_b) annotation (Line(points={{108,8},{108,0},{140,0}}, color={0,127,255}));
  connect(boundary.ports[1], WMZ7x0.port_a) annotation (Line(points={{200,70},{200,40},{180,40}}, color={0,127,255}));
  connect(temperature1.port, HeatExchanger5.port_a1) annotation (Line(points={{88,10},{88,8},{100,8}}, color={0,127,255}));
  connect(temperature1.T, WMZx05.fFeedTemperature) annotation (Line(points={{95,20},{88,20},{88,50},{102,50}}, color={0,0,127}));
  connect(WMZx05.fHeatFlowRate, SVx06.fThermalPowerExternal) annotation (Line(points={{79,50},{84,50},{84,80},{95.2,80},{95.2,92}}, color={0,0,127}));
  connect(SVx06.fTemperatureExternal, SVx06.fThermalPowerExternal) annotation (Line(points={{85,92},{84,92},{84,80},{95.2,80},{95.2,92}}, color={0,0,127}));
  connect(PUx05.fTemperatureExternal, WMZx05.fFeedTemperature) annotation (Line(points={{85,-22},{84,-22},{84,20},{88,20},{88,50},{102,50}}, color={0,0,127}));
  connect(RVx05.fTemperatureExternal, PUx05.fTemperatureExternal) annotation (Line(points={{85,-52},{85,-52},{85,-22}}, color={0,0,127}));
  connect(WMZx05.fHeatFlowRate,PUx05. fThermalPowerExternal) annotation (Line(points={{79,50},{76,50},{76,12},{80,12},{80,-14},{95,-14},{95,-22}}, color={0,0,127}));
  connect(RVx05.fThermalPowerExternal, PUx05.fThermalPowerExternal) annotation (Line(points={{95.2,-52},{95,-52},{95,-22}}, color={0,0,127}));
  connect(SVx05.fThermalPowerExternal, RVx05.fThermalPowerExternal) annotation (Line(points={{95.2,-82},{95.2,-82},{95.2,-52}}, color={0,0,127}));
  connect(RVx05.fTemperatureExternal, SVx05.fTemperatureExternal) annotation (Line(points={{85,-52},{85,-68},{85,-68},{85,-82}}, color={0,0,127}));
  connect(SVx06.bSetStatusOnAutomatic, SVx05.bSetStatusOnAutomatic) annotation (Line(points={{78,71},{40,71},{40,-61},{78,-61}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[1],PUx05. bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{20,70},{20,-1},{78,-1}}, color={255,0,255}));
  connect(RVx05.bAlgorithmPermission, SVx06.bAlgorithmPermission) annotation (Line(points={{78,-35},{60,-35},{60,75},{78,75}}, color={255,0,255}));
  connect(RVx05.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,-45},{72,-45},{72,-4},{72.6,-4},{72.6,85}}, color={255,127,0}));
  connect(RVx05.fSetPointAutomatic, realExpression.y) annotation (Line(points={{78,-39},{72.6,-39},{72.6,73}}, color={0,0,127}));
  connect(RVx05.bSetStatusOnAutomatic, PUx05.bSetStatusOnAutomatic) annotation (Line(points={{78,-31},{20,-31},{20,-1},{78,-1}}, color={255,0,255}));
  connect(PU7x0.bAlgorithmPermission, SVx06.bAlgorithmPermission) annotation (Line(points={{145,-22},{144,-22},{144,-24},{60,-24},{60,75},{78,75}}, color={255,0,255}));
  connect(PU7x0.bSetStatusOnAutomatic,PUx05. bSetStatusOnAutomatic) annotation (Line(points={{141,-22},{141,-40},{20,-40},{20,-1},{78,-1}}, color={255,0,255}));
  connect(PUx05.fSetPointAutomatic, selectSetPoint.fSetPoint) annotation (Line(points={{78,-9},{50,-9},{50,30},{-59,30}}, color={0,0,127}));
  connect(PUx05.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{90,1},{90,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PUx05.bStatusOn, bStatusOn) annotation (Line(points={{85,1},{85,110},{-50,110}}, color={255,0,255}));
  connect(PUx05.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{85,1},{85,110},{-30,110},{-30,81}}, color={255,0,255}));
  connect(PU7x0.fSetPointAutomatic, realExpression1.y) annotation (Line(points={{149,-22},{148,-22},{148,-26.4},{146,-26.4}}, color={0,0,127}));
  connect(PU7x0.nControlModeAutomatic, integerExpression2.y) annotation (Line(points={{155,-22},{154,-22},{154,-26.4}}, color={255,127,0}));
  connect(WMZ7x0.fHeatFlowRate, PU7x0.fThermalPowerExternal) annotation (Line(points={{170,61},{170,60},{150,60},{150,-5},{162,-5}}, color={0,0,127}));
  connect(PU7x0.fTemperatureExternal, PU7x0.fThermalPowerExternal) annotation (Line(points={{162,-15},{150,-15},{150,-5},{162,-5}}, color={0,0,127}));
  connect(RVx05.port_b, PUx05.port_a) annotation (Line(points={{100,-30},{100,-20}}, color={0,127,255}));
  connect(RVx05.port_a, SVx05.port_b) annotation (Line(points={{100,-50},{100,-60}}, color={0,127,255}));
  connect(WMZx05.port_b, RVx05.port_a1) annotation (Line(points={{100,60},{106,60},{106,-40},{100,-40}}, color={0,127,255}));
  connect(localStorageState, HVFAStorage.localStorageState) annotation (Line(points={{0,-110},{210,-110},{210,29}}, color={0,0,0}));
  connect(selectLocalControlModeBoolean.bLoading, SVx05.bSetStatusOnAutomatic) annotation (Line(points={{-59,-70},{40,-70},{40,-61},{78,-61}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, grid={2,2})),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false, grid={2,2}),
                                                                                                                      graphics={Text(
          extent={{20,-120},{60,-140}},
          lineColor={28,108,200},
          textString="Consumer"),  Text(
          extent={{100,-120},{140,-140}},
          lineColor={28,108,200},
          textString="Producer")}));
end HVFAStorageSystem;
