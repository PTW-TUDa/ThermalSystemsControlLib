within ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Tests;
model Test_CompressionChiller_Type2
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  CompressionChiller_Type2 compressionChiller_Type2_1(redeclare Applications.ETA_Factory_Type2.Records.ViessmannVitocal200G deviceData) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=318.15,
    nPorts=1) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, nPorts=1) annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary2(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=295.15,
    nPorts=1) annotation (Placement(transformation(extent={{100,-90},{80,-70}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature2(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{70,-90},{50,-70}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{40,-90},{20,-70}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature3(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-20,-90},{-40,-70}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-50,-90},{-70,-70}})));
  Modelica.Fluid.Sources.FixedBoundary boundary3(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=318.15,
    nPorts=1) annotation (Placement(transformation(extent={{-100,-90},{-80,-70}})));
  Modelica.Blocks.Sources.SawTooth sawTooth(amplitude=20000, period=3600) annotation (Placement(transformation(extent={{-100,50},{-80,70}})));
  Modelica.Blocks.Sources.Constant const(k=70 + 273.15) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.Constant const1(k=25 + 273.15) annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
equation
  connect(temperature.port_b, massFlowRate.port_a) annotation (Line(points={{-50,0},{-40,0}}, color={0,127,255}));
  connect(boundary.ports[1], temperature.port_a) annotation (Line(points={{-80,0},{-70,0}}, color={0,127,255}));
  connect(temperature1.port_b, massFlowRate1.port_a) annotation (Line(points={{40,0},{50,0}}, color={0,127,255}));
  connect(massFlowRate1.port_b, boundary1.ports[1]) annotation (Line(points={{70,0},{80,0}}, color={0,127,255}));
  connect(compressionChiller_Type2_1.port_b, temperature1.port_a) annotation (Line(points={{10,0},{20,0}}, color={0,127,255}));
  connect(compressionChiller_Type2_1.port_a, massFlowRate.port_b) annotation (Line(points={{-10,0},{-16,0},{-16,0},{-20,0}}, color={0,127,255}));
  connect(massFlowRate2.port_a, temperature2.port_b) annotation (Line(points={{40,-80},{50,-80}}, color={0,127,255}));
  connect(temperature2.port_a, boundary2.ports[1]) annotation (Line(points={{70,-80},{80,-80}}, color={0,127,255}));
  connect(massFlowRate2.port_b, compressionChiller_Type2_1.port_a1) annotation (Line(points={{20,-80},{10,-80},{10,-10}}, color={0,127,255}));
  connect(compressionChiller_Type2_1.port_b1, temperature3.port_a) annotation (Line(points={{-10,-10},{-10,-80},{-20,-80}}, color={0,127,255}));
  connect(temperature3.port_b, massFlowRate3.port_a) annotation (Line(points={{-40,-80},{-50,-80}}, color={0,127,255}));
  connect(boundary3.ports[1], massFlowRate3.port_b) annotation (Line(points={{-80,-80},{-70,-80}}, color={0,127,255}));
  connect(compressionChiller_Type2_1.fTargetTemperatureCooling, const1.y) annotation (Line(points={{-5,12},{-4,12},{-4,30},{-79,30}}, color={0,0,127}));
  connect(sawTooth.y, compressionChiller_Type2_1.fSetPoint) annotation (Line(points={{-79,60},{0,60},{0,12}}, color={0,0,127}));
  connect(const.y, compressionChiller_Type2_1.fTargetTemperatureHeating) annotation (Line(points={{-79,90},{5,90},{5,12}}, color={0,0,127}));
  annotation (experiment(StopTime=3600, __Dymola_Algorithm="Dassl"));
end Test_CompressionChiller_Type2;
