within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems;
model TestBufferStorage
extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;

inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
Modelica.Fluid.Sources.FixedBoundary boundary(redeclare package Medium = Medium, nPorts=1)
                                                        annotation (Placement(transformation(extent={{54,-68},{34,-48}})));

Modelica.Fluid.Sources.MassFlowSource_T boundary1(
  redeclare package Medium = Medium,
  use_m_flow_in=false,
  use_T_in=false,
  m_flow=1,
    T=313.15,
    nPorts=1)
            annotation (Placement(transformation(extent={{48,46},{28,66}})));
replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater annotation (choicesAllMatching=true);
  Components.BufferStorage.BufferStorage bufferStorage annotation (Placement(transformation(extent={{-12,-8},{8,12}})));
equation
  connect(bufferStorage.port_b, boundary.ports[1]) annotation (Line(points={{8,12},{18,12},{18,-58},{34,-58}}, color={0,127,255}));
  connect(bufferStorage.port_a, boundary1.ports[1]) annotation (Line(points={{8,-8},{8,-12},{-16,-12},{-16,56},{28,56}}, color={0,127,255}));
annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
  __Dymola_Commands(file="Components/plot_setup.mos" "plot_setup", file="plot_setup.mos" "plot_setup"));
end TestBufferStorage;
