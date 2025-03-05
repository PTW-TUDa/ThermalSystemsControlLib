within ThermalSystemsControlLib.Components.BufferStorage.PhysicalModels;
model BufferStorage_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.BufferStorage_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg = 5 "Number of volume segments (min. 5)";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of lower temperature";

  //Real relative_height[:] = linspace(1, 0, n_Seg); // relative height used for temperature initalization
  parameter Real T_start_values[n_Seg] = linspace(T_start_lower, T_start_upper, n_Seg);

  output Interfaces.BufferStorageState localState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  Modelica.Fluid.Vessels.ClosedVolume vol[n_Seg](
    redeclare each package Medium = Medium,
    each use_portsData = false,
    each use_HeatTransfer=true,
    each V=V/n_Seg,
    each nPorts=3,
    T_start = T_start_values)
        annotation (Placement(transformation(extent={{-8,0},{12,20}})));
    //each T_start=T_start,
  Modelica.Fluid.Sensors.Temperature vol_temperature[n_Seg](redeclare each package Medium = Medium)
                                                                           annotation (Placement(transformation(extent={{-62,40},{-42,60}})));


  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));


equation
  localState.fLowerTemperature = vol_temperature[2].T;
  localState.fMidTemperature = vol_temperature[integer(n_Seg/2)].T;
  localState.fUpperTemperature = vol_temperature[n_Seg-1].T;


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
