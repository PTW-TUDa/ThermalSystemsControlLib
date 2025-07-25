within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNHT_Only
  extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=328.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=328.15 "Start value of active storage temperature";
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CHP1System CHP1System annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CondensingBoilerSystem CondensingBoilerSystem annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CHP2System CHP2System annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.StaticHeatingSystem StaticHeatingSystem annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,0})));
  output Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{40,100},{60,120}})));
  input Interfaces.hnhtControl controlAutomatic annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{180,-40},{160,-20}})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{80,80},{100,100}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
                                     T_start=T_start)  annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Systems.HNHT.VSIStorageSystem VSIStorageSystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{22,72},{42,52}})));
  Components.Pipes.PhysicalModels.Pipe pipe(
    use_HeatLoss=false,
    length=7.95,
    diameter=0.05,
    n_Bending=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,30})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    use_HeatLoss=false,
    length=7.95,
    diameter=0.05,
    n_Bending=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    use_HeatLoss=false,
    length=1.6,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,30})));
  Components.Pipes.PhysicalModels.Pipe pipe3(
    use_HeatLoss=false,
    length=1.6,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    use_HeatLoss=false,
    length=11.15,
    diameter=0.05,
    n_Bending=13) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,30})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    use_HeatLoss=false,
    length=11.15,
    diameter=0.05,
    n_Bending=13) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,-30})));
  Systems.HNHT.CentralMachineHeatingSystem CentralMachineHeatingSystem annotation (Placement(transformation(extent={{120,10},{140,-10}})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    use_HeatLoss=false,
    length=7.5,
    diameter=0.04,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={130,30})));
  Components.Pipes.PhysicalModels.Pipe pipe11(
    use_HeatLoss=false,
    length=7.5,
    diameter=0.04,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={130,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe12(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,70})));
  Components.Pipes.PhysicalModels.Pipe pipe15(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,70})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold annotation (Placement(transformation(extent={{104,-12},{110,-6}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,0; 14400,0; 15300,0; 16200,0; 17100,0; 18000,-24; 18900,-17; 19800,-17; 20700,-17; 21600,-15; 22500,-14; 23400,-13; 24300,-12; 25200,-10; 26100,-9; 27000,-9; 27900,-9; 28800,-8; 29700,-8; 30600,-8; 31500,-8; 32400,-8; 33300,-8; 34200,-8; 35100,-8; 36000,-8; 36900,-8; 37800,-8; 38700,-8; 39600,-8; 40500,-8; 41400,-8; 42300,-8; 43200,-8; 44100,-8; 45000,-8; 45900,
        -8; 46800,-8; 47700,-8; 48600,-8; 49500,-8; 50400,-8; 51300,-8; 52200,-8; 53100,-8; 54000,-8; 54900,-8; 55800,-8; 56700,-8; 57600,-8; 58500,-8; 59400,-8; 60300,-8; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0; 88200,0; 89100,0; 90000,0; 90900,0; 91800,0; 92700,0;
        93600,0; 94500,0; 95400,0; 96300,0; 97200,0; 98100,0; 99000,0; 99900,0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{86,2},{96,12}})));
  Modelica.Blocks.Math.Gain gain(k=1000) annotation (Placement(transformation(extent={{106,4},{112,10}})));
