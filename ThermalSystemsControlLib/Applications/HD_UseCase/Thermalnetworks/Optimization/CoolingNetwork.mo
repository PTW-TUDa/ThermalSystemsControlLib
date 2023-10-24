within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Optimization;
model CoolingNetwork
      final package Medium =
      Modelica.Media.Water.ConstantPropertyLiquidWater;
  parameter SI.Temperature T_start = 273.15+90;

  Interfaces.control_CN_Input control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Interfaces.localState_FluidNetwork_Output localState annotation (Placement(transformation(extent={{40,100},{60,120}})));
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
  Modelica.Fluid.Interfaces.FluidPort_a inlet_AKM_HNLT(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-70,-110},{-50,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b outlet_AKM_HNLT(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-30,-110},{-10,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a inlet_AKM_HNHT(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b outlet_AKM_HNHT(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
  Systems.AbsorptionChillerSystem AKM(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    redeclare package Medium3 = Medium,
    redeclare Records.Pumps.SimplePump_HD_AKM_Hot deviceData_Pump_Hot,
    redeclare Records.Pumps.SimplePump_HD_AKM_Warm deviceData_Pump_Warm,
    redeclare Records.Pumps.SimplePump_HD_AKM_Cold deviceData_Pump_Cold) annotation (Placement(transformation(extent={{-76,-8},{-56,12}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=false)
                                                                      annotation (Placement(transformation(extent={{-100,52},{-80,72}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{80,60},{60,80}})));
  Components.BufferStorage.BufferStorage bufferStorage annotation (Placement(transformation(extent={{-8,-8},{12,12}})));
equation
   // control
  AKM.fSetPointAutomatic = control.fFeedTemperature_CN;
  AKM.bSetStatusOnAutomatic = control.bSetStatusOn_AKM;

  //local state
  localState.fUpperTemperature =bufferStorage.localStorageState.fUpperTemperature;
  localState.fMidTemperature =bufferStorage.localStorageState.fMidTemperature;
  localState.fLowerTemperature =bufferStorage.localStorageState.fLowerTemperature;
  connect(combiTimeTable_consumer_CN.y[1], sink.Q_flow) annotation (Line(points={{61,10},{78,10},{78,-5}},color={0,0,127}));
  connect(sink.T_r, combiTimeTable_consumer_CN.y[2]) annotation (Line(points={{78,5},{62,5},{62,10},{61,10}},   color={0,0,127}));
  connect(AKM.bAlgorithmPermission, booleanExpression.y) annotation (Line(points={{-78,7},{-74,7},{-74,62},{-79,62}},
                                                                                                    color={255,0,255}));
  connect(boundary.ports[1], sink.port_b) annotation (Line(points={{60,70},{40,70},{40,40},{90,40},{90,10}}, color={0,127,255}));
  connect(bufferStorage.port_b, sink.port_b) annotation (Line(points={{12,12},{12,40},{90,40},{90,10}}, color={0,127,255}));
  connect(AKM.port_a3, sink.port_b) annotation (Line(points={{-55.8,12},{-56,12},{-56,40},{90,40},{90,10}}, color={0,127,255}));
  connect(AKM.port_b3, sink.port_a) annotation (Line(points={{-56,-8},{-56,-40},{90,-40},{90,-10}}, color={0,127,255}));
  connect(bufferStorage.port_a, sink.port_a) annotation (Line(points={{12,-8},{12,-40},{90,-40},{90,-10}}, color={0,127,255}));
  connect(AKM.port_a2, inlet_AKM_HNLT) annotation (Line(points={{-60,-8},{-60,-100}}, color={0,127,255}));
  connect(AKM.port_b2, outlet_AKM_HNLT) annotation (Line(points={{-60,12},{-60,40},{-20,40},{-20,-100}}, color={0,127,255}));
  connect(AKM.port_b1, outlet_AKM_HNHT) annotation (Line(points={{-64,-8},{-64,-40},{60,-40},{60,-100}}, color={0,127,255}));
  connect(AKM.port_a1, inlet_AKM_HNHT) annotation (Line(points={{-64,12},{-64,40},{20,40},{20,-100}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CoolingNetwork;
