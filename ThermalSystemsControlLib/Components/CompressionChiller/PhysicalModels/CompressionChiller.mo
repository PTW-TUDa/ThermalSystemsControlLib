within ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels;
model CompressionChiller
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable package Medium1 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChiller_Properties deviceData constrainedby ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChiller_Properties annotation (choicesAllMatching=true);

  //## COMPONENTS ##

  BaseClasses.FluidBaseClasses.ConditionCheck_TwoTemperatures conditionCheck(
    T2_min=deviceData.T_in_heat_min,
    T2_max=deviceData.T_in_heat_max,
    T1_min=deviceData.T_in_cool_min,
    T1_max=deviceData.T_in_cool_max)                                         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,10})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=deviceData.riseTime, initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,82})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin K2degC1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-10})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prePow(final alpha=0)
    "Prescribed power (=heat and flow work) flow for dynamic model"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-30,-50})));
  Modelica.Fluid.Vessels.ClosedVolume volume1(
    redeclare package Medium = Medium,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V_int_cool,
    nPorts=2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={2,-50})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_cool_in(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-40})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1)
                                               annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1)
                                               annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Modelica.Fluid.Vessels.ClosedVolume volume2(
    redeclare package Medium = Medium1,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V_int_heat,
    nPorts=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-90})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prePow1(final alpha=0)
    "Prescribed power (=heat and flow work) flow for dynamic model"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-30,-90})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin K2degC2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_heat_in(redeclare package Medium = Medium1)
                                                                                                   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,-100})));
  Modelica.Blocks.Tables.CombiTable1Ds Table_f_Pel_partLoad1(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    columns={2},
    table=deviceData.f_Pel_partLoad,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,90})));
  Modelica.Blocks.Tables.CombiTable2D Table_f_PthMax1(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table=deviceData.f_PthMax,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,30})));
  Modelica.Blocks.Math.Gain gain_P_el_nom2(k=deviceData.P_el_nom)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-72,60})));
  Modelica.Blocks.Math.Product product_P_el1
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-90,50})));
  Modelica.Blocks.Tables.CombiTable2D Table_f_PelMax1(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table=deviceData.f_PelMax,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,60})));
  Modelica.Blocks.Math.Gain gain_P_th_nom1(k=deviceData.P_th_cool_nom)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-72,30})));
  Modelica.Blocks.Math.Add add1(k2=+1)
                                      annotation (Placement(transformation(extent={{-68,-96},{-58,-86}})));
  Modelica.Blocks.Math.Gain signCorrect_cool1(k=-1)
                                                   annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-50,-50})));
  Modelica.Blocks.Math.Product product_P_el2
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-82,10})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=deviceData.u_min) annotation (Placement(transformation(extent={{60,70},{80,90}})));
equation

  connect(prePow.port, volume1.heatPort) annotation (Line(points={{-20,-50},{-8,-50}},         color={191,0,0}));
  connect(K2degC1.Kelvin, temperature_cool_in.T) annotation (Line(points={{-70,-22},{-70,-29}}, color={0,0,127}));
  connect(port_a, temperature_cool_in.port_a) annotation (Line(points={{-100,0},{-100,-40},{-80,-40}}, color={0,127,255}));
  connect(temperature_cool_in.port_b, volume1.ports[1]) annotation (Line(points={{-60,-40},{0,-40}}, color={0,127,255}));
  connect(volume1.ports[2], port_b) annotation (Line(points={{4,-40},{100,-40},{100,0}},    color={0,127,255}));
  connect(port_a,port_a)  annotation (Line(points={{-100,0},{-100,0}},                   color={0,127,255}));
  connect(volume2.ports[1], port_b1) annotation (Line(points={{-2,-100},{-50,-100},{-50,-100},{-100,-100}}, color={0,127,255}));
  connect(prePow1.port, volume2.heatPort) annotation (Line(points={{-20,-90},{-14,-90},{-14,-90},{-10,-90}}, color={191,0,0}));
  connect(temperature_heat_in.T, K2degC2.Kelvin) annotation (Line(points={{50,-89},{50,-82}}, color={0,0,127}));
  connect(temperature_heat_in.port_a, port_a1) annotation (Line(points={{60,-100},{100,-100}}, color={0,127,255}));
  connect(temperature_heat_in.port_b, volume2.ports[2]) annotation (Line(points={{40,-100},{2,-100}}, color={0,127,255}));
  connect(Table_f_PelMax1.u1, K2degC1.Celsius) annotation (Line(points={{-38,54},{-34,54},{-34,1},{-70,1}}, color={0,0,127}));
  connect(Table_f_PelMax1.u2, K2degC2.Celsius) annotation (Line(points={{-38,66},{-28,66},{-28,-20},{50,-20},{50,-59}}, color={0,0,127}));
  connect(Table_f_PthMax1.u1, K2degC1.Celsius) annotation (Line(points={{-38,24},{-34,24},{-34,1},{-70,1}}, color={0,0,127}));
  connect(Table_f_PthMax1.u2, K2degC2.Celsius) annotation (Line(points={{-38,36},{-28,36},{-28,-20},{50,-20},{50,-59}}, color={0,0,127}));
  connect(Table_f_PelMax1.y, gain_P_el_nom2.u) annotation (Line(points={{-61,60},{-64.8,60}}, color={0,0,127}));
  connect(Table_f_PthMax1.y, gain_P_th_nom1.u) annotation (Line(points={{-61,30},{-64.8,30}}, color={0,0,127}));
  connect(product_P_el1.u1, gain_P_el_nom2.y) annotation (Line(points={{-86.4,57.2},{-86.4,60},{-78.6,60}}, color={0,0,127}));
  connect(product_P_el1.u2, Table_f_Pel_partLoad1.y[1]) annotation (Line(points={{-93.6,57.2},{-93.6,90},{-61,90}}, color={0,0,127}));
  connect(prePow.Q_flow, signCorrect_cool1.y) annotation (Line(points={{-40,-50},{-45.6,-50}}, color={0,0,127}));
  connect(prePow1.Q_flow, add1.y) annotation (Line(points={{-40,-90},{-48,-90},{-48,-91},{-57.5,-91}}, color={0,0,127}));
  connect(add1.u1, signCorrect_cool1.u) annotation (Line(points={{-69,-88},{-80,-88},{-80,-50},{-54.8,-50}}, color={0,0,127}));
  connect(add1.u2, product_P_el1.y) annotation (Line(points={{-69,-94},{-90,-94},{-90,43.4}}, color={0,0,127}));
  connect(conditionCheck.T1, temperature_cool_in.T) annotation (Line(points={{-5,21},{-5,20},{-16,20},{-16,-29},{-70,-29}}, color={0,0,127}));
  connect(conditionCheck.T2, K2degC2.Kelvin) annotation (Line(points={{5,21},{4,21},{4,20},{28,20},{28,-82},{50,-82}}, color={0,0,127}));
  connect(product_P_el1.u2, product_P_el2.u2) annotation (Line(points={{-93.6,57.2},{-93.6,60},{-100,60},{-100,17.2},{-85.6,17.2}}, color={0,0,127}));
  connect(product_P_el2.u1, gain_P_th_nom1.y) annotation (Line(points={{-78.4,17.2},{-78.4,24.6},{-78.6,24.6},{-78.6,30}}, color={0,0,127}));
  connect(product_P_el2.y, signCorrect_cool1.u) annotation (Line(points={{-82,3.4},{-82,-50},{-54.8,-50}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, bStatusOn) annotation (Line(points={{81,80},{110,80}}, color={255,0,255}));
  connect(greaterEqualThreshold.u, fOperatingPoint) annotation (Line(points={{58,80},{40,80},{40,-1},{60,-1},{60,40},{110,40}}, color={0,0,127}));
  connect(fSetPoint, firstOrder.u) annotation (Line(points={{0,120},{0,107},{2.22045e-15,107},{2.22045e-15,94}}, color={0,0,127}));
  connect(firstOrder.y, fOperatingPoint) annotation (Line(points={{0,71},{20,71},{20,70},{40,70},{40,-1},{60,-1},{60,40},{110,40}}, color={0,0,127}));
  connect(conditionCheck.fSetPointInternal, Table_f_Pel_partLoad1.u) annotation (Line(points={{5,-1},{5,-12},{-20,-12},{-20,90},{-38,90}}, color={0,0,127}));
  connect(firstOrder.y, conditionCheck.fSetPoint) annotation (Line(points={{0,71},{0,21}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(initialScale=0.1)),
    Documentation(info="<html>
<p>This model is based on the approach by <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[WISC05]</a> </p>
<p>The compression chiller calculates the thermal power based on its partload characteristics, the operating point and the temperature depending efficiency. </p>
</html>"),
    experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end CompressionChiller;
