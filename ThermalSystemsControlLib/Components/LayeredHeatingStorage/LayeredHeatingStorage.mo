within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=334.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=325.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=315.15
                                                                      "Start value of lower temperature";

  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-60,74},{-80,94}})));

  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    n_Seg=n_Seg,
    T_start_upper= T_start_upper,
    T_start_lower=T_start_lower,
    T_start_mid=T_start_mid)                                          annotation (Placement(transformation(extent={{26,-14},{60,18}})));
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,54},{100,74}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{64,-110},{84,-90}})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5,
      V_int(displayUnit="ml") = 1e-05)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={20,64})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical1(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5,
      V_int(displayUnit="ml") = 1e-05)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-48,-20})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical2(redeclare package Medium = Medium, deviceData(
      dp_nominal=100000,
      m_flow_nominal=1.44,
      riseTime=5,
      V_int(displayUnit="ml") = 1e-05)) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={78,-56})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation (Placement(transformation(extent={{90,22},{80,32}})));
equation

  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,84},{42,84},{42,22},{43.34,22},{43.34,19.6}}, color={0,0,0}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-59,84},{42,84},{42,22},{43.34,22},{43.34,19.6}},               color={0,0,0}));
  connect(layeredStorage_Physical.mode, mode) annotation (Line(points={{63.06,2},{90,2},{90,0},{118,0}},
                                                                                           color={255,0,255}));
  connect(layeredStorage_Physical.feedTemperature, feed_temp) annotation (Line(points={{22.6,15.12},{13.3,15.12},{13.3,0},{-120,0}}, color={0,0,127}));
  connect(massFlow_discharge.port_b, port_a) annotation (Line(points={{84,-100},{100,-100}}, color={0,127,255}));
  connect(threeWayValve_Physical.port_a1, layeredStorage_Physical.port_discharge) annotation (Line(points={{20,54},{20,24},{60,24},{60,17.68}}, color={0,127,255}));
  connect(massFlow_charge.port_b, port_b) annotation (Line(points={{100,64},{100,100}}, color={0,127,255}));
  connect(booleanToReal.u, mode) annotation (Line(points={{91,27},{90,27},{90,26},{98,26},{98,0},{118,0}},
                                                                                                        color={255,0,255}));
  connect(booleanToReal.y, threeWayValve_Physical2.fSetPoint) annotation (Line(points={{79.5,27},{80,27},{80,-16},{96,-16},{96,-56},{90,-56}},               color={0,0,127}));
  connect(booleanToReal.y, threeWayValve_Physical1.fSetPoint) annotation (Line(points={{79.5,27},{-48,27},{-48,-8}}, color={0,0,127}));
  connect(threeWayValve_Physical1.port_a, threeWayValve_Physical.port_a) annotation (Line(points={{-58,-20},{-62,-20},{-62,64},{10,64}}, color={0,127,255}));
  connect(threeWayValve_Physical.port_b, massFlow_charge.port_a) annotation (Line(points={{30,64},{80,64}}, color={0,127,255}));
  connect(booleanToReal.y, threeWayValve_Physical.fSetPoint) annotation (Line(points={{79.5,27},{68,27},{68,86},{20,86},{20,76}}, color={0,0,127}));
  connect(threeWayValve_Physical1.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{-38,-20},{20,-20},{20,2},{24.98,2}}, color={0,127,255}));
  connect(threeWayValve_Physical1.port_a1, threeWayValve_Physical2.port_a1) annotation (Line(points={{-48,-30},{-48,-56},{68,-56}}, color={0,127,255}));
  connect(layeredStorage_Physical.port_charge, threeWayValve_Physical2.port_a) annotation (Line(points={{60,-13.36},{78,-13.36},{78,-46}}, color={0,127,255}));
  connect(massFlow_discharge.port_a, threeWayValve_Physical2.port_b) annotation (Line(points={{64,-100},{60,-100},{60,-72},{78,-72},{78,-66}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
