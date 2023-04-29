within ThermalSystemsControlLib.Components.Pumps.PhysicalModels;
model IdealPump_Physical "Mass flow building pump without pressure considerations"
    extends ThermalSystemsControlLib.BaseClasses.Icons.Pump_Icon;
    extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  replaceable parameter ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties deviceData constrainedby ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties annotation (choicesAllMatching=true);


  SI.Power P_el "Electrical power";
  Modelica.Blocks.Math.Gain gain(k=deviceData.m_flow_nom)
                                 annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=deviceData.riseTime/5,
                                                                 initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,48})));
  BaseClasses.FluidBaseClasses.IdealSource idealSource_simple(redeclare package Medium = Medium, control_m_flow=true) annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  BaseClasses.Utilities.ZeroLimiter zeroLimiter(u_max=deviceData.u_max, u_min=deviceData.u_min) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,80})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=deviceData.u_min) annotation (Placement(transformation(extent={{52,70},{72,90}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn "Connector of Boolean output signal" annotation (Placement(transformation(extent={{100,70},{120,90}})));
equation
  P_el = firstOrder.y*deviceData.P_el_nom*deviceData.f_el;
  connect(firstOrder.y, gain.u) annotation (Line(points={{-2.22045e-15,37},{-2.22045e-15,0},{-50,0},{-50,-60},{-42,-60}},
                                                                                                         color={0,0,127}));
  connect(gain.y, idealSource_simple.m_flow_in) annotation (Line(points={{-19,-60},{-6,-60},{-6,-68}}, color={0,0,127}));
  connect(firstOrder.y, fOperatingPoint) annotation (Line(points={{-2.22045e-15,37},{-2.22045e-15,0},{60,0},{60,40},{110,40}}, color={0,0,127}));
  connect(port_a, idealSource_simple.port_a) annotation (Line(points={{100,-100},{-80,-100},{-80,-80},{-10,-80}},
                                                                                                             color={0,127,255}));
  connect(idealSource_simple.port_b, port_b) annotation (Line(points={{10,-80},{80,-80},{80,100},{100,100}},
                                                                                                         color={0,127,255}));
  connect(zeroLimiter.u, fSetPoint) annotation (Line(points={{2.22045e-15,92},{0,92},{0,120}},                  color={0,0,127}));
  connect(greaterEqualThreshold.y, bStatusOn) annotation (Line(points={{73,80},{110,80}}, color={255,0,255}));
  connect(zeroLimiter.y, firstOrder.u) annotation (Line(points={{0,69},{0,60}}, color={0,0,127}));
  connect(firstOrder.y, greaterEqualThreshold.u) annotation (Line(points={{0,37},{0,30},{32,30},{32,80},{50,80}}, color={0,0,127}));
      annotation (choicesAllMatching = true,
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Ideal mass-flow building pump without considering pressure difference.</p>
</html>"));
end IdealPump_Physical;
