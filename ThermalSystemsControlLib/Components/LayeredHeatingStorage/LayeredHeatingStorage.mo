within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of temperature";

  HeatMeter.HeatMeter WMZx01(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{96,-34},{76,-54}})));
  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-26,22},{-46,42}})));


  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical annotation (Placement(transformation(extent={{26,-8},{60,24}})));
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation

  connect(WMZx01.port_b, port_a) annotation (Line(points={{76,-54},{76,-86},{100,-86},{100,-100}},
                                                                                          color={0,127,255}));

  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,84},{48,84},{48,22},{43.34,22},{43.34,25.6}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-25,32},{0,32},{0,84},{48,84},{48,22},{43.34,22},{43.34,25.6}}, color={0,0,0}));
  connect(layeredStorage_Physical.mode, mode) annotation (Line(points={{63.06,8},{92,8},{92,0},{118,0}},
                                                                                           color={255,0,255}));
  connect(layeredStorage_Physical.port_charge, WMZx01.port_a) annotation (Line(points={{60,-7.36},{60,-20},{76,-20},{76,-34}},  color={0,127,255}));
  connect(layeredStorage_Physical.port_discharge, WMZx01.port_a) annotation (Line(points={{59.66,0},{74,0},{74,-20},{76,-20},{76,-34}},   color={0,127,255}));
  connect(layeredStorage_Physical.feedTemperature, feed_temp) annotation (Line(points={{22.6,21.12},{13.3,21.12},{13.3,0},{-120,0}}, color={0,0,127}));
  connect(feed_temp, WMZx01.fFeedTemperature) annotation (Line(points={{-120,0},{8,0},{8,-44},{74,-44}}, color={0,0,127}));
  connect(layeredStorage_Physical.port_feed, port_b) annotation (Line(points={{24.98,8},{16,8},{16,86},{100,86},{100,100}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
