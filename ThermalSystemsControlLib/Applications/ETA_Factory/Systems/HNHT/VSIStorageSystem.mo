within ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT;
model VSIStorageSystem
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous_Storage(systemFlowControl(nComponents=2));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  parameter SI.Temperature T_start "Start value for temperature";
  Components.BufferStorage.BufferStorage VSIStorage(
    V=7,
    n_Seg=7,
    T_start=T_start) annotation (Placement(transformation(extent={{80,10},{100,-10}})));
  Components.Pumps.Pump PU305(pumpType=11) annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={70,90})));
  Components.Valves.ThreeWayValve SV306(redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{80,-70},{100,-50}})));
  Components.Pumps.Pump PU306(pumpType=11) annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Components.Valves.ThreeWayValve SV305(redeclare Records.Belimo_R2032_S2_ThreeWay deviceData) annotation (Placement(transformation(extent={{80,70},{100,50}})));
  Components.Valves.TwoWayValve SV307(redeclare Records.Belimo_R2032_S2 deviceData) annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Components.HeatMeter.HeatMeter WMZ305 annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=0) annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
  Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100)
                                                             annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{100,-20},{120,0}})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Logical.And and2 annotation (Placement(transformation(extent={{20,100},{40,120}})));
  Components.BufferStorage.Interfaces.BufferStorageState localStorageState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Modelica.Blocks.Logical.Or or1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,150})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=200,
    diameter=0.015,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={170,20})));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Medium2)
                                                                                     annotation (Placement(transformation(extent={{120,20},{140,40}})));
