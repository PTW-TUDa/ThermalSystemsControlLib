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
          Rectangle(
            lineColor={255,204,51},
            lineThickness=0.5,
            extent={{-20,8},{20,12}}),
          Polygon(
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            points={{-80,60},{80,60},{100,40},{80,
              -30},{60,-40},{-60,-40},{-80,-30},{
              -100,40}},
            smooth=Smooth.Bezier,
          lineColor={0,0,0}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-65,25},{-55,35}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-5,25},{5,35}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{55,25},{65,35}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-35,-15},{-25,-5}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{25,-15},{35,-5}})}), Diagram(
        coordinateSystem(preserveAspectRatio=
            false)));
end HeatMeter_Icon;
