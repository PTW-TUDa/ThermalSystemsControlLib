within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V = 7 "Storage volume";
  parameter Integer n_Seg=5   "Number of volume segments (min. 5)";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=328.15
                                                                      "Start value of lower temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=320.15
                                                                      "Start value of middle temperature";

  parameter Real T_start_values_upper[integer(n_Seg/2)] = linspace(T_start_mid, T_start_upper, integer(n_Seg/2));
  parameter Real T_start_values_lower[integer(n_Seg/2)+1] = linspace(T_start_lower, T_start_mid, integer(n_Seg/2)+1);
  parameter Real T_start_values[n_Seg] = cat(1, T_start_values_lower, T_start_values_upper);

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

  Modelica.Fluid.Interfaces.FluidPort_a port_feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-106},{110,-86}})));

  Interfaces.LayeredStorageState localState annotation (Placement(transformation(extent={{-8,100},{12,120}})));
  Modelica.Fluid.Valves.ValveLinear valveLayers[n_Seg](
    redeclare each package Medium = Medium,
    each dp_nominal=100000,
    each m_flow_nominal=1.44,
    each allowFlowReversal = true) annotation (Placement(transformation(extent={{54,50},{74,70}})));

  Modelica.Blocks.Interfaces.RealInput feedTemperature annotation (Placement(transformation(extent={{-140,62},{-100,102}})));

// Layering sistem control

// Mode control (charge or discharge)
  Modelica.Fluid.Interfaces.FluidPort_b port_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,88},{110,108}})));
  Modelica.Blocks.Interfaces.BooleanInput mode "Value true for charge" annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  Modelica.Fluid.Valves.ValveLinear valveCharge(
    redeclare package Medium = Medium,
    dp_nominal=100000,
    m_flow_nominal=1.44)
                      annotation (Placement(transformation(extent={{24,-106},{44,-86}})));
  Modelica.Fluid.Valves.ValveLinear valveDischarge(
    redeclare package Medium = Medium,
    dp_nominal=100000,
    m_flow_nominal=1.44)
                      annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_charge annotation (Placement(transformation(extent={{58,14},{38,34}})));
  Modelica.Blocks.MathBoolean.Not notMode annotation (Placement(transformation(extent={{70,-4},{62,4}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_discharge annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={41,-19})));

  ValveControls.UpperControl upperControl annotation (Placement(transformation(extent={{-66,62},{-46,82}})));
  ValveControls.MidControl midControl[n_Seg-2] annotation (Placement(transformation(extent={{-66,8},{-46,28}})));
  ValveControls.LowerControl lowerControl annotation (Placement(transformation(extent={{-66,-50},{-46,-30}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_VL(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{68,-60},{88,-40}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_RL(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{62,-106},{82,-86}})));
equation
  localState.fLowerTemperature = vol_temperature[1].T;
  localState.fMidTemperature = vol_temperature[integer(n_Seg/2+1)].T;
  localState.fUpperTemperature = vol_temperature[n_Seg].T;

//upper layer connections
  connect(vol[n_Seg].ports[3], valveDischarge.port_a);
  connect(upperControl.opening, valveLayers[n_Seg].opening);
  connect(feedTemperature, upperControl.feed_temp);
  connect(vol_temperature[n_Seg-1].T, upperControl.threshold);
  connect(midControl[n_Seg-2].opening, upperControl.lower_opening);
//lower layer connections
  connect(vol[1].ports[1], valveCharge.port_a);
  connect(vol[1].ports[3],vol[2].ports[1]);
  connect(lowerControl.opening, valveLayers[1].opening);
  connect(vol_temperature[2].T, lowerControl.threshold);
  connect(feedTemperature, lowerControl.feed_temp);
//middle layers connections
  for i in 2:(n_Seg-1) loop
    connect(vol[i].ports[3],vol[i+1].ports[1]);
    connect(feedTemperature, midControl[i-1].feed_temp);
    connect(vol_temperature[i+1].T, midControl[i-1].threshold_upper);
    connect(vol_temperature[i-1].T, midControl[i-1].threshold_lower);
    connect(midControl[i-1].opening, valveLayers[i].opening);
    if i == 2 then
    connect(lowerControl.opening, midControl[i-1].lower_opening);
    else connect(midControl[i-2].opening, midControl[i-1].lower_opening);
    end if;
  end for;

// all layers
  for j in 1:n_Seg loop
    connect(vol[j].ports[2],vol_temperature[j].port);
    connect(vol[j].ports[4],valveLayers[j].port_a);
    connect(valveLayers[j].port_b, port_feed);
  end for;


// connections controlling charge/discharge modes
  connect(booleanToReal_charge.u, mode) annotation (Line(points={{60,24},{88,24},{88,0},{118,0}}, color={255,0,255}));
  connect(booleanToReal_charge.y, valveCharge.opening) annotation (Line(points={{37,24},{34,24},{34,-88}},                   color={0,0,127}));
  connect(mode, notMode.u) annotation (Line(points={{118,0},{71.6,0}}, color={255,0,255}));
  connect(booleanToReal_discharge.y, valveDischarge.opening) annotation (Line(points={{41,-26.7},{41,-32},{50,-32},{50,-42}},
                                                                                                                       color={0,0,127}));
  connect(notMode.y, booleanToReal_discharge.u) annotation (Line(points={{61.2,0},{41,0},{41,-10.6}},            color={255,0,255}));
  connect(port_charge, temp_RL.port_b) annotation (Line(points={{100,-96},{82,-96}}, color={0,127,255}));
  connect(valveCharge.port_b, temp_RL.port_a) annotation (Line(points={{44,-96},{62,-96}}, color={0,127,255}));
  connect(port_discharge, temp_VL.port_b) annotation (Line(points={{100,98},{100,-50},{88,-50}},
                                                                                       color={0,127,255}));
  connect(temp_VL.port_a, valveDischarge.port_b) annotation (Line(points={{68,-50},{60,-50}}, color={0,127,255}));

  connect(port_discharge, port_discharge) annotation (Line(points={{100,98},{100,98}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredStorage_Physical;
