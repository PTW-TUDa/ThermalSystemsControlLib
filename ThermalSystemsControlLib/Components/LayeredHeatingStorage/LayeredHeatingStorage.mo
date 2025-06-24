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
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-24,2},{-44,22}})));


  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{142,-20},{102,20}})));
  PhysicalModels.LayeredStorage_Physical_simple layeredStorage_Physical_simple annotation (Placement(transformation(extent={{44,-18},{64,2}})));
equation

  connect(temperature.T, WMZx01.fFeedTemperature) annotation (Line(points={{51,80},{18,80},{18,-46},{46,-46},{46,-44},{74,-44}},
                                                                                                                 color={0,0,127}));
  connect(WMZx01.port_b, port_a) annotation (Line(points={{76,-54},{76,-86},{100,-86},{100,-100}},
                                                                                          color={0,127,255}));
  connect(temperature.port_a, port_b) annotation (Line(points={{62,90},{62,100},{100,100}}, color={0,127,255}));

  connect(localStorageState, layeredStorage_Physical_simple.localState) annotation (Line(points={{0,110},{0,12},{40,12},{40,18},{54.2,18},{54.2,3}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical_simple.localState) annotation (Line(points={{-23,12},{40,12},{40,18},{54.2,18},{54.2,3}}, color={0,0,0}));
  connect(layeredStorage_Physical_simple.mode, mode) annotation (Line(points={{66,0},{122,0}},               color={255,0,255}));
  connect(temperature.T, layeredStorage_Physical_simple.feedTemperature) annotation (Line(points={{51,80},{18,80},{18,-2.1},{42.3,-2.1}},
                                                                                                                                        color={0,0,127}));
  connect(temperature.port_b, layeredStorage_Physical_simple.feed) annotation (Line(points={{62,70},{62,48},{28,48},{28,-8},{43.4,-8}}, color={0,127,255}));
  connect(layeredStorage_Physical_simple.discharge, WMZx01.port_a) annotation (Line(points={{64,-12},{76,-12},{76,-34}},
                                                                                                                       color={0,127,255}));
  connect(layeredStorage_Physical_simple.charge, WMZx01.port_a) annotation (Line(points={{63.8,-17.8},{63.8,-34},{76,-34}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
