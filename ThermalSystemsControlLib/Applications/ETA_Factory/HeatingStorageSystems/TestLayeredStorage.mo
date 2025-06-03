within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;

  Components.LayeredHeatingStorage.LayeredHeatingStorage layeredHeatingStorage(
    n_Seg=7,
    T_start_lower=313.15,
    T_start_upper=353.15) annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
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
equation
  connect(boundary.ports[1], layeredHeatingStorage.port_b) annotation (Line(points={{36,64},{20,64},{20,20}}, color={0,127,255}));
  connect(layeredHeatingStorage.port_a, boundary1.ports[1]) annotation (Line(points={{20,-20},{20,-50},{60,-50}}, color={0,127,255}));
  connect(step.y, boundary.T_in) annotation (Line(points={{79,66},{66,66},{66,68},{58,68}}, color={0,0,127}));
  connect(mode_constant.y, layeredHeatingStorage.mode) annotation (Line(points={{63,0},{24.4,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage;
