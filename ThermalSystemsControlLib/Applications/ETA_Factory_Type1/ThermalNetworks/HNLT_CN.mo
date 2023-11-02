within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks;
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
        origin={30,30})));
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
        origin={30,-30})));
equation
  HeatPumpSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HeatPump;
  HeatPumpSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_CN and controlAutomatic.bAlgorithmPermission_HNLT;
  HeatPumpSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature_HNLT_Heating;
  connect(HeatPumpSystem.port_a1, pipe5.port_b) annotation (Line(points={{64,8},{64,40},{80,40}},    color={0,127,255}));
  connect(pipe5.port_a, port_a_CN_Producer) annotation (Line(points={{100,40},{100,60}},        color={0,127,255}));
  connect(HeatPumpSystem.port_b1, pipe6.port_a) annotation (Line(points={{64,-12},{64,-20},{80,-20}},    color={0,127,255}));
  connect(pipe6.port_b, port_b_CN_Producer) annotation (Line(points={{100,-20},{100,-60}},         color={0,127,255}));
  connect(pipe4.port_b,port_b_HNLT_Producer)  annotation (Line(points={{20,40},{20,100},{-100,100}}, color={0,127,255}));
  connect(pipe4.port_a, HeatPumpSystem.port_b2) annotation (Line(points={{40,40},{60,40},{60,8}},    color={0,127,255}));
  connect(pipe7.port_b, HeatPumpSystem.port_a2) annotation (Line(points={{40,-20},{60,-20},{60,-12}},    color={0,127,255}));
  connect(pipe7.port_a, port_a_HNLT_Producer) annotation (Line(points={{20,-20},{20,-100},{-100,-100}},   color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNLT_CN;
