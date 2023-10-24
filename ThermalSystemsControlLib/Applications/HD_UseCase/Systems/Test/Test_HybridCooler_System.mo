within ThermalSystemsControlLib.Applications.HD_UseCase.Systems.Test;
model Test_HybridCooler_System
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={30,70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={0,-10})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={0,50})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Water.ConstantPropertyLiquidWater
                                                                                annotation (__Dymola_choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=1000)
                                                                annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=2,
    freqHz=1/1800,
    offset=20 + 273.15) annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false) annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  HybridCoolerSystem hybridCoolerSystem(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-18,6},{2,26}})));
equation

  connect(booleanPulse.y, hybridCoolerSystem.bSetStatusOnAutomatic) annotation (Line(points={{-79,30},{-40,30},{-40,25},{-20,25}},
                                                                                                                                 color={255,0,255}));
  connect(booleanConstant.y, hybridCoolerSystem.bAlgorithmPermission) annotation (Line(points={{-79,-10},{-40,-10},{-40,21},{-20,21}},
                                                                                                                                     color={255,0,255}));
  connect(sine.y, hybridCoolerSystem.fSetPointAutomatic) annotation (Line(points={{-79,-50},{-30,-50},{-30,17},{-20,17}}, color={0,0,127}));
  connect(hybridCoolerSystem.port_a, temperature.port_b) annotation (Line(points={{2,6},{2,4},{0,4},{0,3.55271e-15}},
                                                                                                 color={0,127,255}));
  connect(hybridCoolerSystem.port_b, temperature1.port_a) annotation (Line(points={{2,26},{2,40},{-1.77636e-15,40}}, color={0,127,255}));
  connect(temperature1.port_b, boundary.ports[1]) annotation (Line(points={{0,60},{0,70},{20,70}}, color={0,127,255}));
  connect(temperature1.port_b, temperature.port_a) annotation (Line(points={{1.77636e-15,60},{20,60},{20,-20},{-1.77636e-15,-20}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3600, __Dymola_Algorithm="Dassl"));
end Test_HybridCooler_System;
