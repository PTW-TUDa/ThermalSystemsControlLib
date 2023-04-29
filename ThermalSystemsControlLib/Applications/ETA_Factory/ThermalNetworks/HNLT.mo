within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNLT
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
    parameter SI.Temperature T_start=308.15 "Start value of buffer storage temperature";
  Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT_Linakge(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNHT_Linkage(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,10})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{-80,80},{-100,100}})));
  inner Modelica.Fluid.System system(T_start=T_start)  annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Systems.UnderfloorHeatingSystem UnderfloorHeatingSystem annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={90,0})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[273.15,-7e3; 293.15,0.0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                                                                       annotation (Placement(transformation(extent={{40,0},{60,20}})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Interfaces.hnltControl controlAutomatic annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    length=30,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={50,50})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=30,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={50,-50})));
equation
   //states
  localState1.fUpperTemperature = BufferStorage.localState.fUpperTemperature;
  localState1.fMidTemperature = BufferStorage.localState.fMidTemperature;
  localState1.fLowerTemperature = BufferStorage.localState.fLowerTemperature;
  //must be added with hvfa
  localState1.fUpperTemperature_ActiveStorage = 0;
  localState1.fLowerTemperature_ActiveStorage = 0;
  UnderfloorHeatingSystem.bSetStatusOnAutomatic = true;
  UnderfloorHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  UnderfloorHeatingSystem.fSetPointAutomatic = 0;

  combiTable1D.u[1] = ambientState.fOutsideTemperature;
  ambientState.fOutsideTemperature =  UnderfloorHeatingSystem.fAmbientTemperature;

  connect(port_a_HNHT_Linkage,BufferStorage. port_b) annotation (Line(points={{-100,60},{0,60},{0,20}}, color={0,127,255}));
  connect(BufferStorage.port_a, port_b_HNHT_Linakge) annotation (Line(points={{0,0},{0,-60},{-100,-60}},                       color={0,127,255}));
  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{-79,90},{-50,90},{-50,110}},
                                                                                                            color={0,0,0}));
  connect(UnderfloorHeatingSystem.fHeatFlowRate, combiTable1D.y[1]) annotation (Line(points={{78,7},{76,7},{76,10},{61,10}}, color={0,0,127}));
  connect(boundary.ports[1], BufferStorage.port_a) annotation (Line(points={{-40,-70},{0,-70},{0,0}}, color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_a, pipe8.port_b) annotation (Line(points={{100,10},{100,60},{60,60}}, color={0,127,255}));
  connect(pipe8.port_a, BufferStorage.port_b) annotation (Line(points={{40,60},{0,60},{0,20}}, color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_b, pipe1.port_a) annotation (Line(points={{100,-10},{100,-60},{60,-60}}, color={0,127,255}));
  connect(pipe1.port_b, BufferStorage.port_a) annotation (Line(points={{40,-60},{0,-60},{0,0}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNLT;
