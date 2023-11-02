within ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels;
model CompressionChiller_Type2
  import SI = Modelica.SIunits;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable package Medium1 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChiller_Type2_Properties deviceData constrainedby ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records.CompressionChiller_Type2_Properties annotation (choicesAllMatching=true);

  //## COMPONENTS ##

  SI.ThermodynamicTemperature  T_a_in;
  SI.ThermodynamicTemperature T_a1_in;
  SI.ThermodynamicTemperature T_b_out;
  SI.ThermodynamicTemperature T_b1_out;

  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=deviceData.riseTime, initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-110})));
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
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1)
                                               annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1)
                                               annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Modelica.Blocks.Tables.CombiTable2D Table_f_PthMax1(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table=deviceData.f_PthMax,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-70,40})));
  Modelica.Blocks.Math.Gain gain_P_el_nom2(k=deviceData.P_el_nom)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-92,80})));
  Modelica.Blocks.Tables.CombiTable2D Table_f_PelMax1(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table=deviceData.f_PelMax,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-70,80})));
  Modelica.Blocks.Math.Gain gain_P_th_nom1(k=deviceData.P_th_cool_nom)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-92,40})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=deviceData.u_min) annotation (Placement(transformation(extent={{60,70},{80,90}})));
  Modelica.Blocks.Interfaces.RealInput fTargetTemperatureHeating annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={50,120})));
  Modelica.Blocks.Interfaces.RealInput fTargetTemperatureCooling annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-50,120})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=T_a_in) annotation (Placement(transformation(extent={{-30,24},{-50,44}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=T_a1_in) annotation (Placement(transformation(extent={{-30,76},{-50,96}})));
  Modelica.Blocks.Nonlinear.Limiter heating_Setpoint(uMax=1e10, uMin=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,70})));
  Modelica.Blocks.Nonlinear.Limiter cooling_Setpoint(uMax=0, uMin=-1e10) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,70})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,10})));
  Modelica.Blocks.Nonlinear.Limiter cooling_Setpoint1(uMax=1, uMin=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-20})));
  Modelica.Blocks.Math.Abs abs1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,40})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(threshold=deviceData.u_min)
                                                                                                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-50})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-80})));
  Modelica.Blocks.Math.Product P_th_cool annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-50})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-50})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=deviceData.riseTime, initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-110})));
  Modelica.Blocks.Math.Division division1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,10})));
  Modelica.Blocks.Nonlinear.Limiter heating_Setpoint1(uMax=1, uMin=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-20})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold2(threshold=deviceData.u_min)
                                                                                                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-50})));
  Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-80})));
  Modelica.Blocks.Math.Product P_th_heat annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-50})));
  Modelica.Blocks.Sources.Constant const1(k=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-50})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,50},{-130,70}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold heating(threshold=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,70})));
  Modelica.Blocks.Math.Product P_el annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-110,-50})));
  Modelica.Blocks.Math.Product P_el1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-50})));
