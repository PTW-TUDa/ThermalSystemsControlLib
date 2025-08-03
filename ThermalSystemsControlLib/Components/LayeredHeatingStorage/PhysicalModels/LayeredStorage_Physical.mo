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

  Modelica.Fluid.Interfaces.FluidPort_a port_feed(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-106},{110,-86}})));

  Interfaces.LayeredStorageState localState annotation (Placement(transformation(extent={{-8,100},{12,120}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_feed [n_Seg](redeclare package Medium = Medium, redeclare ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties deviceData(
      dp_nominal(displayUnit="Pa") = 1,
      m_flow_nominal=1,
      riseTime=60))     annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-32,50})));

  Modelica.Blocks.Interfaces.RealInput feedTemperature annotation (Placement(transformation(extent={{-140,80},{-100,120}})));

// Layering sistem control

// Mode control (charge or discharge)
  Modelica.Fluid.Interfaces.FluidPort_b port_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,88},{110,108}})));
  Modelica.Blocks.Interfaces.BooleanInput mode "Value true for charge" annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_charge annotation (Placement(transformation(extent={{60,-52},{40,-32}})));
  Modelica.Blocks.MathBoolean.Not notMode annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal_discharge annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={30,50})));

  ValveControls.UpperControl upperControl annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  ValveControls.MidControl midControl[n_Seg-2] annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  ValveControls.LowerControl lowerControl annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_VL(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{66,70},{86,90}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temp_RL(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{58,-90},{78,-70}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_charge(redeclare package Medium = Medium, redeclare ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties deviceData(
      dp_nominal(displayUnit="Pa") = 1,
      m_flow_nominal=1,
      riseTime=60))
                   annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
  Valves.PhysicalModels.TwoWayValve_Physical valve_discharge(redeclare package Medium = Medium, deviceData(
      dp_nominal=0.1,
      m_flow_nominal=1,
      riseTime=60)) annotation (Placement(transformation(extent={{40,70},{60,90}})));
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
  connect(booleanToReal_charge.u, mode) annotation (Line(points={{62,-42},{88,-42},{88,0},{118,0}},
                                                                                                  color={255,0,255}));
  connect(mode, notMode.u) annotation (Line(points={{118,0},{64,0}},   color={255,0,255}));
  connect(notMode.y, booleanToReal_discharge.u) annotation (Line(points={{38,0},{30,0},{30,38}},                 color={255,0,255}));
  connect(port_charge, temp_RL.port_b) annotation (Line(points={{100,-96},{100,-80},{78,-80}},
                                                                                     color={0,127,255}));
  connect(port_discharge, temp_VL.port_b) annotation (Line(points={{100,98},{100,80},{86,80}},
                                                                                       color={0,127,255}));

  connect(port_discharge, port_discharge) annotation (Line(points={{100,98},{100,98}}, color={0,127,255}));
  connect(valve_charge.port_b, temp_RL.port_a) annotation (Line(points={{30,-80},{58,-80}},                   color={0,127,255}));
  connect(booleanToReal_charge.y, valve_charge.fSetPoint) annotation (Line(points={{39,-42},{20,-42},{20,-68}},        color={0,0,127}));
  connect(valve_discharge.port_b, temp_VL.port_a) annotation (Line(points={{60,80},{66,80}},   color={0,127,255}));
  connect(booleanToReal_discharge.y, valve_discharge.fSetPoint) annotation (Line(points={{30,61},{30,102},{50,102},{50,92}},     color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredStorage_Physical;
