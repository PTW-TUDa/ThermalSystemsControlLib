within ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels;
model CHP_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.CHP_Icon;
    replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);

  replaceable parameter ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Properties deviceData constrainedby ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Properties annotation (__Dymola_choicesAllMatching=true);

  Modelica.Blocks.Tables.CombiTable2Ds Tableefficency_P_th(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table=deviceData.f_effPth,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));

  ThermalSystemsControlLib.BaseClasses.Utilities.ZeroLimiter zeroLimiter1(u_min=deviceData.u_min, u_0=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,80})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prePow(final alpha=0)
    "Prescribed power (=heat and flow work) flow for dynamic model"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,-90})));

  Modelica.Blocks.Math.Gain gain_P_el_nom(k=-deviceData.P_el_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,50})));
  Modelica.Blocks.Math.Gain gain_P_gs_nom(k=deviceData.P_gas_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,90})));
  BaseClasses.FluidBaseClasses.ConditionCheck_OneTemperature conditionCheck(T_inMin=deviceData.T_return_min, T_inMax=deviceData.T_return_max)
                                                                                                                                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,50})));
  Modelica.Blocks.Math.Gain gain_P_gs_nom2(k=deviceData.P_gas_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-70})));

  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=deviceData.riseTime,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,20})));

  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V,
    nPorts=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={0,-90})));

  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-100})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput P_gas "Output signal connector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,90})));
  Modelica.Blocks.Interfaces.RealOutput P_el "Output signal connector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,50})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-10})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=deviceData.u_min) annotation (Placement(transformation(extent={{30,26},{50,46}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Pipes.PhysicalModels.PressureDrop            pressureDrop(
    redeclare package Medium = Medium,
    dp_nominal=deviceData.dp_nominal,
    m_flow_nominal=deviceData.m_flow_nominal)                                                    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-90})));
equation

  connect(zeroLimiter1.y, conditionCheck.fSetPoint) annotation (Line(points={{-2.22045e-15,69},{5,69},{5,61}}, color={0,0,127}));
  connect(prePow.port, volume.heatPort) annotation (Line(points={{40,-90},{10,-90}}, color={191,0,0}));
  connect(prePow.Q_flow, gain_P_gs_nom2.y) annotation (Line(points={{60,-90},{70,-90},{70,-81}},     color={0,0,127}));
  connect(port_a, temperature.port_a) annotation (Line(points={{-100,0},{-100,-100},{-80,-100}},
                                                                                              color={0,127,255}));
  connect(volume.ports[1], port_b) annotation (Line(points={{1,-100},{100,-100},{100,0}},
                                                                                        color={0,127,255}));
  connect(fSetPoint, zeroLimiter1.u) annotation (Line(points={{0,120},{0,92},{2.22045e-15,92}}, color={0,0,127}));
  connect(port_a, port_a) annotation (Line(points={{-100,0},{-100,6},{-100,6},{-100,0}}, color={0,127,255}));
  connect(firstOrder.u, conditionCheck.fSetPointInternal) annotation (Line(points={{2.22045e-15,32},{2.22045e-15,39},{-5,39}}, color={0,0,127}));
  connect(gain_P_el_nom.u, Tableefficency_P_th.u1) annotation (Line(points={{-58,50},{-40,50},{-40,-44},{-42,-44}}, color={0,0,127}));
  connect(gain_P_gs_nom.u, Tableefficency_P_th.u1) annotation (Line(points={{-58,90},{-40,90},{-40,-44},{-42,-44}}, color={0,0,127}));
  connect(conditionCheck.T_in, Tableefficency_P_th.u2) annotation (Line(points={{-5,61},{-20,61},{-20,0},{-70,0},{-70,-40},{-60,-40},{-60,-56},{-42,-56}}, color={0,0,127}));
  connect(gain_P_gs_nom.y, P_gas) annotation (Line(points={{-81,90},{-110,90}}, color={0,0,127}));
  connect(gain_P_el_nom.y, P_el) annotation (Line(points={{-81,50},{-110,50}}, color={0,0,127}));
  connect(temperature.T, Tableefficency_P_th.u2) annotation (Line(points={{-70,-89},{-70,-40},{-60,-40},{-60,-56},{-42,-56}}, color={0,0,127}));
  connect(firstOrder.y, limiter.u) annotation (Line(points={{-1.9984e-15,9},{2.22045e-15,9},{2.22045e-15,2}}, color={0,0,127}));
  connect(limiter.y, Tableefficency_P_th.u1) annotation (Line(points={{0,-21},{0,-44},{-42,-44}}, color={0,0,127}));
  connect(fOperatingPoint, limiter.y) annotation (Line(points={{110,40},{80,40},{80,-20},{0,-20},{0,-21}}, color={0,0,127}));
  connect(product1.u2, Tableefficency_P_th.y) annotation (Line(points={{18,-56},{0,-56},{0,-50},{-19,-50}}, color={0,0,127}));
  connect(product1.u1, Tableefficency_P_th.u1) annotation (Line(points={{18,-44},{-42,-44}}, color={0,0,127}));
  connect(product1.y, gain_P_gs_nom2.u) annotation (Line(points={{41,-50},{70,-50},{70,-58}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, bStatusOn) annotation (Line(points={{51,36},{78,36},{78,80},{110,80}},
                                                                                                        color={255,0,255}));
  connect(temperature.port_b, pressureDrop.port_a) annotation (Line(points={{-60,-100},{-40,-100}}, color={0,127,255}));
  connect(pressureDrop.port_b, volume.ports[2]) annotation (Line(points={{-20,-100},{-1,-100}}, color={0,127,255}));
  connect(greaterEqualThreshold.u, conditionCheck.fSetPointInternal) annotation (Line(points={{28,36},{0,36},{0,39},{-5,39}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(initialScale=0.1),
        graphics={
        Line(points={{-176,98}}, color={255,255,255}),
        Line(
          points={{-60,150}},
          color={255,255,255},
          thickness=1)}),
    Documentation(info="<html>
<p>This model is based on the approach by <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[WISC05]</a>.</p>
<p>The component describes a combined heat and power unit. A Otto engine in combination with a generator is used to produce electricity. The is used to heat water flowing between port_a and port_b. The power is set by the control signal u &isin; [0, 1] and the maximum power is set as nominal power.</p>
</html>"));
end CHP_Physical;
