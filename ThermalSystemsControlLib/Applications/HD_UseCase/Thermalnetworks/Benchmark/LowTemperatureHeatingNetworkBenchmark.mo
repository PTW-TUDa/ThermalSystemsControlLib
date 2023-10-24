within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Benchmark;
model LowTemperatureHeatingNetworkBenchmark
  outer ThermalSystemsControlLib.Applications.HD_UseCase.Weather weather;

  //## IMPORTS ##
  import SI = Modelica.SIunits;
    final package Medium =
      Modelica.Media.Water.ConstantPropertyLiquidWater;
  parameter SI.Temperature T_start=T_start;

  Components.BufferStorage.BufferStorage bufferStorage(
    redeclare package Medium = Medium,
    V=10,
    n_Seg=3,
    T_start=T_start) annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  Components.Consumer.PhysicalModels.IdealConsumer_Physical sink(
    redeclare package Medium = Medium,
    is_heat_sink=true,
    dT_min=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,0})));
  Modelica.Fluid.Interfaces.FluidPort_a inlet_HEX(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b outlet_HEX(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=false)
                                                                      annotation (Placement(transformation(extent={{-100,50},{-80,70}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Interfaces.control_HNLT_Input control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Interfaces.localState_FluidNetwork_Output localState annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Systems.IdealHeatExchangerSystem HEX(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium)
                  annotation (Placement(transformation(extent={{-70,-8},{-50,12}})));
  Components.Consumer.PhysicalModels.DemandRegressionModel demandModel(TemperatureCurve=[263.15,3000000; 288.15,200000; 293.15,200000]) annotation (Placement(transformation(extent={{0,50},{20,70}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=weather.T_ambient) annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  Modelica.Blocks.Sources.Constant const(k=313.15) annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
equation
  // control
  HEX.fSetPointAutomatic =control.fFeedTemperature_HNLT;
  HEX.bSetStatusOnAutomatic =control.bSetStatusOn_HEX;

  //local state
  localState.fUpperTemperature =bufferStorage.localStorageState.fUpperTemperature;
  localState.fMidTemperature =bufferStorage.localStorageState.fMidTemperature;
  localState.fLowerTemperature =bufferStorage.localStorageState.fLowerTemperature;

  connect(sink.port_a,bufferStorage. port_a) annotation (Line(points={{90,10},{90,40},{-14,40},{-14,-10}},
                                                                                                        color={0,127,255}));
  connect(sink.port_b,bufferStorage. port_b) annotation (Line(points={{90,-10},{90,-40},{-14,-40},{-14,10}},
                                                                                                        color={0,127,255}));
  connect(boundary.ports[1], bufferStorage.port_a) annotation (Line(points={{80,60},{90,60},{90,40},{-14,40},{-14,-10}},color={0,127,255}));
  connect(HEX.port_b2, bufferStorage.port_a) annotation (Line(points={{-50,12},{-50,40},{-14,40},{-14,-10}},
                                                                                                           color={0,127,255}));
  connect(HEX.port_a2, bufferStorage.port_b) annotation (Line(points={{-50,-8},{-50,-40},{-14,-40},{-14,10}},color={0,127,255}));
  connect(HEX.port_a1, inlet_HEX) annotation (Line(points={{-54,12},{-54,40},{-100,40}}, color={0,127,255}));
  connect(HEX.port_b1, outlet_HEX) annotation (Line(points={{-54,-8},{-54,-40},{-100,-40}}, color={0,127,255}));
  connect(booleanExpression.y, HEX.bAlgorithmPermission) annotation (Line(points={{-79,60},{-78,60},{-78,7},{-72,7}}, color={255,0,255}));
  connect(realExpression.y, demandModel.T_amb) annotation (Line(points={{-9,60},{-2,60}}, color={0,0,127}));
  connect(const.y, sink.T_r) annotation (Line(points={{21,-60},{30,-60},{30,-5},{78,-5}}, color={0,0,127}));
  connect(demandModel.Q_demand, sink.Q_flow) annotation (Line(points={{21,60},{30,60},{30,5},{78,5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LowTemperatureHeatingNetworkBenchmark;
