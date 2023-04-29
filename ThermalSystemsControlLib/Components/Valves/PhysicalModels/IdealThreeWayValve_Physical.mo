within ThermalSystemsControlLib.Components.Valves.PhysicalModels;
model IdealThreeWayValve_Physical "Ideal three way valve which is able to split volume flow of port_b into parts u and (1-u) at port_a1 resp. port_a2"
  //## PARAMETERS ##
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.IdealThreeWayValveProperties deviceData constrainedby ThermalSystemsControlLib.Components.Valves.PhysicalModels.Records.IdealThreeWayValveProperties annotation (__Dymola_choicesAllMatching=true);

  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-30})));

  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium)
                                                annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium = Medium)
                                                annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium,
    use_portsData=false,
    V=deviceData.V_int,
    nPorts=3) annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{40,-90},{60,-70}})));
  BaseClasses.FluidBaseClasses.IdealSource idealSource_simple(redeclare package Medium = Medium, control_m_flow=true) annotation (Placement(transformation(extent={{-60,-90},{-40,-70}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=deviceData.u_max, uMin=deviceData.u_min)
                                                                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,78})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=deviceData.riseTime/5,
                                                                 initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,40})));
equation
  connect(port_a2, port_a2) annotation (Line(points={{0,-100},{0,-100}}, color={0,127,255}));
  connect(volume.ports[1], port_a2) annotation (Line(points={{-2.66667,-80},{0,-80},{0,-100}},color={0,127,255}));
  connect(massFlowRate.port_a, volume.ports[2]) annotation (Line(points={{40,-80},{2.22045e-16,-80}},
                                                                                                  color={0,127,255}));
  connect(massFlowRate.port_b, port_b) annotation (Line(points={{60,-80},{80,-80},{80,0},{100,0}}, color={0,127,255}));
  connect(idealSource_simple.port_b, volume.ports[3]) annotation (Line(points={{-40,-80},{2.66667,-80}}, color={0,127,255}));
  connect(idealSource_simple.m_flow_in, product.y) annotation (Line(points={{-56,-68},{-56,-54},{-30,-54},{-30,-41}}, color={0,0,127}));
  connect(idealSource_simple.port_a, port_a1) annotation (Line(points={{-60,-80},{-80,-80},{-80,0},{-102,0}}, color={0,127,255}));
  connect(firstOrder.y, product.u2) annotation (Line(points={{-2.22045e-15,29},{-2.22045e-15,0},{-36,0},{-36,-18}},
                                                                                               color={0,0,127}));
  connect(massFlowRate.m_flow, product.u1) annotation (Line(points={{50,-69},{52,-69},{52,-10},{-24,-10},{-24,-18}}, color={0,0,127}));
  connect(firstOrder.y, fOperatingPoint) annotation (Line(points={{-2.22045e-15,29},{0,29},{0,0},{60,0},{60,40},{110,40}}, color={0,0,127}));
  connect(firstOrder.u, limiter.y) annotation (Line(points={{2.22045e-15,52},{0,52},{0,67}}, color={0,0,127}));
  connect(fSetPoint, limiter.u) annotation (Line(points={{0,120},{0,90}}, color={0,0,127}));
  annotation (defaultComponentName="val",
Documentation(info="<html>
<p>Ideal three way valve without consideration of pressure differences.</p>
</html>",
revisions="<html>
<ul>
<li>
February 20, 2012 by Michael Wetter:<br/>
Renamed parameter <code>dp_nominal</code> to <code>dpValve_nominal</code>,
and added new parameter <code>dpFixed_nominal</code>.
See
<a href=\"modelica://BuildingSystems.Fluid.Actuators.UsersGuide\">
BuildingSystems.Fluid.Actuators.UsersGuide</a>.
</li>
<li>
February 14, 2012 by Michael Wetter:<br/>
Added filter to approximate the travel time of the actuator.
</li>
<li>
March 25, 2011, by Michael Wetter:<br/>
Added homotopy method.
</li>
<li>
June 16, 2008 by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
    Icon(graphics={
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
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}));
end IdealThreeWayValve_Physical;
