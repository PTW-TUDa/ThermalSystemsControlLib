within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks;
model HNHT_Only
  extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=328.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.CHP1System CHP1System annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.CondensingBoilerSystem CondensingBoilerSystem annotation (Placement(transformation(extent={{-160,-10},{-140,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.CHP2System CHP2System annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.StaticHeatingSystem StaticHeatingSystem annotation (Placement(transformation(extent={{60,10},{80,-10}})));
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
  Systems.HNHT.VSIStorageSystem VSIStorageSystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{0,80},{20,60}})));
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
    length=3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    use_HeatLoss=false,
    length=3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    use_HeatLoss=false,
    length=8.15,
    diameter=0.025,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-130,30})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    use_HeatLoss=false,
    length=8.15,
    diameter=0.025,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-30})));
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
    length=5.3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,70})));
  Components.Pipes.PhysicalModels.Pipe pipe13(
    use_HeatLoss=false,
    length=5.3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,-70})));
  Components.Pipes.PhysicalModels.Pipe pipe15(
    use_HeatLoss=false,
    length=1.75,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,70})));
  Components.Pipes.PhysicalModels.Pipe pipe16(
    use_HeatLoss=false,
    length=1.75,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,-68})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0.0,0.0; 172800,-15e3; 259200,0.0], smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{86,2},{96,12}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(table=[-10 + 273.15,-7e3; 15 + 273.15,0], extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
                                                                         annotation (Placement(transformation(extent={{44,2},{54,12}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold annotation (Placement(transformation(extent={{104,-12},{110,-6}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(
    table=[0.0,0.0; 172000,-15e3; 260000,0.0],
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{86,-14},{96,-4}})));
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
  StaticHeatingSystem.fSetPointAutomatic = 0;
  VSIStorageSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_VSIStorage;
  VSIStorageSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  VSIStorageSystem.fSetPointAutomatic = 0.5;
  VSIStorageSystem.bLoadingAutomatic = controlAutomatic.bLoading_VSIStorage;
  CentralMachineHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CentralMachineHeatingSystem.fSetPointAutomatic  = 100;

  ambientState.fOutsideTemperature = combiTable1D.u[1];
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
  connect(pipe7.port_a, pipe5.port_b) annotation (Line(points={{-120,-20},{-80,-20}}, color={0,127,255}));
  connect(pipe6.port_b, pipe4.port_a) annotation (Line(points={{-120,20},{-80,20}}, color={0,127,255}));
  connect(CondensingBoilerSystem.port_a, pipe7.port_b) annotation (Line(points={{-140,-10},{-140,-20}}, color={0,127,255}));
  connect(pipe6.port_a, CondensingBoilerSystem.port_b) annotation (Line(points={{-140,20},{-140,10}}, color={0,127,255}));
  connect(pipe8.port_a, BufferStorage.port_b) annotation (Line(points={{60,20},{40,20},{40,10}}, color={0,127,255}));
  connect(pipe9.port_b, BufferStorage.port_a) annotation (Line(points={{60,-20},{40,-20},{40,-10}}, color={0,127,255}));
  connect(pipe10.port_a, pipe8.port_b) annotation (Line(points={{120,20},{80,20}}, color={0,127,255}));
  connect(pipe11.port_b, pipe9.port_a) annotation (Line(points={{120,-20},{80,-20}}, color={0,127,255}));
  connect(pipe10.port_b,CentralMachineHeatingSystem. port_a) annotation (Line(points={{140,20},{140,10}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.port_b, pipe11.port_a) annotation (Line(points={{140,-10},{140,-20}}, color={0,127,255}));
  connect(pipe12.port_a, VSIStorageSystem.port_b1) annotation (Line(points={{-20,80},{16,80}},
                                                                                             color={0,127,255}));
  connect(pipe12.port_b, pipe4.port_a) annotation (Line(points={{-40,80},{-100,80},{-100,20},{-80,20}}, color={0,127,255}));
  connect(pipe13.port_a, pipe5.port_b) annotation (Line(points={{-40,-60},{-100,-60},{-100,-20},{-80,-20}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a1, pipe13.port_b) annotation (Line(points={{16,60},{16,-60},{-20,-60}},
                                                                                                       color={0,127,255}));
  connect(VSIStorageSystem.port_b2, pipe16.port_a) annotation (Line(points={{20,60},{46,60},{46,-58},{50,-58}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a2, pipe15.port_b) annotation (Line(points={{20,80},{52,80}}, color={0,127,255}));
  connect(StaticHeatingSystem.fHeatFlowRate, combiTable1D.y[1]) annotation (Line(points={{58,7},{54.5,7},{54.5,7}}, color={0,0,127}));
  connect(StaticHeatingSystem.port_a, pipe8.port_b) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_b, pipe9.port_a) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.bSetStatusOnAutomatic, lessThreshold.y) annotation (Line(points={{118,-9},{110.3,-9}}, color={255,0,255}));
  connect(combiTimeTable.y[1], CentralMachineHeatingSystem.fHeatFlowRate) annotation (Line(points={{96.5,7},{106.25,7},{106.25,7},{118,7}}, color={0,0,127}));
  connect(lessThreshold.u, combiTimeTable1.y[1]) annotation (Line(points={{103.4,-9},{96.5,-9},{96.5,-9}}, color={0,0,127}));
  connect(boundary.ports[1], pipe11.port_a) annotation (Line(points={{160,-30},{150,-30},{150,-20},{140,-20}}, color={0,127,255}));
  connect(pipe16.port_b, BufferStorage.port_a) annotation (Line(points={{70,-58},{70,-48},{40,-48},{40,-10}}, color={0,127,255}));
  connect(pipe15.port_a, BufferStorage.port_b) annotation (Line(points={{72,80},{72,50},{40,50},{40,10}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT_Only;
