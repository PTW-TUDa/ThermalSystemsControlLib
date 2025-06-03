within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments (min. 5)";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of lower temperature";
  parameter Real delta_T = (T_start_upper-T_start_lower)/n_Seg;

  //Real relative_height[:] = linspace(1, 0, n_Seg); // relative height used for temperature initalization
  parameter Real T_start_values[n_Seg] = linspace(T_start_lower, T_start_upper, n_Seg);

  Modelica.Fluid.Vessels.ClosedVolume vol[n_Seg](
    redeclare each package Medium = Medium,
    each use_portsData = false,
    each use_HeatTransfer=true,
    each V=V/n_Seg,
    each nPorts=4,
    T_start = T_start_values)
        annotation (Placement(transformation(extent={{-8,0},{12,20}})));
    //each T_start=T_start,
  Modelica.Fluid.Sensors.Temperature vol_temperature[n_Seg](redeclare each package Medium = Medium)
                                                                           annotation (Placement(transformation(extent={{-8,32},{12,52}})));

  Modelica.Fluid.Interfaces.FluidPort_a port_feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-106},{110,-86}})));

  Interfaces.LayeredStorageState localState annotation (Placement(transformation(extent={{-8,100},{12,120}})));
  Modelica.Fluid.Valves.ValveLinear valveLayers[n_Seg](
    redeclare each package Medium = Medium,
    each dp_nominal=1,
    each m_flow_nominal = 1,
    each allowFlowReversal = true) annotation (Placement(transformation(extent={{54,50},{74,70}})));

  Modelica.Blocks.Interfaces.RealInput feedTemperature annotation (Placement(transformation(extent={{138,40},{98,80}})));

// Layering sistem control
  Modelica.Blocks.Logical.Switch switch1[n_Seg] annotation (Placement(transformation(extent={{-76,40},{-96,60}})));
  Modelica.Blocks.Sources.Constant const_close(k=0) annotation (Placement(transformation(extent={{-36,24},{-52,40}})));
  Modelica.Blocks.Sources.Constant const_open(k=1) annotation (Placement(transformation(extent={{-38,52},{-54,68}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual[n_Seg-1] annotation (Placement(transformation(extent={{-36,-40},{-56,-20}})));
  Modelica.Blocks.Sources.Constant T_lim[n_Seg-1] annotation (Placement(transformation(extent={{16,-76},{-4,-56}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold[n_Seg-1] annotation (Placement(transformation(extent={{-38,-74},{-58,-54}})));
  Modelica.Blocks.Logical.And and1[n_Seg-2] annotation (Placement(transformation(extent={{-70,-54},{-90,-34}})));

// Mode control (charge or discharge)
  Modelica.Fluid.Interfaces.FluidPort_b port_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{88,-60},{108,-40}})));
  Modelica.Blocks.Interfaces.BooleanInput mode "Value true for charge" annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  Modelica.Fluid.Valves.ValveLinear valveCharge(
    redeclare package Medium = Medium,
    dp_nominal=1,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{48,-106},{68,-86}})));
  Modelica.Fluid.Valves.ValveLinear valveDischarge(
    redeclare package Medium = Medium,
    dp_nominal=1,
    m_flow_nominal=1) annotation (Placement(transformation(extent={{46,-60},{66,-40}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_charge annotation (Placement(transformation(extent={{58,14},{38,34}})));
  Modelica.Blocks.MathBoolean.Not notMode annotation (Placement(transformation(extent={{70,-4},{62,4}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_discharge annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={55,-21})));

equation
  localState.fLowerTemperature = vol_temperature[2].T;
  localState.fMidTemperature = vol_temperature[integer(n_Seg/2)].T;
  localState.fUpperTemperature = vol_temperature[n_Seg-1].T;


  connect(vol[1].ports[1], valveCharge.port_a);
  connect(vol[n_Seg].ports[3], valveDischarge.port_a);

  for i in 1:(n_Seg-1) loop
    connect(vol[i].ports[3], vol[i + 1].ports[1]);
    T_lim[i].k = T_start_lower + i*delta_T;//considering linear dist of temp
    connect(switch1[i].y,valveLayers[i].opening);
    connect(const_close.y,switch1[i].u3);
    connect(const_open.y,switch1[i].u1);
    connect(lessThreshold[i].u, feedTemperature);
    if i > 1 then
        connect(greaterEqual[i-1].u1, feedTemperature);
        connect(greaterEqual[i-1].u2, T_lim[i-1].y);
        connect(and1[i-1].u1,greaterEqual[i-1].y);
        connect(and1[i-1].u2,lessThreshold[i].y);
        connect(switch1[i].u2, and1[i-1].y);
    else connect(switch1[i].u2,lessThreshold[i].y);
    end if;
    lessThreshold[i].threshold = T_lim[i].y;
  end for;

  for j in 1:n_Seg loop
    connect(vol[j].ports[2],vol_temperature[j].port);
    connect(vol[j].ports[4],valveLayers[j].port_a);
    connect(valveLayers[j].port_b, port_feed);
  end for;

// connections for the upper layer
    connect(greaterEqual[n_Seg-1].u2, T_lim[n_Seg-1].y);
    connect(switch1[n_Seg].y,valveLayers[n_Seg].opening);
    connect(const_close.y,switch1[n_Seg].u3);
    connect(const_open.y,switch1[n_Seg].u1);
    connect(switch1[n_Seg].u2,greaterEqual[n_Seg-1].y);
    connect(greaterEqual[n_Seg-1].u1, feedTemperature);

// connections controlling charge/discharge modes
  connect(valveDischarge.port_b, port_discharge) annotation (Line(points={{66,-50},{98,-50}}, color={0,127,255}));
  connect(valveCharge.port_b, port_charge) annotation (Line(points={{68,-96},{100,-96}}, color={0,127,255}));
  connect(booleanToReal_charge.u, mode) annotation (Line(points={{60,24},{88,24},{88,0},{118,0}}, color={255,0,255}));
  connect(booleanToReal_charge.y, valveCharge.opening) annotation (Line(points={{37,24},{34,24},{34,-78},{58,-78},{58,-88}}, color={0,0,127}));
  connect(mode, notMode.u) annotation (Line(points={{118,0},{71.6,0}}, color={255,0,255}));
  connect(booleanToReal_discharge.y, valveDischarge.opening) annotation (Line(points={{55,-28.7},{56,-28.7},{56,-42}}, color={0,0,127}));
  connect(notMode.y, booleanToReal_discharge.u) annotation (Line(points={{61.2,0},{56,0},{56,-12.6},{55,-12.6}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredStorage_Physical;
