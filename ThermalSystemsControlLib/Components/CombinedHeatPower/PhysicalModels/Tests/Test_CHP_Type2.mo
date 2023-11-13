within ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Tests;
model Test_CHP_Type2
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  CHP_Type2 cHP_Type2_1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, redeclare Records.CombinedHeatPower_Type2_Properties deviceData(
      P_el_nom=5000,
      P_gs_nom=15000,
      f_effPth=[30 + 273.15,0.68; 40 + 273.15,0.66; 50 + 273.15,0.59; 60 + 273.15,0.55; 65 + 273.15,0.53],
      u_min=0.5,
      riseTime=180)) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=318.15,
    nPorts=1) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, nPorts=1) annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Sources.SawTooth sawTooth(
    amplitude=20000,
    period=3600,
    offset=0) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=10,
    freqHz=1/3600,
    offset=70 + 273.15) annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
equation
  connect(temperature.port_b, massFlowRate.port_a) annotation (Line(points={{-50,0},{-40,0}}, color={0,127,255}));
  connect(boundary.ports[1], temperature.port_a) annotation (Line(points={{-80,0},{-70,0}}, color={0,127,255}));
  connect(massFlowRate.port_b, cHP_Type2_1.port_a) annotation (Line(points={{-20,0},{-10,0}}, color={0,127,255}));
  connect(cHP_Type2_1.port_b, temperature1.port_a) annotation (Line(points={{10,0},{20,0}}, color={0,127,255}));
  connect(temperature1.port_b, massFlowRate1.port_a) annotation (Line(points={{40,0},{50,0}}, color={0,127,255}));
  connect(massFlowRate1.port_b, boundary1.ports[1]) annotation (Line(points={{70,0},{80,0}}, color={0,127,255}));
  connect(cHP_Type2_1.fSetPoint, sawTooth.y) annotation (Line(points={{0,12},{0,30},{-39,30}}, color={0,0,127}));
  connect(sine.y, cHP_Type2_1.fTargetTemperature) annotation (Line(points={{-39,70},{5,70},{5,12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Test_CHP_Type2;
