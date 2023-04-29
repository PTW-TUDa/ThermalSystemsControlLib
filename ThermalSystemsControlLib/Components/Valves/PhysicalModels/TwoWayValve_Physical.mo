within ThermalSystemsControlLib.Components.Valves.PhysicalModels;
model TwoWayValve_Physical
  //## PARAMETERS ##
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties deviceData constrainedby ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.TwoWayValveProperties annotation (choicesAllMatching=true);
  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Medium,
    dp_nominal=deviceData.dp_nominal,
    m_flow_nominal=deviceData.m_flow_nominal)   annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium)
                                                annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=deviceData.riseTime/5, initType=Modelica.Blocks.Types.Init.SteadyState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,50})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=deviceData.leakageOpening) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,80})));
equation
  connect(port_a1, valveLinear.port_a) annotation (Line(points={{-100,0},{-10,0}}, color={0,127,255}));
  connect(firstOrder.y, valveLinear.opening) annotation (Line(points={{-1.9984e-15,39},{-1.9984e-15,20},{0,20},{0,8}},
                                                                                                       color={0,0,127}));
  connect(valveLinear.port_b, port_b) annotation (Line(points={{10,0},{100,0}}, color={0,127,255}));
  connect(firstOrder.u, limiter.y) annotation (Line(points={{2.22045e-15,62},{0,62},{-1.9984e-15,69}}, color={0,0,127}));
  connect(limiter.u, fSetPoint) annotation (Line(points={{2.22045e-15,92},{2.22045e-15,106},{0,106},{0,120}}, color={0,0,127}));
  connect(firstOrder.y, fOperatingPoint) annotation (Line(points={{0,39},{0,20},{60,20},{60,60},{110,60}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid),
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
          origin={20,0},
          rotation=180),
        Ellipse(
          extent={{-20,20},{20,-20}},
          lineColor={204,204,204},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}),                      Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Linear two way valve.</p>
</html>"));
end TwoWayValve_Physical;
