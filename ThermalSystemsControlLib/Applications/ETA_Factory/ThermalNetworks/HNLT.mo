within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
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
  Systems.HNLT.CompressorSystem CompressorSystem annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
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
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={70,50})));
  Components.Pipes.PhysicalModels.Pipe pipe12(
    length=14,
    diameter=0.05,
    n_Bending=5) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={70,-50})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNHT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,0; 14400,0; 15300,0; 16200,0; 17100,0; 18000,0; 18900,0; 19800,0; 20700,0; 21600,0; 22500,0; 23400,0; 24300,0; 25200,0; 26100,0; 27000,0; 27900,0; 28800,6; 29700,6; 30600,6; 31500,6; 32400,6; 33300,6; 34200,6; 35100,6; 36000,6; 36900,6; 37800,6; 38700,6; 39600,6; 40500,6; 41400,6; 42300,6; 43200,6; 44100,6; 45000,6; 45900,6; 46800,6; 47700,6; 48600,6; 49500,6;
        50400,6; 51300,6; 52200,6; 53100,6; 54000,6; 54900,6; 55800,6; 56700,6; 57600,6; 58500,6; 59400,6; 60300,6; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0; 88200,0; 89100,0; 90000,0; 90900,0; 91800,0; 92700,0; 93600,0; 94500,0; 95400,0; 96300,0; 97200,0; 98100,0; 99000,
        0; 99900,0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{-74,-20},{-64,-10}})));
  Modelica.Blocks.Logical.GreaterThreshold
                                        greaterThreshold
                                                      annotation (Placement(transformation(extent={{-62,2},{-56,8}})));
  Modelica.Blocks.Math.Gain gain(k=1000) annotation (Placement(transformation(extent={{-58,-6},{-52,0}})));
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
  HVFASystem.fSetPointAutomatic = 70;
  HVFASystem.bLoadingAutomatic = controlAutomatic.bLoading_HVFASystem;
  CompressorSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CompressorSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature_Heating-5;
  ambientState.fOutsideTemperature = OuterCapillaryTubeMats.fAmbientTemperature;

  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{-79,90},{-50,90},{-50,110}}, color={0,0,0}));
  connect(HVFASystem.port_a1, pipe9.port_b) annotation (Line(points={{-84,10},{-84,70},{-60,70}}, color={0,127,255}));
  connect(HVFASystem.port_b1, pipe10.port_a) annotation (Line(points={{-84,-10},{-84,-90},{-60,-90}}, color={0,127,255}));
  connect(HVFASystem.port_a2, pipe7.port_b) annotation (Line(points={{-80,-10},{-80,-48}}, color={0,127,255}));
  connect(HVFASystem.port_b2, pipe6.port_a) annotation (Line(points={{-80,10},{-80,52}}, color={0,127,255}));
  connect(CompressorSystem.port_b, pipe4.port_a) annotation (Line(points={{-26,10},{-26,40},{-38,40}},
                                                                                              color={0,127,255}));
  connect(CompressorSystem.port_a, pipe5.port_b) annotation (Line(points={{-26,-10},{-26,-16},{-40,-16},{-40,-20}},
                                                                                                color={0,127,255}));
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
  connect(port_b_CN_Consumer, BufferStorage.port_b) annotation (Line(points={{100,60},{100,80},{0,80},{0,10}}, color={0,127,255}));
  connect(port_a_CN_Consumer, BufferStorage.port_a) annotation (Line(points={{100,-60},{100,-80},{0,-80},{0,-10}}, color={0,127,255}));
  connect(pipe11.port_a, BufferStorage.port_b) annotation (Line(points={{60,60},{0,60},{0,10}}, color={0,127,255}));
  connect(pipe12.port_b, BufferStorage.port_a) annotation (Line(points={{60,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(port_b_HNHT_Consumer, BufferStorage.port_b) annotation (Line(points={{-100,60},{0,60},{0,10}}, color={0,127,255}));
  connect(port_a_HNHT_Consumer, BufferStorage.port_a) annotation (Line(points={{-100,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(greaterThreshold.y, CompressorSystem.bSetStatusOnAutomatic) annotation (Line(points={{-55.7,5},{-54,5},{-54,9},{-48,9}}, color={255,0,255}));
  connect(greaterThreshold.u, combiTimeTable.y[1]) annotation (Line(points={{-62.6,5},{-63.5,5},{-63.5,-15}}, color={0,0,127}));
  connect(port_b_CN_Producer, BufferStorage.port_a) annotation (Line(points={{100,-100},{0,-100},{0,-10}}, color={0,127,255}));
  connect(gain.y, CompressorSystem.fHeatFlowRate) annotation (Line(points={{-51.7,-3},{-50.85,-3},{-50.85,-3},{-48,-3}}, color={0,0,127}));
  connect(gain.u, combiTimeTable.y[1]) annotation (Line(points={{-58.6,-3},{-60,-3},{-60,-15},{-63.5,-15}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNLT;
