within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model CN
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=288.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-30})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,0})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{-80,80},{-100,100}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
                                     T_start=T_start)  annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Systems.CN.CentralMachineCoolingSystem CentralMachineCoolingSystem annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={90,0})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Interfaces.cnControl   controlAutomatic annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    length=30,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,50})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=30,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-50})));
  Systems.CN.eChillerSystem eChillerSystem annotation (Placement(transformation(extent={{-60,10},{-40,-10}})));
  Systems.HNLT.HVFAStorageSystem HVFASystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{-100,10},{-80,-10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                     annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                     annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=100,
    diameter=0.04,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    length=100,
    diameter=0.04,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,42})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-70,-38})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-50,80})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,-80})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,0; 14400,0; 15300,0; 16200,0; 17100,0; 18000,0; 18900,0; 19800,0; 20700,0; 21600,0; 22500,0; 23400,0; 24300,0; 25200,0; 26100,0; 27000,0; 27900,0.1; 28800,8; 29700,8; 30600,8; 31500,8; 32400,8; 33300,8; 34200,8; 35100,8; 36000,8; 36900,10; 37800,10; 38700,10; 39600,10; 40500,10; 41400,10; 42300,10; 43200,10; 44100,10; 45000,10; 45900,10; 46800,5; 47700,5; 48600,
        5; 49500,5; 50400,5; 51300,5; 52200,5; 53100,5; 54000,6; 54900,6; 55800,6; 56700,6; 57600,6; 58500,6; 59400,6; 60300,6; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0; 88200,0; 89100,0; 90000,0; 90900,0; 91800,0; 92700,0; 93600,0; 94500,0; 95400,0; 96300,0; 97200,0;
        98100,0; 99000,0; 99900,0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{48,-12},{58,-2}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold annotation (Placement(transformation(extent={{64,4},{74,14}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-108},{-90,-88}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Blocks.Math.Gain gain(k=1000) annotation (Placement(transformation(extent={{66,-10},{72,-4}})));
equation
   //states
  localState1.fUpperTemperature =BufferStorage.localStorageState.fUpperTemperature;
  localState1.fMidTemperature =BufferStorage.localStorageState.fMidTemperature;
  localState1.fLowerTemperature =BufferStorage.localStorageState.fLowerTemperature;
  localState1.fUpperTemperature_ActiveStorage =HVFASystem.localStorageState.fUpperTemperature;
  localState1.fLowerTemperature_ActiveStorage =HVFASystem.localStorageState.fLowerTemperature;

  //controls
  CentralMachineCoolingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CentralMachineCoolingSystem.fSetPointAutomatic = 3;
  HVFASystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HVFASystem;
  HVFASystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  HVFASystem.fSetPointAutomatic = 40;
  HVFASystem.bLoadingAutomatic = controlAutomatic.bLoading_HVFASystem;
  eChillerSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_eChiller;
  eChillerSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  eChillerSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  ambientState.fOutsideTemperature = eChillerSystem.fAmbientTemperature;
  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{-79,90},{-50,90},{-50,110}},
                                                                                                            color={0,0,0}));
  connect(port_b_HNLT_Producer, BufferStorage.port_b) annotation (Line(points={{-100,60},{0,60},{0,10}}, color={0,127,255}));
  connect(pipe10.port_b, HVFASystem.port_a1) annotation (Line(points={{-60,-90},{-84,-90},{-84,-10}}, color={0,127,255}));
  connect(pipe7.port_a, HVFASystem.port_b2) annotation (Line(points={{-80,-48},{-80,-10},{-80,-10}}, color={0,127,255}));
  connect(pipe9.port_a, HVFASystem.port_b1) annotation (Line(points={{-60,70},{-84,70},{-84,10}}, color={0,127,255}));
  connect(pipe9.port_b, BufferStorage.port_b) annotation (Line(points={{-40,70},{0,70},{0,10}}, color={0,127,255}));
  connect(pipe6.port_b, HVFASystem.port_a2) annotation (Line(points={{-80,52},{-80,10}}, color={0,127,255}));
  connect(pipe6.port_a, BufferStorage.port_b) annotation (Line(points={{-60,52},{0,52},{0,10}}, color={0,127,255}));
  connect(pipe4.port_a, BufferStorage.port_b) annotation (Line(points={{-20,40},{0,40},{0,10}}, color={0,127,255}));
  connect(pipe4.port_b, eChillerSystem.port_a) annotation (Line(points={{-40,40},{-40,10}}, color={0,127,255}));
  connect(eChillerSystem.port_b, pipe5.port_a) annotation (Line(points={{-40,-10},{-40,-20}}, color={0,127,255}));
  connect(pipe1.port_b, CentralMachineCoolingSystem.port_a) annotation (Line(points={{80,-60},{100,-60},{100,-10}}, color={0,127,255}));
  connect(CentralMachineCoolingSystem.port_b, pipe8.port_a) annotation (Line(points={{100,10},{100,60},{80,60}}, color={0,127,255}));
  connect(pipe8.port_b, BufferStorage.port_b) annotation (Line(points={{60,60},{0,60},{0,10}}, color={0,127,255}));
  connect(greaterThreshold.y, CentralMachineCoolingSystem.bSetStatusOnAutomatic) annotation (Line(points={{74.5,9},{78,9}},               color={255,0,255}));
  connect(pipe10.port_a, BufferStorage.port_a) annotation (Line(points={{-40,-90},{0,-90},{0,-10}}, color={0,127,255}));
  connect(pipe1.port_a, BufferStorage.port_a) annotation (Line(points={{60,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(pipe5.port_b, BufferStorage.port_a) annotation (Line(points={{-20,-20},{0,-20},{0,-10}}, color={0,127,255}));
  connect(pipe7.port_b, BufferStorage.port_a) annotation (Line(points={{-60,-48},{0,-48},{0,-10}}, color={0,127,255}));
  connect(port_a_HNLT_Producer, BufferStorage.port_a) annotation (Line(points={{-100,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(boundary.ports[1], BufferStorage.port_a) annotation (Line(points={{30,-20},{30,-10},{0,-10}}, color={0,127,255}));
  connect(port_b_HNLT_Consumer, BufferStorage.port_a) annotation (Line(points={{-100,-98},{0,-98},{0,-10}}, color={0,127,255}));
  connect(port_a_HNLT_Consumer, BufferStorage.port_b) annotation (Line(points={{-100,100},{0,100},{0,10}}, color={0,127,255}));
  connect(combiTimeTable.y[1], gain.u) annotation (Line(points={{58.5,-7},{62.25,-7},{62.25,-7},{65.4,-7}}, color={0,0,127}));
  connect(gain.y, CentralMachineCoolingSystem.fHeatFlowRate) annotation (Line(points={{72.3,-7},{75.15,-7},{75.15,-7},{78,-7}}, color={0,0,127}));
  connect(greaterThreshold.u, gain.u) annotation (Line(points={{63,9},{60,9},{60,-7},{65.4,-7}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CN;
