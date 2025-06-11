within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  //extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of temperature";

  HeatMeter.HeatMeter WMZx01(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,-38},{60,-58}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={62,80})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    redeclare package Medium = Medium,
    n_Seg=n_Seg,
    T_start_upper=353.15,
    T_start_lower=313.15) annotation (Placement(transformation(extent={{38,-10},{58,10}})));
  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-24,2},{-44,22}})));


  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{142,-20},{102,20}})));
equation

  connect(temperature.T, WMZx01.fFeedTemperature) annotation (Line(points={{51,80},{30,80},{30,-48},{58,-48}},   color={0,0,127}));
  connect(WMZx01.port_b, port_a) annotation (Line(points={{60,-58},{60,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.port_a, port_b) annotation (Line(points={{62,90},{62,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{62,70},{62,38},{58,38},{58,10}},    color={0,127,255}));
  connect(WMZx01.port_a, layeredStorage_Physical.port_charge) annotation (Line(points={{60,-38},{60,-9.6},{58,-9.6}},
                                                                                                                color={0,127,255}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-23,12},{48.2,12},{48.2,11}},color={0,0,0}));
  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,12},{48.2,12},{48.2,11}},color={0,0,0}));

  connect(temperature.T, layeredStorage_Physical.feedTemperature) annotation (Line(points={{51,80},{30,80},{30,-22},{70,-22},{70,6},{59.8,6}},   color={0,0,127}));
  connect(WMZx01.port_a, layeredStorage_Physical.port_discharge) annotation (Line(points={{60,-38},{60,-12},{57.8,-12},{57.8,-5}}, color={0,127,255}));
  connect(mode, layeredStorage_Physical.mode) annotation (Line(points={{122,0},{59.8,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
