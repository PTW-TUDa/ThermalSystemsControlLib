within ThermalSystemsControlLib.Components.BufferStorage.PhysicalModels;
model BufferStorage_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg = 5 "Number of volume segments (min. 5). Must be an odd number.";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid "Start value of mid temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of lower temperature";

  parameter Real T_start_values[n_Seg] =
  if mod(n_Seg,2) == 0 then
    cat(1,
        linspace(T_start_lower, T_start_mid, integer(n_Seg/2)),
        linspace(T_start_mid,   T_start_upper, integer(n_Seg/2)))
  else
    cat(1,
        linspace(T_start_lower, T_start_mid, integer(n_Seg/2+1)),
        linspace(T_start_mid,   T_start_upper, integer(n_Seg/2)));

  output Interfaces.BufferStorageState localState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  Modelica.Fluid.Vessels.ClosedVolume vol[n_Seg](
    redeclare each package Medium = Medium,
    each use_portsData = false,
    each use_HeatTransfer=true,
    each V=V/n_Seg,
    each nPorts=3,
    T_start = T_start_values)
        annotation (Placement(transformation(extent={{-8,0},{12,20}})));
  Modelica.Fluid.Sensors.Temperature vol_temperature[n_Seg](redeclare each package Medium = Medium)
                                                                           annotation (Placement(transformation(extent={{-62,40},{-42,60}})));


  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,90},{110,110}})));


equation
  localState.fLowerTemperature = vol_temperature[1].T;
  localState.fMidTemperature = vol_temperature[integer(n_Seg/2)+1].T;
  localState.fUpperTemperature = vol_temperature[n_Seg].T;


  connect(vol[1].ports[1], port_a);
  connect(vol[n_Seg].ports[3], port_b);
  for i in 1:(n_Seg-1) loop
    connect(vol[i].ports[3], vol[i + 1].ports[1]);
  end for;
  for j in 1:n_Seg loop
    connect(vol[j].ports[2],vol_temperature[j].port);
  end for;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end BufferStorage_Physical;