equation
  port_a.h_outflow = Medium.h_default;
  port_a1.h_outflow = Medium.h_default;

  T_a_in = Medium.temperature_phX(port_a.p, inStream(port_a.h_outflow), Medium.X_default);
  T_a1_in = Medium.temperature_phX(port_a1.p, inStream(port_a1.h_outflow), Medium.X_default);
  T_b_out = if heating.y then max(fTargetTemperatureHeating, T_a_in + 5) else T_a_in + 5;
  T_b1_out = if heating.y then T_a1_in - 5 else min(fTargetTemperatureCooling, T_a1_in - 5);

  port_b.h_outflow = Medium.specificEnthalpy_pTX(port_b.p, T_b_out, Medium.X_default);
  port_b1.h_outflow = Medium.specificEnthalpy_pTX(port_b1.p, T_b1_out, Medium.X_default);

  port_a.m_flow + port_b.m_flow = 0;
  port_a1.m_flow + port_b1.m_flow = 0;

  port_b.m_flow * (port_b.h_outflow - inStream(port_a.h_outflow)) = if heating.y then firstOrder1.y else 0;




  connect(port_a,port_a)  annotation (Line(points={{-100,0},{-100,0}},                   color={0,127,255}));
  connect(Table_f_PelMax1.y, gain_P_el_nom2.u) annotation (Line(points={{-81,80},{-84.8,80}}, color={0,0,127}));
  connect(Table_f_PthMax1.y, gain_P_th_nom1.u) annotation (Line(points={{-81,40},{-84.8,40}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, bStatusOn) annotation (Line(points={{81,80},{110,80}}, color={255,0,255}));
  connect(Table_f_PelMax1.u1, realExpression1.y) annotation (Line(points={{-58,86},{-51,86}}, color={0,0,127}));
  connect(Table_f_PelMax1.u2, realExpression.y) annotation (Line(points={{-58,74},{-54,74},{-54,34},{-51,34}}, color={0,0,127}));
  connect(Table_f_PthMax1.u2, realExpression.y) annotation (Line(points={{-58,34},{-51,34}}, color={0,0,127}));
  connect(Table_f_PthMax1.u1, realExpression1.y) annotation (Line(points={{-58,46},{-52,46},{-52,86},{-51,86}}, color={0,0,127}));
  connect(cooling_Setpoint.u, fSetPoint) annotation (Line(points={{-20,82},{-20,100},{0,100},{0,120}}, color={0,0,127}));
  connect(heating_Setpoint.u, fSetPoint) annotation (Line(points={{20,82},{20,100},{0,100},{0,120}}, color={0,0,127}));
  connect(gain_P_th_nom1.y, division.u2) annotation (Line(points={{-98.6,40},{-98,40},{-98,22},{-56,22}}, color={0,0,127}));
  connect(cooling_Setpoint1.u, division.y) annotation (Line(points={{-50,-8},{-50,-1}}, color={0,0,127}));
  connect(division.u1, abs1.y) annotation (Line(points={{-44,22},{-20,22},{-20,29}}, color={0,0,127}));
  connect(cooling_Setpoint.y, abs1.u) annotation (Line(points={{-20,59},{-20,52}}, color={0,0,127}));
  connect(greaterEqualThreshold1.u, cooling_Setpoint1.y) annotation (Line(points={{-50,-38},{-50,-31}}, color={0,0,127}));
  connect(switch1.u2, greaterEqualThreshold1.y) annotation (Line(points={{-50,-68},{-50,-61}}, color={255,0,255}));
  connect(P_th_cool.u2, cooling_Setpoint1.y) annotation (Line(points={{-26,-38},{-26,-34},{-50,-34},{-50,-31}}, color={0,0,127}));
  connect(gain_P_th_nom1.y, P_th_cool.u1) annotation (Line(points={{-98.6,40},{-98,40},{-98,-32},{-14,-32},{-14,-38}}, color={0,0,127}));
  connect(switch1.u1, P_th_cool.y) annotation (Line(points={{-42,-68},{-42,-61},{-20,-61}}, color={0,0,127}));
  connect(const.y, switch1.u3) annotation (Line(points={{-80,-61},{-58,-61},{-58,-68}}, color={0,0,127}));
  connect(firstOrder.u, switch1.y) annotation (Line(points={{-50,-98},{-50,-91}}, color={0,0,127}));
  connect(heating_Setpoint1.u, division1.y) annotation (Line(points={{50,-8},{50,-1}}, color={0,0,127}));
  connect(greaterEqualThreshold2.u,heating_Setpoint1. y) annotation (Line(points={{50,-38},{50,-31}}, color={0,0,127}));
  connect(switch2.u2, greaterEqualThreshold2.y) annotation (Line(points={{50,-68},{50,-61}}, color={255,0,255}));
  connect(P_th_heat.u2,heating_Setpoint1. y) annotation (Line(points={{74,-38},{74,-34},{50,-34},{50,-31}}, color={0,0,127}));
  connect(switch2.u1, P_th_heat.y) annotation (Line(points={{58,-68},{58,-61},{80,-61}}, color={0,0,127}));
  connect(const1.y, switch2.u3) annotation (Line(points={{20,-61},{42,-61},{42,-68}}, color={0,0,127}));
  connect(firstOrder1.u, switch2.y) annotation (Line(points={{50,-98},{50,-91}}, color={0,0,127}));
  connect(heating_Setpoint.y, division1.u1) annotation (Line(points={{20,59},{20,40},{56,40},{56,22}}, color={0,0,127}));
  connect(add.u1, gain_P_el_nom2.y) annotation (Line(points={{-108,66},{-108,80},{-98.6,80}}, color={0,0,127}));
  connect(add.u2, gain_P_th_nom1.y) annotation (Line(points={{-108,54},{-108,40},{-98.6,40}}, color={0,0,127}));
  connect(add.y, division1.u2) annotation (Line(points={{-131,60},{-150,60},{-150,26},{44,26},{44,22}}, color={0,0,127}));
  connect(P_th_heat.u1, division1.u2) annotation (Line(points={{86,-38},{86,26},{44,26},{44,22}}, color={0,0,127}));
  connect(heating.u, fSetPoint) annotation (Line(points={{0,82},{0,120}}, color={0,0,127}));
  connect(P_el.u1, cooling_Setpoint1.y) annotation (Line(points={{-104,-38},{-104,-34},{-50,-34},{-50,-31}}, color={0,0,127}));
  connect(gain_P_th_nom1.y, P_el.u2) annotation (Line(points={{-98.6,40},{-116,40},{-116,-38}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(initialScale=0.1)),
    Documentation(info="<html>
<p>This model is based on the approach by <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[WISC05]</a> </p>
<p>The compression chiller calculates the thermal power based on its partload characteristics, the operating point and the temperature depending efficiency. </p>
</html>"),
    experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end CompressionChiller_Type2;
