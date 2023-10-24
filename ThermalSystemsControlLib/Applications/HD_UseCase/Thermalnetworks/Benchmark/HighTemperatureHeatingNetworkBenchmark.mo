within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Benchmark;
model HighTemperatureHeatingNetworkBenchmark
  outer ThermalSystemsControlLib.Applications.HD_UseCase.Weather weather;

  //## IMPORTS ##
  import SI = Modelica.SIunits;
    final package Medium =
      Modelica.Media.Water.ConstantPropertyLiquidWater;
  parameter SI.Temperature T_start=T_start;
  Components.BufferStorage.BufferStorage bufferStorage(
    redeclare package Medium = Medium,
    V=60,
    n_Seg=3,
    T_start=T_start) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Components.Consumer.PhysicalModels.IdealConsumer_Physical sink(
    redeclare package Medium = Medium,
    is_heat_sink=true,
    dT_min=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=false)
                                                                      annotation (Placement(transformation(extent={{-100,68},{-80,88}})));
  Modelica.Fluid.Interfaces.FluidPort_a inlet_HEX(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_b outlet_HEX(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,70})));
  Systems.CHPSystem cHPSystem(redeclare package Medium = Medium)
                              annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  Systems.GasBoilerSystem gasBoilerSystem(redeclare package Medium = Medium)
                                          annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  Interfaces.control_HNHT_Input control annotation (Placement(transformation(extent={{-40,100},{-20,120}})));
  Interfaces.localState_FluidNetwork_Output localState annotation (Placement(transformation(extent={{40,100},{60,120}})));

  Components.Consumer.PhysicalModels.DemandRegressionModel demandModel(TemperatureCurve=[263.15,9000000; 288.15,600000; 293.15,600000]) annotation (Placement(transformation(extent={{0,50},{20,70}})));
  Modelica.Blocks.Sources.Constant const(k=343.15) annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=weather.T_ambient) annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
equation
  //control
  gasBoilerSystem.bSetStatusOnAutomatic =control.bSetStatusOn_Boiler;
  cHPSystem.bSetStatusOnAutomatic =control.bSetStatusOn_cHPSystem;
  gasBoilerSystem.fSetPointAutomatic =control.fFeedTemperature_HNHT;
  cHPSystem.fSetPointAutomatic =control.fFeedTemperature_HNHT;

  //local state
  localState.fUpperTemperature =bufferStorage.localStorageState.fUpperTemperature;
  localState.fMidTemperature =bufferStorage.localStorageState.fMidTemperature;
  localState.fLowerTemperature =bufferStorage.localStorageState.fLowerTemperature;

  //connections
  connect(sink.port_a, bufferStorage.port_a) annotation (Line(points={{40,10},{40,40},{0,40},{0,-10}},  color={0,127,255}));
  connect(sink.port_b, bufferStorage.port_b) annotation (Line(points={{40,-10},{40,-40},{0,-40},{0,10}},color={0,127,255}));
  connect(outlet_HEX, bufferStorage.port_a) annotation (Line(points={{100,40},{0,40},{0,-10}},    color={0,127,255}));
  connect(inlet_HEX, bufferStorage.port_b) annotation (Line(points={{100,-40},{0,-40},{0,10}},    color={0,127,255}));
  connect(boundary.ports[1], bufferStorage.port_a) annotation (Line(points={{60,70},{40,70},{40,40},{0,40},{0,-10}},    color={0,127,255}));
  connect(gasBoilerSystem.port_b, bufferStorage.port_a) annotation (Line(points={{-40,10},{-40,40},{0,40},{0,-10}},    color={0,127,255}));
  connect(gasBoilerSystem.port_a, bufferStorage.port_b) annotation (Line(points={{-40,-10},{-40,-40},{0,-40},{0,10}},
                                                                                                                    color={0,127,255}));
  connect(cHPSystem.port_b, bufferStorage.port_a) annotation (Line(points={{-72,10},{-72,40},{0,40},{0,-10}},    color={0,127,255}));
  connect(cHPSystem.port_a, bufferStorage.port_b) annotation (Line(points={{-72,-10},{-72,-40},{0,-40},{0,10}},
                                                                                                              color={0,127,255}));
  connect(booleanExpression.y, gasBoilerSystem.bAlgorithmPermission) annotation (Line(points={{-79,78},{-68,78},{-68,5},{-62,5}},   color={255,0,255}));
  connect(booleanExpression.y, cHPSystem.bAlgorithmPermission) annotation (Line(points={{-79,78},{-68,78},{-68,30},{-98,30},{-98,5},{-94,5}},   color={255,0,255}));
  connect(demandModel.Q_demand, sink.Q_flow) annotation (Line(points={{21,60},{28,60},{28,5}}, color={0,0,127}));
  connect(const.y, sink.T_r) annotation (Line(points={{21,-60},{28,-60},{28,-5}}, color={0,0,127}));
  connect(realExpression.y, demandModel.T_amb) annotation (Line(points={{-9,60},{-2,60}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end HighTemperatureHeatingNetworkBenchmark;
