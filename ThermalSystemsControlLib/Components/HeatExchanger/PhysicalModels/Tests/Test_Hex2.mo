within ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Tests;
model Test_Hex2
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  HeatExchanger.PhysicalModels.HeatExchanger_Type2 heatExchanger_Type2_1(deviceData(
      U=1490,
      A=1.12,
      V1=0.0015,
      V2=0.0015,
      P_th_nom=50e3,
      dT_min=1,
      control_ReturnTemperature=true))
                         annotation (Placement(transformation(extent={{-12,-8},{8,12}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=313.15,
    nPorts=1) annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=323.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,30})));
  Modelica.Fluid.Sources.FixedBoundary boundary2(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=343.15,
    nPorts=1) annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Fluid.Sources.FixedBoundary boundary3(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=353.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={88,-30})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T1_in(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T2_out(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-40,-40},{-60,-20}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T2_in(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{60,-40},{40,-20}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T1_out(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Sources.Step step(
    height=25,
    offset=50 + 273.15,
    startTime=1000)
                   annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=25e3,
    freqHz=1/100,
    offset=-25e3)
                 annotation (Placement(transformation(extent={{40,60},{20,80}})));
equation
  connect(heatExchanger_Type2_1.port_a1, T1_in.port_b) annotation (Line(points={{-12,6},{-20,6},{-20,30},{-40,30}}, color={0,127,255}));
  connect(T1_in.port_a, boundary.ports[1]) annotation (Line(points={{-60,30},{-80,30}}, color={0,127,255}));
  connect(boundary2.ports[1], T2_out.port_b) annotation (Line(points={{-80,-30},{-60,-30}}, color={0,127,255}));
  connect(T2_out.port_a, heatExchanger_Type2_1.port_b2) annotation (Line(points={{-40,-30},{-20,-30},{-20,-2},{-12,-2}}, color={0,127,255}));
  connect(boundary3.ports[1], T2_in.port_a) annotation (Line(points={{78,-30},{60,-30}}, color={0,127,255}));
  connect(T2_in.port_b, heatExchanger_Type2_1.port_a2) annotation (Line(points={{40,-30},{20,-30},{20,-2},{8,-2}}, color={0,127,255}));
  connect(heatExchanger_Type2_1.port_b1, T1_out.port_a) annotation (Line(points={{8,6},{20,6},{20,30},{40,30}}, color={0,127,255}));
  connect(T1_out.port_b, boundary1.ports[1]) annotation (Line(points={{60,30},{80,30}}, color={0,127,255}));
  connect(step.y, heatExchanger_Type2_1.fControlledTemperature) annotation (Line(points={{-19,70},{-7,70},{-7,14}}, color={0,0,127}));
  connect(sine.y, heatExchanger_Type2_1.fSetPoint) annotation (Line(points={{19,70},{3,70},{3,14}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=2000, __Dymola_Algorithm="Dassl"));
end Test_Hex2;
