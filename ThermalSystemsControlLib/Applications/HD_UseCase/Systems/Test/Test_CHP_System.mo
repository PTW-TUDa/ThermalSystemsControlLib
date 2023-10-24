within ThermalSystemsControlLib.Applications.HD_UseCase.Systems.Test;
model Test_CHP_System
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={8,70})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={8,30})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={8,-70})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater annotation (__Dymola_choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=600) annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=10,
    freqHz=1/1800,
    offset=60 + 273.15) annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false) annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  ThermalSystemsControlLib.Applications.HD_UseCase.Systems.CHPSystem cHPSystem annotation (Placement(transformation(extent={{0,-20},{20,0}})));
equation

  connect(temperature.port_a, massFlowRate.port_b) annotation (Line(points={{8,60},{8,40}}, color={0,127,255}));
  connect(temperature1.port_a, boundary.ports[1]) annotation (Line(points={{8,-80},{8,-90},{40,-90},{40,2}}, color={0,127,255}));
  connect(temperature.port_b, boundary.ports[2]) annotation (Line(points={{8,80},{8,90},{40,90},{40,-2}}, color={0,127,255}));
  connect(massFlowRate.port_a, cHPSystem.port_b) annotation (Line(points={{8,20},{20,20},{20,0}}, color={0,127,255}));
  connect(temperature1.port_b, cHPSystem.port_a) annotation (Line(points={{8,-60},{8,-40},{20,-40},{20,-20}}, color={0,127,255}));
  connect(sine.y, cHPSystem.fSetPointAutomatic) annotation (Line(points={{-79,-50},{-2,-50},{-2,-9}}, color={0,0,127}));
  connect(cHPSystem.bSetStatusOnAutomatic, booleanPulse.y) annotation (Line(points={{-2,-1},{-40,-1},{-40,30},{-79,30}}, color={255,0,255}));
  connect(booleanConstant.y, cHPSystem.bAlgorithmPermission) annotation (Line(points={{-79,-10},{-40,-10},{-40,-5},{-2,-5}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Test_CHP_System;
