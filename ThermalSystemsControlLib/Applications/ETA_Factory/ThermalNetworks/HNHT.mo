within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNHT
  extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=328.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.CHP1System CHP1System annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.CondensingBoilerSystem CondensingBoilerSystem annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.CHP2System CHP2System annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.StaticHeatingSystem StaticHeatingSystem annotation (Placement(transformation(extent={{80,10},{100,-10}})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,0})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Linkage(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Linkage(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  output Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  input Interfaces.hnhtControl controlAutomatic annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[273.15,-2e3; 288.15,0.0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,           extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{-80,80},{-100,100}})));
  inner Modelica.Fluid.System system(T_start=T_start)  annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Systems.VSIStorageSystem VSIStorageSystem(T_start=T_start_ActiveStorage)
                                            annotation (Placement(transformation(extent={{10,10},{30,-10}})));
equation
  //states
  localState1.fUpperTemperature = BufferStorage.localState.fUpperTemperature;
  localState1.fMidTemperature = BufferStorage.localState.fMidTemperature;
  localState1.fLowerTemperature = BufferStorage.localState.fLowerTemperature;
  localState1.fUpperTemperature_ActiveStorage = VSIStorageSystem.localState.fUpperTemperature;
  localState1.fLowerTemperature_ActiveStorage = VSIStorageSystem.localState.fLowerTemperature;

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
  VSIStorageSystem.nControlModeAutomatic = controlAutomatic.nControlMode_VSIStorage;

  combiTable1D.u[1] = ambientState.fOutsideTemperature;
  ambientState.fOutsideTemperature = StaticHeatingSystem.fAmbientTemperature;

  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{-79,90},{-50,90},{-50,110}}, color={0,0,0}));
  connect(StaticHeatingSystem.fHeatFlowRate, combiTable1D.y[1]) annotation (Line(points={{78,7},{78,-70},{1,-70}},  color={0,0,127}));
  connect(CondensingBoilerSystem.port_a, BufferStorage.port_a) annotation (Line(points={{-80,-10},{-80,-20},{60,-20},{60,-10}}, color={0,127,255}));
  connect(CHP1System.port_a, BufferStorage.port_a) annotation (Line(points={{-50,-10},{-50,-20},{60,-20},{60,-10}}, color={0,127,255}));
  connect(CHP2System.port_a, BufferStorage.port_a) annotation (Line(points={{-10,-10},{-10,-20},{60,-20},{60,-10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a1, BufferStorage.port_a) annotation (Line(points={{26,-10},{26,-20},{60,-20},{60,-10}}, color={0,127,255}));
  connect(CHP1System.port_b, BufferStorage.port_b) annotation (Line(points={{-50,10},{-50,20},{60,20},{60,10}}, color={0,127,255}));
  connect(CHP2System.port_b, BufferStorage.port_b) annotation (Line(points={{-10,10},{-10,20},{60,20},{60,10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_b1, BufferStorage.port_b) annotation (Line(points={{26,10},{26,20},{60,20},{60,10}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_a, BufferStorage.port_b) annotation (Line(points={{100,10},{100,20},{60,20},{60,10}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_b, BufferStorage.port_a) annotation (Line(points={{100,-10},{100,-20},{60,-20},{60,-10}}, color={0,127,255}));
  connect(port_b_HNLT_Linkage, BufferStorage.port_b) annotation (Line(points={{100,60},{60,60},{60,10}}, color={0,127,255}));
  connect(port_a_HNLT_Linkage, BufferStorage.port_a) annotation (Line(points={{100,-60},{60,-60},{60,-10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a2, BufferStorage.port_b) annotation (Line(points={{30,10},{30,40},{60,40},{60,10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_b2, BufferStorage.port_a) annotation (Line(points={{30,-10},{30,-40},{60,-40},{60,-10}}, color={0,127,255}));
  connect(boundary.ports[1], BufferStorage.port_a) annotation (Line(points={{-80,-50},{30,-50},{30,-40},{60,-40},{60,-10}}, color={0,127,255}));
  connect(CondensingBoilerSystem.port_b, BufferStorage.port_b) annotation (Line(points={{-80,10},{-80,20},{60,20},{60,10}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT;
