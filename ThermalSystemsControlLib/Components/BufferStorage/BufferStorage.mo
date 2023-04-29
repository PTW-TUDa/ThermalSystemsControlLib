within ThermalSystemsControlLib.Components.BufferStorage;
model BufferStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg = 2 "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start "Start value of temperature";

  output Interfaces.BufferStorageState localState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  PhysicalModels.BufferStorage_Physical bufferStorage_Physical(
    redeclare package Medium = Medium,
    V=V,
    n_Seg=n_Seg,
    T_start=T_start) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,10})));
equation
  connect(bufferStorage_Physical.port_a, port_a) annotation (Line(points={{80,0},{80,-100},{100,-100}}, color={0,127,255}));
  connect(bufferStorage_Physical.port_b, port_b) annotation (Line(points={{80,20},{80,100},{100,100}}, color={0,127,255}));
  connect(bufferStorage_Physical.localState, localState) annotation (Line(points={{69,10},{0,10},{0,110}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end BufferStorage;
