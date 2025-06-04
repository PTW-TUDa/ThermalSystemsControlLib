within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;

  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{56,54},{36,74}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, nPorts=1) annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
  Modelica.Blocks.Sources.Step step(
    height=-20,
    offset=353.15,
    startTime(displayUnit="min") = 300) annotation (Placement(transformation(extent={{100,56},{80,76}})));
  Modelica.Blocks.Sources.BooleanConstant mode_constant annotation (Placement(transformation(extent={{84,-10},{64,10}})));
  Components.LayeredHeatingStorage.LayeredHeatingStorage_test layeredHeatingStorage_test(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    n_Seg=n_Seg,
    T_start_lower=T_start_lower,
    T_start_upper=T_start_upper) annotation (Placement(transformation(extent={{-32,-26},{20,24}})));
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  parameter Integer n_Seg=3 "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=313.15 "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=353.15 "Start value of temperature";
equation
  connect(step.y, boundary.T_in) annotation (Line(points={{79,66},{66,66},{66,68},{58,68}}, color={0,0,127}));
  connect(layeredHeatingStorage_test.port_b, boundary.ports[1]) annotation (Line(points={{20,24},{20,64},{36,64}}, color={0,127,255}));
  connect(layeredHeatingStorage_test.port_a, boundary1.ports[1]) annotation (Line(points={{20,-26},{20,-50},{60,-50}}, color={0,127,255}));
  connect(layeredHeatingStorage_test.mode, mode_constant.y) annotation (Line(points={{25.72,-1},{25.72,-2},{60,-2},{60,0},{63,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage;
