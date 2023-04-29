within ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels;
model CompressionChiller_Simplified_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerSimplifiedProperties deviceData constrainedby ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChillerSimplifiedProperties annotation (choicesAllMatching=true);

  //## COMPONENTS ##

  ThermalSystemsControlLib.BaseClasses.Utilities.ZeroLimiter zeroLimiter(u_min=deviceData.u_min) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,78})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=deviceData.riseTime, initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,10})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin K2degC1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-50})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prePow(final alpha=0)
    "Prescribed power (=heat and flow work) flow for dynamic model"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-30,-70})));
  Modelica.Fluid.Vessels.ClosedVolume volume1(
    redeclare package Medium = Medium,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V_int_cool,
    nPorts=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_in(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-68,-80})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Tables.CombiTable2D Table_f_EER(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table=deviceData.f_EER,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,30})));
  Modelica.Blocks.Math.Gain gain_P_el_nom2(k=deviceData.P_el_nom)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-30})));
  Modelica.Blocks.Math.Product product_P_el1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-50})));
  Modelica.Blocks.Math.Gain signCorrect_cool1(k=-1)
                                                   annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-50,-70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_out(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-80})));
  BaseClasses.FluidBaseClasses.ConditionCheck_OneTemperature conditionCheck_OneTemperature(T_inMin=deviceData.T_Recooling_min, T_inMax=deviceData.T_Recooling_max) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,50})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Modelica.Constants.inf,
                                            uMin=deviceData.T_Recooling_min) annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Modelica.Blocks.Interfaces.RealInput T_air "Connector of Real input signal" annotation (Placement(transformation(extent={{-140,50},{-100,90}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin K2degC2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,70})));
equation

  connect(fSetPoint, zeroLimiter.u) annotation (Line(points={{0,120},{0,90}}, color={0,0,127}));
  connect(prePow.port, volume1.heatPort) annotation (Line(points={{-20,-70},{-10,-70}},        color={191,0,0}));
  connect(port_a, temperature_in.port_a) annotation (Line(points={{-100,0},{-100,-80},{-78,-80}}, color={0,127,255}));
  connect(temperature_in.port_b, volume1.ports[1]) annotation (Line(points={{-58,-80},{-2,-80}}, color={0,127,255}));
  connect(port_a,port_a)  annotation (Line(points={{-100,0},{-100,0}},                   color={0,127,255}));
  connect(firstOrder.y, fOperatingPoint) annotation (Line(points={{-1.9984e-15,-1},{60,-1},{60,40},{110,40}}, color={0,0,127}));
  connect(prePow.Q_flow, signCorrect_cool1.y) annotation (Line(points={{-40,-70},{-45.6,-70}}, color={0,0,127}));
  connect(volume1.ports[2], temperature_out.port_a) annotation (Line(points={{2,-80},{40,-80}}, color={0,127,255}));
  connect(temperature_out.port_b, port_b) annotation (Line(points={{60,-80},{100,-80},{100,0}}, color={0,127,255}));
  connect(temperature_out.T, K2degC1.Kelvin) annotation (Line(points={{50,-69},{50,-62}}, color={0,0,127}));
  connect(firstOrder.y, gain_P_el_nom2.u) annotation (Line(points={{0,-1},{0,-18},{2.22045e-15,-18}}, color={0,0,127}));
  connect(zeroLimiter.y, conditionCheck_OneTemperature.fSetPoint) annotation (Line(points={{0,67},{0,64},{5,64},{5,61}}, color={0,0,127}));
  connect(conditionCheck_OneTemperature.fSetPointInternal, firstOrder.u) annotation (Line(points={{-5,39},{-5,34},{2.22045e-15,34},{2.22045e-15,22}}, color={0,0,127}));
  connect(conditionCheck_OneTemperature.bStatusOn, bStatusOn) annotation (Line(points={{5,39},{5,34},{20,34},{20,80},{110,80}}, color={255,0,255}));
  connect(limiter.y, Table_f_EER.u2) annotation (Line(points={{-39,70},{-36,70},{-36,42}}, color={0,0,127}));
  connect(K2degC1.Celsius, Table_f_EER.u1) annotation (Line(points={{50,-39},{50,70},{-24,70},{-24,42}}, color={0,0,127}));
  connect(product_P_el1.u2, Table_f_EER.y) annotation (Line(points={{-56,-38},{-56,-20},{-30,-20},{-30,19}}, color={0,0,127}));
  connect(product_P_el1.u1, gain_P_el_nom2.y) annotation (Line(points={{-44,-38},{-2.22045e-15,-38},{-2.22045e-15,-41}}, color={0,0,127}));
  connect(product_P_el1.y, signCorrect_cool1.u) annotation (Line(points={{-50,-61},{-50,-64},{-60,-64},{-60,-70},{-54.8,-70}}, color={0,0,127}));
  connect(conditionCheck_OneTemperature.T_in, Table_f_EER.u2) annotation (Line(points={{-5,61},{-5,64},{-36,64},{-36,42}}, color={0,0,127}));
  connect(K2degC2.Celsius, limiter.u) annotation (Line(points={{-69,70},{-62,70}}, color={0,0,127}));
  connect(K2degC2.Kelvin, T_air) annotation (Line(points={{-92,70},{-120,70}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(initialScale=0.1)),
    Documentation(info="<html>
<p>Compression chiller model without cooling water cycle. EER depends on ambient air temperature and feed temperature.</p>
</html>"));
end CompressionChiller_Simplified_Physical;
