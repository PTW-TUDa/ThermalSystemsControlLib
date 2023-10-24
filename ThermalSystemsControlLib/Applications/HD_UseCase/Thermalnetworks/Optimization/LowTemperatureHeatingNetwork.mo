within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Optimization;
model LowTemperatureHeatingNetwork
  //## IMPORTS ##
  import SI = Modelica.SIunits;
    final package Medium =
      Modelica.Media.Water.ConstantPropertyLiquidWater;
  parameter SI.Temperature T_start = 273.15+90;
  Interfaces.control_HNLT_Input control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
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
  Systems.IdealHeatExchangerSystem HEX(redeclare package Medium1 = Medium, redeclare package Medium2 = Medium)
                                       annotation (Placement(transformation(extent={{-86,-8},{-66,12}})));
  Modelica.Fluid.Interfaces.FluidPort_a inlet_AKM(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-70,-110},{-50,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b outlet_AKM(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-30,-110},{-10,-90}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=false)
                                                                      annotation (Placement(transformation(extent={{-100,50},{-80,70}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_consumer_HNLT(tableOnFile=false, table=[0.0,2e6,313.15])
                                                                      "1=Q_flow,2=T_return" annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Interfaces.localState_FluidNetwork_Output localState annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Systems.HybridCoolerSystem hybridCoolerSystem(redeclare package Medium = Medium)
                                                annotation (Placement(transformation(extent={{6,-10},{26,10}})));
equation
  // control
  HEX.fSetPointAutomatic = control.fFeedTemperature_HNLT;
  HEX.bSetStatusOnAutomatic = control.bSetStatusOn_HEX;
  hybridCoolerSystem.bSetStatusOnAutomatic = control.bSetStatusOn_hybridCoolerSystem;
  hybridCoolerSystem.fSetPointAutomatic = control.fFeedTemperature_HNLT;

  //local state
  localState.fUpperTemperature =bufferStorage.localStorageState.fUpperTemperature;
  localState.fMidTemperature =bufferStorage.localStorageState.fMidTemperature;
  localState.fLowerTemperature =bufferStorage.localStorageState.fLowerTemperature;

  connect(sink.port_a,bufferStorage. port_a) annotation (Line(points={{90,10},{90,40},{-34,40},{-34,0}},color={0,127,255}));
  connect(sink.port_b,bufferStorage. port_b) annotation (Line(points={{90,-10},{90,-40},{-14,-40},{-14,0}},
                                                                                                        color={0,127,255}));
  connect(HEX.port_a1, inlet_HEX) annotation (Line(points={{-70,12},{-70,40},{-100,40}}, color={0,127,255}));
  connect(HEX.port_b1, outlet_HEX) annotation (Line(points={{-70,-8},{-70,-40},{-100,-40}},  color={0,127,255}));
  connect(HEX.port_a2, bufferStorage.port_b) annotation (Line(points={{-66,-8},{-66,-40},{-14,-40},{-14,0}},        color={0,127,255}));
  connect(HEX.port_b2, bufferStorage.port_a) annotation (Line(points={{-66,12},{-66,40},{-34,40},{-34,0}},      color={0,127,255}));
  connect(inlet_AKM, bufferStorage.port_a) annotation (Line(points={{-60,-100},{-60,40},{-34,40},{-34,0}},  color={0,127,255}));
  connect(outlet_AKM, bufferStorage.port_b) annotation (Line(points={{-20,-100},{-20,-40},{-14,-40},{-14,0}},   color={0,127,255}));
  connect(booleanExpression.y, HEX.bAlgorithmPermission) annotation (Line(points={{-79,60},{-88,60},{-88,7}},         color={255,0,255}));
  connect(combiTimeTable_consumer_HNLT.y[1], sink.Q_flow) annotation (Line(points={{61,10},{78,10},{78,5}}, color={0,0,127}));
  connect(sink.T_r,combiTimeTable_consumer_HNLT. y[2]) annotation (Line(points={{78,-5},{62,-5},{62,10},{61,10}}, color={0,0,127}));
  connect(boundary.ports[1], bufferStorage.port_a) annotation (Line(points={{80,60},{90,60},{90,40},{-34,40},{-34,0}},  color={0,127,255}));
  connect(hybridCoolerSystem.port_b, bufferStorage.port_a) annotation (Line(points={{26,10},{26,40},{-34,40},{-34,0}}, color={0,127,255}));
  connect(hybridCoolerSystem.port_a, bufferStorage.port_b) annotation (Line(points={{26,-10},{26,-40},{-14,-40},{-14,0}}, color={0,127,255}));
  connect(booleanExpression.y, hybridCoolerSystem.bAlgorithmPermission) annotation (Line(points={{-79,60},{-6,60},{-6,5},{4,5}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LowTemperatureHeatingNetwork;
