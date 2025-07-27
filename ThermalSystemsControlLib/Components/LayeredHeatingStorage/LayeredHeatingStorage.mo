within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=331.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=328.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=320.15
                                                                      "Start value of lower temperature";

  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-56,54},{-76,74}})));


  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    n_Seg=n_Seg,
    T_start_upper= T_start_upper,
    T_start_lower=T_start_lower,
    T_start_mid=T_start_mid)                                          annotation (Placement(transformation(extent={{26,-16},{60,16}})));
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Fluid.Valves.ValveDiscrete valve_charge_feed(
    redeclare package Medium = Medium,
    dp_nominal=100000,
    m_flow_nominal=1.44,
    opening_min=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={16,42})));
  Modelica.Fluid.Valves.ValveDiscrete valve_charge_out(
    redeclare package Medium = Medium,
    dp_nominal=100000,
    m_flow_nominal=1.44,
    opening_min=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={66,-42})));
  Modelica.Fluid.Valves.ValveDiscrete valve_discharge_feed(
    redeclare package Medium = Medium,
    dp_nominal=100000,
    m_flow_nominal=1.44,
    opening_min=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={18,-28})));
  Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(extent={{124,-40},{112,-28}})));
  Modelica.Fluid.Valves.ValveDiscrete valve_discharge_out(
    redeclare package Medium = Medium,
    dp_nominal=100000,
    m_flow_nominal=1.44,
    opening_min=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={74,62})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{22,90},{42,110}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{10,-96},{30,-76}})));
equation

  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,84},{48,84},{48,22},{43.34,22},{43.34,17.6}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-55,64},{0,64},{0,84},{48,84},{48,22},{43.34,22},{43.34,17.6}}, color={0,0,0}));
  connect(layeredStorage_Physical.mode, mode) annotation (Line(points={{63.06,0},{118,0}}, color={255,0,255}));
  connect(layeredStorage_Physical.feedTemperature, feed_temp) annotation (Line(points={{22.6,13.12},{13.3,13.12},{13.3,0},{-120,0}}, color={0,0,127}));
  connect(valve_charge_feed.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{16,32},{16,0},{24.98,0}}, color={0,127,255}));
  connect(mode, valve_charge_feed.open) annotation (Line(points={{118,0},{84,0},{84,42},{24,42}}, color={255,0,255}));
  connect(mode, valve_charge_out.open) annotation (Line(points={{118,0},{84,0},{84,-42},{74,-42}}, color={255,0,255}));
  connect(valve_discharge_feed.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{18,-18},{18,0},{24.98,0}}, color={0,127,255}));
  connect(not1.u, mode) annotation (Line(points={{125.2,-34},{144,-34},{144,0},{118,0}}, color={255,0,255}));
  connect(not1.y, valve_discharge_feed.open) annotation (Line(points={{111.4,-34},{68,-34},{68,-28},{26,-28}}, color={255,0,255}));
  connect(valve_discharge_out.open, not1.y) annotation (Line(points={{82,62},{88,62},{88,-24},{111.4,-24},{111.4,-34}},
                                                                                                            color={255,0,255}));
  connect(layeredStorage_Physical.port_discharge, valve_discharge_out.port_b) annotation (Line(points={{60,15.68},{70,15.68},{70,54},{74,54},{74,52}}, color={0,127,255}));
  connect(layeredStorage_Physical.port_charge, valve_charge_out.port_a) annotation (Line(points={{60,-15.36},{60,-20},{66,-20},{66,-32}}, color={0,127,255}));
  connect(valve_discharge_feed.port_a, massFlow_discharge.port_a) annotation (Line(points={{18,-38},{18,-72},{6,-72},{6,-86},{10,-86}}, color={0,127,255}));
  connect(valve_charge_feed.port_a, massFlow_charge.port_a) annotation (Line(points={{16,52},{16,100},{22,100}}, color={0,127,255}));
  connect(massFlow_charge.port_b, port_b) annotation (Line(points={{42,100},{100,100}}, color={0,127,255}));
  connect(valve_discharge_out.port_a, port_b) annotation (Line(points={{74,72},{74,100},{100,100}}, color={0,127,255}));
  connect(valve_charge_out.port_b, port_a) annotation (Line(points={{66,-52},{66,-86},{100,-86},{100,-100}}, color={0,127,255}));
  connect(massFlow_discharge.port_b, valve_charge_out.port_b) annotation (Line(points={{30,-86},{66,-86},{66,-52}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
