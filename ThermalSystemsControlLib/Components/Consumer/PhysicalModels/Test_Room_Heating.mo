within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model Test_Room_Heating

  ThermalSystemsControlLib.Components.Consumer.PhysicalModels.Room_Heating floor_Wall_Heating(
    C_Air=840*1000,
    R_Building=0.001,
    R_Heater=0.001,
    V_int=0.0023*24) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T_in=false,
    m_flow=0.8,
    T=288.15,
    nPorts=1) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,0})));
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=293.15) annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_IN(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_OUT(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(fixedTemperature.port, floor_Wall_Heating.port_ambient) annotation (Line(points={{-20,-30},{0,-30},{0,-10.6}}, color={191,0,0}));
  connect(floor_Wall_Heating.port_a, temperature_IN.port_b) annotation (Line(points={{-10,0},{-40,0}}, color={0,127,255}));
  connect(temperature_IN.port_a, boundary.ports[1]) annotation (Line(points={{-60,0},{-80,0}}, color={0,127,255}));
  connect(floor_Wall_Heating.port_b, temperature_OUT.port_a) annotation (Line(points={{10,0},{32,0},{32,8.88178e-16},{40,0}}, color={0,127,255}));
  connect(temperature_OUT.port_b, boundary1.ports[1]) annotation (Line(points={{60,0},{70,0},{70,8.88178e-16},{80,8.88178e-16}}, color={0,127,255}));
  annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end Test_Room_Heating;
