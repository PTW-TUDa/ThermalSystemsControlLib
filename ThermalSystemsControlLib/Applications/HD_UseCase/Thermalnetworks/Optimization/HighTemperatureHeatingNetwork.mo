within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Optimization;
model HighTemperatureHeatingNetwork

  //## IMPORTS ##
  import SI = Modelica.SIunits;
    final package Medium =
      Modelica.Media.Water.ConstantPropertyLiquidWater;
  parameter SI.Temperature T_start = 273.15+90;
  Interfaces.control_HNHT_Input control annotation (Placement(transformation(extent={{-60,100},{-40,120}}), iconTransformation(extent={{-60,100},{-40,120}})));
  Interfaces.localState_FluidNetwork_Output localState annotation (Placement(transformation(extent={{40,100},{60,120}}), iconTransformation(extent={{40,100},{60,120}})));
  Components.BufferStorage.BufferStorage bufferStorage(
    redeclare package Medium = Medium,
    V=5,
    n_Seg=3,
    T_start=T_start) annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Components.Consumer.PhysicalModels.IdealConsumer_Physical sink(
    redeclare package Medium = Medium,
    is_heat_sink=true,
    dT_min=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,10})));
  Modelica.Fluid.Interfaces.FluidPort_a inlet_AKM(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b outlet_AKM(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=false)
                                                                      annotation (Placement(transformation(extent={{-100,68},{-80,88}})));
  Modelica.Fluid.Interfaces.FluidPort_a inlet_HEX(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_b outlet_HEX(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_consumer_HNHT(table=[0.0,1e6,343.15])
                                                                      "1=Q_flow,2=T_return" annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,70})));
  Systems.GasBoilerSystem gasBoilerSystem(redeclare package Medium = Medium)
                                          annotation (Placement(transformation(extent={{-52,0},{-32,20}})));
  Systems.CHPSystem cHPSystem(redeclare package Medium = Medium)
                              annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
equation
  //control
  gasBoilerSystem.bSetStatusOnAutomatic = control.bSetStatusOn_Boiler;
  cHPSystem.bSetStatusOnAutomatic = control.bSetStatusOn_cHPSystem;
  gasBoilerSystem.fSetPointAutomatic = control.fFeedTemperature_HNHT;
  cHPSystem.fSetPointAutomatic = control.fFeedTemperature_HNHT;

  //local state
  localState.fUpperTemperature =bufferStorage.localStorageState.fUpperTemperature;
  localState.fMidTemperature =bufferStorage.localStorageState.fMidTemperature;
  localState.fLowerTemperature =bufferStorage.localStorageState.fLowerTemperature;

  //connections
  connect(sink.port_a, bufferStorage.port_a) annotation (Line(points={{40,20},{40,40},{-20,40},{-20,10}},
                                                                                                        color={0,127,255}));
  connect(sink.port_b, bufferStorage.port_b) annotation (Line(points={{40,0},{40,-40},{0,-40},{0,10}},  color={0,127,255}));
  connect(outlet_AKM, bufferStorage.port_a) annotation (Line(points={{60,-100},{60,40},{-20,40},{-20,10}},
                                                                                                  color={0,127,255}));
  connect(inlet_AKM, bufferStorage.port_b) annotation (Line(points={{20,-100},{20,-40},{0,-40},{0,10}},
                                                                                                  color={0,127,255}));
  connect(outlet_HEX, bufferStorage.port_a) annotation (Line(points={{100,40},{-20,40},{-20,10}}, color={0,127,255}));
  connect(inlet_HEX, bufferStorage.port_b) annotation (Line(points={{100,-40},{0,-40},{0,10}},    color={0,127,255}));
  connect(combiTimeTable_consumer_HNHT.y[1], sink.Q_flow) annotation (Line(points={{21,70},{28,70},{28,15}}, color={0,0,127}));
  connect(sink.T_r, combiTimeTable_consumer_HNHT.y[2]) annotation (Line(points={{28,5},{26,5},{26,6},{21,6},{21,70}}, color={0,0,127}));
  connect(boundary.ports[1], bufferStorage.port_a) annotation (Line(points={{60,70},{40,70},{40,40},{-20,40},{-20,10}}, color={0,127,255}));
  connect(gasBoilerSystem.port_b, bufferStorage.port_a) annotation (Line(points={{-32,20},{-32,40},{-20,40},{-20,10}}, color={0,127,255}));
  connect(gasBoilerSystem.port_a, bufferStorage.port_b) annotation (Line(points={{-32,0},{-32,-40},{0,-40},{0,10}}, color={0,127,255}));
  connect(cHPSystem.port_b, bufferStorage.port_a) annotation (Line(points={{-70,20},{-70,40},{-20,40},{-20,10}}, color={0,127,255}));
  connect(cHPSystem.port_a, bufferStorage.port_b) annotation (Line(points={{-70,0},{-70,-40},{0,-40},{0,10}}, color={0,127,255}));
  connect(booleanExpression.y, gasBoilerSystem.bAlgorithmPermission) annotation (Line(points={{-79,78},{-58,78},{-58,15},{-54,15}}, color={255,0,255}));
  connect(booleanExpression.y, cHPSystem.bAlgorithmPermission) annotation (Line(points={{-79,78},{-58,78},{-58,46},{-96,46},{-96,15},{-92,15}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end HighTemperatureHeatingNetwork;
