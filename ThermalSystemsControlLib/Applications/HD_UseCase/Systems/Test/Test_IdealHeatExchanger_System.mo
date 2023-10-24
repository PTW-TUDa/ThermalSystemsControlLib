within ThermalSystemsControlLib.Applications.HD_UseCase.Systems.Test;
model Test_IdealHeatExchanger_System
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium,
    T=343.15,
    nPorts=1)                                                                                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-10,-90})));
  Modelica.Fluid.Sensors.TemperatureTwoPort HW_RL(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,50})));
  Modelica.Fluid.Sensors.TemperatureTwoPort WW_VL(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-30})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater annotation (__Dymola_choicesAllMatching=true);
  Modelica.Blocks.Sources.Sine sine(
    amplitude=5,
    freqHz=1/1800,
    offset=273.15 + 40) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false) annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(
    redeclare package Medium = Medium,
    T=313.15,
    nPorts=1)                                                                                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,90})));
  Modelica.Fluid.Sources.FixedBoundary boundary2(
    redeclare package Medium = Medium,
    T=333.15,
    nPorts=1)                                                                                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={30,-90})));
  ThermalSystemsControlLib.Applications.HD_UseCase.Systems.IdealHeatExchangerSystem idealHeatExchanger_System(P_th_nom=5e6) annotation (Placement(transformation(extent={{-12,10},{8,-10}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant1(k=true) annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort HW_VL(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-48})));
  Modelica.Fluid.Sensors.TemperatureTwoPort WW_RL(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,32})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(
    redeclare package Medium = Medium,
    use_T_in=true,
    T=323.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,70})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=5,
    freqHz=1/900,
    offset=273.15 + 45) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,90})));
equation

  connect(booleanConstant.y, idealHeatExchanger_System.bAlgorithmPermission) annotation (Line(points={{-79,-10},{-60,-10},{-60,-5},{-14,-5}},
                                                                                                                                            color={255,0,255}));
  connect(sine.y, idealHeatExchanger_System.fSetPointAutomatic) annotation (Line(points={{-79,50},{-14,50},{-14,-1}},color={0,0,127}));
  connect(boundary1.ports[1], HW_RL.port_b) annotation (Line(points={{-10,80},{0,80},{6.10623e-16,60}}, color={0,127,255}));
  connect(HW_RL.port_a, idealHeatExchanger_System.port_b1) annotation (Line(points={{-5.55112e-16,40},{-5.55112e-16,25},{4,25},{4,10}},   color={0,127,255}));
  connect(idealHeatExchanger_System.port_b2, WW_VL.port_a) annotation (Line(points={{8,-10},{8,-20},{40,-20}},     color={0,127,255}));
  connect(WW_VL.port_b, boundary2.ports[1]) annotation (Line(points={{40,-40},{40,-80},{30,-80}}, color={0,127,255}));
  connect(booleanConstant1.y, idealHeatExchanger_System.bSetStatusOnAutomatic) annotation (Line(points={{-79,-50},{-14,-50},{-14,-9}}, color={255,0,255}));
  connect(idealHeatExchanger_System.port_a1, HW_VL.port_b) annotation (Line(points={{4,-10},{4,-24},{6.10623e-16,-24},{6.10623e-16,-38}},   color={0,127,255}));
  connect(HW_VL.port_a, boundary.ports[1]) annotation (Line(points={{-5.55112e-16,-58},{0,-80},{-10,-80}}, color={0,127,255}));
  connect(idealHeatExchanger_System.port_a2, WW_RL.port_b) annotation (Line(points={{8,10},{30,10},{30,22}},   color={0,127,255}));
  connect(boundary3.ports[1], WW_RL.port_a) annotation (Line(points={{30,60},{30,42}}, color={0,127,255}));
  connect(sine1.y, boundary3.T_in) annotation (Line(points={{59,90},{34,90},{34,82}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3600, __Dymola_Algorithm="Dassl"));
end Test_IdealHeatExchanger_System;
