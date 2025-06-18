within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Components.LayeredHeatingStorage.PhysicalModels.LayeredStorage_Physical_simple layeredStorage_Physical_simple(
    T_start_upper=353.15,
    T_start_lower=313.15,                                                                                       redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-38,-30},{32,36}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{80,-62},{60,-42}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_T_in=true,
    m_flow=1,
    nPorts=1) annotation (Placement(transformation(extent={{-82,-70},{-62,-50}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false) annotation (Placement(transformation(extent={{84,20},{64,40}})));
  Modelica.Blocks.Sources.Constant const(k=323) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
equation
  connect(layeredStorage_Physical_simple.charge, boundary.ports[1]) annotation (Line(points={{31.3,-29.34},{31.3,-53},{60,-53}},     color={0,127,255}));
  connect(layeredStorage_Physical_simple.discharge, boundary.ports[2]) annotation (Line(points={{32,-10.2},{54,-10.2},{54,-51},{60,-51}},     color={0,127,255}));
  connect(boundary1.ports[1], layeredStorage_Physical_simple.feed) annotation (Line(points={{-62,-60},{-50,-60},{-50,3},{-40.1,3}}, color={0,127,255}));
  connect(booleanConstant.y, layeredStorage_Physical_simple.mode) annotation (Line(points={{63,30},{39,30},{39,29.4}}, color={255,0,255}));
  connect(const.y, layeredStorage_Physical_simple.feedTemperature) annotation (Line(points={{-79,50},{-70,50},{-70,22.47},{-43.95,22.47}}, color={0,0,127}));
  connect(layeredStorage_Physical_simple.feedTemperature, boundary1.T_in) annotation (Line(points={{-43.95,22.47},{-70,22.47},{-70,20},{-68,20},{-68,-26},{-94,-26},{-94,-56},{-84,-56}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    __Dymola_Commands(file="plotsetup_simple.mos" "plotsetup"));
end TestLayeredStorage;
