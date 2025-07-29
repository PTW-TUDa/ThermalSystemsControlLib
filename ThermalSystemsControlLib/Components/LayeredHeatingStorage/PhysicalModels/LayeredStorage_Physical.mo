within ThermalSystemsControlLib.Components.LayeredHeatingStorage.PhysicalModels;
model LayeredStorage_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V = 7 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments (min. 5)";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=328.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=320.15
                                                                      "Start value of lower temperature";


  parameter Real T_start_values_upper[integer(n_Seg/2)] = linspace(T_start_mid, T_start_upper, integer(n_Seg/2));
  parameter Real T_start_values_lower[integer(n_Seg/2)+1] = linspace(T_start_lower, T_start_mid, integer(n_Seg/2)+1);
  parameter Real T_start_values[n_Seg] = cat(1, T_start_values_lower, T_start_values_upper);

  Modelica.Fluid.Vessels.ClosedVolume vol[n_Seg](
    redeclare each package Medium = Medium,
    each use_portsData = false,
    each use_HeatTransfer=true,
    each V=V/n_Seg,
    each nPorts=5,
    T_start = T_start_values)
        annotation (Placement(transformation(extent={{-8,0},{12,20}})));
    //each T_start=T_start,
  Modelica.Fluid.Sensors.Temperature vol_temperature[n_Seg](redeclare each package Medium = Medium)
                                                                           annotation (Placement(transformation(extent={{-8,32},{12,52}})));

  Modelica.Fluid.Interfaces.FluidPort_a port_feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-106},{110,-86}})));

  Interfaces.LayeredStorageState localState annotation (Placement(transformation(extent={{-8,100},{12,120}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_feed [n_Seg](redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(extent={{11,10},{-11,-10}},
        rotation=180,
        origin={-27,36})));

  Modelica.Blocks.Interfaces.RealInput feedTemperature annotation (Placement(transformation(extent={{-140,62},{-100,102}})));

// Layering sistem control

// Mode control (charge or discharge)
  Modelica.Fluid.Interfaces.FluidPort_b port_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,88},{110,108}})));
  Modelica.Blocks.Interfaces.BooleanInput mode "Value true for charge" annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_charge annotation (Placement(transformation(extent={{64,-64},{44,-44}})));
  Modelica.Blocks.MathBoolean.Not notMode annotation (Placement(transformation(extent={{54,-4},{46,4}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_discharge annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=270,
        origin={31,59})));

  ValveControls.UpperControl upperControl annotation (Placement(transformation(extent={{-66,62},{-46,82}})));
  ValveControls.MidControl midControl[n_Seg-2] annotation (Placement(transformation(extent={{-66,8},{-46,28}})));
  ValveControls.LowerControl lowerControl annotation (Placement(transformation(extent={{-66,-50},{-46,-30}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_VL(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{76,66},{96,86}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_RL(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{62,-106},{82,-86}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_charge(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(extent={{22,-106},{42,-86}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_discharge(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5)) annotation (Placement(transformation(extent={{50,66},{70,86}})));
equation
  localState.fLowerTemperature = vol_temperature[1].T;
  localState.fMidTemperature = vol_temperature[integer(n_Seg/2+1)].T;
  localState.fUpperTemperature = vol_temperature[n_Seg].T;

//upper layer connections
  connect(vol[n_Seg].ports[3], valve_discharge.port_a1);
  connect(upperControl.opening, valve_feed[n_Seg].fSetPoint);
  connect(feedTemperature, upperControl.feed_temp);
  connect(vol_temperature[n_Seg-1].T, upperControl.threshold);
  connect(midControl[n_Seg-2].opening, upperControl.lower_opening);
//lower layer connections
  connect(vol[1].ports[1], valve_charge.port_a1);
  connect(vol[1].ports[3],vol[2].ports[1]);
  connect(lowerControl.opening, valve_feed[1].fSetPoint);
  connect(vol_temperature[2].T, lowerControl.threshold);
  connect(feedTemperature, lowerControl.feed_temp);
//middle layers connections
  for i in 2:(n_Seg-1) loop
    connect(vol[i].ports[3],vol[i+1].ports[1]);
    connect(feedTemperature, midControl[i-1].feed_temp);
    connect(vol_temperature[i+1].T, midControl[i-1].threshold_upper);
    connect(vol_temperature[i-1].T, midControl[i-1].threshold_lower);
    connect(midControl[i-1].opening, valve_feed[i].fSetPoint);
    if i == 2 then
    connect(lowerControl.opening, midControl[i-1].lower_opening);
    else connect(midControl[i-2].opening, midControl[i-1].lower_opening);
    end if;
  end for;

// all layers
  for j in 1:n_Seg loop
    connect(vol[j].ports[2],vol_temperature[j].port);
    connect(vol[j].ports[4],valve_feed[j].port_a1);
    connect(valve_feed[j].port_b, port_feed);
  end for;


// connections controlling charge/discharge modes
  connect(booleanToReal_charge.u, mode) annotation (Line(points={{66,-54},{88,-54},{88,0},{118,0}},
                                                                                                  color={255,0,255}));
  connect(mode, notMode.u) annotation (Line(points={{118,0},{55.6,0}}, color={255,0,255}));
  connect(notMode.y, booleanToReal_discharge.u) annotation (Line(points={{45.2,0},{31,0},{31,50.6}},             color={255,0,255}));
  connect(port_charge, temp_RL.port_b) annotation (Line(points={{100,-96},{82,-96}}, color={0,127,255}));
  connect(port_discharge, temp_VL.port_b) annotation (Line(points={{100,98},{100,76},{96,76}},
                                                                                       color={0,127,255}));

  connect(port_discharge, port_discharge) annotation (Line(points={{100,98},{100,98}}, color={0,127,255}));
  connect(valve_charge.port_b, temp_RL.port_a) annotation (Line(points={{42,-96},{52,-96},{52,-96},{62,-96}}, color={0,127,255}));
  connect(booleanToReal_charge.y, valve_charge.fSetPoint) annotation (Line(points={{43,-54},{32,-54},{32,-84}},        color={0,0,127}));
  connect(valve_discharge.port_b, temp_VL.port_a) annotation (Line(points={{70,76},{76,76}},   color={0,127,255}));
  connect(booleanToReal_discharge.y, valve_discharge.fSetPoint) annotation (Line(points={{31,66.7},{32,66.7},{32,98},{60,98},{60,88}},
                                                                                                                                 color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredStorage_Physical;
