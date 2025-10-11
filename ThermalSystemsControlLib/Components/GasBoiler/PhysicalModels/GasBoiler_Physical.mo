within ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels;
model GasBoiler_Physical
    extends ThermalSystemsControlLib.BaseClasses.Icons.CondensingBoiler_Icon;

  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties deviceData constrainedby ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties annotation (choicesAllMatching=true);

  //## COMPONENTS ##

  ThermalSystemsControlLib.BaseClasses.Utilities.ZeroLimiter zeroLimiter(u_min=deviceData.u_min, u_0=0)
                                                                                                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,78})));
  ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.ConditionCheck_OneTemperature conditionCheck(T_inMin=deviceData.T_return_min, T_inMax=deviceData.T_return_max)
                                                                                                                                                             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,50})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=deviceData.riseTime/5,
                                                                          initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,20})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Tables.CombiTable2Ds Tableefficency_P_th1(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table=deviceData.f_effPth,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prePow
    "Prescribed power (=heat and flow work) flow for dynamic model"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,-90})));
  Modelica.Blocks.Math.Gain gain_P_gs_nom1(k=deviceData.P_gas_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-70})));
  Modelica.Fluid.Vessels.ClosedVolume volume1(
    redeclare package Medium = Medium,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V,
    nPorts=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={0,-90})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Medium)
                                                                                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-100})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-10})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=deviceData.u_min) annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Blocks.Math.Gain gain_P_gs_nom2(k=deviceData.P_gas_nominal*deviceData.P_gas_calibration_factor)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,90})));
  Modelica.Blocks.Interfaces.RealOutput P_gas "Output signal connector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,90})));
equation

  connect(fSetPoint, zeroLimiter.u) annotation (Line(points={{0,120},{0,90}}, color={0,0,127}));
  connect(zeroLimiter.y, conditionCheck.fSetPoint) annotation (Line(points={{0,67},{5,67},{5,61}}, color={0,0,127}));
  connect(conditionCheck.fSetPointInternal, firstOrder.u) annotation (Line(points={{-5,39},{-5,38},{0,38},{0,32},{2.22045e-15,32}}, color={0,0,127}));
  connect(prePow.port, volume1.heatPort) annotation (Line(points={{40,-90},{10,-90}},          color={191,0,0}));
  connect(prePow.Q_flow,gain_P_gs_nom1. y) annotation (Line(points={{60,-90},{70,-90},{70,-81}},     color={0,0,127}));
  connect(port_a, temperature1.port_a) annotation (Line(points={{-100,0},{-100,-100},{-80,-100}}, color={0,127,255}));
  connect(temperature1.port_b, volume1.ports[1]) annotation (Line(points={{-60,-100},{1,-100}}, color={0,127,255}));
  connect(volume1.ports[2], port_b) annotation (Line(points={{-1,-100},{100,-100},{100,0}}, color={0,127,255}));
  connect(port_a,port_a)  annotation (Line(points={{-100,0},{-100,0}},                   color={0,127,255}));
  connect(conditionCheck.T_in, Tableefficency_P_th1.u2) annotation (Line(points={{-5,61},{-20,61},{-20,0},{-70,0},{-70,-40},{-60,-40},{-60,-56},{-42,-56}}, color={0,0,127}));
  connect(temperature1.T, Tableefficency_P_th1.u2) annotation (Line(points={{-70,-89},{-70,-40},{-60,-40},{-60,-56},{-42,-56}}, color={0,0,127}));
  connect(firstOrder.y, limiter.u) annotation (Line(points={{0,9},{2.22045e-15,9},{2.22045e-15,2}}, color={0,0,127}));
  connect(limiter.y, Tableefficency_P_th1.u1) annotation (Line(points={{0,-21},{0,-30},{-42,-30},{-42,-44}}, color={0,0,127}));
  connect(fOperatingPoint, limiter.y) annotation (Line(points={{110,40},{80,40},{80,-21},{0,-21}}, color={0,0,127}));
  connect(greaterEqualThreshold.u, firstOrder.y) annotation (Line(points={{18,10},{0,10},{0,9}},
                                                                                               color={0,0,127}));
  connect(product1.u2, Tableefficency_P_th1.y) annotation (Line(points={{18,-56},{0,-56},{0,-50},{-19,-50}}, color={0,0,127}));
  connect(product1.u1, Tableefficency_P_th1.u1) annotation (Line(points={{18,-44},{0,-44},{0,-30},{-42,-30},{-42,-44}}, color={0,0,127}));
  connect(product1.y, gain_P_gs_nom1.u) annotation (Line(points={{41,-50},{70,-50},{70,-58}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, bStatusOn) annotation (Line(points={{41,10},{60,10},{60,80},{110,80}}, color={255,0,255}));
  connect(gain_P_gs_nom2.u, limiter.y) annotation (Line(points={{-58,90},{-40,90},{-40,-21},{-2.22045e-15,-21}}, color={0,0,127}));
  connect(gain_P_gs_nom2.y, P_gas) annotation (Line(points={{-81,90},{-110,90}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(initialScale=0.1)),
    Documentation(info="<html>
<p>This model is based on the approach by <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[WISC05]</a>.</p>
<p>The component describes a condensing boiler. The power is set by the control signal y &isin; [0, 1] and the maximum power is set as nominal power. The actual efficiency is calculated analytically depending on temperature and control signal described below.</p>
</html>"));
end GasBoiler_Physical;
