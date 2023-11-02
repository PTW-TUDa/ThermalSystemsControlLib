within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks;
model HNHT_HNLT
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  input Interfaces.hnhtHnltLinkageControl controlAutomatic annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNHT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT_HNLT.HeatExchanger1System HeatExchanger1System annotation (Placement(transformation(extent={{40,-12},{60,8}})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    length=30,
    diameter=0.03,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={70,50})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=30,
    diameter=0.03,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,-70})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=5,
    diameter=0.04,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-70})));
  Components.Pipes.PhysicalModels.Pipe pipe3(
    length=5,
    diameter=0.04,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,50})));
  Systems.HNHT_HNLT.HeatPumpSystem HeatPumpSystem annotation (Placement(transformation(extent={{-20,-12},{-40,8}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=5,
    diameter=0.04,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,30})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    length=5,
    diameter=0.04,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    length=5,
    diameter=0.04,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-10,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    length=5,
    diameter=0.04,
    n_Bending=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-70,-30})));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
equation
  HeatExchanger1System.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HeatExchanger1;
  HeatExchanger1System.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_HNHT and controlAutomatic.bAlgorithmPermission_HNLT;
  HeatExchanger1System.fSetPointAutomatic = controlAutomatic.fFeedTemperature_HNLT_Heating;
  HeatPumpSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HeatPump;
  HeatPumpSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_HNHT and controlAutomatic.bAlgorithmPermission_HNLT;
  HeatPumpSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature_HNHT;
  connect(HeatExchanger1System.port_b2, pipe8.port_a) annotation (Line(points={{60,8},{60,60}},       color={0,127,255}));
  connect(pipe8.port_b, port_b_HNLT_Producer) annotation (Line(points={{80,60},{80,100},{100,100}}, color={0,127,255}));
  connect(HeatExchanger1System.port_a2, pipe1.port_b) annotation (Line(points={{60,-12},{60,-60}},        color={0,127,255}));
  connect(pipe1.port_a, port_a_HNLT_Producer) annotation (Line(points={{80,-60},{80,-100},{100,-100}}, color={0,127,255}));
  connect(pipe3.port_b, HeatExchanger1System.port_a1) annotation (Line(points={{40,60},{56,60},{56,8}},color={0,127,255}));
  connect(pipe2.port_a, HeatExchanger1System.port_b1) annotation (Line(points={{40,-60},{56,-60},{56,-12}},color={0,127,255}));
  connect(pipe2.port_b, port_b_HNHT_Consumer) annotation (Line(points={{20,-60},{-100,-60}}, color={0,127,255}));
  connect(HeatPumpSystem.port_a1, pipe5.port_b) annotation (Line(points={{-36,8},{-36,40},{-20,40}}, color={0,127,255}));
  connect(pipe5.port_a, port_a_HNLT_Consumer) annotation (Line(points={{0,40},{100,40},{100,60}}, color={0,127,255}));
  connect(HeatPumpSystem.port_b1, pipe6.port_a) annotation (Line(points={{-36,-12},{-36,-20},{-20,-20}}, color={0,127,255}));
  connect(pipe6.port_b, port_b_HNLT_Consumer) annotation (Line(points={{0,-20},{100,-20},{100,-60}}, color={0,127,255}));
  connect(pipe4.port_b, port_b_HNHT_Producer) annotation (Line(points={{-80,40},{-80,100},{-100,100}},
                                                                                                     color={0,127,255}));
  connect(pipe4.port_a, HeatPumpSystem.port_b2) annotation (Line(points={{-60,40},{-40,40},{-40,8}}, color={0,127,255}));
  connect(pipe7.port_b, HeatPumpSystem.port_a2) annotation (Line(points={{-60,-20},{-40,-20},{-40,-12}}, color={0,127,255}));
  connect(pipe7.port_a, port_a_Producer) annotation (Line(points={{-80,-20},{-80,-100},{-100,-100}}, color={0,127,255}));
  connect(pipe3.port_a, volumeFlowRate.port_b) annotation (Line(points={{20,60},{-20,60}}, color={0,127,255}));
  connect(volumeFlowRate.port_a, port_a_HNHT_Consumer) annotation (Line(points={{-40,60},{-100,60}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT_HNLT;
