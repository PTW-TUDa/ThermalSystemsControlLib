within ThermalSystemsControlLib.BaseClasses.Icons;
partial model Contact_Icon
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,72},{100,-70}},
          lineColor={28,108,200},
          fillColor={235,235,235},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,-70},{100,-70},{0,22},{-100,-70}},
          lineColor={28,108,200},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{22,2},{100,72},{100,-70},{22,2}},
          lineColor={28,108,200},
          fillColor={235,235,235},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,72},{100,72},{0,-18},{-100,72}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}),                      Diagram(coordinateSystem(preserveAspectRatio=false)));
end Contact_Icon;
