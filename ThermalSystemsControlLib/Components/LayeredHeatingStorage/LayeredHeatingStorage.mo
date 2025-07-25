within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of temperature";

  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-56,54},{-76,74}})));


  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    T_start_upper=334.15,
    T_start_lower=319.15,
    T_start_mid=325.15)                                          annotation (Placement(transformation(extent={{26,-16},{60,16}})));
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Fluid.Valves.ValveDiscrete valve_charge_feed(
    redeclare package Medium = Medium,
    dp_nominal=100000,
    m_flow_nominal=1.44,
    opening_min=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={18,48})));
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
        origin={68,70})));
equation

  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,84},{48,84},{48,22},{43.34,22},{43.34,17.6}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-55,64},{0,64},{0,84},{48,84},{48,22},{43.34,22},{43.34,17.6}}, color={0,0,0}));
  connect(layeredStorage_Physical.mode, mode) annotation (Line(points={{63.06,0},{118,0}}, color={255,0,255}));
  connect(layeredStorage_Physical.feedTemperature, feed_temp) annotation (Line(points={{22.6,13.12},{13.3,13.12},{13.3,0},{-120,0}}, color={0,0,127}));
  connect(valve_charge_feed.port_a, port_b) annotation (Line(points={{18,58},{18,100},{100,100}}, color={0,127,255}));
  connect(valve_charge_feed.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{18,38},{18,0},{24.98,0}}, color={0,127,255}));
  connect(mode, valve_charge_feed.open) annotation (Line(points={{118,0},{84,0},{84,48},{26,48}}, color={255,0,255}));
  connect(layeredStorage_Physical.port_charge, valve_charge_out.port_a) annotation (Line(points={{60,-15.36},{66,-15.36},{66,-32}}, color={0,127,255}));
  connect(valve_charge_out.port_b, port_a) annotation (Line(points={{66,-52},{66,-86},{100,-86},{100,-100}}, color={0,127,255}));
  connect(mode, valve_charge_out.open) annotation (Line(points={{118,0},{84,0},{84,-42},{74,-42}}, color={255,0,255}));
  connect(port_a, valve_discharge_feed.port_a) annotation (Line(points={{100,-100},{100,-86},{18,-86},{18,-38}}, color={0,127,255}));
  connect(valve_discharge_feed.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{18,-18},{18,0},{24.98,0}}, color={0,127,255}));
  connect(not1.u, mode) annotation (Line(points={{125.2,-34},{144,-34},{144,0},{118,0}}, color={255,0,255}));
  connect(not1.y, valve_discharge_feed.open) annotation (Line(points={{111.4,-34},{68,-34},{68,-28},{26,-28}}, color={255,0,255}));
  connect(valve_discharge_out.port_b, layeredStorage_Physical.port_discharge) annotation (Line(points={{68,60},{68,22},{60,22},{60,15.68}}, color={0,127,255}));
  connect(valve_discharge_out.port_a, port_b) annotation (Line(points={{68,80},{68,100},{100,100}}, color={0,127,255}));
  connect(valve_discharge_out.open, not1.y) annotation (Line(points={{76,70},{96,70},{96,-34},{111.4,-34}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