equation
  //states
  localState1.fUpperTemperature =BufferStorage.localStorageState.fUpperTemperature;
  localState1.fMidTemperature =BufferStorage.localStorageState.fMidTemperature;
  localState1.fLowerTemperature =BufferStorage.localStorageState.fLowerTemperature;
  localState1.fUpperTemperature_ActiveStorage =VSIStorageSystem.localStorageState.fUpperTemperature;
  localState1.fLowerTemperature_ActiveStorage =VSIStorageSystem.localStorageState.fLowerTemperature;

  //controls
  CondensingBoilerSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_CondensingBoiler;
  CondensingBoilerSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CondensingBoilerSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  CHP1System.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_CHP1;
  CHP1System.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CHP1System.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  CHP2System.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_CHP2;
  CHP2System.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CHP2System.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  StaticHeatingSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_StaticHeating;
  StaticHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  StaticHeatingSystem.fSetPointAutomatic = controlAutomatic.fTargetTemperature_ProductionHall;
  //VSIStorageSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_VSIStorage;
  VSIStorageSystem.bSetStatusOnAutomatic = true;
  VSIStorageSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  VSIStorageSystem.fSetPointAutomatic = 30;
  VSIStorageSystem.bLoadingAutomatic = controlAutomatic.bLoading_VSIStorage;
  CentralMachineHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CentralMachineHeatingSystem.fSetPointAutomatic  = 5;
  ambientState.fOutsideTemperature = StaticHeatingSystem.fAmbientTemperature;

  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{79,90},{50,90},{50,110}},    color={0,0,0}));
  connect(pipe.port_a, CHP1System.port_b) annotation (Line(points={{0,20},{0,10}}, color={0,127,255}));
  connect(pipe.port_b, BufferStorage.port_b) annotation (Line(points={{20,20},{40,20},{40,10}}, color={0,127,255}));
  connect(pipe1.port_a, BufferStorage.port_a) annotation (Line(points={{20,-20},{40,-20},{40,-10}}, color={0,127,255}));
  connect(pipe1.port_b, CHP1System.port_a) annotation (Line(points={{0,-20},{0,-10}}, color={0,127,255}));
  connect(pipe2.port_b, pipe.port_a) annotation (Line(points={{-20,20},{0,20}}, color={0,127,255}));
  connect(pipe2.port_a, CHP2System.port_b) annotation (Line(points={{-40,20},{-40,10}}, color={0,127,255}));
  connect(pipe3.port_a, pipe1.port_b) annotation (Line(points={{-20,-20},{0,-20}}, color={0,127,255}));
  connect(pipe3.port_b, CHP2System.port_a) annotation (Line(points={{-40,-20},{-40,-10}}, color={0,127,255}));
  connect(pipe4.port_b, pipe2.port_a) annotation (Line(points={{-60,20},{-40,20}}, color={0,127,255}));
  connect(pipe5.port_a, pipe3.port_b) annotation (Line(points={{-60,-20},{-40,-20}}, color={0,127,255}));
  connect(pipe8.port_a, BufferStorage.port_b) annotation (Line(points={{60,20},{40,20},{40,10}}, color={0,127,255}));
  connect(pipe9.port_b, BufferStorage.port_a) annotation (Line(points={{60,-20},{40,-20},{40,-10}}, color={0,127,255}));
  connect(pipe10.port_a, pipe8.port_b) annotation (Line(points={{120,20},{80,20}}, color={0,127,255}));
  connect(pipe11.port_b, pipe9.port_a) annotation (Line(points={{120,-20},{80,-20}}, color={0,127,255}));
  connect(pipe10.port_b,CentralMachineHeatingSystem. port_a) annotation (Line(points={{140,20},{140,10}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.port_b, pipe11.port_a) annotation (Line(points={{140,-10},{140,-20}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_a, pipe8.port_b) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_b, pipe9.port_a) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.bSetStatusOnAutomatic, lessThreshold.y) annotation (Line(points={{118,-9},{110.3,-9}}, color={255,0,255}));
  connect(boundary.ports[1], pipe11.port_a) annotation (Line(points={{160,-30},{150,-30},{150,-20},{140,-20}}, color={0,127,255}));
  connect(CondensingBoilerSystem.port_a, pipe5.port_b) annotation (Line(points={{-80,-10},{-80,-20}}, color={0,127,255}));
  connect(CondensingBoilerSystem.port_b, pipe4.port_a) annotation (Line(points={{-80,10},{-80,20}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a2, pipe15.port_b) annotation (Line(points={{42,72},{42,80},{52,80}}, color={0,127,255}));
  connect(pipe15.port_a, BufferStorage.port_b) annotation (Line(points={{72,80},{72,60},{50,60},{50,20},{40,20},{40,10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_b1, pipe12.port_a) annotation (Line(points={{38,72},{38,80},{0,80}}, color={0,127,255}));
  connect(VSIStorageSystem.port_b2, BufferStorage.port_a) annotation (Line(points={{42,52},{46,52},{46,-10},{40,-10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a1, BufferStorage.port_a) annotation (Line(points={{38,52},{38,-10},{40,-10}}, color={0,127,255}));
  connect(pipe12.port_b, BufferStorage.port_b) annotation (Line(points={{-20,80},{-20,40},{40,40},{40,10}}, color={0,127,255}));
  connect(combiTimeTable.y[1], gain.u) annotation (Line(points={{96.5,7},{101.25,7},{101.25,7},{105.4,7}}, color={0,0,127}));
  connect(gain.y, CentralMachineHeatingSystem.fHeatFlowRate) annotation (Line(points={{112.3,7},{114.15,7},{114.15,7},{118,7}}, color={0,0,127}));
  connect(lessThreshold.u, gain.u) annotation (Line(points={{103.4,-9},{100,-9},{100,7},{105.4,7}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT_Only;
