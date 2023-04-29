within ThermalSystemsControlLib.Components.Valves.PhysicalModels;
model ThreeWayValve_Physical "Simple three way valve consisting of two linear valves"
  //## PARAMETERS ##
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.ThreeWayValveProperties deviceData constrainedby ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.ThreeWayValveProperties annotation (choicesAllMatching=true);
  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium,
    use_portsData=false,
    V=deviceData.V_int,
    nPorts=3)                                annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Medium,
    dp_nominal=deviceData.dp_nominal,
    m_flow_nominal=deviceData.m_flow_nominal)   annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=deviceData.riseTime/5,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=1)                                                   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,50})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium)
                                                annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(
    redeclare package Medium = Medium,
    dp_nominal=deviceData.dp_nominal,
    m_flow_nominal=deviceData.m_flow_nominal)   annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-70})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=deviceData.leakageOpening) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,80})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
equation
  connect(valveLinear.port_b, volume.ports[1]) annotation (Line(points={{-40,-20},{-2.66667,-20}},             color={0,127,255}));
  connect(volume.ports[2], valveLinear1.port_b) annotation (Line(points={{0,-20},{0,-60}},                                   color={0,127,255}));
  connect(volume.ports[3], port_b) annotation (Line(points={{2.66667,-20},{52,-20},{52,0},{100,0}},
                                                                                  color={0,127,255}));
  connect(port_a, valveLinear.port_a) annotation (Line(points={{-100,0},{-80,0},{-80,-20},{-60,-20}}, color={0,127,255}));
  connect(valveLinear1.port_a,port_a1)  annotation (Line(points={{0,-80},{0,-100}},                             color={0,127,255}));
  connect(firstOrder.y, valveLinear.opening) annotation (Line(points={{-1.9984e-15,39},{-1.9984e-15,20},{-50,20},{-50,-12}},
                                                                                                       color={0,0,127}));
  connect(firstOrder.u, limiter.y) annotation (Line(points={{2.22045e-15,62},{0,62},{-1.9984e-15,69}}, color={0,0,127}));
  connect(limiter.u, fSetPoint) annotation (Line(points={{2.22045e-15,92},{2.22045e-15,106},{0,106},{0,120}}, color={0,0,127}));
  connect(firstOrder.y, fOperatingPoint) annotation (Line(points={{-2.22045e-15,39},{-2.22045e-15,20},{60,20},{60,60},{110,60}}, color={0,0,127}));
  connect(feedback.u1, const.y) annotation (Line(points={{-58,-70},{-79,-70}}, color={0,0,127}));
  connect(feedback.u2, valveLinear.opening) annotation (Line(points={{-50,-78},{-50,-42},{-20,-42},{-20,20},{-50,20},{-50,-12}}, color={0,0,127}));
  connect(feedback.y, valveLinear1.opening) annotation (Line(points={{-41,-70},{-8,-70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-53,6},{53,-6}},
          lineColor={204,204,204},
          fillColor={204,204,204},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          origin={0,-47},
          rotation=90),
        Rectangle(
          extent={{-100,6},{100,-6}},
          lineColor={204,204,204},
          fillColor={204,204,204},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-40,20},{-40,-20},{0,0},{-40,20}},
          lineColor={204,204,204},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-20,20},{-20,-20},{20,0},{-20,20}},
          lineColor={204,204,204},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          origin={0,-20},
          rotation=90),
        Polygon(
          points={{-20,20},{-20,-20},{20,0},{-20,20}},
          lineColor={204,204,204},
          pattern=LinePattern.None,
          fillColor={102,102,102},
          fillPattern=FillPattern.Solid,
          origin={20,0},
          rotation=180),
        Ellipse(
          extent={{-20,20},{20,-20}},
          lineColor={204,204,204},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}),                      Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Three way valve considering pressure differences.</p>
</html>"));
end ThreeWayValve_Physical;