equation
  connect(PU306.port_a, port_a2) annotation (Line(points={{100,-100},{100,-100}}, color={0,127,255}));
  connect(port_a1, PU305.port_a) annotation (Line(points={{60,100},{80,100}}, color={0,127,255}));
  connect(PU305.port_b, SV305.port_a) annotation (Line(points={{80,80},{90,80},{90,70},{100,70}}, color={0,127,255}));
  connect(SV306.port_a, PU306.port_b) annotation (Line(points={{100,-70},{100,-80}}, color={0,127,255}));
  connect(SV305.port_a1, port_b2) annotation (Line(points={{100,60},{120,60},{120,100},{100,100}}, color={0,127,255}));
  connect(SV307.port_a, SV306.port_b) annotation (Line(points={{100,-40},{100,-50}}, color={0,127,255}));
  connect(VSIStorage.port_b, SV307.port_b) annotation (Line(points={{100,-10},{100,-20}}, color={0,127,255}));
  connect(SV306.port_a1, port_b1) annotation (Line(points={{100,-60},{120,-60},{120,-120},{60,-120},{60,-100}}, color={0,127,255}));
  connect(SV305.port_b, WMZ305.port_b) annotation (Line(points={{100,50},{100,40},{100,40}}, color={0,127,255}));
  connect(integerExpression1.y, PU306.nControlModeAutomatic) annotation (Line(points={{1,-90},{40,-90},{40,-95},{78,-95}}, color={255,127,0}));
  connect(SV306.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,-65},{40,-65},{40,-90},{1,-90}}, color={255,127,0}));
  connect(SV307.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,-35},{40,-35},{40,-90},{1,-90}}, color={255,127,0}));
  connect(SV305.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{78,65},{40,65},{40,-90},{1,-90}}, color={255,127,0}));
  connect(PU305.nControlModeAutomatic, integerExpression1.y) annotation (Line(points={{58,95},{40,95},{40,-90},{1,-90}}, color={255,127,0}));
  connect(not1.y, SV305.bSetStatusOnAutomatic) annotation (Line(points={{61,50},{70,50},{70,51},{78,51}}, color={255,0,255}));
  connect(realExpression.y, SV305.fSetPointAutomatic) annotation (Line(points={{41,70},{44,70},{44,59},{78,59}}, color={0,0,127}));
  connect(PU306.fSetPointAutomatic, PU305.fSetPointAutomatic) annotation (Line(points={{78,-89},{50,-89},{50,90},{58,90},{58,89}}, color={0,0,127}));
  connect(SV306.fSetPointAutomatic, SV305.fSetPointAutomatic) annotation (Line(points={{78,-59},{44,-59},{44,59},{78,59}}, color={0,0,127}));
  connect(SV307.fSetPointAutomatic, SV305.fSetPointAutomatic) annotation (Line(points={{78,-29},{44,-29},{44,59},{78,59}}, color={0,0,127}));
  connect(temperature1.port, SV307.port_b) annotation (Line(points={{110,-20},{100,-20}}, color={0,127,255}));
  connect(temperature1.T, WMZ305.fFeedTemperature) annotation (Line(points={{117,-10},{120,-10},{120,30},{102,30}}, color={0,0,127}));
  connect(bAlgorithmPermission, PU305.bAlgorithmPermission) annotation (Line(points={{-120,50},{20,50},{20,85},{58,85}}, color={255,0,255}));
  connect(SV305.bAlgorithmPermission, PU305.bAlgorithmPermission) annotation (Line(points={{78,55},{20,55},{20,85},{58,85}}, color={255,0,255}));
  connect(SV307.bAlgorithmPermission, PU305.bAlgorithmPermission) annotation (Line(points={{78,-25},{20,-25},{20,85},{58,85}}, color={255,0,255}));
  connect(SV306.bAlgorithmPermission, PU305.bAlgorithmPermission) annotation (Line(points={{78,-55},{20,-55},{20,85},{58,85}}, color={255,0,255}));
  connect(PU306.bAlgorithmPermission, PU305.bAlgorithmPermission) annotation (Line(points={{78,-85},{20,-85},{20,85},{58,85}}, color={255,0,255}));
  connect(SV305.fTemperatureExternal, PU305.fSetPointAutomatic) annotation (Line(points={{85,72},{84,72},{84,76},{50,76},{50,90},{58,90},{58,89}}, color={0,0,127}));
  connect(SV305.fThermalPowerExternal, PU305.fSetPointAutomatic) annotation (Line(points={{95.2,72},{95.2,76},{50,76},{50,90},{58,90},{58,89}}, color={0,0,127}));
  connect(SV306.fTemperatureExternal, PU305.fSetPointAutomatic) annotation (Line(points={{85,-72},{50,-72},{50,90},{58,90},{58,89}}, color={0,0,127}));
  connect(SV306.fThermalPowerExternal, PU305.fSetPointAutomatic) annotation (Line(points={{95.2,-72},{50,-72},{50,90},{58,90},{58,89}}, color={0,0,127}));
  connect(WMZ305.fHeatFlowRate, SV307.fThermalPowerExternal) annotation (Line(points={{79,30},{94,30},{94,-30},{95,-30},{95,-42}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[1], SV307.bSetStatusOnAutomatic) annotation (Line(points={{-19,70},{10,70},{10,-21},{78,-21}}, color={255,0,255}));
  connect(and1.u1, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{-22,30},{-19,30},{-19,70}}, color={255,0,255}));
  connect(and1.y, PU306.bSetStatusOnAutomatic) annotation (Line(points={{1,30},{6,30},{6,-81},{78,-81}}, color={255,0,255}));
  connect(and2.u1, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{18,110},{8,110},{8,70},{-19,70}}, color={255,0,255}));
  connect(not1.y, and2.u2) annotation (Line(points={{61,50},{60,50},{60,74},{18,74},{18,102}}, color={255,0,255}));
  connect(and2.y, PU305.bSetStatusOnAutomatic) annotation (Line(points={{41,110},{46,110},{46,80},{52,80},{52,81},{58,81}}, color={255,0,255}));
  connect(or1.y, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{19,150},{-30,150},{-30,81}}, color={255,0,255}));
  connect(or1.u1, PU305.bStatusOn) annotation (Line(points={{42,150},{65,150},{65,79}}, color={255,0,255}));
  connect(PU306.bStatusOn, or1.u2) annotation (Line(points={{85,-79},{85,-80},{140,-80},{140,158},{42,158}}, color={255,0,255}));
  connect(SV307.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{85,-19},{85,-20},{-30,-20},{-30,81}}, color={255,0,255}));
  connect(PU305.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{70,79},{70,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PU305.fThermalPowerExternal, WMZ305.fHeatFlowRate) annotation (Line(points={{75,102},{75,92},{79,92},{79,30}}, color={0,0,127}));
  connect(PU306.fThermalPowerExternal, WMZ305.fHeatFlowRate) annotation (Line(points={{95,-102},{95,-100},{79,-100},{79,30}}, color={0,0,127}));
  connect(or1.y, bStatusOn) annotation (Line(points={{19,150},{-70,150},{-70,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, PU305.fSetPointAutomatic) annotation (Line(points={{-59,30},{50,30},{50,90},{58,90},{58,89}}, color={0,0,127}));
  connect(VSIStorage.port_a, pipe2.port_a) annotation (Line(points={{100,10},{160,10}}, color={0,127,255}));
  connect(WMZ305.port_a, pipe2.port_b) annotation (Line(points={{100,20},{112,20},{112,30},{160,30}}, color={0,127,255}));
  connect(not1.u, SV306.bSetStatusOnAutomatic) annotation (Line(points={{38,50},{28,50},{28,-51},{78,-51}}, color={255,0,255}));
  connect(and1.u2, SV306.bSetStatusOnAutomatic) annotation (Line(points={{-22,22},{-22,-51},{78,-51}},                     color={255,0,255}));
  connect(VSIStorage.localStorageState, localStorageState) annotation (Line(points={{90,-11},{0,-11},{0,-110}}, color={0,0,0}));
  connect(temperature2.port, pipe2.port_a) annotation (Line(points={{130,20},{130,10},{160,10}}, color={0,127,255}));
  connect(PU306.fTemperatureExternal, temperature2.T) annotation (Line(points={{85,-102},{85,-120},{137,-120},{137,30}}, color={0,0,127}));
  connect(PU305.fTemperatureExternal, temperature1.T) annotation (Line(points={{65,102},{120,102},{120,-10},{117,-10}}, color={0,0,127}));
  connect(selectLocalControlModeBoolean.bLoading, SV306.bSetStatusOnAutomatic) annotation (Line(points={{-59,-70},{-22,-70},{-22,-51},{78,-51}}, color={255,0,255}));
  connect(SV307.fTemperatureExternal, SV307.fThermalPowerExternal) annotation (Line(points={{85,-42},{86,-42},{86,-30},{95,-30},{95,-42}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, grid={2,2})),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false, grid={2,2}),
                                                                                                                      graphics={Text(
          extent={{20,-120},{60,-140}},
          lineColor={28,108,200},
          textString="Unloading"), Text(
          extent={{80,-120},{120,-140}},
          lineColor={28,108,200},
          textString="Loading")}));
end VSIStorageSystem;
