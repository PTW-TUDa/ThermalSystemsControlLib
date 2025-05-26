within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestLayeredStorage
extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;

Components.LayeredHeatingStorage.LayeredHeatingStorage layeredHeatingStorage(
  redeclare package Medium = Medium,
  n_Seg=7,
    T_start_lower=313.15,
    T_start_upper=353.15)
                        annotation (Placement(transformation(extent={{-12,-10},{8,10}}, rotation=0)));
inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1)
                                                        annotation (Placement(transformation(extent={{54,-68},{34,-48}})));

Modelica.Fluid.Sources.MassFlowSource_T boundary1(
  redeclare package Medium = Medium,
  use_m_flow_in=false,
  use_T_in=false,
  m_flow=1,
  T=353.15,
    nPorts=1)
            annotation (Placement(transformation(extent={{48,46},{28,66}})));
replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater annotation (choicesAllMatching=true);
equation
  connect(layeredHeatingStorage.port_b, boundary1.ports[1]) annotation (Line(points={{8,10},{22,10},{22,56},{28,56}}, color={0,127,255}));
  connect(layeredHeatingStorage.port_a, boundary.ports[1]) annotation (Line(points={{8,-10},{22,-10},{22,-58},{34,-58}}, color={0,127,255}));
annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
  __Dymola_Commands(file="Components/plot_setup.mos" "plot_setup"));
end TestLayeredStorage;
