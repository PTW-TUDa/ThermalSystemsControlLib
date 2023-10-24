within ThermalSystemsControlLib.Applications.HD_UseCase.Systems.Test;
model Test_AbsorptionChiller_System
  ThermalSystemsControlLib.Applications.HD_UseCase.Systems.AbsorptionChillerSystem absorptionChiller_System(
    redeclare Records.Pumps.SimplePump_HD_AKM_Hot deviceData_Pump_Hot,
    redeclare Records.Pumps.SimplePump_HD_AKM_Warm deviceData_Pump_Warm,
    redeclare Records.Pumps.SimplePump_HD_AKM_Cold deviceData_Pump_Cold) annotation (Placement(transformation(extent={{-8,-12},{12,8}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(redeclare package Medium = Medium,
    p=300000,                                                                       nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hot_in(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,30})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_warm_in(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,-30})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_cold_in(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,30})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hot_out(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-30})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_cold_out(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-30})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_warm_out(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,30})));
  Modelica.Fluid.Sources.FixedBoundary boundary2(redeclare package Medium = Medium,
    p=300000,                                                                       nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,70})));
  Modelica.Fluid.Sources.FixedBoundary boundary4(
    redeclare package Medium = Medium,
    p=300000,
    T=363.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,70})));
  Modelica.Fluid.Sources.FixedBoundary boundary6(
    redeclare package Medium = Medium,
    p=300000,
    T=318.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-70})));
  Modelica.Blocks.Sources.Constant const(k=18 + 273.15) annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=3600) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  Modelica.Blocks.Sources.Sine sine(
    amplitude=100*1000/3600,
    freqHz=1/7200,
    offset=200*1000/3600)
                         annotation (Placement(transformation(extent={{70,-100},{90,-80}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium,
    use_portsData=false,
    V=5,
    nPorts=4) annotation (Placement(transformation(extent={{70,0},{90,20}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    T=298.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-50})));
  Modelica.Fluid.Sources.FixedBoundary boundary3(
    redeclare package Medium = Medium,
    p=300000,
    nPorts=1)                                                                                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={110,50})));
equation
  connect(T_hot_out.port_b, boundary1.ports[1]) annotation (Line(points={{-50,-40},{-50,-60}}, color={0,127,255}));
  connect(boundary2.ports[1], T_warm_out.port_b) annotation (Line(points={{0,60},{0,40}}, color={0,127,255}));
  connect(T_cold_in.port_b,absorptionChiller_System.port_a3)  annotation (Line(points={{50,20},{50,8},{12.2,8}},color={0,127,255}));
  connect(absorptionChiller_System.port_b3, T_cold_out.port_a) annotation (Line(points={{12,-12},{50,-12},{50,-20}},color={0,127,255}));
  connect(absorptionChiller_System.port_b1, T_hot_out.port_a) annotation (Line(points={{4,-12},{-50,-12},{-50,-20}}, color={0,127,255}));
  connect(T_hot_in.port_b, absorptionChiller_System.port_a1) annotation (Line(points={{-50,20},{-50,8},{4,8}},   color={0,127,255}));
  connect(T_warm_out.port_a,absorptionChiller_System.port_b2)  annotation (Line(points={{0,20},{4,20},{4,8},{8,8}},   color={0,127,255}));
  connect(absorptionChiller_System.port_a2, T_warm_in.port_b) annotation (Line(points={{8,-12},{8,-20},{0,-20}}, color={0,127,255}));
  connect(boundary4.ports[1], T_hot_in.port_a) annotation (Line(points={{-50,60},{-50,40}}, color={0,127,255}));
  connect(boundary6.ports[1], T_warm_in.port_a) annotation (Line(points={{6.66134e-16,-60},{0,-60},{0,-40}}, color={0,127,255}));
  connect(const.y, absorptionChiller_System.fSetPointAutomatic) annotation (Line(points={{-79,-50},{-70,-50},{-70,-1},{-10,-1}}, color={0,0,127}));
  connect(booleanPulse.y, absorptionChiller_System.bSetStatusOnAutomatic) annotation (Line(points={{-79,50},{-70,50},{-70,7},{-10,7}}, color={255,0,255}));
  connect(booleanExpression.y, absorptionChiller_System.bAlgorithmPermission) annotation (Line(points={{-79,0},{-46,0},{-46,3},{-10,3}},
                                                                                                                         color={255,0,255}));
  connect(T_cold_out.port_b, volume.ports[1]) annotation (Line(points={{50,-40},{50,-60},{77,-60},{77,0}}, color={0,127,255}));
  connect(T_cold_in.port_a, volume.ports[2]) annotation (Line(points={{50,40},{50,60},{79,60},{79,0}}, color={0,127,255}));
  connect(volume.ports[3], boundary.ports[1]) annotation (Line(points={{81,0},{82,0},{82,-30},{110,-30},{110,-40}}, color={0,127,255}));
  connect(boundary3.ports[1], volume.ports[4]) annotation (Line(points={{110,40},{110,0},{83,0}}, color={0,127,255}));
  connect(sine.y, boundary.m_flow_in) annotation (Line(points={{91,-90},{102,-90},{102,-60}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
end Test_AbsorptionChiller_System;
