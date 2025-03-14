within ThermalSystemsControlLib.BaseClasses.Icons;
partial model HeatMeter_Icon
  annotation (Icon(coordinateSystem(
          preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid),
          Polygon(
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,-40},{-100,30}},
            smooth=Smooth.Bezier,
          lineColor={0,0,0},
          origin={0,-14},
          rotation=360),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-5,-5},{5,5}},
          origin={38,-32},
          rotation=360),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-5,-5},{5,5}},
          origin={-60,8},
          rotation=360),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-5,-5},{5,5}},
          origin={60,8},
          rotation=360),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-5,-5},{5,5}},
          origin={-36,-32},
          rotation=360),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-5,-5},{5,5}},
          origin={0,8},
          rotation=360),
        Polygon(
          points={{-19,24},{20,0},{-19,-26},{-19,24}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          visible=showDesignFlowDirection,
          origin={0,71},
          rotation=90)}),                 Diagram(
        coordinateSystem(preserveAspectRatio=
            false)));
end HeatMeter_Icon;
