within ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels;
model CHP_Type2
  //## EXTENSIONS ##
  extends Modelica.Fluid.Interfaces.PartialTwoPortTransport;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CHP_Icon;

  //## IMPORTS ##
  import SI = Modelica.SIunits;

  //## VARIABLES ##
  SI.ThermodynamicTemperature T_return;
  SI.SpecificEnthalpy h_flow;

   // replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    // annotation (__Dymola_choicesAllMatching=true);

  replaceable parameter ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Type2_Properties deviceData constrainedby ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPower_Type2_Properties annotation (__Dymola_choicesAllMatching=true);

  Modelica.Blocks.Math.Gain gain_P_el_nom(k=-deviceData.P_el_nom)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-80,50})));
  Modelica.Blocks.Math.Gain gain_P_gs_nom(k=deviceData.P_gs_nom)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-80,90})));

  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn annotation (Placement(transformation(extent={{100,80},{120,100}})));
  Modelica.Blocks.Interfaces.RealOutput P_gas "Output signal connector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,90})));
  Modelica.Blocks.Interfaces.RealOutput P_el "Output signal connector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,50})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=deviceData.u_min) annotation (Placement(transformation(extent={{60,80},{80,100}})));
  Modelica.Blocks.Interfaces.RealInput fTargetTemperature annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={50,120})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=T_return)
                                                                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,-50})));
  Modelica.Blocks.Tables.CombiTable1D Tableefficency_P_th(
    table=deviceData.f_effPth,
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,                                                                                             extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Math.Gain P_th_max(k=deviceData.P_gs_nom) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={10,30})));
  Modelica.Blocks.Math.Gain P_th_min(k=deviceData.P_gs_nom) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-10,30})));
  Modelica.Blocks.Math.Gain gain(k=deviceData.u_min) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-10,-10})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,70})));
  Modelica.Blocks.Logical.Greater greater annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,10})));
  Modelica.Blocks.Logical.Switch P_th annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-10,-48},{10,-28}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{68,-46},{88,-26}})));
  Modelica.Blocks.Math.Gain gain_P_gs_nom1(k=deviceData.P_gs_nom)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={20,-90})));
  Modelica.Blocks.Math.Division u annotation (Placement(transformation(extent={{88,-80},{68,-60}})));
  Modelica.Blocks.Sources.Constant const1(k=1) annotation (Placement(transformation(extent={{-30,-100},{-10,-80}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=deviceData.riseTime, initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,-10})));
equation

  T_return = Medium.temperature_phX(port_a.p, inStream(port_a.h_outflow), Medium.X_default); // get return properties

  h_flow = Medium.specificEnthalpy_pTX(port_b.p, fTargetTemperature, Medium.X_default);  // define flow properties

  port_a.h_outflow = Medium.h_default; // no flow reversal

  port_b.h_outflow = h_flow; // define outflow

  firstOrder.y = m_flow * (h_flow - inStream(port_a.h_outflow)); //energy balance

  connect(gain_P_gs_nom.y, P_gas) annotation (Line(points={{-91,90},{-110,90}}, color={0,0,127}));
  connect(gain_P_el_nom.y, P_el) annotation (Line(points={{-91,50},{-110,50}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, bStatusOn) annotation (Line(points={{81,90},{110,90}},               color={255,0,255}));
  connect(Tableefficency_P_th.u[1], realExpression1.y) annotation (Line(points={{-42,-50},{-49,-50}}, color={0,0,127}));
  connect(gain.y, P_th_min.u) annotation (Line(points={{-10,1},{-10,18}}, color={0,0,127}));
  connect(P_th_max.y, variableLimiter.limit1) annotation (Line(points={{10,41},{10,82},{8,82}}, color={0,0,127}));
  connect(P_th_min.y, variableLimiter.limit2) annotation (Line(points={{-10,41},{-10,82},{-8,82}}, color={0,0,127}));
  connect(P_th.u1, variableLimiter.y) annotation (Line(points={{18,-22},{0,-22},{0,59},{-1.77636e-15,59}}, color={0,0,127}));
  connect(const1.y, gain_P_gs_nom1.u) annotation (Line(points={{-9,-90},{8,-90}}, color={0,0,127}));
  connect(division.y, u.u1) annotation (Line(points={{89,-36},{94,-36},{94,-64},{90,-64}},     color={0,0,127}));
  connect(gain_P_gs_nom1.y, u.u2) annotation (Line(points={{31,-90},{94,-90},{94,-76},{90,-76}},    color={0,0,127}));
  connect(fSetPoint, variableLimiter.u) annotation (Line(points={{0,120},{0,82}}, color={0,0,127}));
  connect(greater.u1, fSetPoint) annotation (Line(points={{-40,22},{-40,100},{0,100},{0,120}}, color={0,0,127}));
  connect(P_th_min.y, greater.u2) annotation (Line(points={{-10,41},{-32,41},{-32,22}}, color={0,0,127}));
  connect(greater.y, P_th.u2) annotation (Line(points={{-40,-1},{-40,-30},{18,-30}}, color={255,0,255}));
  connect(const.y, P_th.u3) annotation (Line(points={{11,-38},{18,-38}}, color={0,0,127}));
  connect(u.y, gain_P_gs_nom.u) annotation (Line(points={{67,-70},{-80,-70},{-80,0},{-60,0},{-60,90},{-68,90}}, color={0,0,127}));
  connect(gain_P_el_nom.u, gain_P_gs_nom.u) annotation (Line(points={{-68,50},{-60,50},{-60,90},{-68,90}}, color={0,0,127}));
  connect(fOperatingPoint, gain_P_gs_nom.u) annotation (Line(points={{110,50},{-60,50},{-60,90},{-68,90}}, color={0,0,127}));
  connect(greaterEqualThreshold.u, gain_P_gs_nom.u) annotation (Line(points={{58,90},{-68,90}}, color={0,0,127}));
  connect(P_th.y, firstOrder.u) annotation (Line(points={{41,-30},{44,-30},{44,-10},{48,-10}},
                                                                             color={0,0,127}));
  connect(gain.u, Tableefficency_P_th.y[1]) annotation (Line(points={{-10,-22},{-10,-50},{-19,-50}}, color={0,0,127}));
  connect(P_th_max.u, Tableefficency_P_th.y[1]) annotation (Line(points={{10,18},{10,-50},{-19,-50}}, color={0,0,127}));
  connect(division.u2, Tableefficency_P_th.y[1]) annotation (Line(points={{66,-42},{44,-42},{44,-50},{-19,-50}},
                                                                                                         color={0,0,127}));
  connect(division.u1, firstOrder.u) annotation (Line(points={{66,-30},{44,-30},{44,-10},{48,-10}}, color={0,0,127}));
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
end CHP_Type2;
