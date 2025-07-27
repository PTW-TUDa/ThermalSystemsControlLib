within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage_complex
  extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-60,-60}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1) annotation (Placement(transformation(extent={{74,-88},{54,-68}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    use_m_flow_in=false,
    use_T_in=true,
    m_flow=1.44,
    nPorts=1) annotation (Placement(transformation(extent={{66,66},{46,86}})));
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=328.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=320.15
                                                                      "Start value of lower temperature";
  Modelica.Blocks.Sources.BooleanConstant mode(k=false)
                                                       annotation (Placement(transformation(extent={{96,-8},{76,12}})));
  Modelica.Blocks.Sources.Constant const(k=330) annotation (Placement(transformation(extent={{114,78},{94,98}})));
  Components.LayeredHeatingStorage.LayeredHeatingStorage_3portvalves layeredHeatingStorage_3portvalves annotation (Placement(transformation(extent={{-34,-30},{20,26}})));
equation
  connect(const.y, boundary1.T_in) annotation (Line(points={{93,88},{78,88},{78,80},{68,80}}, color={0,0,127}));
  connect(layeredHeatingStorage_3portvalves.mode, mode.y) annotation (Line(points={{24.86,-2},{70,-2},{70,2},{75,2}}, color={255,0,255}));
  connect(boundary1.ports[1], layeredHeatingStorage_3portvalves.port_a) annotation (Line(points={{46,76},{40,76},{40,-30},{20,-30}}, color={0,127,255}));
  connect(boundary.ports[1], layeredHeatingStorage_3portvalves.port_b) annotation (Line(points={{54,-78},{36,-78},{36,26},{20,26}}, color={0,127,255}));
  connect(const.y, layeredHeatingStorage_3portvalves.feed_temp) annotation (Line(points={{93,88},{70,88},{70,90},{-50,90},{-50,-2},{-39.4,-2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestLayeredStorage_complex;
