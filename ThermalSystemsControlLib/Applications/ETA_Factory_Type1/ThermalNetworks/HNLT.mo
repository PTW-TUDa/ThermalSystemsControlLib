within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks;
model HNLT
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=318.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNHT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={24,-28})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,0})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{-80,80},{-100,100}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
                                     T_start=T_start)  annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Interfaces.hnltControl controlAutomatic annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Systems.HNLT.CompressorSystem CompressorSystem annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Systems.HNLT.HVFAStorageSystem HVFASystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=4,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-28,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    length=4,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-70,42})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-70,-38})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,80})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-50,-80})));
  Systems.HNLT.OuterCapillaryTubeMatsSystem OuterCapillaryTubeMats annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Components.Pipes.PhysicalModels.Pipe pipe11(
    length=14,
    diameter=0.05,
    n_Bending=12)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={70,50})));
  Components.Pipes.PhysicalModels.Pipe pipe12(
    length=14,
    diameter=0.05,
    n_Bending=12)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={70,-50})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0.0,0.0; 86400,2e3; 172800,0.0],                                                      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{-74,-6},{-68,0}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort test_sensor(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{40,-110},{60,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,50},{110,70}})));
equation
   //states
  localState1.fUpperTemperature = BufferStorage.localStorageState.fUpperTemperature;
  localState1.fMidTemperature = BufferStorage.localStorageState.fMidTemperature;
  localState1.fLowerTemperature = BufferStorage.localStorageState.fLowerTemperature;
  localState1.fUpperTemperature_ActiveStorage =HVFASystem.localStorageState.fUpperTemperature;
  localState1.fLowerTemperature_ActiveStorage =HVFASystem.localStorageState.fLowerTemperature;

  //controls
  OuterCapillaryTubeMats.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_OuterCapillaryTubeMats;
  OuterCapillaryTubeMats.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  OuterCapillaryTubeMats.fSetPointAutomatic = controlAutomatic.fFeedTemperature_Cooling;
  HVFASystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HVFASystem;
  HVFASystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  HVFASystem.fSetPointAutomatic = 0.7;
  HVFASystem.bLoadingAutomatic = controlAutomatic.bLoading_HVFASystem;
  CompressorSystem.bSetStatusOnAutomatic = true;
  CompressorSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CompressorSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature_Heating;
  ambientState.fOutsideTemperature = OuterCapillaryTubeMats.fAmbientTemperature;

  connect(CompressorSystem.fHeatFlowRate, combiTimeTable.y[1]) annotation (Line(points={{-62,-3},{-67.7,-3}}, color={0,0,127}));
  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{-79,90},{-50,90},{-50,110}}, color={0,0,0}));
  connect(HVFASystem.port_a1, pipe9.port_b) annotation (Line(points={{-84,10},{-84,70},{-60,70}}, color={0,127,255}));
  connect(HVFASystem.port_b1, pipe10.port_a) annotation (Line(points={{-84,-10},{-84,-90},{-60,-90}}, color={0,127,255}));
  connect(HVFASystem.port_a2, pipe7.port_b) annotation (Line(points={{-80,-10},{-80,-48}}, color={0,127,255}));
  connect(HVFASystem.port_b2, pipe6.port_a) annotation (Line(points={{-80,10},{-80,52}}, color={0,127,255}));
  connect(CompressorSystem.port_b, pipe4.port_a) annotation (Line(points={{-40,10},{-40,40},{-38,40}},
                                                                                              color={0,127,255}));
  connect(CompressorSystem.port_a, pipe5.port_b) annotation (Line(points={{-40,-10},{-40,-20}}, color={0,127,255}));
  connect(pipe5.port_a, BufferStorage.port_a) annotation (Line(points={{-20,-20},{0,-20},{0,-10}}, color={0,127,255}));
  connect(pipe4.port_b, BufferStorage.port_b) annotation (Line(points={{-18,40},{0,40},{0,10}}, color={0,127,255}));
  connect(pipe9.port_a, BufferStorage.port_b) annotation (Line(points={{-40,70},{0,70},{0,10}}, color={0,127,255}));
  connect(pipe7.port_a, BufferStorage.port_a) annotation (Line(points={{-60,-48},{0,-48},{0,-10}}, color={0,127,255}));
  connect(pipe6.port_b, BufferStorage.port_b) annotation (Line(points={{-60,52},{0,52},{0,10}}, color={0,127,255}));
  connect(pipe10.port_b, BufferStorage.port_a) annotation (Line(points={{-40,-90},{0,-90},{0,-10}}, color={0,127,255}));
  connect(OuterCapillaryTubeMats.port_a, pipe11.port_b) annotation (Line(points={{80,10},{80,60}}, color={0,127,255}));
  connect(OuterCapillaryTubeMats.port_b, pipe12.port_a) annotation (Line(points={{80,-10},{80,-60}}, color={0,127,255}));
  connect(port_b_HNHT_Producer, BufferStorage.port_a) annotation (Line(points={{-100,-100},{0,-100},{0,-10}}, color={0,127,255}));
  connect(port_a_HNHT_Producer, BufferStorage.port_b) annotation (Line(points={{-100,100},{0,100},{0,10}}, color={0,127,255}));
  connect(port_a_CN_Producer, BufferStorage.port_b) annotation (Line(points={{100,100},{0,100},{0,10}},          color={0,127,255}));
  connect(boundary.ports[1], BufferStorage.port_a) annotation (Line(points={{24,-18},{4,-18},{4,-10},{0,-10}}, color={0,127,255}));
  connect(port_b_CN_Producer, test_sensor.port_b) annotation (Line(points={{100,-100},{60,-100}}, color={0,127,255}));
  connect(test_sensor.port_a, BufferStorage.port_a) annotation (Line(points={{40,-100},{10,-100},{10,-10},{0,-10}}, color={0,127,255}));
  connect(port_b_CN_Consumer, BufferStorage.port_b) annotation (Line(points={{100,60},{100,80},{0,80},{0,10}}, color={0,127,255}));
  connect(port_a_CN_Consumer, BufferStorage.port_a) annotation (Line(points={{100,-60},{100,-80},{0,-80},{0,-10}}, color={0,127,255}));
  connect(pipe11.port_a, BufferStorage.port_b) annotation (Line(points={{60,60},{0,60},{0,10}}, color={0,127,255}));
  connect(pipe12.port_b, BufferStorage.port_a) annotation (Line(points={{60,-60},{0,-60},{0,-10}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNLT;
