within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage_3portvalves
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
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-60,74},{-80,94}})));

  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    n_Seg=n_Seg,
    T_start_upper= T_start_upper,
    T_start_lower=T_start_lower,
    T_start_mid=T_start_mid)                                          annotation (Placement(transformation(extent={{26,-16},{60,16}})));
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,54},{100,74}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{64,-110},{84,-90}})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5,
      V_int(displayUnit="ml") = 1e-05)) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={20,64})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical1(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5,
      V_int(displayUnit="ml") = 1e-05)) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-32,-8})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical2(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5,
      V_int(displayUnit="ml") = 1e-05)) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={78,-56})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation (Placement(transformation(extent={{124,74},{114,84}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1 annotation (Placement(transformation(extent={{-70,-14},{-60,-4}})));
  Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(extent={{-90,-16},{-78,-4}})));
equation

  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,84},{42,84},{42,22},{43.34,22},{43.34,17.6}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-59,84},{42,84},{42,22},{43.34,22},{43.34,17.6}},               color={0,0,0}));
  connect(layeredStorage_Physical.mode, mode) annotation (Line(points={{63.06,0},{118,0}}, color={255,0,255}));
  connect(layeredStorage_Physical.feedTemperature, feed_temp) annotation (Line(points={{22.6,13.12},{13.3,13.12},{13.3,0},{-120,0}}, color={0,0,127}));
  connect(threeWayValve_Physical1.port_a1, layeredStorage_Physical.port_feed) annotation (Line(points={{-22,-8},{20,-8},{20,0},{24.98,0}}, color={0,127,255}));
  connect(layeredStorage_Physical.port_charge, threeWayValve_Physical2.port_b) annotation (Line(points={{60,-15.36},{60,-20},{78,-20},{78,-46}}, color={0,127,255}));
  connect(threeWayValve_Physical2.port_a, massFlow_discharge.port_a) annotation (Line(points={{78,-66},{78,-86},{60,-86},{60,-100},{64,-100}}, color={0,127,255}));
  connect(threeWayValve_Physical1.port_b, threeWayValve_Physical2.port_a1) annotation (Line(points={{-32,-18},{-32,-56},{68,-56}}, color={0,127,255}));
  connect(massFlow_discharge.port_b, port_a) annotation (Line(points={{84,-100},{100,-100}}, color={0,127,255}));
  connect(booleanToReal.y, threeWayValve_Physical.fSetPoint) annotation (Line(points={{113.5,79},{44,79},{44,86},{20,86},{20,76}}, color={0,0,127}));
  connect(threeWayValve_Physical1.port_a, threeWayValve_Physical.port_b) annotation (Line(points={{-32,2},{-32,64},{10,64}}, color={0,127,255}));
  connect(threeWayValve_Physical.port_a1, layeredStorage_Physical.port_discharge) annotation (Line(points={{20,54},{20,24},{60,24},{60,15.68}}, color={0,127,255}));
  connect(threeWayValve_Physical.port_a, massFlow_charge.port_a) annotation (Line(points={{30,64},{50,64},{50,64},{80,64}}, color={0,127,255}));
  connect(massFlow_charge.port_b, port_b) annotation (Line(points={{100,64},{100,100}}, color={0,127,255}));
  connect(booleanToReal.u, mode) annotation (Line(points={{125,79},{130,79},{130,24},{118,24},{118,0}}, color={255,0,255}));
  connect(booleanToReal1.y, threeWayValve_Physical1.fSetPoint) annotation (Line(points={{-59.5,-9},{-59.5,-8},{-44,-8}}, color={0,0,127}));
  connect(not1.y, booleanToReal1.u) annotation (Line(points={{-77.4,-10},{-74,-10},{-74,-9},{-71,-9}}, color={255,0,255}));
  connect(not1.u, mode) annotation (Line(points={{-91.2,-10},{-94,-10},{-94,-126},{114,-126},{114,0},{118,0}}, color={255,0,255}));
  connect(booleanToReal.y, threeWayValve_Physical2.fSetPoint) annotation (Line(points={{113.5,79},{113.5,8},{114,8},{114,-58},{104,-58},{104,-56},{90,-56}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage_3portvalves;
