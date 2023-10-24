within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Benchmark;
model CoolingNetworkBenchmark
      final package Medium =
      Modelica.Media.Water.ConstantPropertyLiquidWater;
  parameter SI.Temperature T_start=273.15 + 90;

  Components.BufferStorage.BufferStorage bufferStorage(
    redeclare package Medium = Medium,
    V=1,
    n_Seg=3,
    T_start=T_start) annotation (Placement(transformation(extent={{-12,-8},{8,12}})));
  Components.Consumer.PhysicalModels.IdealConsumer_Physical sink(
    redeclare package Medium = Medium,
    is_heat_sink=false,
    dT_min=5) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={90,0})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_consumer_CN(
    tableOnFile=false,
    table=[0.0,150e3,296.15],
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
                                                                    "1=Q_flow,2=T_return" annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=false)
                                                                      annotation (Placement(transformation(extent={{-100,52},{-80,72}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{80,60},{60,80}})));
  Systems.HybridCoolerSystem hybridCoolerSystem(redeclare package Medium = Medium)
                                                annotation (Placement(transformation(extent={{-52,-8},{-32,12}})));

  Interfaces.control_CN_Input control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Interfaces.localState_FluidNetwork_Output localState annotation (Placement(transformation(extent={{40,100},{60,120}})));
equation
   // control
  hybridCoolerSystem.fSetPointAutomatic =control.fFeedTemperature_CN;
  hybridCoolerSystem.bSetStatusOnAutomatic =control.bSetStatusOn_hybridCoolerSystem;

  //local state
  localState.fUpperTemperature =bufferStorage.localStorageState.fUpperTemperature;
  localState.fMidTemperature =bufferStorage.localStorageState.fMidTemperature;
  localState.fLowerTemperature =bufferStorage.localStorageState.fLowerTemperature;
  connect(combiTimeTable_consumer_CN.y[1], sink.Q_flow) annotation (Line(points={{61,10},{78,10},{78,-5}},color={0,0,127}));
  connect(sink.T_r, combiTimeTable_consumer_CN.y[2]) annotation (Line(points={{78,5},{62,5},{62,10},{61,10}},   color={0,0,127}));
  connect(bufferStorage.port_a, sink.port_a) annotation (Line(points={{8,-8},{8,-20},{90,-20},{90,-10}},  color={0,127,255}));
  connect(bufferStorage.port_b, sink.port_b) annotation (Line(points={{8,12},{8,40},{90,40},{90,10}}, color={0,127,255}));
  connect(boundary.ports[1], sink.port_b) annotation (Line(points={{60,70},{40,70},{40,40},{90,40},{90,10}}, color={0,127,255}));
  connect(hybridCoolerSystem.port_b, sink.port_b) annotation (Line(points={{-32,12},{-32,40},{90,40},{90,10}},          color={0,127,255}));
  connect(hybridCoolerSystem.port_a, sink.port_a) annotation (Line(points={{-32,-8},{-32,-20},{90,-20},{90,-10}}, color={0,127,255}));
  connect(booleanExpression.y, hybridCoolerSystem.bAlgorithmPermission) annotation (Line(points={{-79,62},{-72,62},{-72,7},{-54,7}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CoolingNetworkBenchmark;
