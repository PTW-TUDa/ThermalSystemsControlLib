within ThermalSystemsControlLib.Components.AbsorptionChiller.PhysicalModels;
model Test_AbsorptionChiller
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  PhysicalModels.AbsorptionChiller absorptionChiller   annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    m_flow=2,
    T=363.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,70})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(
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
 package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater;
  Modelica.Fluid.Sources.FixedBoundary boundary2(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,70})));
  Modelica.Fluid.Sources.FixedBoundary boundary3(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-70})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(
    redeclare package Medium = Medium,
    m_flow=5,
    T=303.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,-70})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary5(
    redeclare package Medium = Medium,
    m_flow=2,
    T=298.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,70})));
  Modelica.Blocks.Sources.Pulse pulse(amplitude=2, period=3600) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(T_hot_out.port_b, boundary1.ports[1]) annotation (Line(points={{-50,-40},{-50,-60},{-50,-60}}, color={0,127,255}));
  connect(boundary2.ports[1], T_warm_out.port_b) annotation (Line(points={{0,60},{0,40}}, color={0,127,255}));
  connect(T_cold_out.port_b, boundary3.ports[1]) annotation (Line(points={{50,-40},{50,-60}}, color={0,127,255}));
  connect(boundary.ports[1], T_hot_in.port_a) annotation (Line(points={{-50,60},{-50,40}}, color={0,127,255}));
  connect(boundary4.ports[1], T_warm_in.port_a) annotation (Line(points={{0,-60},{0,-40}}, color={0,127,255}));
  connect(boundary5.ports[1], T_cold_in.port_a) annotation (Line(points={{50,60},{50,40}}, color={0,127,255}));
  connect(T_cold_in.port_b,absorptionChiller.port_a3)  annotation (Line(points={{50,20},{50,10},{10.2,10}},
                                                                                                         color={0,127,255}));
  connect(absorptionChiller.port_b3, T_cold_out.port_a) annotation (Line(points={{10,-10},{50,-10},{50,-20}},color={0,127,255}));
  connect(absorptionChiller.port_b1, T_hot_out.port_a) annotation (Line(points={{2,-10},{-50,-10},{-50,-20}}, color={0,127,255}));
  connect(T_hot_in.port_b, absorptionChiller.port_a1) annotation (Line(points={{-50,20},{-50,10},{2,10}}, color={0,127,255}));
  connect(T_warm_out.port_a,absorptionChiller.port_b2)  annotation (Line(points={{-1.77636e-15,20},{4,20},{4,10},{6,10}}, color={0,127,255}));
  connect(absorptionChiller.port_a2, T_warm_in.port_b) annotation (Line(points={{6,-10},{6,-20},{0,-20}}, color={0,127,255}));
  connect(pulse.y, boundary.m_flow_in) annotation (Line(points={{-79,90},{-42,90},{-42,80}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=7200, __Dymola_Algorithm="Dassl"));
end Test_AbsorptionChiller;
