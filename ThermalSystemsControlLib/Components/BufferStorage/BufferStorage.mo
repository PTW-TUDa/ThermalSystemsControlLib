within ThermalSystemsControlLib.Components.BufferStorage;
model BufferStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg = 7 "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=313.15
                                                                      "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=353.15
                                                                      "Start value of temperature";

  PhysicalModels.BufferStorage_Physical BufferStorage(
    redeclare package Medium = Medium,
    V=V,
    n_Seg=n_Seg,
    T_start_upper=T_start_upper,
    T_start_lower=T_start_lower)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-10})));
  Interfaces.bufferStorageState_FMUConnector localState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-24,8})));
  Interfaces.BufferStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  HeatMeter.HeatMeter WMZx01(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,-38},{60,-58}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={60,80})));
equation
  connect(BufferStorage.localState, localState.localState1) annotation (Line(points={{50,1},{50,8},{-13,8}},
                                                                                                        color={0,0,0}));
  connect(BufferStorage.localState, localStorageState) annotation (Line(points={{50,1},{50,8},{0,8},{0,110}},
                                                                                                         color={0,0,0}));
  connect(temperature.T, WMZx01.fFeedTemperature) annotation (Line(points={{49,80},{30,80},{30,-48},{58,-48}},   color={0,0,127}));
  connect(WMZx01.port_a, BufferStorage.port_a) annotation (Line(points={{60,-38},{60,-20}},
                                                                                          color={0,127,255}));
  connect(WMZx01.port_b, port_a) annotation (Line(points={{60,-58},{60,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.port_a, port_b) annotation (Line(points={{60,90},{60,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_b, BufferStorage.port_b) annotation (Line(points={{60,70},{60,0}},  color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end BufferStorage;
