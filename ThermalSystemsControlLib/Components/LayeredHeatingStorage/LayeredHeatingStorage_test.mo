within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage_test
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=3   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=313.15
                                                                      "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=353.15
                                                                      "Start value of temperature";

  HeatMeter.HeatMeter WMZx01(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,-38},{60,-58}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={62,80})));
  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-24,2},{-44,22}})));

  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{142,-20},{102,20}})));
  PhysicalModels.LayeredStorage_Physical_test layeredStorage_Physical_test(T_start_upper=T_start_upper, T_start_lower=T_start_lower) annotation (Placement(transformation(extent={{26,-10},{46,10}})));
equation

  connect(temperature.T, WMZx01.fFeedTemperature) annotation (Line(points={{51,80},{16,80},{16,-50},{38,-50},{38,-48},{58,-48}},
                                                                                                                 color={0,0,127}));
  connect(WMZx01.port_b, port_a) annotation (Line(points={{60,-58},{60,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.port_a, port_b) annotation (Line(points={{62,90},{62,100},{100,100}}, color={0,127,255}));

  connect(layeredStorage_Physical_test.mode, mode) annotation (Line(points={{47.8,0},{122,0}}, color={255,0,255}));
  connect(temperature.T, layeredStorage_Physical_test.feedTemperature) annotation (Line(points={{51,80},{52,80},{52,14},{47.8,14},{47.8,6}}, color={0,0,127}));
  connect(layeredStorage_Physical_test.port_feed, temperature.port_b) annotation (Line(points={{46,10},{46,18},{62,18},{62,70}}, color={0,127,255}));
  connect(layeredStorage_Physical_test.port_charge, WMZx01.port_a) annotation (Line(points={{46,-9.6},{58,-9.6},{58,-40},{60,-40},{60,-38}}, color={0,127,255}));
  connect(WMZx01.port_a, layeredStorage_Physical_test.port_discharge) annotation (Line(points={{60,-38},{60,-36},{58,-36},{58,-10},{45.8,-10},{45.8,-5}}, color={0,127,255}));
  connect(layeredStorage_Physical_test.port_charge, layeredStorage_Physical_test.port_discharge) annotation (Line(points={{46,-9.6},{58,-9.6},{58,-10},{45.8,-10},{45.8,-5}}, color={0,127,255}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical_test.localState) annotation (Line(points={{-23,12},{22,12},{22,18},{36.2,18},{36.2,11}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, localStorageState) annotation (Line(points={{-23,12},{0,12},{0,110}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage_test;
