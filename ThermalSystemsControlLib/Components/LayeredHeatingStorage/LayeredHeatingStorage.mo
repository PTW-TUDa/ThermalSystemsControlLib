within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of temperature";

  HeatMeter.HeatMeter WMZx01(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{96,-34},{76,-54}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={62,80})));
  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-26,22},{-46,42}})));


  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical annotation (Placement(transformation(extent={{30,-16},{64,16}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=temperature.T) annotation (Placement(transformation(extent={{-122,2},{-102,22}})));
equation

  connect(temperature.T, WMZx01.fFeedTemperature) annotation (Line(points={{51,80},{8,80},{8,-44},{74,-44}},     color={0,0,127}));
  connect(WMZx01.port_b, port_a) annotation (Line(points={{76,-54},{76,-86},{100,-86},{100,-100}},
                                                                                          color={0,127,255}));
  connect(temperature.port_a, port_b) annotation (Line(points={{62,90},{62,100},{100,100}}, color={0,127,255}));

  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,84},{48,84},{48,22},{47.34,22},{47.34,17.6}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-25,32},{0,32},{0,84},{48,84},{48,22},{47.34,22},{47.34,17.6}}, color={0,0,0}));
  connect(layeredStorage_Physical.mode, mode) annotation (Line(points={{67.06,0},{118,0}}, color={255,0,255}));
  connect(layeredStorage_Physical.port_charge, WMZx01.port_a) annotation (Line(points={{64,-15.36},{64,-20},{76,-20},{76,-34}}, color={0,127,255}));
  connect(layeredStorage_Physical.port_discharge, WMZx01.port_a) annotation (Line(points={{63.66,-8},{74,-8},{74,-20},{76,-20},{76,-34}}, color={0,127,255}));
  connect(temperature.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{62,70},{62,64},{16,64},{16,0},{28.98,0}}, color={0,127,255}));
  connect(realExpression.y, layeredStorage_Physical.feedTemperature) annotation (Line(points={{-101,12},{26.6,12},{26.6,13.12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
