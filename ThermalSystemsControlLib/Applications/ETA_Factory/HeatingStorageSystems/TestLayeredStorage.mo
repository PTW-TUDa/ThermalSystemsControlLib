within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=2) annotation (Placement(transformation(extent={{80,-62},{60,-42}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_T_in=true,
    m_flow=20/36,
    nPorts=1) annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false) annotation (Placement(transformation(extent={{84,20},{64,40}})));
  Components.LayeredHeatingStorage.PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(n_Seg=5)
                                                                                                  annotation (Placement(transformation(extent={{-34,-34},{30,36}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=55 - 26.3,
    duration(displayUnit="min") = 1500,
    offset=26.3 + 273,
    startTime(displayUnit="min") = 0) annotation (Placement(transformation(extent={{-106,18},{-86,38}})));
equation
  connect(layeredStorage_Physical.mode, booleanConstant.y) annotation (Line(points={{35.76,1},{58,1},{58,30},{63,30}}, color={255,0,255}));
  connect(layeredStorage_Physical.port_discharge, boundary.ports[1]) annotation (Line(points={{29.36,-16.5},{60,-16.5},{60,-53}}, color={0,127,255}));
  connect(layeredStorage_Physical.port_charge, boundary.ports[2]) annotation (Line(points={{30,-32.6},{60,-32.6},{60,-51}}, color={0,127,255}));
  connect(boundary1.ports[1], layeredStorage_Physical.port_feed) annotation (Line(points={{-60,-60},{-46,-60},{-46,1},{-35.92,1}}, color={0,127,255}));
  connect(ramp.y, layeredStorage_Physical.feedTemperature) annotation (Line(points={{-85,28},{-52,28},{-52,29.7},{-40.4,29.7}}, color={0,0,127}));
  connect(ramp.y, boundary1.T_in) annotation (Line(points={{-85,28},{-82,28},{-82,-46},{-90,-46},{-90,-56},{-82,-56}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    __Dymola_Commands(file="plotsetup_simple.mos" "plotsetup", file="plotsetup7layers.mos" "plotsetup7layers"));
end TestLayeredStorage;
