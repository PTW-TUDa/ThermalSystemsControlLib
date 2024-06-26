within ThermalSystemsControlLib.Components.BufferStorage;
model BufferStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg = 2 "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start "Start value of temperature";

  PhysicalModels.BufferStorage_Physical BufferStorage(
    redeclare package Medium = Medium,
    V=V,
    n_Seg=n_Seg,
    T_start=T_start) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,10})));
  Interfaces.bufferStorageState_FMUConnector localState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,10})));
  Interfaces.BufferStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  HeatMeter.HeatMeter WMZx01(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{60,-40},{80,-60}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={80,70})));
equation
  connect(BufferStorage.localState, localState.localState1) annotation (Line(points={{69,10},{-19,10}}, color={0,0,0}));
  connect(BufferStorage.localState, localStorageState) annotation (Line(points={{69,10},{0,10},{0,110}}, color={0,0,0}));
  connect(temperature.T, WMZx01.fFeedTemperature) annotation (Line(points={{91,70},{100,70},{100,-50},{82,-50}}, color={0,0,127}));
  connect(WMZx01.port_a, BufferStorage.port_a) annotation (Line(points={{80,-40},{80,0}}, color={0,127,255}));
  connect(WMZx01.port_b, port_a) annotation (Line(points={{80,-60},{80,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.port_a, port_b) annotation (Line(points={{80,80},{80,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_b, BufferStorage.port_b) annotation (Line(points={{80,60},{80,20}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end BufferStorage;
