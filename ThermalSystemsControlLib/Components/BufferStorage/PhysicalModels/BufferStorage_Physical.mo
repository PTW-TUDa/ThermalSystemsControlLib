within ThermalSystemsControlLib.Components.BufferStorage.PhysicalModels;
model BufferStorage_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg = 2 "Number of volume segments";

  Modelica.Fluid.Vessels.ClosedVolume vol[n_Seg](
    redeclare each package Medium = Medium,
    each T_start=T_start,
    each use_portsData = false,
    each use_HeatTransfer=true,
    each V=V/n_Seg,
    each nPorts=2)   annotation (Placement(transformation(extent={{-8,0},{12,20}})));

  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start "Start value of temperature";
  Interfaces.BufferStorageState localState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
equation
  localState.fLowerTemperature = vol[1].medium.T;
  localState.fMidTemperature = vol[integer(n_Seg/2)].medium.T;
  localState.fUpperTemperature = vol[n_Seg].medium.T;
  connect(vol[1].ports[1], port_a);
  connect(vol[n_Seg].ports[2], port_b);
  for i in 1:(n_Seg-1) loop
    connect(vol[i].ports[2], vol[i + 1].ports[1]);
  end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end BufferStorage_Physical;
