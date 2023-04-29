within ThermalSystemsControlLib.BaseClasses.Icons;
partial package CoolingTower_Icon_Package "icon for cooling tower open"
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          radius=25,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),
          Polygon(
        points={{-40,-80},{-80,40},{80,40},{40,-80},{-40,-80}},
        lineColor={255,255,255},
        pattern=LinePattern.None,
        lineThickness=1,
        fillColor={28,108,200},
        fillPattern=FillPattern.Solid),
          Polygon(
        points={{-80,-100},{-60,-80},{60,-80},{80,-100},{-80,-100}},
        lineColor={255,255,255},
        pattern=LinePattern.None,
        lineThickness=1,
        fillColor={28,108,200},
        fillPattern=FillPattern.Solid),
      Line(
        points={{-96,-14},{-76,2},{-76,-46},{-94,10}},
        color={28,108,200},
        pattern=LinePattern.None,
        smooth=Smooth.Bezier),
      Line(
        points={{-100,12},{-80,-40},{-166,34},{-74,52}},
        color={28,108,200},
        pattern=LinePattern.None,
        thickness=1),
        Polygon(
          points={{-24,84},{-36,64},{-30,58},{-34,40},{-26,58},{-32,68},{-24,84}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Polygon(
          points={{6,84},{-6,64},{0,58},{-4,40},{4,58},{-2,68},{6,84}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Polygon(
          points={{36,84},{24,64},{30,58},{26,40},{34,58},{28,68},{36,84}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier)}),          Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end CoolingTower_Icon_Package;
