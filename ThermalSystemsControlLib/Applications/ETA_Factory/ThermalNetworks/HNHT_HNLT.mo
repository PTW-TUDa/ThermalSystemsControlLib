within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNHT_HNLT
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  input Interfaces.hnhtHnltLinkageControl controlAutomatic annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNHT(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                      annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HeatExchanger1System HeatExchanger1System annotation (Placement(transformation(extent={{-12,-12},{8,8}})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    length=30,
    diameter=0.04,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={50,50})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=30,
    diameter=0.04,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-70})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=15,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-70})));
  Components.Pipes.PhysicalModels.Pipe pipe3(
    length=15,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,50})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=30,
    diameter=0.03,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,50})));
equation
  HeatExchanger1System.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HeatExchanger1;
  HeatExchanger1System.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_HNHT and controlAutomatic.bAlgorithmPermission_HNLT;
  HeatExchanger1System.fSetPointAutomatic = controlAutomatic.fFeedTemperature_HNLT_Heating;
  connect(HeatExchanger1System.port_b2, pipe8.port_a) annotation (Line(points={{8,8},{8,60},{40,60}}, color={0,127,255}));
  connect(pipe8.port_b, port_b_HNLT) annotation (Line(points={{60,60},{100,60}}, color={0,127,255}));
  connect(HeatExchanger1System.port_a2, pipe1.port_b) annotation (Line(points={{8,-12},{8,-60},{40,-60}}, color={0,127,255}));
  connect(pipe1.port_a, port_a_HNLT) annotation (Line(points={{60,-60},{100,-60}}, color={0,127,255}));
  connect(HeatExchanger1System.port_b1, pipe2.port_b) annotation (Line(points={{4,-12},{4,-60},{-60,-60}}, color={0,127,255}));
  connect(pipe2.port_a, port_b_HNHT) annotation (Line(points={{-40,-60},{-100,-60}}, color={0,127,255}));
  connect(pipe3.port_b, port_a_HNHT) annotation (Line(points={{-80,60},{-100,60}}, color={0,127,255}));
  connect(pipe3.port_a, pipe4.port_b) annotation (Line(points={{-60,60},{-40,60}}, color={0,127,255}));
  connect(pipe4.port_a, HeatExchanger1System.port_a1) annotation (Line(points={{-20,60},{4,60},{4,8}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT_HNLT;
