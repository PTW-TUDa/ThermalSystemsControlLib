within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNLT_CN
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  input Interfaces.hnltCnLinkageControl   controlAutomatic annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Systems.HNLT_CN.HeatPumpSystem   HeatPumpSystem annotation (Placement(transformation(extent={{80,-12},{60,8}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,30})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={90,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={50,-30})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Systems.HNLT_CN.UnderfloorHeatingSystem UnderfloorHeatingSystem annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,0})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-90,30})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-90,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe3(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-50,30})));
  Systems.HNLT_CN.InnerCapillaryTubeMatsSystem InnerCapillaryTubeMats annotation (Placement(transformation(extent={{-20,10},{0,-10}})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-10,50})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,-50})));
  Components.Pipes.PhysicalModels.Pipe pipe11(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,50})));
  Components.Pipes.PhysicalModels.Pipe pipe12(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={22,-50})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
equation
  HeatPumpSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HeatPump;
  HeatPumpSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_CN and controlAutomatic.bAlgorithmPermission_HNLT;
  HeatPumpSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature_HNLT_Heating;
  UnderfloorHeatingSystem.bSetStatusOnAutomatic = true;
  UnderfloorHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_CN and controlAutomatic.bAlgorithmPermission_HNLT;
  UnderfloorHeatingSystem.fSetPointAutomatic = controlAutomatic.fTargetTemperature_ProductionHall;
  UnderfloorHeatingSystem.bHeatingModeAutomatic = controlAutomatic.bHeatingMode;
  InnerCapillaryTubeMats.bSetStatusOnAutomatic = true;
  InnerCapillaryTubeMats.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_CN and controlAutomatic.bAlgorithmPermission_HNLT;
  InnerCapillaryTubeMats.fSetPointAutomatic = controlAutomatic.fTargetTemperature_ProductionHall;
  InnerCapillaryTubeMats.bHeatingModeAutomatic = controlAutomatic.bHeatingMode;
  ambientState.fOutsideTemperature =  UnderfloorHeatingSystem.fAmbientTemperature;
  ambientState.fOutsideTemperature = InnerCapillaryTubeMats.fAmbientTemperature;
  connect(HeatPumpSystem.port_a1, pipe5.port_b) annotation (Line(points={{64,8},{64,40},{80,40}},    color={0,127,255}));
  connect(pipe5.port_a, port_a_CN_Producer) annotation (Line(points={{100,40},{100,60}},        color={0,127,255}));
  connect(HeatPumpSystem.port_b1, pipe6.port_a) annotation (Line(points={{64,-12},{64,-20},{80,-20}},    color={0,127,255}));
  connect(pipe6.port_b, port_b_CN_Producer) annotation (Line(points={{100,-20},{100,-60}},         color={0,127,255}));
  connect(pipe4.port_b,port_b_HNLT_Producer)  annotation (Line(points={{40,40},{40,100},{-100,100}}, color={0,127,255}));
  connect(pipe4.port_a, HeatPumpSystem.port_b2) annotation (Line(points={{60,40},{60,8}},            color={0,127,255}));
  connect(pipe7.port_b, HeatPumpSystem.port_a2) annotation (Line(points={{60,-20},{60,-12}},             color={0,127,255}));
  connect(pipe7.port_a, port_a_HNLT_Producer) annotation (Line(points={{40,-20},{40,-100},{-100,-100}},   color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_b_HNLT, pipe1.port_a) annotation (Line(points={{-80,-10},{-80,-40}}, color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_a_HNLT, pipe8.port_b) annotation (Line(points={{-80,10},{-80,40}}, color={0,127,255}));
  connect(pipe8.port_a, port_a_HNLT_Consumer) annotation (Line(points={{-100,40},{-100,60}}, color={0,127,255}));
  connect(pipe1.port_b, port_b_HNLT_Consumer) annotation (Line(points={{-100,-40},{-100,-60}}, color={0,127,255}));
  connect(pipe2.port_b, UnderfloorHeatingSystem.port_a_CN) annotation (Line(points={{-60,-40},{-66,-40},{-66,0},{-76,0},{-76,10}}, color={0,127,255}));
  connect(port_a_CN_Consumer, pipe2.port_a) annotation (Line(points={{100,-100},{80,-100},{80,-80},{-30,-80},{-30,-40},{-40,-40}}, color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_b_HNLT1, pipe3.port_a) annotation (Line(points={{-76,-10},{-72,-10},{-72,40},{-60,40}}, color={0,127,255}));
  connect(pipe3.port_b, port_b_CN_Consumer) annotation (Line(points={{-40,40},{-30,40},{-30,80},{100,80},{100,100}}, color={0,127,255}));
  connect(pipe9.port_a, port_a_HNLT_Consumer) annotation (Line(points={{-20,60},{-100,60}}, color={0,127,255}));
  connect(pipe10.port_b, port_b_HNLT_Consumer) annotation (Line(points={{-20,-60},{-100,-60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_a_CN, pipe12.port_b) annotation (Line(points={{-4,10},{-4,0},{12,0},{12,-60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_b_HNLT1, pipe11.port_a) annotation (Line(points={{-4,-10},{-4,-4},{10,-4},{10,60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_b_HNLT, pipe10.port_a) annotation (Line(points={{0,-10},{0,-60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_a_HNLT, pipe9.port_b) annotation (Line(points={{0,10},{0,60}}, color={0,127,255}));
  connect(pipe11.port_b, port_b_CN_Consumer) annotation (Line(points={{30,60},{60,60},{60,100},{100,100}}, color={0,127,255}));
  connect(pipe12.port_a, port_a_CN_Consumer) annotation (Line(points={{32,-60},{80,-60},{80,-100},{100,-100}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNLT_CN;
