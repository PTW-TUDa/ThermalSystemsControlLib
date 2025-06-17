within ThermalSystemsControlLib.Components.Consumer.Tests;
model Test_Ideal_ConsumerSystem_DefinedMassFlow_ByValve
    extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(
    redeclare package Medium = Medium,
    use_p=true,
    p=100000,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,0})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater annotation (choicesAllMatching=true);
  Applications.ETA_Factory.Records.RV rV annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  parameter Valves.PhysicalModels.Records.TwoWayValveProperties deviceData=rV;
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=30,
    period=120,
    nperiod=10,
    startTime=10) annotation (Placement(transformation(extent={{-78,-42},{-58,-22}})));
  IdealConsumerSystem_DefinedMassFlow_ByValve idealConsumerSystem_DefinedMassFlow_MSL_only(
    redeclare package Medium = Medium,
    V_int=0.1,
    riseTime=deviceData.riseTime,
    deviceData=rV) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.FixedBoundary boundary2(
    redeclare package Medium = Medium,
    use_p=true,
    p=1000000,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-64,0})));
equation
  connect(idealConsumerSystem_DefinedMassFlow_MSL_only.port_b, boundary1.ports[1]) annotation (Line(points={{10,0},{60,0}}, color={0,127,255}));
  connect(pulse.y, idealConsumerSystem_DefinedMassFlow_MSL_only.m_flow_in) annotation (Line(points={{-57,-32},{-18,-32},{-18,-12},{-10,-12}}, color={0,0,127}));
  connect(pulse.y, idealConsumerSystem_DefinedMassFlow_MSL_only.Q_flow) annotation (Line(points={{-57,-32},{-18,-32},{-18,-20},{0,-20},{0,-12}}, color={0,0,127}));
  connect(boundary2.ports[1], idealConsumerSystem_DefinedMassFlow_MSL_only.port_a) annotation (Line(points={{-54,0},{-10,0}}, color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=400, __Dymola_Algorithm="Dassl"));
end Test_Ideal_ConsumerSystem_DefinedMassFlow_ByValve;
