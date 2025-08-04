within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=6   "Number of volume segments";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper=334.15
                                                                      "Start value of upper temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_mid=325.15
                                                                      "Start value of middle temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower=315.15
                                                                      "Start value of lower temperature";

  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector localState annotation (Placement(transformation(extent={{-60,74},{-80,94}})));

  Modelica.Blocks.Interfaces.BooleanInput mode annotation (Placement(transformation(extent={{138,-20},{98,20}})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    V=7,
    n_Seg=n_Seg,
    T_start_upper= T_start_upper,
    T_start_lower=T_start_lower,
    T_start_mid=T_start_mid)                                          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_charge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,54},{100,74}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_discharge(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{64,-110},{84,-90}})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical2(redeclare package Medium = Medium, redeclare ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.ThreeWayValveProperties deviceData(
      dp_nominal(displayUnit="Pa") = 1,
      m_flow_nominal=1,
      riseTime=60,
      V_int=0.01),
      volume(medium(
      T( start=T_start_mid, fixed=true))))                      annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={40,-54})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation (Placement(transformation(extent={{88,10},{72,26}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort feed_temp(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical1(redeclare package Medium = Medium, redeclare Valves.PhysicalModels.Records.ThreeWayValveProperties deviceData(
      dp_nominal(displayUnit="Pa") = 1,
      m_flow_nominal=1,
      riseTime=60,
      V_int=0.01),
      volume(medium(
      T( start=T_start_mid, fixed=true))))                      annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-40,0})));
  Valves.PhysicalModels.ThreeWayValve_Physical threeWayValve_Physical3(redeclare package Medium = Medium, redeclare Valves.PhysicalModels.Records.ThreeWayValveProperties deviceData(
      dp_nominal(displayUnit="Pa") = 1,
      m_flow_nominal=1,
      riseTime=60,
      V_int=0.01),
      volume(medium(
      T( start=T_start_mid, fixed=true))))                      annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={28,64})));
equation

  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,40},{30,40},{30,18},{30.2,18},{30.2,11}},     color={0,0,0}));
  connect(localState.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-59,84},{0,84},{0,40},{30,40},{30,18},{30.2,18},{30.2,11}}, color={0,0,0}));
  connect(layeredStorage_Physical.mode, mode) annotation (Line(points={{41.8,0},{118,0}},  color={255,0,255}));
  connect(massFlow_discharge.port_b, port_a) annotation (Line(points={{84,-100},{100,-100}}, color={0,127,255}));
  connect(massFlow_charge.port_b, port_b) annotation (Line(points={{100,64},{100,100}}, color={0,127,255}));
  connect(booleanToReal.u, mode) annotation (Line(points={{89.6,18},{98,18},{98,0},{118,0}},            color={255,0,255}));
  connect(booleanToReal.y, threeWayValve_Physical2.fSetPoint) annotation (Line(points={{71.2,18},{54,18},{54,-46},{60,-46},{60,-54},{52,-54}},               color={0,0,127}));
  connect(layeredStorage_Physical.port_charge, threeWayValve_Physical2.port_a) annotation (Line(points={{40,-9.6},{40,-44}},               color={0,127,255}));
  connect(massFlow_discharge.port_a, threeWayValve_Physical2.port_b) annotation (Line(points={{64,-100},{40,-100},{40,-64}},                   color={0,127,255}));
  connect(feed_temp.port_b, layeredStorage_Physical.port_feed) annotation (Line(points={{4,0},{20,0}}, color={0,127,255}));
  connect(feed_temp.T, layeredStorage_Physical.feedTemperature) annotation (Line(points={{-6,11},{-6,16},{8,16},{8,10},{18,10}}, color={0,0,127}));
  connect(threeWayValve_Physical2.port_a1, threeWayValve_Physical1.port_a1) annotation (Line(points={{30,-54},{-40,-54},{-40,-10}}, color={0,127,255}));
  connect(threeWayValve_Physical1.port_b, feed_temp.port_a) annotation (Line(points={{-30,0},{-16,0}}, color={0,127,255}));
  connect(threeWayValve_Physical1.fSetPoint, booleanToReal.y) annotation (Line(points={{-40,12},{-40,18},{71.2,18}}, color={0,0,127}));
  connect(threeWayValve_Physical1.port_a, threeWayValve_Physical3.port_a) annotation (Line(points={{-50,0},{-54,0},{-54,44},{12,44},{12,64},{18,64}}, color={0,127,255}));
  connect(threeWayValve_Physical3.port_a1, layeredStorage_Physical.port_discharge) annotation (Line(points={{28,54},{28,16},{40,16},{40,9.8}}, color={0,127,255}));
  connect(massFlow_charge.port_a, threeWayValve_Physical3.port_b) annotation (Line(points={{80,64},{38,64}}, color={0,127,255}));
  connect(booleanToReal.y, threeWayValve_Physical3.fSetPoint) annotation (Line(points={{71.2,18},{54,18},{54,84},{28,84},{28,76}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
